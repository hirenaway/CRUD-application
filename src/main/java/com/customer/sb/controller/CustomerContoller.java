package com.customer.sb.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.customer.sb.bean.Customer;
import com.customer.sb.services.CustomerService;

@Controller
@RequestMapping(value="/customer")
public class CustomerContoller {	

	private final CustomerService service;

	@Autowired
	public CustomerContoller(CustomerService service) {
		super();
		this.service = service;
	}

	@GetMapping("/list")
	public ModelAndView list() {
		ModelAndView model = new ModelAndView("customer-list");
		List<Customer> customer = service.getAllCustomers();
		model.addObject("customerlist", customer);
		return model;
	}

	@GetMapping("/addCustomer/")
	public ModelAndView addCustomer() {
		ModelAndView model = new ModelAndView();
		Customer customer = new Customer();
		model.addObject("customerform", customer);
		model.setViewName("customer-form");
		return model;
	}

	@PostMapping("/save") 
	public ModelAndView add(@ModelAttribute("customerform") Customer customer) {
		service.saveCustomer(customer);
		return new ModelAndView("redirect:/customer/list");
	}

	@GetMapping("/editCustomer/{id}")
	public ModelAndView editCustomer(@PathVariable("id") long id) {
		ModelAndView model = new ModelAndView();
		Customer customer = service.getCustomerById(id);
		service.saveCustomer(customer);
		model.addObject("customerform", customer);
		model.setViewName("customer-form");
		return model;
	}

	@GetMapping("/deleteCustomer/{id}")
	public ModelAndView deleteCustomer(@PathVariable("id") long id) {
		service.deleteCustomerById(id);
		return new ModelAndView("redirect:/customer/list");
	}

	@GetMapping("/checkmobileemail")
	@ResponseBody
	public String checkMobileEmail(HttpServletRequest req, Model model) {
		String mobile = req.getParameter("mobile");
		String email = req.getParameter("email");
		String idParameter = req.getParameter("id");
		Long id = 0L;
		if (idParameter != null && !idParameter.equals("")) {
			id = Long.parseLong(idParameter);
		}
		System.err.println("id : " + id + " mobile : " + mobile + " email: " + email);
		return service.findByEmailAndMobile(email,mobile,id);
	}

}