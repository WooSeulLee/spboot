<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>상품리스트</h3>

	<br>
	<br>
	<table border="1">
		<tr>
			<th data-col='giNum'>번호</th>
			<th data-col='giName'>상품명</th>
		</tr>
		<tbody id="tBody"></tbody>
	</table>
	<br>
	<br>
	<a href="/views/goods/goods-insert">상품 등록</a>
	<script>
		function getGoods(){
			const xhr = new XMLHttpRequest();
			xhr.open('GET','/goods');			
			xhr.onreadystatechange = function(){
				if(xhr.readyState===4){
					if(xhr.status===200){
						const goodsList = JSON.parse(xhr.responseText);
						var html ='';
						for(const goods of goodsList){
							html+='<tr>';
							html+='<td>'+ goods.giNum + '</td>';
							html+='<td><a href = "/views/goods/goods-view?giNum='+ goods.giNum + '">'+ goods.giName + '</td>';
							html+='</tr>';
						}
						document.querySelector('#tBody').innerHTML = html;
						}
					}
				}
			xhr.send();
		}		
		window.onload = getGoods;
	</script>



</body>
</html>