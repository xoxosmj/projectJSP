<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2024-09-05
  Time: PM 5:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.removeAttribute("memName");
    session.removeAttribute("memId");

    session.invalidate();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
    window.onload = function(){
        alert("로그아웃");
        location.href = "../index.jsp";
    }
</script>
</body>
</html>



