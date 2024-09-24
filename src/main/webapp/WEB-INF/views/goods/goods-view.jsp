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
			<th>상품번호</th>
			<td data-col="giNum"></td>
		</tr>
		<tr>
			<th>상품이름</th>
			<td data-col="giName"></td>
		</tr>
		<tr>
			<th>상품가격</th>
			<td data-col="giPrice"></td>
		</tr>
		<tr>
			<th>상품소개</th>
			<td data-col="giDesc"></td>
		</tr>
		<tr>
			<th>상품등록날짜</th>
			<td data-col="credat"></td>
		</tr>
		<tr>
			<th colspan="2">
				<button
					onclick="location.href = '/views/goods/goods-update?giNum=${param.giNum}'">수정</button>
				<button onclick="deleteGoods()">삭제</button>
			</th>
		</tr>
	</table>
	<script>
		const giNum = '${param.giNum}';
		function deleteGoods(){
			const xhr = new XMLHttpRequest();
			xhr.open('DELETE','/goods/' + giNum);
			xhr.onreadystatechange = function(){
				if(xhr.readyState === 4){
					if(xhr.status === 200){
						if(xhr.responseText == 1){
							alert('상품이 정상적으로 삭제됐습니다.');
							location.href='/views/goods/goods-list';
						}
					}
				}
			}
			xhr.send();
		}
		
		function getGoods(){
			const xhr = new XMLHttpRequest();
			xhr.open('GET','/goods/'+ giNum);
			xhr.onreadystatechange = function(){
				if(xhr.readyState ===4){
					if(xhr.status === 200){
						console.log(xhr.responseText);
						const goods = JSON.parse(xhr.responseText);
						for(const key in goods){
							document.querySelector('td[data-col=' + key + ']').innerHTML = goods[key];
						}
					}
				}
			}
			xhr.send();
		}
		getGoods();
	</script>
</body>
</html>