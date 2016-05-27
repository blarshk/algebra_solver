# '2x = 6'
# '3x + 6y = 56'
# 'x + 3y - 2z = 3'

require 'strscan'

class Tokenizer
  SPACE  = /[ \t\r\n]/
  NUMBER = /\d+/
  LABEL  = /[a-z]+/
  SIGN   = /(?:-|\+)/
  EQUALS = /=/
  SEMI   = /;/

  def initialize string
    @ss = StringScanner.new string
    @tokens = []
    tokenize
  end

  def next_token
    token = @tokens.shift
  end

  def tokenize
    until @ss.eos?
      token = case
        when text = @ss.scan(SPACE)   then nil
        when text = @ss.scan(NUMBER)  then [:NUMBER, text]
        when text = @ss.scan(LABEL)   then [:LABEL, text]
        when text = @ss.scan(SIGN)    then [:SIGN, text]
        when text = @ss.scan(EQUALS)  then [:EQUALS, text]
        when text = @ss.scan(SEMI)    then [:SEMI, text]
        else
          x = @ss.getch
          [x, x]
        end

      @tokens << token if token
    end
  end
end