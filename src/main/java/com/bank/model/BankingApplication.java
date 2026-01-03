package com.bank.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class BankingApplication {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int userid;
@Column(unique = true)
private Long  accountNumber;
private String username;
private String password;
private double balance;
public BankingApplication() {
	super();
	// TODO Auto-generated constructor stub
}
public BankingApplication(int userid, Long  accountNumber, String username, String password, double balance) {
	super();
	this.userid = userid;
	this.accountNumber = accountNumber;
	this.username = username;
	this.password = password;
	this.balance = balance;
}
public int getUserid() {
	return userid;
}
public void setUserid(int userid) {
	this.userid = userid;
}
public Long  getAccountNumber() {
	return accountNumber;
}
public void setAccountNumber(Long  accountNumber) {
	this.accountNumber = accountNumber;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public double getBalance() {
	return balance;
}
public void setBalance(double balance) {
	this.balance = balance;
}
@Override
public String toString() {
	return "BankingApplication [userid=" + userid + ", accountNumber=" + accountNumber + ", username=" + username
			+ ", password=" + password + ", balance=" + balance + "]";
}

}
