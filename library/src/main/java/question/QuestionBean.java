package question;

import java.sql.Date;

/*CREATE DATABASE library;
use library


question테이블 정의
글번호(num) - 정수, PK 
작성자(name) - 문자16자, NN
패스워드(pass) - 문자16자, NN
제목(subject) - 문자50자, NN
내용(content) - 문자2000자, NN
작성일(date) - 날짜(DATE), NN
조회수(readcount) - 정수, NN

CREATE TABLE question(
	num INT PRIMARY KEY,
	name VARCHAR(16) NOT NULL,
	pass VARCHAR(16) NOT NULL,
	subject VARCHAR(50) NOT NULL,
	content VARCHAR(2000) NOT NULL,
	date DATE NOT NULL,
	readcount INT NOT NULL
);
*/


public class QuestionBean {
	
	private int num;
	private String name;
	private String pass;
	private String subject;
	private String content;
	private Date date;
	
	
	public QuestionBean() {
	}

	
	
	public QuestionBean(int num, String name, String pass, String subject, String content, Date date, int readcount) {
		super();
		this.num = num;
		this.name = name;
		this.pass = pass;
		this.subject = subject;
		this.content = content;
		this.date = date;
		this.readcount = readcount;
	}

	
	

	public QuestionBean(int num, String name, String pass, String subject, String content) {
		super();
		this.num = num;
		this.name = name;
		this.pass = pass;
		this.subject = subject;
		this.content = content;
	}



	public QuestionBean(String name, String pass, String subject, String content) {
		super();
		this.name = name;
		this.pass = pass;
		this.subject = subject;
		this.content = content;
	}



	private int readcount;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
	
	
	

}
