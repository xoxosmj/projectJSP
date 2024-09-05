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
         style="cursor: pointer">로그인
</h1>
<form id="memberLoginForm" name="memberLoginForm">
    <table border="1">
        <tr>
            <td>아이디</td>
            <td>
                <input type="text" id="id" name="id" placeholder="아이디 입력"/>
                <div id="idDiv"></div>
            </td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td>
                <input type="password" id="pwd" name="pwd" placeholder="비밀번호 입력"/>
                <div id="pwdDiv"></div>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <%--
                                <input type="button" value="로그인" onclick="memberLogin()"/> 제이쿼리를 쓸거니까 onclick 대신 id를줌
                --%>
                <input type="button" value="로그인" id="loginBtn"/>
                <input type="button" value="회원가입" onclick="location.href='memberWriteForm.jsp'"/>
            </td>
        </tr>
    </table>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
    $(function () {
        $('#loginBtn').click(function () {
            $('#idDiv').empty();
            $('#pwdDiv').empty();

            if ($('#id').val() == '') {
                $('#idDiv').html('아이디 입력');
            } else if ($('#pwd').val() == '') {
                $('#pwdDiv').html('비밀번호 입력');
            } else {
                $.ajax({
                    type: 'post',
                    url: 'memberLogin.jsp',
                    data: 'id=' + $('#id').val() + '&pwd=' + $('#pwd').val(),
                    /*   data: {
                           'id': $('#id').val(),
                           'pwd': $('#pwd').val() // json방식 둘중에 하나 사용
                       },*/

                    dataType: 'text',    //서버로부터 받는 타입 'text', 'xml', 'json' 세개중에 한개
                    success: function (data) {
                        /*
                                                alert(data.trim());
                        */
                        if (data.trim() == 'fail') {
                            alert("아이디 혹은 비밀번호가 틀렸습니다.")
                        } else {
                            alert(data.trim() + "님 로그인 성공");
                            $('span').text(data.trim());
                            // location.href = '../index.jsp';
                        }
                    },
                    error: function (e) {
                        console.log(e);
                    }
                });
            }
        });

    })
</script>
</body>