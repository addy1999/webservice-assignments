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
function listStudentsApi(){ 
	
	var xmlhttp, Obj, x;
	xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
	  if (this.readyState == 4 && this.status == 200) {
	    Obj = JSON.parse(this.responseText);
	    for (x in Obj) {
	    $("#StudentTable").append("<tr>" + 
	        "<td>"+Obj[x].roll+"</td>" +
	        "<td>"+Obj[x].name+"</td>" +
	        "<td>"+Obj[x].semester+"</td>" +
	        "<td>"+Obj[x].cgpa+"</td>" +
	        "<td><button onclick='window.location.href=\"updatestudent.jsp?roll="+Obj[x].roll+" \"'>Edit</button></td>"+
	        "<td><button onclick='deleteStudent("+ Obj[x].roll+")'>delete</button> </td>"+
	        "</tr>");
	    	 }
	    
		
	    $("#StudentTable").append("<tr>"+
        '<td colspan="6"><button onclick="window.location.href=\'addstudent.jsp\'">Add</button> </td>'+
        '</tr></table>');
	  }
	};
	
	xmlhttp.open("GET", "http://localhost:8081/studentrest/webapi/students", true);
	xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.send();
		
	} 
$(document).ready(function () {
	listStudentsApi();
});
function deleteStudent(sid){ 
	
	let result = document.querySelector('.result');  
	

	let xhr = new XMLHttpRequest(); 
	
	let url = "http://localhost:8081/studentrest/webapi/students/student/"+sid;
	xhr.open("DELETE", url, true); 
	
	xhr.setRequestHeader("Content-Type", "application/json"); 
	xhr.onreadystatechange = function () { 
		if (xhr.readyState === 4 && xhr.status === 200) {
			return;
		} 
	}; 
	xhr.send();
	window.location.reload();
}  
</script>
<body>
			
<table id="StudentTable" border="1" width="90%">
				<thead>
					<tr>
						<th>Roll</th>
						<th>Name</th>
						<th>Semester</th>
						<th>CGPA</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
				</thead>

</body>
</html>