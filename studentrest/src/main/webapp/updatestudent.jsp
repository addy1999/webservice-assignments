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
function listStudentApi(rol){ 
	
	var xmlhttp, Obj, x;
	xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
	  if (this.readyState == 4 && this.status == 200) {
	    Obj = JSON.parse(this.responseText);
	    console.log(Obj);
	    
	    $("#UpdateStudent").append("<tr>"+
	    		'<td>Roll: </td><td> <input type="text" id="roll" value="'+Obj.roll+'"/> </td></tr>'+
	    		'<tr><td>Name: </td> <td> <input type="text" id="name" value="'+Obj.name+'"/> </td></tr>'+
        '<tr><td>Semester: </td><td><input type="text" id="semester" value="'+Obj.semester+'"/></td></tr> '+
       '<tr><td>CGPA: </td> <td><input type="text" id="cgpa" value="'+Obj.cgpa+'"/></td></tr>'+
        '<tr><td colspan="2"><button onclick="updateStudent(),index()">Update</button> </td>'+
        '</tr></table></form>');
	  }
	};
	let url = "http://localhost:8081/studentrest/webapi/students/student/"+rol;
	xmlhttp.open("GET",url, true);
	xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.send();
		
	} 
$(document).ready(function () {
	$.urlParam = function(name){
	    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
	    if (results == null){
	       return null;
	    }
	    else {
	       return decodeURI(results[1]) || 0;
	    }
	}
	const rol = $.urlParam('roll')
	console.log(rol);
	listStudentApi(rol);
});
function updateStudent(){ 
	

	let result = document.querySelector('.result'); 
	let roll = document.querySelector('#roll'); 
	let name = document.querySelector('#name'); 
	let semester = document.querySelector('#semester'); 
	let cgpa = document.querySelector('#cgpa'); 

	let xhr = new XMLHttpRequest(); 
	
	let url = "http://localhost:8081/studentrest/webapi/students/student"; 

	xhr.open("PUT", url, true); 
	xhr.setRequestHeader("Content-Type", "application/json"); 

	var data = JSON.stringify({ "roll": roll.value, "name": name.value,"semester": semester.value,"cgpa": cgpa.value }); 
 
	xhr.send(data);
} 
function index(){
	window.open("index.jsp") ;
}
</script>
<body>
<% %>
<h2>Update Student Form</h2>
        <form>  
        <table id='UpdateStudent'>  
            
</body>
</html>