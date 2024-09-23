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
		<td data-col="ciNum"></td>
	</tr>
	<tr>
		<th>모델명</th>
		<td data-col="ciName"></td>
	</tr>
	<tr>
		<th>연식</th>
		<td data-col="ciYear"></td>
	</tr>
	<tr>
		<th colspan="2">
			<button onclick="location.href='/views/car/car-update?ciNum=${param.ciNum}'">수정</button>
			<button onclick="deleteCar()">삭제</button>
		</th>
	</tr>
</table>
<script>
	const ciNum = '${param.ciNum}';
	function deleteCar(){
		const xhr = new XMLHttpRequest();
		xhr.open('DELETE','/cars/' + ciNum);
		xhr.onreadystatechange = function(){
			if(xhr.readyState === 4){
				if(xhr.status === 200){
					if(xhr.responseText == 1){
						alert('삭제 되었습니다.');
						location.href='/views/car/car-list';
					}	
				}
			}
		}
		xhr.send();
	}
	function getCar(){
		const xhr = new XMLHttpRequest();
		xhr.open('GET','/cars/' + ciNum);
		xhr.onreadystatechange = function(){
			if(xhr.readyState === 4){
				if(xhr.status === 200){
					console.log(xhr.responseText);
					const car = JSON.parse(xhr.responseText);
					for(const key in car){
						document.querySelector('td[data-col=' + key + ']').innerHTML = car[key];
					}
				}
			}
		}
		xhr.send();
	}
	getCar();
</script>
</body>
</html>