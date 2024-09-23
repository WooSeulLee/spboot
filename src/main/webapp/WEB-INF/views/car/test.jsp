<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div data-col="ciNum"></div>
<div data-col="ciName"></div>
<div data-col="ciYear"></div>
<script>
	const json = '{"ciNum":9,"ciName":"페라리","ciYear":"2021"}';	
	const car = JSON.parse(json);
	for(const key in car){
		
		document.querySelector('div[data-col=' + key +  ']').innerHTML = car[key];
	}
</script>
</body>
</html>