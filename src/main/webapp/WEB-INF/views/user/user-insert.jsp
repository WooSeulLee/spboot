<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="text" id="uiId" placeholder="ID"><br>
<input type="text" id="uiPwd" placeholder="Password"><br>
<input type="text" id="uiName" placeholder="이름"><br>
남<input type="radio" name="uiGender" value="1"> 여<input type="radio" name="uiGender" value="2"><br>
<input type="date" id="uiBirth" placeholder="생년월일"><br>

드라이브<input type="checkbox" name="uiHobby" value="드라이브"> 영화<input type="checkbox" name="uiHobby" value="영화"><br>
<textarea id="uiDesc"></textarea><br>
<button onclick="insertUser()">유저등록</button>
<script>
function insertUser(){
	var uiHobbies = document.querySelectorAll('[name=uiHobby]:checked');
	var uiHobby = '';
	for(const hobby of uiHobbies){
		uiHobby += hobby.value + ',';
	}
	uiHobby = uiHobby.substring(0, uiHobby.length-1);
	const uiBirth = document.querySelector('#uiBirth').value.replaceAll('-','');
	var param = {
			uiId : document.querySelector('#uiId').value,
			uiPwd : document.querySelector('#uiPwd').value,
			uiName : document.querySelector('#uiName').value,
			uiGender : document.querySelector('[name=uiGender]:checked').value,
			uiBirth : uiBirth,
			uiHobby : uiHobby,
			uiDesc : document.querySelector('#uiDesc').value
	}
	param = JSON.stringify(param);
	
	const xhr = new XMLHttpRequest();
	xhr.open('POST','/users');
	xhr.onreadystatechange = function(){
		if(xhr.readyState===4){
			if(xhr.status === 200){
				if(xhr.responseText == 1){
					alert('유저등록 성공!');
					location.href='/views/user/user-list'
				}
			}
		}
	}
	xhr.setRequestHeader('Content-Type','application/json');
	xhr.send(param);
}
</script>
</body>
</html>