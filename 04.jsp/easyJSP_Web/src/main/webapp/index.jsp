<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.TreeMap" %>
<%@ page import="java.util.Map" %>
<%! // 하위 폴더까지 재귀적으로 탐색하며 jsp, html 파일을 수집하는 메서드
    public void findWebPages(File dir, String rootPath, Map<String, List<String[]>> folderMap) {
        File[] files = dir.listFiles();
        if (files == null) return;

        for (File file : files) {
            if (file.isDirectory()) {
                // 보안상 클라이언트가 직접 접근할 수 없는 폴더는 제외
                if (!file.getName().equalsIgnoreCase("WEB-INF") &&
                    !file.getName().equalsIgnoreCase("META-INF") &&
                    !file.getName().startsWith(".")) {
                    findWebPages(file, rootPath, folderMap);
                }
            } else {
                String fileName = file.getName();
                // _가 포함된 파일 제외
                if (fileName.contains("_")) {
                    continue;
                }

                String lowerName = fileName.toLowerCase();
                // JSP 및 HTML 파일만 추출
                if (lowerName.endsWith(".jsp") || lowerName.endsWith(".html") || lowerName.endsWith(".htm")) {
                    // 시스템 절대경로를 웹 상대경로로 변환
                    String relativePath = file.getAbsolutePath().substring(rootPath.length());
                    relativePath = relativePath.replace(File.separatorChar, '/');

                    // index.jsp 본인은 목록에서 제외
                    if (!relativePath.equals("index.jsp") && !relativePath.equals("/index.jsp")) {
                        // 폴더명 추출
                        String cleanPath = relativePath.startsWith("/") ? relativePath.substring(1) : relativePath;
                        String folderName = "Root";
                        int slashIndex = cleanPath.indexOf('/');
                        if (slashIndex != -1) {
                            folderName = cleanPath.substring(0, slashIndex);
                        }

                        List<String[]> list = folderMap.get(folderName);
                        if (list == null) {
                            list = new ArrayList<String[]>();
                            folderMap.put(folderName, list);
                        }
                        list.add(new String[]{fileName, relativePath});
                    }
                }
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>웹페이지 링크 목록</title>
<style>
    .container {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
    }
    .card {
        min-width: 180px;
    }
</style>
</head>
<body>
    <header>
        <h1>JSP Web Programming</h1>
        <div class="info-bar">
            <div class="info-item">
                <span>Today:</span>
                <span><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %></span>
            </div>
            <div class="info-item">
                <span>Time:</span>
                <span id="live-clock">]</span>
            </div>
        </div>
    </header>

    <main class="container">
        <%
            String rootPath = application.getRealPath("/");
            File rootDir = new File(rootPath);

            // TreeMap을 활용하여 폴더명을 알파벳/숫자 순서대로 정렬하여 그룹화
            Map<String, List<String[]>> folderMap = new TreeMap<String, List<String[]>>();
            findWebPages(rootDir, rootPath, folderMap);

            if (folderMap.isEmpty()) {
        %>
            <div class="card" style="grid-column: 1 / -1; align-items: center;">
                <p class="empty-msg">생성된 웹페이지가 없습니다.</p>
            </div>
        <%
            } else {
                for (Map.Entry<String, List<String[]>> entry : folderMap.entrySet()) {
                    String folderName = entry.getKey();
                    List<String[]> pages = entry.getValue();
        %>
            <section class="card">
                <h2 class="card-title"> <%= folderName %> </h2>
                <ul class="page-list">
                    <%
                        for (String[] pageInfo : pages) {
                            String fileName = pageInfo[0];
                            String pageUrl = pageInfo[1];
                            String href = pageUrl.startsWith("/") ? pageUrl : "/" + pageUrl;
                    %>
                        <li class="page-item">
                            <a href="<%= request.getContextPath() + href %>">
                                <%= fileName %>
                            </a>
                        </li>
                    <%
                        }
                    %>
                </ul>
            </section>
        <%
                }
            }
        %>
    </main>

<script>
function showTime() {
    const clockElement = document.getElementById("live-clock");
    const now = new Date();
    clockElement.innerText = now.toLocaleTimeString();
}
setInterval(showTime, 1000);
showTime();
</script>
</body>
</html>
