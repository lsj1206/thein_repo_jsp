<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<body>
	<%! int pageCount = 0;
		void addCount() {
			pageCount++;
		}
	 %>
	 <%
	 addCount();
	 %>
	 <p>페이지 방문 횟수: <%= pageCount %></p>
</body>
</html>
