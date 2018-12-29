# 1.
# Given the array below
# Turn this array into a hash where the names are the keys and the values are the positions in the array.

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones.each_with_object({}) do |name, hash|
  hash[name] = flintstones.index(name)
end

# 2.
# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.values.sum # => 6174

# other solutions:
# initialize sum = 0, loop through the hash and add the values to sum
# or call #reduce on ages.values

# 3.
# In the age hash throw out the really old people (age 100 or older).

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.select! { |_, age| age <= 100 }

# or
ages.keep_if { |_, age| age < 100 }

# 4.
# Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.values.min

# 5.
# In the array:
# Find the index of the first name that starts with "Be"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.index { |name| name.match(/^Be/) }

# or
flintstones.index { |name| name[0, 2] == "Be" }

# 6.
# Amend this array so that the names are all shortened to just the first three characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name| name[0, 3] }

# 7.
# Create a hash that expresses the frequency with which each letter occurs in this string:
# ex:
# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

# iterate over string
# initialize a letters hash
# if letters[current_letter] exists add 1
# if not add the current_letter with the value 1
# return hash

statement = "The Flintstones Rock"

def count_letters(string)
  string.split('').each_with_object({}) do |letter, hash|
    hash[letter] ? hash[letter] += 1 : hash[letter] = 1
  end
end

count_letters(statement)

# 8.
# What happens when we modify an array while we are iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# #shift and #pop will mutate the array while iteration over it with unexpectd results
# => [1, 3]
# the iteration is based on the current length
# by removing an element we shorten the length
# after 2 removings the length is 2
# and the iteratior already iterated 2 times so it will break the loop

# => [1, 2]

# 9.
# As we have seen previously we can use some built-in string methods to change the case of a string. A notably missing method is something provided in Rails, but not in Ruby itself...titleize. This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title. For example, the string:

words = "the flintstones rock"
# would be:

words = "The Flintstones Rock"
# Write your own version of the rails titleize implementation.

# split the string in an words array
# iterate over the array
# capitalize each word
# join and return the string

def titleize(string)
  string.split.map { |word| word.capitalize }.join(' ')
end

# 10.
# Given the munsters hash below

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior). Your solution should produce the hash below

{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.

# iterate over hash - map
# change the value of each person:
# add an "age_group" key
# with the "kid" value if the age < 17
# with the "adult" value if the age 64
# with the "senior" if over 65

munsters.each do |person, person_data|
  person_data["age_group"] =
  if person_data["age"] < 18
    "kid"
  elsif person_data["age"] < 65
    "adult"
  else
    "senior"
  end
end

# refactor
munsters.each do |person, person_data|
  person_data["age_group"] =
 case person_data["age"]
    when 0..17 then "kid"
    when 18..64 then "adult"
    else "senior"
  end
end