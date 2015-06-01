class Bot
	attr_accessor :data, :outputs#, :weights
	
	def initialize(data_file)
		@data = []
		@outputs = []
		@data_file = data_file
		load_data
	end
	
	def load_data
		io_file = File.open(@data_file, 'r')
		io_file.each_line do |line|
			#line.chomp.scan(/\w+/)
			@data << line.chomp.split(/:/)
		end
		io_file.close
	end
	
	def generate_output(from_user)
		i = 0
		@outputs = []
		while i < @data.length
			if from_user == @data[i][0].downcase
				@outputs << @data[i][1]
			end
			i += 1
		end
		return select_output rescue "Yeah, honestly I'm not sure!"
	end
	
	def select_output
		freq = @outputs.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
		max = freq.values.max
		freq.select { |k, f| f == max }
		output = freq.keys[rand(freq.length)]
		if output == nil
			raise
		end
		return output
	end
	
end