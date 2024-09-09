<%@ page import="member.dao.MemberDAO" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="member.bean.MemberDTO" %><%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2024-09-05
  Time: PM 3:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //데이터
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");

    //DB
    MemberDAO memberDAO = MemberDAO.getInstance();
    MemberDTO memberDTO = memberDAO.login(id,pwd);


%>

<%
    if (memberDTO == null) {
        //페이지 이동
        response.sendRedirect("loginFail.jsp");

    } else {

    /*    //중요한 데이터를 주소표시줄에 실어서 보내지 말자
        //response.sendRedirect("loginOk.jsp?name=" + URLEncoder.encode(name, "UTF-8")+"&id="+id); //한글 깨짐 오류 방지 인코더메소드 호출

        //쿠키
        //쿠키는 서버에서 만들지만 클라이언트에 저장
        Cookie cookie1 = new Cookie("memName",name); //쿠키 생성
        cookie1.setMaxAge(60*3*10); //초단위
        response.addCookie(cookie1); //클라이언트에 저장

        Cookie cookie2 = new Cookie("memId",id); //쿠키 생성
        cookie2.setMaxAge(60*3*10);
        response.addCookie(cookie2); //클라이언트에 저장

        */

        //세션

        session.setAttribute("memName", memberDTO.getName());
        session.setAttribute("memId", memberDTO.getId());
        session.setAttribute("memEmail", memberDTO.getEmail1()+"@"+memberDTO.getEmail2());
        session.setAttribute("memDTO", memberDTO);

        response.sendRedirect("loginOk.jsp");
   }
%>
