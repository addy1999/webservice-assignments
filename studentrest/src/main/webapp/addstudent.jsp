<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix = "c"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script>
function addStudent(){ 
	

	let result = document.querySelector('.result'); 
	let roll = document.querySelector('#roll'); 
	let name = document.querySelector('#name'); 
	let semester = document.querySelector('#semester'); 
	let cgpa = document.querySelector('#cgpa'); 

	let xhr = new XMLHttpRequest(); 
	
	let url = "http://localhost:8081/studentrest/webapi/students/newstudent"; 

	xhr.open("POST", url, true); 
	xhr.setRequestHeader("Content-Type", "application/json"); 

	var data = JSON.stringify({ "roll": roll.value, "name": name.value,"semester": semester.value,"cgpa": cgpa.value }); 
 
	xhr.send(data); 
} 
function index(){
	window.open("index.jsp") ;
}
</script>
<body>
<h2>Add Student Form</h2>
        <form>  
        <table>  
            <tr><td>Roll: </td><td><input type="text" id="roll"/></td></tr>  
            <tr><td>Name: </td><td><input type="text" id="name"/></td></tr>  
            <tr><td>Semester: </td><td><input type="text" id="semester"/></td></tr>  
            <tr><td>CGPA: </td><td><input type="text" id="cgpa"/></td></tr>  
            <tr><td><button onclick="addStudent(),index()">ADD</button></td><td><button type="reset">Reset</button></td></tr>  
        </table>  
        </form>
        <button onclick="window.location.href='index.jsp'">Cancel</button>
</body>
</html>