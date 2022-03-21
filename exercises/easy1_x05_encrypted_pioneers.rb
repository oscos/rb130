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

p rot13('Nqn Ybirynpr')
p rot13('Tenpr Ubccre')
p rot13('Nqryr Tbyqfgvar')
p rot13('Nyna Ghevat')
p rot13('Puneyrf Onoontr')
p rot13('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv')
p rot13('Wbua Ngnanfbss')
p rot13('Ybvf Unvog')
p rot13('Pynhqr Funaaba')
p rot13('Fgrir Wbof')
p rot13('Ovyy Tngrf')
p rot13('Gvz Orearef-Yrr')
p rot13('Fgrir Jbmavnx')
p rot13('Xbaenq Mhfr')
p rot13('Fve Nagbal Ubner')
p rot13('Zneiva Zvafxl')
p rot13('Lhxvuveb Zngfhzbgb')
p rot13('Unllvz Fybavzfxv')
p rot13('Tregehqr Oynapu')


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
