package com.bank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bank.dto.DepositRequest;
import com.bank.dto.LoginRequest;
import com.bank.dto.RegisterRequest;
import com.bank.model.BankingApplication;
import com.bank.service.BankingService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/bank")


public class BankingController {
	
@Autowired private BankingService service;

@GetMapping("/register")
public String showRegisterPage() {
    return "register";    // this loads register.jsp
}




@PostMapping("/register")//url to access this method through ui

public String register(RegisterRequest request, ModelMap model) {
	
	BankingApplication user = service.register(request);
	model.addAttribute("message","Account Created Sucessfully! Your Account Number is: "+user.getAccountNumber());
	return "register-success";
//this is our .jsp page
}

@GetMapping("/login")
public String loginPage() {
	return "login";
}


@PostMapping("/login")
public String loging(ModelMap model,LoginRequest request,HttpSession session) {
	BankingApplication user = service.login(request);
	if(user==null) {
		model.addAttribute("message", "Invalid Account Number or Password");
		return "login";
	}
	session.setAttribute("loggedInUser",user);
	
	model.addAttribute("user", user);
	
	return "dashboard";
	
}
@PostMapping("/showBalance")
public String showBalance(Long accountNumber , ModelMap model) {
	BankingApplication user = service.findByAccountNumber(accountNumber);
	
	 model.addAttribute("user", user);
	return "show-balance";
}


@GetMapping("/dashboard")
public String dashboard(HttpSession session, ModelMap model) {

    BankingApplication loggedInUser =
        (BankingApplication) session.getAttribute("loggedInUser");

    if (loggedInUser == null) {
        return "login";
    }

    model.addAttribute("user", loggedInUser);
    return "dashboard";
}



@GetMapping("/deposit")
public 	String showDepositPage() {
	return "deposit";
}


@PostMapping("/deposit")
public String deposit(DepositRequest request, ModelMap model, HttpSession session) {

    // Get logged-in user from session
    BankingApplication loggedInUser = 
            (BankingApplication) session.getAttribute("loggedInUser");

    if (loggedInUser == null) {
        model.addAttribute("message", "Please login first!");
        return "login";
    }

    // Always use logged-in user's account number
    DepositRequest newReq = new DepositRequest();
    newReq.setAccountNumber(loggedInUser.getAccountNumber());
    newReq.setAmount(request.getAmount());

    // Update balance
    BankingApplication updatedUser = service.deposit(newReq);

    model.addAttribute("message", "Amount Deposited Successfully!");
    model.addAttribute("user", updatedUser);

    // Update session with new balance
    session.setAttribute("loggedInUser", updatedUser);

    return "deposit-success";
}

@GetMapping("/transfer")
public String showTransferPage() {
    return "transfer";
}

@PostMapping("/transfer")
public String transfer(Long reciverAccountNumber,
                       double amount,
                       HttpSession session,
                       ModelMap model) {

  
    BankingApplication loggedInUser =
            (BankingApplication) session.getAttribute("loggedInUser");

    if (loggedInUser == null) {
        model.addAttribute("message", "Please login first");
        return "login";
    }

    Long senderAccountNumber = loggedInUser.getAccountNumber();

   
    String result = service.transfer(
            senderAccountNumber,
            reciverAccountNumber,
            amount
    );

   
    if (!"sucess".equals(result)) {
        model.addAttribute("message", result);
        return "transfer";
    }

    
    BankingApplication updatedUser =
            service.findByAccountNumber(senderAccountNumber);

    session.setAttribute("loggedInUser", updatedUser);

    model.addAttribute("message", "Transfer successful!");
    model.addAttribute("user", updatedUser);

    return "transfer-success";
}




}
