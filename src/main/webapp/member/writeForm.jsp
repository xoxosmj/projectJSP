<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2024-09-04
  Time: PM 3:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="../css/member.css">
    <style type="text/css">
        /* ... 기존 CSS 스타일 ... */
    </style>
</head>
<body>
<h1 align="center">

    <img src="../image/1.png" width="70" height="70" alt="홈" onclick="location.href='../index.jsp'"
         style="cursor: pointer">회원가입
</h1>
<form id="join" name="join" method="post" action="write.jsp">
    <table>
        <tr>
            <td>이름</td>
            <td><input type="text" id="name" name="name" placeholder="이름 입력"/>
                <div id="error-name" class="error"></div>
            </td>
        </tr>
        <tr>
            <td>아이디</td>
            <td>
                <input type="text" id="id" name="id" placeholder="아이디 입력"/>
                <button type="button" onclick="checkId()">중복체크</button>
                <input type="hidden" id="check" value="">
                <div id="error-id" class="error"></div>
            </td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" id="pwd" name="pwd" placeholder="비밀번호 입력"/>
                <div id="error-pwd" class="error"></div>
            </td>
        </tr>
        <tr>
            <td>재확인</td>
            <td><input type="password" id="pwdChk" name="pwdChk" placeholder="비밀번호 입력"/>
                <div id="error-pwdChk" class="error"></div>
            </td>
        </tr>
        <tr>
            <td>성별</td>
            <td>
                <input type="radio" name="gender" id="m" value="m" checked/><label for="m"> 남자</label>&nbsp;
                <input type="radio" name="gender" id="w" value="f"/><label for="w"> 여자</label>
            </td>
        </tr>
        <tr>
            <td>이메일</td>
            <td>
                <input type="text" name="email1" id="email1"/> @
                <input type="text" name="email2" id="email2"/>

                <select name="email3" id="email3" onchange="changeEmail()">
                    <option value="">직접 입력</option>
                    <option value="naver.com">네이버</option>
                    <option value="google.com">구글</option>
                    <option value="daum.net">다음</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>휴대전화</td>
            <td>
                <select name="tel1" id="tel1">
                    <option value="010">010</option>
                    <option value="011">011</option>
                    <option value="019">019</option>
                </select> -
                <input type="text" name="tel2" id="tel2" maxlength="4"/> -
                <input type="text" name="tel3" id="tel3" maxlength="4"/>
            </td>
        </tr>
        <tr>
            <td>주소</td>
            <td>
                <input type="text" name="zipcode" id="zipcode" placeholder="우편번호" readonly/>
                <input type="button"
                       value="우편번호 검색"
                       class="btn"
                       id="findAddr"
                       onclick="checkPost()"/>
                <input type="text" name="addr1" id="addr1" placeholder="주소" readonly/>
                <input type="text" name="addr2" id="addr2" placeholder="상세주소"/>
            </td>
        </tr>
        <tr>
            <td id="submitBtn" colspan="2">
                <input type="button" value="회원가입" onclick="memberWrite()"/>
                <input type="reset" value="다시입력"/>
            </td>
        </tr>
    </table>
</form>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/member.js"></script>
</body>
</html>