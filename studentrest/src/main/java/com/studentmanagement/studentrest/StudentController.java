package com.studentmanagement.studentrest;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.*;

@Path("students")
public class StudentController {
	
	StudentRepository stu;
	
	public StudentController() {
		stu=new StudentRepository();
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<Student> getAllStudent() {
		
		return stu.getAllStudents();
		
	}
	
	@GET
	@Path("student/{roll}")
	@Produces(MediaType.APPLICATION_JSON)
	public Student getStudentByRoll(@PathParam("roll") String roll) {
		
		return stu.getStudentByRoll(roll);
		
	}
	
	@POST
	@Path("newstudent")
	@Consumes(MediaType.APPLICATION_JSON)
	public void addStudent(Student s) {
		
		stu.addStudent(s);
		
	}
	
	@PUT
	@Path("student")
	@Consumes(MediaType.APPLICATION_JSON)
	public void updateStudent(Student s) {
		
		if(stu.getStudentByRoll(s.getRoll()).getRoll()==null) {
			stu.addStudent(s);
		}
		else {
			stu.updateStudent(s);
		}
	}
	
	@DELETE
	@Path("student/{roll}")
	public void deleteStudent(@PathParam("roll") String roll) {
		
		Student s=stu.getStudentByRoll(roll);
		
		if(s.getRoll()!=null)
			stu.deleteStudent(roll);
		
	}

}
