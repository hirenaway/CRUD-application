package com.customer.sb.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.customer.sb.bean.Customer;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {
	//since I want to validate mobile and email so there is no duplicate entries in the database 
	//for that i need to check in database first, since we can only access database through Repository
	//I have defined following method annotated with query that would check existing email and mobile is not passed again 
	@Query(value = "SELECT * FROM customer_data WHERE email = :email OR mobile = :mobile AND id != :id", nativeQuery = true)
	List<Customer> findByEmailAndMobile(@Param("email") String email, @Param("mobile") String mobile, @Param("id") Long id);

}