require_relative 'enigma'

read_file = ARGV[0].dup.prepend('./lib/')
write_file = ARGV[1].dup.prepend('./lib/')
enigma = Enigma.new
decrypted = enigma.decrypt(File.read(read_file), ARGV[2], ARGV[3])
File.write(write_file, decrypted[:decryption])
puts "Created #{ARGV[1]} with the key #{decrypted[:key]} and date #{decrypted[:date]}"