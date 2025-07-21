class StringCalculator
  def add(str_numbers)
    return 0 if str_numbers.empty?
    return str_numbers.to_i if str_numbers.length == 1

    delimiters = [',']
    if str_numbers.start_with?('//')
      delimiters, str_numbers = parse_custom_delimiters(str_numbers)
    end

    numbers = str_numbers.gsub("\n", ",").split(Regexp.union(delimiters)).map(&:to_i)
    numbers.reject! { |num| num > 1000 }

    negative_numbers = numbers.select { |num| num < 0 }
    raise "negative numbers not allowed: #{negative_numbers.join(', ')}" unless negative_numbers.empty?

    numbers.sum
  end

  private

  def parse_custom_delimiters(str_numbers)
    if str_numbers =~ %r{^//(\[.*?\])+\n}
      delimiters = str_numbers.scan(%r{\[(.*?)\]}).flatten
      str_numbers = str_numbers.split("\n", 2).last
    else
      delimiters = [str_numbers[2]]
      str_numbers = str_numbers[4..]
    end
    [delimiters, str_numbers]
  end
end