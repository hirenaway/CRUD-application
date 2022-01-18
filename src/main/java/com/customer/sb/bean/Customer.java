package com.customer.sb.bean;

import java.sql.Date;
import javax.persistence.*;
import lombok.Getter;
import lombok.Setter;

//Plain old Java Object class
//Using java persistence API to link this class with database table
@Getter
@Setter
@Entity
@Table(name="customer_data")
public class Customer {

	//Primary key
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;

	@Column(name="first_name",nullable=false,length=50)
	private String firstName;

	@Column(name="last_name",nullable=false,length=50)
	private String lastName;

	@Column(name="dob",nullable=false)
	private Date dob;

	@Column(name="mobile",unique=true,nullable=false,length=20)
	private String mobile;

	@Column(name="address_1",nullable=false,length=50)
	private String address1;

	@Column(name="address_2",length=50)
	private String address2;

	@Column(name="age",nullable=false,length=3)
	private int age;

	@Column(name="gender",nullable=false)
	private int gender;

	@Column(name="email", unique=true,nullable=false,length=50)
	private String email;

}