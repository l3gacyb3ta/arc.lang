_help_msg = "Usage: arc [command] [arguments]"

op_file = ARGV[1]?

if ARGV[0]? == "run"
else
	exit
end

raw_file_content = File.open(op_file.to_s).gets_to_end

raw_lines = raw_file_content.split("\n")

lines = [] of String

raw_lines.each do | line |
	if line.starts_with? "#"
	else
		lines.push line
	end
end

stack = [0, 0, 0, 0, 0, 0, 0, 0]
op = 0

_debug = false

if ARGV[2]? == "--debug"
	_debug = true
end

lines.each do | instruction |
	if instruction == "arc"
		stack[op] = stack[op] + 1
	end

	if instruction == "aRc"
		stack[op] = stack[op] - 1
	end

	if instruction == "Arc"
		op = op + 1
	end

	if instruction == "arC"
		op = op - 1
	end

	if instruction == "ARc"
		stack[op] = stack[op] + stack[op - 1]
	end

	if instruction == "aRC"
		stack[op] = stack[op] + stack[op + 1]
	end

	if instruction == "ArC"
		STDOUT.print stack[op].chr
	end

	if instruction == "ARC"
		STDOUT.print stack[op]
	end

	if _debug
		STDOUT.print stack
	end
	#puts op
end

puts