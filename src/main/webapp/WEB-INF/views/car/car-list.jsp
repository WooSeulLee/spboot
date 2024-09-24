<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/boot/css/bootstrap.css" />
<link rel="stylesheet" href="/boot/css/bootstrap-grid.css" />
<link rel="stylesheet" href="/boot/css/bootstrap-reboot.css" />
<link rel="stylesheet" href="/boot/css/bootstrap-utilities.css" />
<script src="/boot/js/bootstrap.bundle.js"></script>
<script src="/boot/js/bootstrap.js"></script>
</head>
<body>
	<div class="container">
		<input type="text" id="ciNum" placeholder="번호">
		<input type="text" id="ciName" placeholder="모델명">
		<input type="text" id="ciYear" placeholder="연식">
		<button onclick=getCars(1)>검색</button>
		<div id="total"></div>
		<select id="count" onchange="getCars(1)">
			<option value="10">10</option>
			<option value="20">20</option>
			<option value="50">50</option>
			<option value="100">100</option>
		</select>
		<table border="1" class="table table-striped table-hover">
			<tr>
				<th data-col='ciNum' scope="col">번호</th>
				<th data-col='ciName' scope="col">모델명</th>
				<th data-col='ciYear' scope="col">연식</th>
			</tr>
			<tbody id="tBody"></tbody>
			<tr>
				<th colspan="3" id="pagination" scope="col" class="text-center"></th>
			</tr>
		</table>
	</div>
	<a href="/views/car/car-insert">차량등록</a>
	
	<script>
function getCars(page){
	var count = document.querySelector('#count').value;
	var xhr = new XMLHttpRequest();
	var url = '/cars?page=' + page + '&ciName=' + document.querySelector('#ciName').value;
	url += '&ciYear=' + document.querySelector('#ciYear').value;
	url +='&count=' + count;

	xhr.open('GET',url);
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState===4){
			if(xhr.status===200){
				const result = JSON.parse(xhr.responseText);
				const cars = result.list;
				var html = '';
				for(const car of cars){
					html += '<tr>';
					html += '<td>' + car.ciNum + '</td>';
					html += '<td><a href="/views/car/car-view?ciNum=' + car.ciNum + '">' + car.ciName + '</a></td>';
					html += '<td>' + car.ciYear + '</td>';
					html += '</tr>';
				}
				document.querySelector('#tBody').innerHTML = html;
				document.querySelector('#total').innerHTML = '총갯수 :'+ result.count;
				html='';
				var sNum = (Math.ceil(page/10)-1)*10+1;
				var lNum = sNum + 9;
				var total = Math.ceil(result.count/count);
				if(lNum>total){
					lNum = total;
				}
				if(sNum != 1){
					html+='<a href="javascript:getCars(' + (sNum-1) + ')">◀</a>'
				}
				for(var i = sNum ; i <= lNum ; i++){
					if(i===page){
						html += ' [' + i + ']';
					}else{
						html += '<a href="javascript:getCars(' + i + ')">[' + i + ']</a> ';
					}
				}
				if(lNum != total){
					html+='<a href="javascript:getCars(' + (lNum+1) + ')">▶</a>';
				}
				document.querySelector('#pagination').innerHTML = html;
			}
		}
	}
	xhr.send();
}
window.onload = getCars.bind(null,1);
</script>
</body>
</html>