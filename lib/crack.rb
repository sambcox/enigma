# frozen_string_literal: true

require_relative 'enigma'

read_file = ARGV[0].dup.prepend('./lib/')
write_file = ARGV[1].dup.prepend('./lib/')
enigma = Enigma.new
cracked = enigma.crack(File.read(read_file), ARGV[2])
File.write(write_file, cracked[:decryption])
puts "Created #{ARGV[1]} with the cracked key #{cracked[:key]} and date #{cracked[:date]}"
