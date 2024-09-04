<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2024-09-04
  Time: PM 3:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <style type="text/css">
        * {
            margin: 0 auto;
        }

        div{
            color:red;
            font-size: 8pt;
            font-weight: bold;
        }
        table {
            margin-top: 100px;
            width: 550px;
            height: 500px;
            border-collapse: collapse;
        }

        table td {
            padding-left: 15px;
            border: 1px solid #ccc;
        }

        td:nth-child(1) {
            width: 90px;
        }

        input {
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 5px 10px;
        }

        .btn {
            padding: 3px 5px;
            font-size: 0.8em;
            cursor: pointer;
        }

        #email1, #email2 {
            width: 100px;
        }

        #email3 {
            width: 100px;
        }

        #tel2, #tel3 {
            width: 50px;
        }

        #tel1 {
            width: 60px;
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 3px 3px;
        }

        #zipcode {
            width: 100px;
            margin-bottom: 10px;
        }

        #addr1, #addr2 {
            width: 300px;
            margin-bottom: 5px;
        }

        #submitBtn {
            text-align: center;
        }

        #submitBtn input[type="submit"] {
            margin-right: 5px;
        }

        .error {
            margin-top: 5px;
            font-size: 0.5em;
            color: tomato;
        }
    </style>
</head>
<body>

<form id="join" action="/memberJoin" method="post">
    <table>
        <tr>
            <td>* 이름</td>
            <td><input type="text" id="name" name="name" placeholder="이름 입력"/>
                <div id="error-name" class="error"></div>
            </td>
        </tr>
        <tr>
            <td>* 아이디</td>
            <td>
                <input type="text" id="id" name="id" placeholder="아이디입력"/>
                <button type="button" onclick="checkId()">중복체크</button>
                <div id="error-id" class="error"></div>
            </td>
        </tr>
        <tr>
            <td>* 비밀번호</td>
            <td><input type="password" id="pwd" name="pwd" placeholder="비밀번호 입력"/>
                <div id="error-pwd" class="error"></div>
            </td>
        </tr>
        <tr>
            <td>* 재확인</td>
            <td><input type="password" id="pwdChk" name="pwdChk" placeholder="비밀번호 입력"/>
                <div id="error-pwdChk" class="error"></div>
            </td>
        </tr>
        <tr>
            <td>성별</td>
            <td>
                <input type="radio" name="gender" id="m" value="남자" checked/><label for="m"> 남자</label>&nbsp;
                <input type="radio" name="gender" id="w" value="여자"/><label for="w"> 여자</label>
            </td>
        </tr>
        <tr>
            <td>이메일</td>
            <td>
                <input type="text" name="email1" id="email1"/> @ <input type="text" name="email2" id="email2"/>

                <input type="email" name="email3" list="email3_list" id="email3" oninput="changeEmail"/>
                <datalist id="email3_list">
                    <option value="직접입력"></option>
                    <option value="naver.com"/>
                    <option value="google.com"/>
                    <option value="daum.net"/>
                </datalist>
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
            <td id="submitBtn" colspan="2"><input type="submit" value="회원가입"/><input type="reset" value="다시입력"/></td>
        </tr>
    </table>
</form>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/member.js"></script>
</body>
</html>