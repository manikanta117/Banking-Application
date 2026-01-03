package com.bank.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bank.model.BankingApplication;


@Repository
public interface BankingApplicationrepo extends JpaRepository<BankingApplication, Integer> {
	
Optional<BankingApplication> findByAccountNumber(Long accountNumber);

}
