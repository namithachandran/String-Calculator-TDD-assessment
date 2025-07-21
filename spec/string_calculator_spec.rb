require 'rspec'
require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  let(:string_calculator) { StringCalculator.new }

  it 'returns 0 for the empty string' do
    expect(string_calculator.add("")).to eq(0)
  end

  it 'returns the number when the input is a single number string.' do
    expect(string_calculator.add("1")).to eq(1)
  end

  it 'returns the sum of two numbers' do
    expect(string_calculator.add("2,2")).to eq(4)
  end

  it 'returns the sum of multiple numbers' do
    expect(string_calculator.add("5,5,5,5")).to eq(20)
  end

  it 'handles new lines between numbers' do
    expect(string_calculator.add("1\n2,3")).to eq(6)
  end

  it 'supports different delimiters' do
    expect(string_calculator.add("//;\n1;2")).to eq(3)
  end

  it 'raises an exception for negative numbers' do
    expect { string_calculator.add("1,-2,3") }.to raise_error("negative numbers not allowed: -2")
  end

  it 'raises an exception for multiple negative numbers' do
    expect { string_calculator.add("1,-2,-3") }.to raise_error("negative numbers not allowed: -2, -3")
  end
end