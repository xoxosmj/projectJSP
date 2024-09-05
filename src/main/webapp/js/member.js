//아이디 중복 체크
function checkId() {
    let id = document.getElementById('id').value;

    if (id === "") {
        document.getElementById('error-id').innerHTML = "먼저 아이디를 입력하세요";
    } else {
        window.open("./checkId.jsp?id=" + id, "myWindow", "width=450,height=150 top=100 left=200") //타겟명을 주면 똑같은창이 반복되서 생성안된다
        //아이디를 실어보내기위해 url 뒤에 ?변수=값 을 추가해서 보냄
    }
}

//이메일
function changeEmail() {
    document.getElementById("email2").value = document.getElementById("email3").value;

}

//회원가입
function memberWrite() {
    document.getElementById("error-name").innerHTML = "";
    document.getElementById("error-id").innerHTML = "";
    document.getElementById("error-pwd").innerHTML = "";
    document.getElementById("error-pwdChk").innerHTML = "";

    if (document.getElementById("name").value === "") {
        document.getElementById('error-name').innerHTML = "이름 입력";
    } else if (document.getElementById("id").value === "") {
        document.getElementById("error-id").innerHTML = "아이디 입력";
    } else if (document.getElementById("pwd").value === "") {
        document.getElementById("error-pwd").innerHTML = "비밀번호 입력";
    } else if (document.getElementById("pwd").value !== document.getElementById("pwdChk").value) {
        document.getElementById("error-pwdChk").innerHTML = "비밀번호가 맞지 않습니다";
    } else if (document.getElementById("id").value !== document.getElementById("check").value) {
        document.getElementById("error-id").innerHTML = "중복체크 하세요";
    } else {
        document.join.submit();
    }
}

//우편번호 다음 API
function checkPost() {
    new daum.Postcode({
        oncomplete: function (data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("addr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr2").focus();
        }
    }).open();
}




