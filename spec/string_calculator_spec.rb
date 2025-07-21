require 'rspec'
require_relative 'string_calculator'

RSpec.describe StringCalculator do
  let(:string_calculator) { StringCalculator.new }

  it 'returns 0 for the empty string' do
    expect(string_calculator.add("")).to eq(0)
  end
end