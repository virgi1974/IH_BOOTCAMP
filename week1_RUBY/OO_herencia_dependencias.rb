require 'pry'
#modulos siempre arriba
module Photos
	def take_pictures
		"Photo taken in Android"
	end
end

class Device
	def initialize(so,inches)
		@so = so
		@inches = inches
		@time = Time.now
	end

	def print_currenTime
		@time
	end

end


class Phone < Device

	include Photos

	def initialize(so,inches,agenda)
		super(so,inches)
		@agenda = agenda
		@new_contact = []
	end

	def add_contact_to_agenda()
		puts "enter name"
		last_position = @agenda.contact_list.length
		@new_contact[0] = gets.chomp

		puts "enter telephone number"
		@new_contact[1] = gets.chomp
		binding.pry
		@agenda.contact_list << @new_contact
		@new_contact = []
		puts "more contact?  Y / N"
		continue = gets.chomp.downcase
		if continue == "y"
			add_contact_to_agenda
		end
	end

	def call_someone(name)

		@agenda.contact_list.each do |contact|
			if contact[0] == name
				puts "the telephone is : " + contact[1].to_s
				return
			else
				puts "that contact doesn´t exist"
			end
		end

	end
end

class Agenda

	attr_accessor :contact_list
	def initialize(agenda_name)
		@agenda_name = agenda_name
		@contact_list = []
		@par = []
		
	end

	def add_contact
		puts "enter name"
		@par[0] = gets.chomp
		puts "enter telephone number"
		@par[1] = gets.chomp

		@contact_list << @par
		@par = []
		
		puts "more contact?  Y / N"
		continue = gets.chomp.downcase
		if continue == "y"
			add_contact
		end
	end

end


class Laptop < Device
	attr_accessor :touchable

	def initialize(so,inches,touchable)
		super(so,inches)
		@touchable = touchable
	end
end


class Smartwatch < Device
	
	include Photos

	def initialize(so,inches)
		super(so,inches)
	end

	def print_currenTime
		 "*** #{@time} ***"
	end

end

class Microwave

	def initialize
		@time = Time.now
	end

	def print_currenTime
		@time
	end

	def heat_food
		puts "heating food"
	end
end

# my_device = Device.new("windows",24)
# my_device.print_currenTime

# my_phone = Phone.new("mac",33)
# puts my_phone.print_currenTime
# my_phone.add_contacts
# my_phone.call_someone("toni")

# my_laptop = Laptop.new("linux",23,true)
# puts my_laptop.touchable
# puts "-------------"

# my_smartwatch = Smartwatch.new("android",6)
# my_smartwatch.fancyprint

puts "-------------"
my_device = Device.new("windows",24)
my_laptop = Laptop.new("linux",23,true)
my_smartwatch = Smartwatch.new("android",6)
my_micro = Microwave.new
my_agenda = Agenda.new("trabajo")
my_phone = Phone.new("nokia_os",5,my_agenda)




my_collection = []
my_collection << my_device
my_collection << my_phone
my_collection << my_laptop
my_collection << my_smartwatch
my_collection << my_micro

my_collection.each do |dev|
	puts dev.print_currenTime
end





