<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>  <!-- 에러 전용 페이지임을 선언 -->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8" />
	<title>에러 발생 화면</title>
</head>
<body>
	<!-- 발생한 예외 객체 정보 출력 -->
	<p><strong>오류 메시지:</strong> <%= exception.getMessage() %></p>
	<p><strong>오류 타입:</strong> <%= exception.toString() %></p>
</body>
</html>
