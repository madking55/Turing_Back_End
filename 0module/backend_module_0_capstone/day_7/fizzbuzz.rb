# frozen_string_literal: true

def fizzbuzz(num1, num2)
  numbers = num1..num2
  numbers.each do |num|
    if (num % 15).zero?
      puts 'FizzBuzz'
    elsif (num % 3).zero?
      puts 'Fizz'
    elsif (num % 5).zero?
      puts 'Buzz'
    else
      puts num
    end
  end
end

fizzbuzz(4, 24)
