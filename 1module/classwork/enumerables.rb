# frozen_string_literal: true

def kennedy_brothers
  brothers = %w[Robert Ted Joseph John]
  cap_brothers = brothers.map(&:upcase)
end

p kennedy_brothers

def find_me_first_even
  numbers = [1, 2, 3, 4, 5]
  numbers.find(&:even?)
end

p find_me_first_even

def find_sisters
  sisters = %w[Rose Kathleen Eunice Patricia Jean]
  sisters.find { |sister| sister.length > 4 }
end

p find_sisters

def find_all_nums_divisible_by_3
  numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  numbers.select { |num| num % 3 == 0 }
end

p find_all_nums_divisible_by_3
