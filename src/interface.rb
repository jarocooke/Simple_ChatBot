require_relative 'bot'

class Interface
	attr_accessor :input, :output, :data_file, :bot
	
	def initialize(data_file)
		@input = ""
		@output = ""
		@data_file = data_file
		load_data_file(data_file)
	end
	
	def load_data_file(data_file)
		if File.exist?(data_file)
			@bot = Bot.new(data_file)
		else
			puts "Error: #{data_file} not found\n"
			exit
		end
	end
	
	def request_input
		puts "Ready for input>"
		input = gets.chomp.downcase
		return input
	end
	
	def print_output
		puts output
	end
	
	def run_bot(input)
		@bot.generate_output(input)
	end
	
end