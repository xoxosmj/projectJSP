<%@ page import="member.bean.MemberDTO" %>
<%@ page import="java.util.Date" %>
<%@ page import="member.dao.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2024-09-05
  Time: AM 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    //데이터
    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    String gender = request.getParameter("gender");
    String email1 = request.getParameter("email1");
    String email2 = request.getParameter("email2");
    String tel1 = request.getParameter("tel1");
    String tel2 = request.getParameter("tel2");
    String tel3 = request.getParameter("tel3");
    String zipcode = request.getParameter("zipcode");
    String addr1 = request.getParameter("addr1");
    String addr2 = request.getParameter("addr2");

    MemberDTO memberDTO = new MemberDTO();
    memberDTO.setName(name);
    memberDTO.setId(id);
    memberDTO.setPwd(pwd);
    memberDTO.setGender(gender);
    memberDTO.setEmail1(email1);
    memberDTO.setEmail2(email2);
    memberDTO.setTel1(tel1);
    memberDTO.setTel2(tel2);
    memberDTO.setTel3(tel3);
    memberDTO.setZipcode(zipcode);
    memberDTO.setAddr1(addr1);
    memberDTO.setAddr2(addr2);

    //DB
    MemberDAO memberDAO = MemberDAO.getInstance();
    boolean join = memberDAO.memberWrite(memberDTO);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
<%
    if (join) {
%>
<p>회원가입을 축하합니다.</p>
<%
} else {
%>
<p>회원가입에 실패했습니다.</p>
<%
    }
%>

<script type="text/javascript">
    window.onload = function(){
        alert("회원가입을 축하합니다.")
        location.href = "../index.jsp";
    }
</script>
</body>
</html>