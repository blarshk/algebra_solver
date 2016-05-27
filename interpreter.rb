require 'nmatrix'

class Variable
  attr_accessor :label, :coefficient

  def initialize label, coefficient
    self.label = label
    self.coefficient = coefficient
  end
end

class LinearEquation
  attr_accessor :variables, :solution

  def initialize variables, solution
    self.variables = variables
    self.solution = solution
  end

  def variable_names
    variables.map(&:label)
  end

  def coefficient_for label
    found_var = variables.detect { |var| label == var.label }

    (found_var && found_var.coefficient) || 0
  end
end

class LinearEquationSystem
  attr_accessor :equations

  def initialize equations
    self.equations = equations
  end

  def solved_coefficients
    coefficients.solve(rhs).to_a
  end

  def solve
    Hash[variable_names.zip(solved_coefficients.flatten)]
  end

  def variable_names
    equations.flat_map(&:variable_names).uniq.sort
  end

  def normalized_coefficients
    equations.map do |eq|
      variable_names.map do |var|
        eq.coefficient_for var
      end
    end
  end

  def coefficients
    NMatrix.new [equations.size, equations.size], normalized_coefficients.flatten, dtype: :float32
  end

  def rhs
    NMatrix.new [equations.size, 1], equations.map(&:solution), dtype: :float32
  end
end

if __FILE__ == $0
  eq1 = LinearEquation.new [Variable.new('x', 2)], 6
  sys = LinearEquationSystem.new [eq1]
  sys.solve
end