#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.14
# from Racc grammer file "".
#

require 'racc/parser.rb'


require './tokenizer'
require './interpreter'

class EquationParser < Racc::Parser

module_eval(<<'...end grammar.y/module_eval...', 'grammar.y', 36)

attr_accessor :tokenizer

def parse string
  @tokenizer = Tokenizer.new string
  do_parse
end

def next_token
  tokenizer.next_token
end
...end grammar.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
     6,     6,     8,     8,    15,    11,     8,    14,     9,    16,
    17,     8,    19,    20 ]

racc_action_check = [
     0,     3,     0,     3,     8,     4,     5,     6,     1,     9,
    11,    13,    15,    17 ]

racc_action_pointer = [
    -2,     8,   nil,    -1,     0,     2,     4,   nil,     2,     9,
   nil,     8,   nil,     7,   nil,     9,   nil,     7,   nil,   nil,
   nil ]

racc_action_default = [
   -12,   -12,    -1,    -2,   -12,    -5,   -12,   -10,   -12,   -12,
    -3,   -12,    -6,    -7,    -9,   -12,    21,   -12,    -8,   -11,
    -4 ]

racc_goto_table = [
    13,    12,     2,     1,   nil,    10,   nil,   nil,    13,    18 ]

racc_goto_check = [
     7,     6,     2,     1,   nil,     2,   nil,   nil,     7,     6 ]

racc_goto_pointer = [
   nil,     3,     2,   nil,   nil,   nil,    -4,    -5 ]

racc_goto_default = [
   nil,   nil,   nil,     3,     4,     5,   nil,     7 ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 8, :_reduce_1,
  1, 9, :_reduce_2,
  2, 9, :_reduce_3,
  4, 10, :_reduce_4,
  1, 11, :_reduce_5,
  2, 11, :_reduce_6,
  1, 13, :_reduce_none,
  2, 13, :_reduce_8,
  2, 12, :_reduce_9,
  1, 12, :_reduce_none,
  3, 14, :_reduce_11 ]

racc_reduce_n = 12

racc_shift_n = 21

racc_token_table = {
  false => 0,
  :error => 1,
  :NUMBER => 2,
  :LABEL => 3,
  :SIGN => 4,
  :EQUALS => 5,
  :SEMI => 6 }

racc_nt_base = 7

racc_use_result_var = false

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "NUMBER",
  "LABEL",
  "SIGN",
  "EQUALS",
  "SEMI",
  "$start",
  "system",
  "equations",
  "equation",
  "variables",
  "initial_variable",
  "variable_list",
  "variable" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'grammar.y', 8)
  def _reduce_1(val, _values)
     LinearEquationSystem.new val[0] 
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 10)
  def _reduce_2(val, _values)
     val 
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 10)
  def _reduce_3(val, _values)
     val.flatten 
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 12)
  def _reduce_4(val, _values)
     LinearEquation.new(val[0], val[2].to_i) 
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 14)
  def _reduce_5(val, _values)
     Array(val) 
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 14)
  def _reduce_6(val, _values)
     val.flatten 
  end
.,.,

# reduce 7 omitted

module_eval(<<'.,.,', 'grammar.y', 18)
  def _reduce_8(val, _values)
     val.flatten 
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 21)
  def _reduce_9(val, _values)
     Variable.new(val[1], val[0].to_i) 
  end
.,.,

# reduce 10 omitted

module_eval(<<'.,.,', 'grammar.y', 25)
  def _reduce_11(val, _values)
     Variable.new(val[2], "#{val[0]}#{val[1]}".to_i) 
  end
.,.,

def _reduce_none(val, _values)
  val[0]
end

end   # class EquationParser
