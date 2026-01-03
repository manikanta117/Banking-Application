package com.bank.dto;

public class LoginRequest {
private Long accountNumber;
private String password;
public Long getAccountNumber() {
	return accountNumber;
}
public void setAccountNumber(Long accountNumber) {
	this.accountNumber = accountNumber;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}

}
