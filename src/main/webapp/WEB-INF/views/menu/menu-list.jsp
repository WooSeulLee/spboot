<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="text" id="miNum" placeholder="번호">
	<input type="text" id="miName" placeholder="이름">
	<button onclick = getMenus(1)>검색</button><br><br>
	<a href="/views/menu/menu-insert">메뉴 등록하기</a><br><br>
	<div id ="total"></div>
	<select id="count" onchange="getMenus(1)">
		<option value = "10">10</option>
		<option value = "20">20</option>
		<option value = "50">50</option>
		<option value = "100">100</option>
	</select>
	<table border="1">
		<tr>
			<th data-col='uiNum'>번호</th>
			<th data-col='uiName'>메뉴명</th>
			<th data-col='uiPrice'>가격</th>
			<th data-col='uiPath'>이미지</th>
		</tr>
		<tbody id="tBody"></tbody>
		<tr>
			<th colspan="4" id="pagination"></th>
		</tr>
	</table>
	<script>
		function getMenus(page){
			var count = document.querySelector('#count').value;
			const xhr = new XMLHttpRequest();
			var url ='/menus?page=' + page + '&miNum=' + document.querySelector('#miNum').value;
			url+='&miName=' + document.querySelector('#miName').value;
			url += '&count=' +  count;
			
			xhr.open('GET',url);
			xhr.onreadystatechange = function(){
				if(xhr.readyState === 4){
					if(xhr.status === 200){
						const result = JSON.parse(xhr.responseText);
						const menus = result.list;
						var html = '';
						for(const menu of menus){
							html += '<tr>';
							html += '<td>' + menu.miNum + '</td>';
							html += '<td><a href="/views/menu/menu-update?miNum='+ menu.miNum+'">' + menu.miName + '</a></td>';
							html += '<td>' + menu.miPrice + '원</td>';
							if(menu.miPath){
								html += '<td> <img src="' + menu.miPath + '" width="200" height="100"></td>';
							}else{
								html += '<td> <img src="/upload/no-image.jpg" width="200" height="100"></td>';
							}
							html += '</tr>';
						}
						document.querySelector('#tBody').innerHTML = html;
						document.querySelector('#total').innerHTML = '총갯수: ' + result.count;
						html='';
						var sNum = (Math.ceil(page/10)-1)*10+1;
						var lNum = sNum + 9;
						var total = Math.ceil(result.count/count);
						if(lNum>total){
							lNum = total;
						}
						if(sNum != 1){
							html +='<a href="javascript:getMenus('+ (sNum-1) + ')">◀</a>';
						}
						for(var i = sNum ; i <= lNum ; i++){
							if(i === page){
								html += ' [' + i + ']';
							}else{
								html += '<a href="javascript:getMenus('+ i + ')">[' + i + ']</a>';
							}
						}
						if(lNum != total){
							html += '<a href="javascript:getMenus('+ (lNum+1) + ')">▶</a>'
						}
						document.querySelector('#pagination').innerHTML = html;
					}
				}
			}
			xhr.send();
		}
		window.onload = getMenus.bind(null,1);
	</script>
</body>
</html>