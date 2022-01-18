$(document).ready(function() {
	$("#CustomerForm").validate({
		rules: {
			'firstName': {
				required: true
				},
			'lastName': {
				required: true
				},
			'dob': {
				required: true
				},
			'mobile': {
				
				required: true,
				digits: true,
				maxlength: 10
				},
			'email': {
				required: true,
				email: true
				},
			'age': {
				required: true,
				digits: true
				},
			'gender': {
				required: true
				},
			'address1': {
				required: true
			},
		},
		messages: {
			firstName: {
				required: "Please enter the First name!"
				},
			lastName: {
				required: "Please enter the Last name!"
			},
			dob: {
				required: "Please pick your Date Of Birth!"
			},
			mobile: {
				required: "Please enter phone number",
				maxlength: "Number must be at least 10 digit long"
			},
			email: {
				required: "Please enter a valid email"
			},
			age: {
				required: "Please enter your age in digit"
			},
			gender: {
				required: "Please select a gender"
			},
			address1: {
				required: "Please enter your address"
			},
		}
	});
	$('#mobile,#email').change(function(){
		var enteredMobile = $("#mobile").val();
		var enteredEmail = $("#email").val();
		var id = $("#id").val();
		$.ajax({
			url : '/customer/checkmobileemail',
			data : {mobile:enteredMobile,email:enteredEmail,id:id},
			type : 'GET',
			success : function(result) {
				if (result == 'Duplicate') {
					console.log("result in if",result);
					$("#mobileMsg").html("Mobile already exists");
					$("#emailMsg").html("Email already exists");
					$("#Button").prop("disabled",true);
				} else {
					console.log("result in else",result);
					$("#emailMsg").html("");
					$("#mobileMsg").html("");
					$("#Button").prop("disabled",false);
				}
			}
		});
	});
});