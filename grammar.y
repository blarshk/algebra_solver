# '2x = 6'
# '3x + 6y = 56'
# '1x + 3y - 2z = 3'

class EquationParser
options no_result_var
token NUMBER LABEL SIGN EQUALS SEMI
rule
  system: equations { LinearEquationSystem.new val[0] }

  equations: equation { val } | equation equations { val.flatten };

  equation: variables EQUALS NUMBER SEMI { LinearEquation.new(val[0], val[2].to_i) };

  variables: initial_variable { Array(val) } | initial_variable variable_list { val.flatten };

  variable_list:
    variable
    | variable variable_list { val.flatten }

  initial_variable: 
    NUMBER LABEL { Variable.new(val[1], val[0].to_i) }
    | variable
    ;

  variable: SIGN NUMBER LABEL { Variable.new(val[2], "#{val[0]}#{val[1]}".to_i) };
  
end

---- header

require './tokenizer'
require './interpreter'

---- inner

attr_accessor :tokenizer

def parse string
  @tokenizer = Tokenizer.new string
  do_parse
end

def next_token
  tokenizer.next_token
end