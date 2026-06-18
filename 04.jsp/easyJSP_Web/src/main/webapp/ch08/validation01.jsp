<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Validation</title>
</head>
<script type="text/javascript">
    function checkForm() {
      alert("아이디 : " + document.loginForm.id.value + "\n" + "비밀번호 : " + document.loginForm.password.value);
    }
  </script>
<body>
  <form name="loginForm" method="post">
    <p>아이디 : <input type="text" name="id" /></p>
    <p>비밀번호 : <input type="password" name="password" /></p>
    <input type="button" value="전송" onclick="checkForm()" />
  </form>
</body>
</html>
