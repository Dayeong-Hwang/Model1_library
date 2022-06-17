package book;

/*

CREATE DATABASE library;
use library


book 테이블 정의

청구기호(num) - 문자16자, NN
도서명(bookname) - 문자50자, NN
저자명(name) - 문자50자, NN
발행처(publisher) - 문자16자, NN
대여상태(rental) - 문자16자, NN


CREATE TABLE book(
	num VARCHAR(16) PRIMARY KEY,
	bookname VARCHAR(50) NOT NULL,
	name VARCHAR(50) NOT NULL,
	publisher VARCHAR(16) NOT NULL,
	rental VARCHAR(16) NOT NULL
);

*/

public class BookBean {
	
	
	private String bookname;
	private String num;
	private String name;
	private String publisher;
	private String rental;
	

	public BookBean() {
	}

	public BookBean(String bookname, String num, String name, String publisher, String rental) {
		super();
		this.bookname = bookname;
		this.num = num;
		this.name = name;
		this.publisher = publisher;
		this.rental = rental;
	}



	public BookBean(String bookname, String num, String name, String publisher) {
		super();
		this.bookname = bookname;
		this.num = num;
		this.name = name;
		this.publisher = publisher;
	}



	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getRental() {
		return rental;
	}

	public void setRental(String rental) {
		this.rental = rental;
	}

	
	
	@Override
	public String toString() {
		return "BookBean [num=" + num + ", bookname=" + bookname + ", name=" + name + ", publisher=" + publisher
				+ ", rental=" + rental + "]";
	}
	
	
}
