=begin
Launch School: RB130 - Ruby Foundations: More Topics > Medium 1 > Text Analyzer - Sandwich Code
ExerciseName: [Text Analyzer - Sandwich Code](https://launchschool.com/exercises/c618c0e4)
FileName: medium1_x02_text_analyzer_sandwich_code.rb
Answered On: 12/29/2021
=end

# First Solution
class TextAnalyzer
  def process
    str = "Eiusmod non aute commodo excepteur amet consequat ex elit. Ut excepteur ipsum
            enim nulla aliqua fugiat quis dolore do minim non. Ad ex elit nulla commodo
            aliqua eiusmod aliqua duis officia excepteur eiusmod veniam. Enim culpa laborum
            nisi magna esse nulla ipsum ex consequat. Et enim et quis excepteur tempor ea
            sit consequat cupidatat.

            Esse commodo magna dolore adipisicing Lorem veniam quis ut labore pariatur quis
            aliquip labore ad. Voluptate ullamco aliquip cillum cupidatat id in sint ipsum
            pariatur nisi adipisicing exercitation id adipisicing qui. Nulla proident ad
            elit dolore exercitation cupidatat mollit consequat enim cupidatat tempor
            aliqua ea sunt ex nisi non.

            Officia dolore labore non labore irure nisi ad minim consectetur non irure
            veniam dolor. Laboris cillum fugiat reprehenderit elit consequat ullamco veniam
            commodo."

    yield(str)
  end  
end

analyzer = TextAnalyzer.new
analyzer.process{|block_str| puts "#{block_str.split("\n\n").count} paragraphs"}
analyzer.process{|block_str| puts "#{block_str.split("\n").count} lines"}
analyzer.process{|block_str| puts "#{block_str.split(' ').count} words"}


# 2nd Solution
class TextAnalyzer
  def process
    arr = ["Eiusmod non aute commodo excepteur amet consequat ex elit. Ut excepteur ipsum
            enim nulla aliqua fugiat quis dolore do minim non. Ad ex elit nulla commodo
            aliqua eiusmod aliqua duis officia excepteur eiusmod veniam. Enim culpa laborum
            nisi magna esse nulla ipsum ex consequat. Et enim et quis excepteur tempor ea
            sit consequat cupidatat.

            Esse commodo magna dolore adipisicing Lorem veniam quis ut labore pariatur quis
            aliquip labore ad. Voluptate ullamco aliquip cillum cupidatat id in sint ipsum
            pariatur nisi adipisicing exercitation id adipisicing qui. Nulla proident ad
            elit dolore exercitation cupidatat mollit consequat enim cupidatat tempor
            aliqua ea sunt ex nisi non.

            Officia dolore labore non labore irure nisi ad minim consectetur non irure
            veniam dolor. Laboris cillum fugiat reprehenderit elit consequat ullamco veniam
            commodo."]

    arr.each {|line| yield(line)}
  end  
end

analyzer = TextAnalyzer.new
analyzer.process{|block_str| puts "#{block_str.split("\n\n").count} paragraphs"}
analyzer.process{|block_str| puts "#{block_str.split("\n").count} lines"}
analyzer.process{|block_str| puts "#{block_str.split(' ').count} words"}


# Third Solution
class TextAnalyzer
  def process
    file = File.open('medium1_x02.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process{|block_str| puts "#{block_str.split("\n\n").count} paragraphs"}
analyzer.process{|block_str| puts "#{block_str.split("\n").count} lines"}
analyzer.process{|block_str| puts "#{block_str.split(' ').count} words"}