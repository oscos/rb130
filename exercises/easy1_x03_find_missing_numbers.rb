def missing(arr)
  full_arr = []

  first = arr.first
  last = arr.last

  first.upto(last) do |num|
    full_arr << num
  end

  full_arr - arr
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

# further exploration
def missing2(arr)
  (arr.first..arr.last).to_a - arr
end

p missing2([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing2([1, 2, 3, 4]) == []
p missing2([1, 5]) == [2, 3, 4]
p missing2([6]) == []
