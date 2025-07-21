class StringCalculator
  def add(str_numbers)
    return str_numbers.to_i if str_numbers.length == 1
    numbers = str_numbers.split(/,|\n/).map(&:to_i)
    numbers.sum
  end
end