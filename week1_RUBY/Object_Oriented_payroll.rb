
class Employee
	attr_reader :name, :email
​
	def initialize(name, email)
		@name = name
		@email = email
	end
end
​
class HourlyEmployee < Employee
	attr_reader :hourly_rate, :hours_worked
​
	def initialize(name, email, hourly_rate, hours_worked)
		super(name, email)
		@hourly_rate = hourly_rate
		@hours_worked = hours_worked
	end
​
	def calculate_salary
		@hourly_rate * @hours_worked
	end
end
​
class SalariedEmployee < Employee
	attr_reader :yearly_salary
​
	def initialize(name, email, yearly_salary)
		super(name, email)
		@yearly_salary = yearly_salary
	end
​
	def calculate_salary
		@yearly_salary / 52.0
	end
end
​
class MultiPaymentEmployee < SalariedEmployee
	attr_reader :hourly_rate, :hours_worked
​
	def initialize(name, email, yearly_salary, hourly_rate, hours_worked)
		super(name, email, yearly_salary)
		@hourly_rate = hourly_rate
		@hours_worked = hours_worked
	end
​
	def calculate_salary
		super + (hours_worked - 40) * hourly_rate
	end
end
​
class Payroll
	def initialize(employees)
		@employees = employees
	end
​
	def pay_employees
		total_salary = 0
		@employees.each do |employee|
			puts "#{employee.name} => $#{taxes(employee.calculate_salary).round(2)}"
			total_salary += taxes(employee.calculate_salary)
			notify_employee employee
		end
		puts "Total amount spent this week: $#{total_salary.round(2)}"
	end
​
	def taxes salary
		salary * 1.18
	end
​
	def notify_employee employee
		puts "You have received your salary. Total amount: $#{taxes(employee.calculate_salary).round(2)}"
	end
end

# ​-------------------------

josh = HourlyEmployee.new('Josh', 'nachoemail@sample.com', 35, 50)
nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
ted = MultiPaymentEmployee.new('Ted', 'fotran0x@gmail.com', 60000, 275, 55)
​
employees = [josh, nizar, ted]
payroll = Payroll.new(employees)
payroll.pay_employees