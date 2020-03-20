#  The program must be executed from the command line like so:
#  ruby file.rb quiet_quotes.txt loud_quotes.txt

quiet = File.open(ARGV[0], 'r')

incoming_text = quiet.read
quiet.close

loud = File.open(ARGV[1], 'w')
loud.write(incoming_text.upcase)
loud.close
