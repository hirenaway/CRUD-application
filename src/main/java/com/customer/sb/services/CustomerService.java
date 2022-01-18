package com.customer.sb.services;

import java.util.List;
import com.customer.sb.bean.Customer;

public interface CustomerService {

	List<Customer> getAllCustomers();

	Customer getCustomerById(long id);

	void saveCustomer(Customer customer);

	void deleteCustomerById(long id);

	String findByEmailAndMobile(String email, String mobile, Long id);

}