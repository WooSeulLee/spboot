<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<th>번호</th>
		<td data-col="uiNum"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td data-col="uiName"></td>
	</tr>
	<tr>
		<th>아이디</th>
		<td data-col="uiId"></td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td data-col="uiBirth"></td>
	</tr>
	<tr>
		<th colspan="2">
			<button onclick="location.href='/views/user/user-update?uiNum=${param.uiNum}'">수정</button>
			<button onclick="deleteUser()">삭제</button>
		</th>
	</tr>
</table>
<script>
const uiNum = '${param.uiNum}';
function getUser(){
	const xhr = new XMLHttpRequest();
	xhr.open('GET','/users/' + uiNum);
	xhr.onreadystatechange = function(){
		if(xhr.readyState === 4){
			if(xhr.status === 200){
				const user = JSON.parse(xhr.responseText);
				document.querySelector('td[data-col=uiNum]').innerHTML = user.uiNum;
				document.querySelector('td[data-col=uiName]').innerHTML = user.uiName;
				document.querySelector('td[data-col=uiId]').innerHTML = user.uiId;
				document.querySelector('td[data-col=uiBirth]').innerHTML = user.uiBirth;
			}
		}
	}
	xhr.send();
}
function deleteUser(){
	const xhr = new XMLHttpRequest();
	xhr.open('DELETE','/users/' + uiNum);
	xhr.onreadystatechange = function(){
		if(xhr.readyState === 4){
			if(xhr.status === 200){
				if(xhr.responseText == 1){
					alert('삭제 완료');
					location.href='/views/user/user-list';
				}
			}
		}
	}
	xhr.send();
}
window.onload = getUser;
</script>
</body>
</html>