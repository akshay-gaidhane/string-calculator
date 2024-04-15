class  StringCalculator
  def add(string)
    verify_if_string(string)
    ends_in_new_line(string)
    string_array = string.split(/[^0-9-]+/)
    integer_array = string_array.map(&:to_i)
    negative_numbers = negative(integer_array)
    raise "negative numbers are not allowed - #{negative_numbers}" if negative_numbers
    integer_array.inject(0){|sum,x| x <= 1000? sum + x : sum }
  end

  private

  def verify_if_string(string)
    raise 'only accepts a string' unless string.is_a?(String)
  end

  def ends_in_new_line(string)
    raise('ends in newline') if string.end_with?("\n")
  end

  def negative(numbers)
    negatives = numbers.select{ |i| i < 0 }
    negatives.join(",") if negatives.length > 0
  end
end