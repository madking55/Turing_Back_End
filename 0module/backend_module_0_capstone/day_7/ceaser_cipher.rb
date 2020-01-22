# frozen_string_literal: true

def encrypt(string, number)
  alphabet = ('A'..'Z').to_a
  chars = string.upcase.split('')
  chars_encrypted = []
  chars.each do |char|
    if alphabet.include?(char)
      old_idx = alphabet.index(char)
      new_idx = (old_idx - number) % 26
      chars_encrypted << alphabet[new_idx]
    else
      chars_encrypted << char
    end
  end
  p chars_encrypted.join('')
end

encrypt('a hello world', 5)
