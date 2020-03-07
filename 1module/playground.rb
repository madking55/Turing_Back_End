singers = ["billie", "ariana", "lizzo", "leon"]

capitalized = []
all_caps = []

singers.each { |singer| capitalized << singer.capitalize }
singers.each { |singer| all_caps << singer.upcase }

p capitalized
p all_caps