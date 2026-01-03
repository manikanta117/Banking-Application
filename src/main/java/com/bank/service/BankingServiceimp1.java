package com.bank.service;


import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bank.dto.DepositRequest;
import com.bank.dto.LoginRequest;
import com.bank.dto.RegisterRequest;
import com.bank.model.BankingApplication;
import com.bank.repo.BankingApplicationrepo;

@Service
public class BankingServiceimp1 implements BankingService {
@Autowired private BankingApplicationrepo repo;

private Long generateAccountNumber() {
	Long accountNumber;
	do {
		accountNumber=(long)(Math.random()*9000000000L)+1000000000L;
	}
	while(repo.findByAccountNumber(accountNumber).isPresent());
	
		return accountNumber;
}
public BankingApplication register(RegisterRequest request) {
	BankingApplication user = new BankingApplication();
	user.setUsername(request.getUsername());
	user.setPassword(request.getPassword());
	
	Long accountNumber = generateAccountNumber();
	user.setAccountNumber(accountNumber);
	
	user.setBalance(0.0);
	return repo.save(user);
}


public BankingApplication login(LoginRequest request) {
	
	Optional<BankingApplication> userOptional = repo.findByAccountNumber(request.getAccountNumber());
	
	if(userOptional.isEmpty()) {
		return null;
	}
	BankingApplication user = userOptional.get();


	
	if(!user.getPassword().equals(request.getPassword())) { // if out writeen password and password that exist with account number then return null
		return null;
	}
	return user;
}

@Override
public BankingApplication findByAccountNumber(Long accountNumber) {
    return repo.findByAccountNumber(accountNumber).orElse(null);
}


public BankingApplication deposit(DepositRequest request) {
	BankingApplication user = repo.findByAccountNumber(request.getAccountNumber()).orElse(null);
	if(user==null) {
		return null;
	}
	
	double newBalance = user.getBalance()+request.getAmount();
	user.setBalance(newBalance);
	return repo.save(user);
	
}
@Transactional
public String transfer(Long senderAccountNumber,Long reciverAccountNumber,double amount) {
	BankingApplication sender = repo.findByAccountNumber(senderAccountNumber).orElse(null);
	BankingApplication reciver = repo.findByAccountNumber(reciverAccountNumber).orElse(null);
	
	if(sender==null) {
		return "sender-not-found";
	}
	if(reciver==null) {
		return "reciver-not-found";
	}
	if(sender.getBalance()<amount) {
		return "Insufficient Balance";
	}
	// deduct from sender and set the remaining balance in senders account
	sender.setBalance(sender.getBalance()-amount);
	// add balance 
	reciver.setBalance(reciver.getBalance()+amount);
	
	repo.save(sender);
	repo.save(reciver);	
	return "sucess";
}

}
