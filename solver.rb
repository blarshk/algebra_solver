require './equation_parser'
require 'readline'

ep = EquationParser.new

print "Enter your equations!\n"
print "You must enter one equation for each variable\n"
print "2 equations for x and y, 3 for x, y, z, etc...\n"

stty_save = `stty -g`.chomp
trap('INT') { system('stty', stty_save); exit }

while line = Readline.readline('> ', true)
  if line.match(/.*;/)
    sys = ep.parse line

    puts sys.solve
  else
    print line
  end
end