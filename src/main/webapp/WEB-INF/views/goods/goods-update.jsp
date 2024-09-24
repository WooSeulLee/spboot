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
			<th>상품이름</th>
			<td><input type="text" id="giName"></td>
		</tr>
		<tr>
			<th>상품가격</th>
			<td><input type="text" id="giPrice"></td>
		</tr>
		<tr>
			<th>상품소개</th>
			<td><input type="text" id="giDesc"></td>
		</tr>
		<tr>
			<th colspan="2">
				<button onclick="updateGoods()">수정</button>
			</th>
		</tr>
	</table>
	<input type="hidden" id="giNum">
	
	<script>
		window.onload = getGoods;
		const giNum = '${param.giNum}';
		function getGoods() {
			const xhr = new XMLHttpRequest();
			xhr.open('GET', '/goods/' + giNum);
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4) {
					if (xhr.status === 200) {
						console.log(xhr.responseText);
						const goods = JSON.parse(xhr.responseText);
						for ( const key in goods) {
							document.querySelector('#' + key).value = goods[key];
						}
					}
				}
			}
			xhr.send();
		}

		function updateGoods() {
			var param = {
				giNum : document.querySelector('#giNum').value,
				giName : document.querySelector('#giName').value,
				giPrice : document.querySelector('#giPrice').value,
				giDesc : document.querySelector('#giDesc').value
			}
			param = JSON.stringify(param);
			const xhr = new XMLHttpRequest();
			xhr.open('PUT', '/goods');
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4) {
					if (xhr.status === 200) {
						if (xhr.responseText == 1) {
							alert('상품수정이 성공하였습니다');
							location.href = '/views/goods/goods-list';
						}
					}
				}
			}
			xhr.setRequestHeader('Content-Type', 'application/json');
			xhr.send(param);
		}
	</script>
</body>
</html>