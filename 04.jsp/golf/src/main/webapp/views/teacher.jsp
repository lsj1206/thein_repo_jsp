<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List,
                 java.text.DecimalFormat,
                 java.text.SimpleDateFormat,
                 golf.vo.TeacherVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사조회</title>
</head>
<body>
<%@ include file="../layout/header.jsp" %>

<section>
    <div class="title">강사조회</div>

    <%
        List<TeacherVO> teacherList = (List<TeacherVO>) request.getAttribute("teacherList");
        DecimalFormat df = new DecimalFormat("#,###원");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
    %>

    <table>
        <thead>
            <tr>
                <th>강사코드</th>
                <th>강사명</th>
                <th>강의명</th>
                <th>수강료</th>
                <th>강사등록일</th>
            </tr>
        </thead>
        <tbody>
            <% if (teacherList == null || teacherList.isEmpty()) { %>
                <tr>
                    <td colspan="5" style="color: #888;">등록된 강사 정보가 없습니다.</td>
                </tr>
            <% } else {
                for (TeacherVO teacher : teacherList) {
                    String priceFormatted = df.format(teacher.getClassPrice());
                    String dateFormatted = "";
                    if (teacher.getTeacherRegistDate() != null) {
                        dateFormatted = sdf.format(teacher.getTeacherRegistDate());
                    }
            %>
                <tr>
                    <td><%= teacher.getTeacherCode() %></td>
                    <td><%= teacher.getTeacherName() %></td>
                    <td><%= teacher.getClassName() %></td>
                    <td><%= priceFormatted %></td>
                    <td><%= dateFormatted %></td>
                </tr>
            <%
                }
            }
            %>
        </tbody>
    </table>
</section>

<%@ include file="../layout/footer.jsp" %>
</body>
</html>
