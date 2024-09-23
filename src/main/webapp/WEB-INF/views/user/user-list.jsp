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
		<th data-col='uiNum'>번호</th>
		<th data-col='uiName'>이름</th>
		<th data-col='uiId'>아이디</th>
	</tr>
	<tbody id="tBody"></tbody>
</table>
<script>
function getUsers(){
	const xhr = new XMLHttpRequest();
	xhr.open('GET','/users');
	xhr.onreadystatechange = function(){
		if(xhr.readyState === 4){
			if(xhr.status === 200){
				const users = JSON.parse(xhr.responseText);
				var html ='';
				for(const user of users){
					html += '<tr>';
					html += '<td>' + user.uiNum + '</td>';
					html += '<td><a href="/views/user/user-view?uiNum=' + user.uiNum + '">' + user.uiName + '</a></td>';
					html += '<td>' + user.uiId + '</td>';
					html += '</tr>';
				}
				document.querySelector('#tBody').innerHTML = html;
			}
		}
	}
	xhr.send();
}
window.onload = getUsers;
</script>
</body>
</html>