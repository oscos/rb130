def rot13(str)
  letters = ('a'..'z').to_a * 2
  str.chars.map do |el|
    idx = letters.index(el.downcase)
    if idx
      letter_seek = letters[idx + 13]
      el == el.downcase ? letter_seek : letter_seek.upcase
    else
      el
    end
  end.join
end

# additional solution added 07/03/2022
def rot13(str)
  uppercase = ('A'..'Z').to_a * 2
  lowercase = ('a'..'z').to_a * 2
  result = ''

  str.chars.each.with_index do |chr, idx|
    if uppercase.include?(chr)
      idx13 = uppercase.index(chr) + 13
      result += (uppercase[idx13])
    elsif lowercase.include?(chr)
      idx13 = lowercase.index(chr) + 13
      result += (lowercase[idx13])
    else
      result += chr
    end
  end

  result
end

# additional solution added 07/03/2022
UPPERCASE = ('A'..'Z').to_a * 2
LOWERCASE = ('a'..'z').to_a * 2

def decrypt(chr)
  if UPPERCASE.include?(chr)
    UPPERCASE[UPPERCASE.index(chr) + 13]
  elsif LOWERCASE.include?(chr)
    LOWERCASE[LOWERCASE.index(chr) + 13]
  else
    chr
  end
end

def rot13(str)
  str.chars.map { |chr| decrypt(chr) }.join
end

# additional solution added 07/03/2022
LETTERS = ('A'..'Z').to_a * 2

def decrypt(chr)
  if LETTERS.include?(chr)
    LETTERS[LETTERS.index(chr) + 13]
  elsif LETTERS.include?(chr.upcase)
    LETTERS[LETTERS.index(chr.upcase) + 13].downcase
  else
    chr
  end
end

def rot13(str)
  str.chars.map { |chr| decrypt(chr) }.join
end


p rot13('Nqn Ybirynpr')  == "Ada Lovelace"
p rot13('Tenpr Ubccre') == "Grace Hopper"
p rot13('Nqryr Tbyqfgvar') == "Adele Goldstine"
p rot13('Nyna Ghevat') == "Alan Turing"
p rot13('Puneyrf Onoontr') == "Charles Babbage"
p rot13('Noqhyynu Zhunzznqova Zhfn ny-Xujnevmzv') == "Abdullah Muhammadbin Musa al-Khwarizmi"
p rot13('Wbua Ngnanfbss') == "John Atanasoff"
p rot13('Ybvf Unvog') == "Lois Haibt"
p rot13('Pynhqr Funaaba')  == "Claude Shannon"
p rot13('Fgrir Wbof') == "Steve Jobs"
p rot13('Ovyy Tngrf') == "Bill Gates"
p rot13('Gvz Orearef-Yrr') == "Tim Berners-Lee"
p rot13('Fgrir Jbmavnx') == "Steve Wozniak"
p rot13('Xbaenq Mhfr') == "Konrad Zuse"
p rot13('Fve Nagbal Ubner') == "Sir Antony Hoare"
p rot13('Zneiva Zvafxl') == "Marvin Minsky"
p rot13('Lhxvuveb Zngfhzbg') == "Yukihiro Matsumot"
p rot13('Unllvz Fybavzfxv') == "Hayyim Slonimski"
p rot13('Tregehqr Oynapu') == "Gertrude Blanch"


# method 2
AM, NZ = ('a'..'z').each_slice(13).to_a

def convert_char(single_char)
  result =
    if AM.include?(single_char.downcase)
      (single_char.downcase.ord + 13).chr
    elsif NZ.include?(single_char.downcase)
      (single_char.downcase.ord - 13).chr
    else
      single_char
    end
  single_char.downcase == single_char ? result : result.upcase
end

def decrypt(name)
  name.chars.map do |single_char|
    convert_char(single_char)
  end.join
end

def rot13_2(arr)
  arr.map do |names|
    decrypt(names)
  end
end

ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

p rot13_2(ENCRYPTED_PIONEERS)
