# frozen_string_literal: true

class BinaryArithmetic
  def initialize(op1, op2)
    @op1 = op1
    @op2 = op2
  end
  
  def add
    @op1 + @op2
  end

  def subtract
    @op1 - @op2
  end

  def multiply
    @op1 * @op2
  end

  def divide
    if (@op1 % @op2 == 0)
      @op1 / @op2
    else
      @op1 / @op2.to_f
    end
  end
end

calc = BinaryArithmetic.new(20, 11)
puts calc.add
puts calc.subtract
puts calc.multiply
puts calc.divide
