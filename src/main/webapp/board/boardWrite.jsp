<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="board.dao.BoardDAO" %><%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2024-09-09
  Time: AM 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //데이터
    request.setCharacterEncoding("UTF-8");
    String subject = request.getParameter("subject");
    String content = request.getParameter("content");

    String id = (String)session.getAttribute("memId"); //object 타입이라 String으로 캐스팅
    String name =  (String)session.getAttribute("memName");
    String email = (String)session.getAttribute("memEmail");

    Map<String,String> map = new HashMap<String, String>();
    map.put("subject", subject);
    map.put("content", content);
    map.put("id", id);
    map.put("name", name);
    map.put("email", email);

    //DB
    BoardDAO boardDAO = BoardDAO.getInstance();
    boardDAO.boardWrite(map);

%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
