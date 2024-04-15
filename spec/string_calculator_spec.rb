require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  subject(:calculator) { described_class.new }

  it "should accept a string" do
    expect{ calculator.add('1,2,3') }.not_to raise_error
  end
  
  it "should return 0 for an empty string" do
    expect(calculator.add('')).to eq(0)
  end

  it "should not accept other data types" do
    expect{ calculator.add(123) }.to raise_error('only accepts a string')
    expect{ calculator.add(['123']) }.to raise_error('only accepts a string')
  end
  
  it "should return a number if the passed string contains no delimiters" do
    expect(calculator.add('123')).to eq (123)
  end

  it "should return the sum of the numbers in the passed string, if the passed string contains new line delimiters" do
    expect(calculator.add("1\n2,3")).to eq(6)
  end
  
  it "should raise ends in newline error if string ends with \n" do
    expect{ calculator.add("1,\n")}.to raise_error('ends in newline')
  end

  it "should handle multiple random delimiters" do
    expect(calculator.add("//;\n1;2")).to eq(3)
  end

  it "should not accept negative numbers" do
    expect{ calculator.add("123,-2") }.to raise_error("negative numbers are not allowed - -2")
  end

  it "should not accept negative numbers multiple" do
    expect{ calculator.add("123,-2, -5") }.to raise_error("negative numbers are not allowed - -2,-5")
  end
end