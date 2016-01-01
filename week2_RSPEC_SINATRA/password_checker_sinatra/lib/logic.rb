require 'pry'
class Passwordchecker

	def get_email(email)
		if email.split("@").size == 2  && email.split("@")[0] != "" && email.split("@")[1] != ""
			valid = true
		else
			valid = false
		end
		valid
	end

	def check_all(email,password)
		result = check_length(password) && check_uppercase(password) && check_lowercase(password) && check_symbol(password) && check_number(password) && check_email(email,password)
		result	
	end
	def check_email(email,password)
		if get_email(email) == true
			name = email.split("@")[0]
			domain = email.split("@")[1]
			valid = ! (password.include?(name) || password.include?(domain) )
			# binding.pry
		else
			valid = false
		end
		valid
	end


	#------------------
	private
	def check_length(password)
		if password.length > 7
			true
		else
			false
		end	
	end
	
	def check_uppercase(password)
		upper = password.match(/[A-Z]/) != nil
		upper
	end

	def check_lowercase(password)
		lower = password.match(/[a-z]/) != nil 
		lower
	end

	def check_symbol(password)
		symb = password.match(/\W/)  != nil
		symb
	end

 	def check_number(password)
		numb = password.match(/\d/)  != nil
		numb
	end

	


end