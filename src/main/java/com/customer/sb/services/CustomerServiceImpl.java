package com.customer.sb.services;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import com.customer.sb.bean.Customer;
import com.customer.sb.repository.CustomerRepository;

@Service
public class CustomerServiceImpl implements CustomerService {

	//Creating reference of CustomerRepository to access its methods
	@Autowired
	private CustomerRepository repository;

//	Overriding methods that I described in CustomerService
//	In each method I will be accessing JPARepository interface that has been implemented in CustomerRepository 
	@Override
	public List<Customer> getAllCustomers() {
		// Here through CustomerRepository reference that is repository I am accessing JPARepository method findAll() to display all the customers 
		return (List<Customer>) repository.findAll(Sort.by(Sort.Direction.DESC, "id"));
	}

	@Override
	public void saveCustomer(Customer customer) {
		//Through reference repository I am accessing JPARepository method save() to save the customers into database
		repository.save(customer);
	}

	@Override
	public Customer getCustomerById(long id) {
		//Through reference repository I am accessing JPARepository method findById(id) to access record details by ID from the database
		Optional <Customer> opt = repository.findById(id);
		Customer customer = null;
		if (opt.isPresent()) {
			customer = opt.get();
		} else {
			throw new RuntimeException("Customer not found for id : " + id);
		}
		return customer;
	}

	@Override
	public void deleteCustomerById(long id) {
		//Through reference repository I am accessing JPARepository method deleteById(id) to delete record by ID from the database
		repository.deleteById(id);
	}

	@Override
	public String findByEmailAndMobile(String email, String mobile, Long id) {
		List<Customer> customer = repository.findByEmailAndMobile(email, mobile, id);
		System.out.println("******Customer******"+ customer);
		return (customer != null && !customer.isEmpty())? "Duplicate" : "Unique";
	}

}