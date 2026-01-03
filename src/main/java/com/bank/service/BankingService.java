package com.bank.service;

import com.bank.dto.DepositRequest;
import com.bank.dto.LoginRequest;
import com.bank.dto.RegisterRequest;
import com.bank.dto.TransferRequest;
import com.bank.model.BankingApplication;

public interface BankingService {
BankingApplication register (RegisterRequest request);
BankingApplication login(LoginRequest request);
public BankingApplication findByAccountNumber(Long accountNumber);
BankingApplication deposit(DepositRequest request);
String transfer(Long senderAccountNumber,Long reciverAccountNumber,double amount);
}
