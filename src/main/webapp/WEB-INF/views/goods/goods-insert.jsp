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
				<button onclick="insertGoods()">등록</button>
			</th>
		</tr>
	</table>
	<script>
		function insertGoods(){
			var param = {
					giName : document.querySelector('#giName').value,
					giPrice : document.querySelector('#giPrice').value,
					giDesc : document.querySelector('#giDesc').value
			}
			param = JSON.stringify(param);
			const xhr = new XMLHttpRequest();
			xhr.open('POST','/goods');
			xhr.onreadystatechange = function(){
				if(xhr.readyState ===4){
					if(xhr.status === 200){
						if(xhr.responseText == 1){
							alert('상품등록이 성공하였습니다');
							location.href = '/views/goods/goods-list';
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