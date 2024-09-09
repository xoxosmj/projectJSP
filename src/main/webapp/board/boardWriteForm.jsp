<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2024-09-09
  Time: AM 9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
        table {
            border-collapse: collapse; /* 테이블 이중선 제거 */
        }

        th, td {
            padding: 5px;
        }

        div {
            color: red;
            font-size: 8pt;
            font-weight: bold;
        }
    </style>
</head>
<body>
<h3>
    <img src="../image/1.png" width="100" height="100 " onclick="location.href='../index.jsp'" style="cursor:pointer;">
    글 등록
</h3>
<form id="boardForm" method="post" action="boardWrite.jsp"> <!-- onsubmit 이벤트를 통해 유효성 검사를 하고, 통과 시 폼 제출 -->
    <table border="1">
        <tr>
            <th width="100">제목</th>
            <td>
                <input type="text" id="subject" name="subject" size="70" placeholder="제목 입력">
                <div id="subjectDiv"></div>
            </td>
        </tr>
        <tr>
            <th>내용</th>
            <td>
                <textarea id="content" name="content" rows="10" cols="70" placeholder="내용 입력"></textarea>
                <div id="contentDiv"></div>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="button" value="글쓰기" id="boardWriteBtn">
                <input type="reset" value="다시작성">
            </td>
        </tr>
    </table>
</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../js/boardWrite.js"></script>
</body>
</html>