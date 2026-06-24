<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List,
                 java.text.DecimalFormat,
                 golf.vo.MemberVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보조회</title>
</head>
<body>
<%@ include file="../layout/header.jsp" %>

<section>
    <div class="title">회원정보조회</div>

    <%
        List<MemberVO> memberList = (List<MemberVO>) request.getAttribute("memberList");
        DecimalFormat df = new DecimalFormat("#,###원");
    %>

    <table>
        <thead>
            <tr>
                <th>수강월</th>
                <th>회원번호</th>
                <th>회원명</th>
                <th>강의명</th>
                <th>강의장소</th>
                <th>수강료</th>
                <th>등급</th>
            </tr>
        </thead>
        <tbody>
            <% if (memberList == null || memberList.isEmpty()) { %>
                <tr>
                    <td colspan="7" style="color: #888;">등록된 회원 정보가 없습니다.</td>
                </tr>
            <% } else {
                for (MemberVO member : memberList) {
                    // 수강월 포맷팅 (YYYYMM -> YYYY-MM)
                    String registMonth = member.getRegistMonth();
                    String registMonthFormatted = "-";
                    if (registMonth != null && registMonth.length() == 6) {
                        registMonthFormatted = registMonth.substring(0, 4) + "-" + registMonth.substring(4, 6);
                    }

                    // 등급 표시
                    String grade = member.getGrade() != null ? member.getGrade() : "-";

                    // 수강 정보 가져오기
                    String className = member.getClassName() != null ? member.getClassName() : "-";
                    String classArea = member.getClassArea() != null ? member.getClassArea() : "-";

                    String tuitionFormatted = "-";
                    if (member.getRegistMonth() != null) {
                        tuitionFormatted = df.format(member.getTuition());
                    }
            %>
                <tr>
                    <td><%= registMonthFormatted %></td>
                    <td><%= member.getcNo() %></td>
                    <td><%= member.getcName() %></td>
                    <td><%= className %></td>
                    <td><%= classArea %></td>
                    <td style="text-align: right; padding-right: 15px;"><%= tuitionFormatted %></td>
                    <td><%= grade %></td>
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
