<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button onclick="getCars()">값 가져오기</button>
<table border="1">
	<tr>
		<th>번호</th>
		<th>모델명</th>
		<th>연식</th>
	</tr>
	<tbody id="tBody"></tbody>
</table>
<script>

function getCars(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/cars');
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState===4){
			if(xhr.status===200){
				const cars = JSON.parse(xhr.responseText);
				var html = '';
				for(const car of cars){
					html += '<tr>';
					html += '<td>' + car.ciNum + '</td>';
					html += '<td>' + car.ciName + '</td>';
					html += '<td>' + car.ciYear + '</td>';
					html += '</tr>';
				}
				document.querySelector('#tBody').innerHTML = html;
			}
		}
	}
	xhr.send();
}
</script>
</body>
</html>