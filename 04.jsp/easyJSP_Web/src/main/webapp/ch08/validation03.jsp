<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Validation</title>
</head>
<script type="text/javascript">
    function checkLogin() {
      var form = document.loginForm;

      if (form.id.value.length < 4 || form.id.value.length > 12) {
        alert("아이디를 4~12자 사이로 입력해주세요.");
        form.id.select();
        return;
      }
      if (form.password.value.length < 4) {
        alert("비밀번호를 4자 이상으로 입력해야합니다.");
        form.password.select();
        return;
      }
      form.submit();
    }
  </script>
<body>
  <form name="loginForm" action="validation02_process.jsp" method="post">
    <p> 아이디 : <input type="text" name="id" />
    <p> 비밀번호 : <input type="password" name="password" />
    <p> <input type="button" value="전송" onclick="checkLogin()">
  </form>
</body>
</html>
