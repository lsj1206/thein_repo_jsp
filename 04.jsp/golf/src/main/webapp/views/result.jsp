<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List,
                 java.text.DecimalFormat,
                 golf.vo.SalesVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사매출현황</title>
</head>
<body>
<%@ include file="../layout/header.jsp" %>

<section>
    <div class="title">강사매출현황</div>

    <%
        List<SalesVO> salesList = (List<SalesVO>) request.getAttribute("salesList");
        DecimalFormat df = new DecimalFormat("#,###원");
    %>

    <table>
        <thead>
            <tr>
                <th>강사코드</th>
                <th>강사명</th>
                <th>강의명</th>
                <th>총매출액</th>
            </tr>
        </thead>
        <tbody>
            <% if (salesList == null || salesList.isEmpty()) { %>
                <tr>
                    <td colspan="4" style="color: #888;">매출 내역이 존재하지 않습니다.</td>
                </tr>
            <% } else {
                for (SalesVO sales : salesList) {
                    String salesFormatted = df.format(sales.getTotalSales());
            %>
                <tr>
                    <td><%= sales.getTeacherCode() %></td>
                    <td><%= sales.getTeacherName() %></td>
                    <td><%= sales.getClassName() %></td>
                    <td style="text-align: right; padding-right: 20px;"><%= salesFormatted %></td>
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
