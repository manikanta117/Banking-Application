package com.bank.dto;

public class TransferRequest {

	private Long ReciverAccountNumber;
	private double Amount;
	public Long getReciverAccountNumber() {
		return ReciverAccountNumber;
	}
	public void setReciverAccountNumber(Long reciverAccountNumber) {
		ReciverAccountNumber = reciverAccountNumber;
	}
	public double getAmount() {
		return Amount;
	}
	public void setAmount(double amount) {
		Amount = amount;
	}
	
}
