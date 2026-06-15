<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%! // 하위 폴더까지 재귀적으로 탐색하며 jsp, html 파일을 수집하는 메서드
    public void findWebPages(File dir, String rootPath, List<String> fileList) {
        File[] files = dir.listFiles();
        if (files == null) return;

        for (File file : files) {
            if (file.isDirectory()) {
                // 보안상 클라이언트가 직접 접근할 수 없는 폴더는 제외
                if (!file.getName().equalsIgnoreCase("WEB-INF") &&
                    !file.getName().equalsIgnoreCase("META-INF") &&
                    !file.getName().startsWith(".")) {
                    findWebPages(file, rootPath, fileList);
                }
            } else {
                String fileName = file.getName().toLowerCase();
                // JSP 및 HTML 파일만 추출
                if (fileName.endsWith(".jsp") || fileName.endsWith(".html") || fileName.endsWith(".htm")) {
                    // 시스템 절대경로를 웹 상대경로로 변환
                    String relativePath = file.getAbsolutePath().substring(rootPath.length());
                    relativePath = relativePath.replace(File.separatorChar, '/');

                    // index.jsp 본인은 목록에서 제외
                    if (!relativePath.equals("index.jsp") && !relativePath.equals("/index.jsp")) {
                        fileList.add(relativePath);
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
<title>웹페이지 링크 목록</title>
</head>
<body>
	<%@ page info="Date 클랫를 이용한 날짜 출력하기" %>
	<p>Today is <%= new java.util.Date() %></p>
    <p>Today is <span id="live-clock">]</span></p>

    <h1>링크 목록</h1>
    
    <ul>
        <% // 웹 애플리케이션의 배포 실제 경로 획득
            String rootPath = application.getRealPath("/");
            File rootDir = new File(rootPath);

            List<String> pageList = new ArrayList<String>();
            findWebPages(rootDir, rootPath, pageList);

            if (pageList.isEmpty()) {
        %>
            <li>생성된 웹페이지가 없습니다.</li>
        <%
            } else {
                for (String pageUrl : pageList) {
                    // 경로가 '/'로 시작하지 않는 경우 보정
                    String href = pageUrl.startsWith("/") ? pageUrl : "/" + pageUrl;
        %>
            <li> <a href="<%= request.getContextPath() + href %>"><%= pageUrl %></a> </li>
        <%
                }
            }
        %>
    </ul>

</body>
<script>
function showTime() {
    const clockElement = document.getElementById("live-clock");
    const now = new Date(); // 사용자 브라우저 기준 현재 날짜/시간 생성
    clockElement.innerText = now.toLocaleString(); // 읽기 편한 포맷으로 변환
}
// 1초(1000밀리초)마다 showTime 함수를 반복 실행
setInterval(showTime, 1000);
// 페이지 로드 시 즉시 시간을 표시 (1초 지연 방지)
showTime();
</script>

</html>
