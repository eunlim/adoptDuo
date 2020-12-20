<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	label.error {
		margin-left: 10px;
		width: auto;
		display: inline;
		color: red;
	}
	#newsletter_topics label.error {
		display: none;
		margin-left: 103px;
	}
	</style>

	<script>

	$(document).ready(function() {
		// validate signup form on keyup and submit
		$("#signupForm").validate({

			//validation이 끝난 이후의 submit 직전 추가 작업할 부분
            submitHandler: function() {
                var f = confirm("회원가입을 완료하겠습니까?");
                if(f){
                    return true;
                } else {
                    return false;
                }
            },

			rules: {
				firstname: "required",
				lastname: "required",
				username: {
					required: true,
					minlength: 2
				},
				password: {
					required: true,
					minlength: 5
				},
				confirm_password: {
					required: true,
					minlength: 5,
					equalTo: "#password"
				},
				email: {
					required: true,
					email: true
				},
				topic: {
					required: "#newsletter:checked",
					minlength: 2
				},
				agree: "required"
			},
		});

		// propose username by combining first- and lastname
		$("#username").focus(function() {
			var firstname = $("#firstname").val();
			var lastname = $("#lastname").val();
			if (firstname && lastname && !this.value) {
				this.value = firstname + "." + lastname;
			}
		});

		//code to hide topic selection, disable for demo
		var newsletter = $("#newsletter");
		// newsletter topics are optional, hide at first
		var inital = newsletter.is(":checked");
		var topics = $("#newsletter_topics")[inital ? "removeClass" : "addClass"]("gray");
		var topicInputs = topics.find("input").attr("disabled", !inital);
		// show when newsletter is checked
		newsletter.click(function() {
			topics[this.checked ? "removeClass" : "addClass"]("gray");
			topicInputs.attr("disabled", !this.checked);
		});
	});
	</script>
	
	<p>Default submitHandler is set to display an alert into of submitting the form</p>
	<form class="cmxform" id="signupForm" method="get" action="">
		<fieldset>
			<legend>Validating a complete form</legend>
			<p>
				<label for="firstname">Firstname</label>
				<input id="firstname" name="firstname" type="text">
			</p>
			<p>
				<label for="lastname">Lastname</label>
				<input id="lastname" name="lastname" type="text">
			</p>
			<p>
				<label for="username">Username</label>
				<input id="username" name="username" type="text">
			</p>
			<p>
				<label for="password">Password</label>
				<input id="password" name="password" type="password">
			</p>
			<p>
				<label for="confirm_password">Confirm password</label>
				<input id="confirm_password" name="confirm_password" type="password">
			</p>
			<p>
				<label for="email">Email</label>
				<input id="email" name="email" type="email">
			</p>
			<p>
				<label for="agree">Please agree to our policy</label>
				<input type="checkbox" class="checkbox" id="agree" name="agree">
			</p>
			<p>
				<label for="newsletter">I'd like to receive the newsletter</label>
				<input type="checkbox" class="checkbox" id="newsletter" name="newsletter">
			</p>
			<fieldset id="newsletter_topics">
				<legend>Topics (select at least two) - note: would be hidden when newsletter isn't selected, but is visible here for the demo</legend>
				<label for="topic_marketflash">
					<input type="checkbox" id="topic_marketflash" value="marketflash" name="topic">Marketflash
				</label>
				<label for="topic_fuzz">
					<input type="checkbox" id="topic_fuzz" value="fuzz" name="topic">Latest fuzz
				</label>
				<label for="topic_digester">
					<input type="checkbox" id="topic_digester" value="digester" name="topic">Mailing list digester
				</label>
				<label for="topic" class="error">Please select at least two topics you'd like to receive.</label>
			</fieldset>
			<p>
				<input class="submit" type="submit" value="Submit">
			</p>
		</fieldset>
	</form>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	