<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2024-09-05
  Time: PM 5:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String name = null;
    String id = null;
    //쿠키
    Cookie[] ar =request.getCookies(); //특정 쿠키만을 가져오지 못하고, 모든 쿠키들을 다 가져온다.

    if(ar!=null){
        for(Cookie c:ar){
            String cookieName = c.getName();
            String cookieValue = c.getValue();

            System.out.println("쿠키명 = "+cookieName);
            System.out.println("쿠키값 = "+cookieValue);
            System.out.println();

            if(c.getName().equals("memName")){
               name = c.getValue();
            }
        } //for
    } //if

%>
<%=name%>
