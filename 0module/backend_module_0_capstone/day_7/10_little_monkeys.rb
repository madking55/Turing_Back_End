# frozen_string_literal: true

def count_monkeys(number)
  while number > 1
    puts "#{number} little monkeys jumping on the bed,
     One fell off and bumped his head,
     Mama called the doctor and the doctor said,
     'No more monkeys jumping on the bed!'"
    number -= 1
  end
  puts "One little monkey jumping on the bed,
    He fell off and bumped his head,
    Mama called the doctor and the doctor said,
    'Get those monkeys right to bed!'"
end

count_monkeys(5)
