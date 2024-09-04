<%@ page import="member.dao.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2024-09-04
  Time: PM 4:01
  To change this template use File | Settings | File Templates.
--%>
<%
    //데이터 받아오기
    String id = request.getParameter("id");

    //DB, 싱글톤
    MemberDAO memberDAO = MemberDAO.getInstance();


    //id가 있으면 true 없으면 false
    boolean exist = memberDAO.isExistId(id);

%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<% if (exist) { %>
<%=id%>는 사용 불가능
<br><br>
<form action="checkId.jsp"><%--재귀호출--%>
    아이디<input type="text" name="id">
    <input type="submit" value="중복체크"/>
</form>
<%} else {%>
<%=id%>는 사용 가능
<br><br>
<input type="button" value="사용하기" onclick="checkIdClose('<%=id%>')"/> <!--아이디를 가져가라-->
<input type="button" value="다시찾기"/>


<%} %>
<script type="text/javascript">
    function checkIdClose(id) {
        opener.document.getElementById("id").value = id; //중요 열려있는 창들중에 id 속성이 id인걸찾아라
        window.close();
        opener.document.getElementById("pwd").focus();
    }
</script>


</body>
</html>
