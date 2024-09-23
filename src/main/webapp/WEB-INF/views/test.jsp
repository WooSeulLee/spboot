<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
드라이브<input type="checkbox" name="uiHobby" value="드라이브"> 영화<input type="checkbox" name="uiHobby" value="영화"><br>
<script>
const json = '{"uiHobby":"드라이브"}';
const user = JSON.parse(json);
const hobbies = user.uiHobby.split(',');
for(const hobby of hobbies){
	document.querySelector('[value=' + hobby +']').checked = true;
}
</script>
</body>
</html>