<%@ page errorPage="errorPage_error.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Directives Tag</title>
</head>
<body>
	<%
	// NullPointerException 에러 발생!
	String str = null;
	out.println(str.toString());
	%>
</body>
</html>
