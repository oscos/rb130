# example 1
def method_implicit_block
  yield("I am an implicit block")
end
p method_implicit_block {|str| str}

puts ""

# example 2
p ["symbol", "to proc", "then", "to block", "shortcut"].map(&:upcase!)

puts ""


# example #3
def also_method_symbol_to_proc_to_block
  yield("Using a symbol to proc to block using to_proc explicitly")
end

a_proc = :upcase!.to_proc
p also_method_symbol_to_proc_to_block(&a_proc)

puts ""

# example #4
def method_explicit_block(&a_block)
  now_i_am_a_proc = a_block
  now_i_am_a_proc.call
end
p method_explicit_block { "sending a block" }

puts ""

# example #5
def method_expecting_a_proc(a_proc)
  a_proc.call
end
a_proc = proc { "sending a proc" }
p method_expecting_a_proc(a_proc)