require_relative 'enigma'
read_file = ARGV[0].dup.prepend('./lib/')
write_file = ARGV[1].dup.prepend('./lib/')
enigma = Enigma.new
encryption = enigma.encrypt(File.read(read_file))

require 'pry'; binding.pry