<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2024-09-05
  Time: PM 5:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Cookie[] ar =request.getCookies(); //특정 쿠키만을 가져오지 못하고, 모든 쿠키들을 다 가져온다.
    if(ar!=null){
        for(Cookie c:ar){
           if(c.getName().equals("memName")){
               c.setMaxAge(0); //쿠키 삭제
               response.addCookie(c); //클라이언트에 저장
           }

            if(c.getName().equals("memId")){
                c.setMaxAge(0); //쿠키 삭제
                response.addCookie(c); //클라이언트에 저장
            }

        } //for
    } //if
%>