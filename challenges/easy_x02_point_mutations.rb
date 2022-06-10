=begin
Launch School: RB130 - Ruby/JavaScript Challenges > Easy Challenges
ExerciseName: [Point Mutations](https://launchschool.com/exercises/fd2aaf29)
FileName: easy_challenges_x02_point_mutations.rb
Answered On: 01/11/2022
=end


# def hamming(str1, str2)
#   counter = 0

#   dna_shortest_length = str1.length < str2.length ? str1.length : str2.length
  
#   arr1 = str1.chars
#   arr2 = str2.chars
  
#   p arr3 = arr1[0..dna_shortest_length]
  
#   arr3.each.with_index do |el, idx|
#     counter += 1 if el != arr2[idx]
#     # p "#{el} : #{arr2[idx]}"
#   end
  
#   counter
# end

# str1 = 'GAGCCTACTAACGGGAT'
# str2 = 'CATC'

# p hamming(str1,str2)



class DNA
  def initialize(dna_str1="")
    @dna_str1 = dna_str1
  end
  
  def hamming_distance(dna_str2 = "")
    hamming(@dna_str1, dna_str2)
  end
  
  private
  
  def hamming(str1, str2)
  counter = 0
    
  dna_shortest_length = str1.length < str2.length ? str1.length : str2.length
  # [1,2,3,4.5]
  # 0, dna_shortest_length
    
  arr1 = str1.chars
  arr2 = str2.chars
    
  arr3 = arr1[0, dna_shortest_length]
    
  
  arr3.each.with_index do |el, idx|
    counter += 1 if el != arr2[idx]
    # p "#{el} : #{arr2[idx]}"
  end
  
  counter
  end

end

# additional solution added 03/28/2022
class DNA
  def initialize(dna1)
    @dna1 = dna1
  end

  def hamming_distance(dna2)
    counter1 = 0
    counter2 = 0

    @dna1.chars.each_with_index do |el, idx|
      break if counter2 == dna2.length

      counter1 += 1 if el != dna2[idx]
      counter2 += 1
    end

    counter1
  end
end

# str1 = 'GAGCCTACTAACGGGAT'
# str2 = 'CATCGTAATGACGGCCT'

# dna = DNA.new(str1)
# p dna.hamming_distance(str2)



require 'minitest/autorun'
#require_relative 'point_mutations'

class DNATest < Minitest::Test
  def test_no_difference_between_empty_strands
    assert_equal 0, DNA.new('').hamming_distance('')
  end

  def test_no_difference_between_identical_strands
    # skip
    assert_equal 0, DNA.new('GGACTGA').hamming_distance('GGACTGA')
  end

  def test_complete_hamming_distance_in_small_strand
    # skip
    assert_equal 3, DNA.new('ACT').hamming_distance('GGA')
  end

  def test_hamming_distance_in_off_by_one_strand
    # skip
    strand = 'GGACGGATTCTGACCTGGACTAATTTTGGGG'
    distance = 'AGGACGGATTCTGACCTGGACTAATTTTGGGG'
    assert_equal 19, DNA.new(strand).hamming_distance(distance)
  end

  def test_small_hamming_distance_in_middle_somewhere
    # skip
    assert_equal 1, DNA.new('GGACG').hamming_distance('GGTCG')
  end

  def test_larger_distance
    # skip
    assert_equal 2, DNA.new('ACCAGGG').hamming_distance('ACTATGG')
  end

  def test_ignores_extra_length_on_other_strand_when_longer
    # skip
    assert_equal 3, DNA.new('AAACTAGGGG').hamming_distance('AGGCTAGCGGTAGGAC')
  end

  def test_ignores_extra_length_on_original_strand_when_longer
    # skip
    strand = 'GACTACGGACAGGGTAGGGAAT'
    distance = 'GACATCGCACACC'
    assert_equal 5, DNA.new(strand).hamming_distance(distance)
  end

  def test_does_not_actually_shorten_original_strand
    # skip
    dna = DNA.new('AGACAACAGCCAGCCGCCGGATT')
    assert_equal 1, dna.hamming_distance('AGGCAA')
    assert_equal 4, dna.hamming_distance('AGACATCTTTCAGCCGCCGGATTAGGCAA')
    assert_equal 1, dna.hamming_distance('AGG')
  end
end
