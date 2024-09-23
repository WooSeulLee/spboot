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
		<th>모델명</th>
		<td><input type="text" id="ciName"></td>
	</tr>
	<tr>
		<th>연식</th>
		<td><input type="text" id="ciYear"></td>
	</tr>
	<tr>
		<th colspan="2"><button onclick="updateCar()">수정</button></th>
	</tr>
</table>
<input type="hidden" id="ciNum">
<script>
	window.onload = getCar;
	const ciNum = '${param.ciNum}';
	function getCar(){
		const xhr = new XMLHttpRequest();
		xhr.open('GET','/cars/' + ciNum);
		xhr.onreadystatechange = function(){
			if(xhr.readyState === 4){
				if(xhr.status === 200){
					console.log(xhr.responseText);
					const car = JSON.parse(xhr.responseText);
					for(const key in car){
						document.querySelector('#' + key).value = car[key];
					}
				}
			}
		}
		xhr.send();
	}
	function updateCar(){
		var param = {
				ciNum : document.querySelector('#ciNum').value,
				ciName : document.querySelector('#ciName').value,
				ciYear : document.querySelector('#ciYear').value
		}
		param = JSON.stringify(param);
		const xhr = new XMLHttpRequest();
		xhr.open('PUT','/cars');
		xhr.onreadystatechange = function(){
			if(xhr.readyState === 4){
				if(xhr.status === 200){
					if(xhr.responseText == 1){
						alert('차량수정이 성공하였습니다.');
						location.href='/views/car/car-list';
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