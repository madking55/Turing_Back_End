# frozen_string_literal: true
class Converter
  def print_welcome
    puts "Welcome to Converter!"
  end

  def convert_to_celsius(fahrenheit)
    ((fahrenheit - 32) * 5.0 / 9.0).round(2)
  end

  def convert_to_fahrenheit(celsius)
    (celsius * 1.8) + 32
  end
end

converter = Converter.new
converter.print_welcome
celsius = converter.convert_to_celsius(32)
puts "32 degrees F is #{celsius} degrees C"
celsius = converter.convert_to_celsius(212)
puts "212 degrees F is #{celsius} degrees C"
fahrenheit = converter.convert_to_fahrenheit(0)
puts "0 degrees C is #{fahrenheit} degrees F"
fahrenheit = converter.convert_to_fahrenheit(100)
puts "100 degrees C is #{fahrenheit} degrees F"
