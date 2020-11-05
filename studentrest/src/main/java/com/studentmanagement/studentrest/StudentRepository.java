package com.studentmanagement.studentrest;

import java.util.*;
import java.sql.*;

public class StudentRepository {
	
	Connection con;
	
	public StudentRepository(){
		
		String url = "jdbc:mysql://localhost:3307/studentdb";
		String user = "root";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url,user,"");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Student> getAllStudents(){
		
		List<Student> students = new ArrayList<>();
		String sql = "SELECT * FROM studetails";
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				Student s = new Student();
				s.setCgpa(rs.getString("cgpa"));
				s.setName(rs.getString("fullname"));
				s.setRoll(rs.getString("roll"));
				s.setSemester(rs.getString("semester"));
				students.add(s);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return students;
		
	}
	
	public Student getStudentByRoll(String roll) {
		
		String sql = "SELECT * FROM studetails WHERE roll = ?";
		Student s = new Student();
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, roll);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				s.setCgpa(rs.getString("cgpa"));
				s.setName(rs.getString("fullname"));
				s.setRoll(rs.getString("roll"));
				s.setSemester(rs.getString("semester"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return s;
		
	}

	public void addStudent(Student s) {
		
		String sql = "INSERT INTO studetails(roll,fullname,semester,cgpa) VALUES (?,?,?,?)";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, s.getRoll());
			ps.setString(2, s.getName());
			ps.setString(3, s.getSemester());
			ps.setString(4, s.getCgpa());
			ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void updateStudent(Student s) {
			
		String sql = "UPDATE studetails SET fullname=?,semester=?,cgpa=? WHERE roll=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, s.getName());
			ps.setString(2, s.getSemester());
			ps.setString(3, s.getCgpa());
			ps.setString(4, s.getRoll());
			ps.executeUpdate();
				
		}catch(Exception e) {
			e.printStackTrace();
		}
			
	}

	public void deleteStudent(String roll) {
		
		String sql = "DELETE FROM studetails WHERE roll=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, roll);
			ps.executeUpdate();
				
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
