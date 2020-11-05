package com.studentmanagement.studentrest;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Student {

	private String roll, name, semester, cgpa;

	public String getRoll() {
		return roll;
	}

	public void setRoll(String roll) {
		this.roll = roll;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public String getCgpa() {
		return cgpa;
	}

	public void setCgpa(String cgpa) {
		this.cgpa = cgpa;
	}

	@Override
	public String toString() {
		return "Student [roll=" + roll + ", name=" + name + ", semester=" + semester + ", cgpa=" + cgpa + "]";
	}
	
	
}
