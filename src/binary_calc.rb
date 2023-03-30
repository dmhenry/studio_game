# frozen_string_literal: true

class BinaryCalc
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
end

calc = BinaryCalc.new(20, 11)
puts calc.add
puts calc.subtract
