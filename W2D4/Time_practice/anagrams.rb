def anagrams(string)
  return [string] if string.length <= 1


  first = string[0]
  string = string[1..-1]
  perms = anagrams(string)
  total_anagrams = []

  perms.each do |anagram|
    (0..anagram.length).each do |i|
      total_anagrams << anagram[0...i] + first + anagram[i..-1]
    end
  end
  total_anagrams
end

def first_anagram?(first_string, second_string)
  anagrams(first_string).include?(second_string)
end



def second_anagrams?(first_string,second_string)
  first_string.chars.each do |ch|
    if second_string.include?(ch)
      index2 = second_string.index(ch)
      index1 = first_string.index(ch)
      second_string.slice!(index2) && first_string.slice!(index1)
    end
  end
  return true if first_string.length == 0 && second_string.length == 0
  false
end

def third_anagram?(first_string, second_string)
  first_string.split("").sort ==  second_string.split("").sort
end

def char_count(string)
  new_hash = Hash.new(0)
  string.chars.each do |ch|
    new_hash[ch] += 1
  end
  new_hash
end

def four_anagram?(first_string, second_string)
  first_count = char_count(first_string)
  second_count = char_count(second_string)
  first_count.all? do |k, v|
    second_count[k] == v
  end
end

def four_anagram2?(first_string, second_string)
  first_count = char_count(first_string)
  second_string.chars.each {|chr| first_count[chr] -= 1}
  first_count.all? {|k,v| v == 0}
end

p four_anagram2?("gizmo", "sally")    #=> false
p four_anagram2?("elvis", "lives")    #=> true
