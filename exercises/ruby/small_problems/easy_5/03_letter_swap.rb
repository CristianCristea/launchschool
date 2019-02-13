
# Letter Swap
# Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.

# You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces

def swap_word_letters(string)
  return string if string.length == 1

  chars = string.split('')
  last_char = chars.pop
  first_char = chars.shift
  chars.unshift(last_char) << first_char

  chars.join('')
end

def swap(string)
  words = string.split(' ').map { |word| swap_word_letters(word) }

  words.join(' ')
end

# refactor
def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end


# Examples:
p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'