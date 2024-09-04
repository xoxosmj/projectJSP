//아이디 중복 체크
function checkId() {
    let id = document.getElementById('id').value;

    if(id === "")
    {
        document.getElementById('error-id').innerHTML="먼저 아이디를 입력하세요";
    }
    else{
        window.open("./checkId.jsp?id="+id,"myWindow","width=450,height=150 top=100 left=200") //타겟명을 주면 똑같은창이 반복되서 생성안된다
    //아이디를 실어보내기위해 url 뒤에 ?변수=값 을 추가해서 보냄
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

<!-- 제목, 내용은 유효성검사 하기 -->
$(function () {

    $('input[type="submit"]').click(function () {
        $('#error-name').empty();
        $('#error-id').empty();
        $('#error-pwd').empty();
        $('#error-pwdChk').empty();

        if (!$('#name').val()) {
            $('#error-name').html('이름을 입력하세요.');
            $('#name').focus();
        } else if (!$('#id').val()) {
            $('#error-id').html('아이디를 입력하세요.');
            $('#id').focus();
        } else if (!$('#pwd').val()) {
            $('#error-pwd').html('비밀번호를 입력하세요.');
            $('#pwd').focus();
        } else if (!$('#pwdChk').val()) {
            $('#error-pwdChk').html('비밀번호 재확인을 입력하세요.');
            $('#pwdChk').focus();
        } else if ($('#pwd').val() != $('#pwdChk').val()) {
            $('#error-pwdChk').html('비밀번호가 일치하지 않습니다.');
            $('#pwdChk').val('');
            $('#pwdChk').focus();
        } else if ($('#isCheckId').val() != true) {
            $('#error-id').html('아이디 중복체크를 확인하세요.');
            $('#id').focus();
        } else {
            $('#join').submit();
        }

        return false;
    })
})

