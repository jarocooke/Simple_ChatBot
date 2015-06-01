#require 'rubygems'
#require 'debugger'

require_relative 'src/interface'

my_interface = Interface.new("chat_data.txt")

loop do
	input = my_interface.request_input
	if input == "exit"
		puts "Till next time then"
		exit
	else
		puts my_interface.run_bot(input)
		redo
	end
end
