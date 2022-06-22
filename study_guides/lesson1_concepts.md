# Launch School - Lesson 1

## Closures

A closure is a general programming concept that allows programmers to save a chunk of code that can later be executed.

It’s called a closure because it binds the surrounding artifacts that were in scope at the time and location of where and when the closure was created. Thus forming an enclosure around everything so that the artifacts can be referenced when the closure is executed later.

The references or access that a closure retains to these artifacts or in-scope items is known as its binding. The binding includes things like variables, methods, and objects.

Because the closure drags around its context or environment, it can access the artifacts that are part of its binding when it’s later executed in a different scope such as when you pass it to a method.

In Ruby there are three ways to implement a closure:

1. Creating an object from the Proc class
2. Using Blocks
3. Using Lambdas

## Calling Methods with Blocks

```ruby
[1, 2, 3, 4, 5].select {|n| n % 2 == 0 }

```

The code above is an example of a method invocation with a block. The Array object `[1, 2, 3, 4, 5]` is the calling object. The `Array#select` is the method being invoked. The `{|n| n % 2 == 0 }` is the block (chunk of code) which is passed as an argument to the `Array#select` method.

In Ruby every method takes a block as an implicit parameter. However, a method's implementation determines whether or not the block will be executed.

## Writing Methods with Blocks

### Yielding

In Ruby every method takes a block as an implicit parameter. However, a method's implementation determines whether or not the block will be executed.

One way that we can ensure that the passed-in block argument is invoked from within the method is by using the `yield` keyword. This is because `yield` executes the block.

This allows a programmer to inject additional code into the method by passing in a block of code as an argument to the method, all without altering the method implementation.

```ruby
1 def ingore_block
2   puts "World!"
3 end
4
5 ingore_block { puts "Hello"}
```

In the example above, the `ignore_block` method has been defined on `lines 1-3`, and invoked with a block on `line 5`. However, because the method has been defined without the `yield` keyword, the block is completely ignored and the method simply outputs `"World!"` and returns `nil`.

```ruby
1 def exec_block
2   yield
3   puts "World!"
4 end
5
6 exec_block { puts "Hello"}
```

In the example above, the `exec_block` method has been defined on `lines 1-4`, and invoked with a block on `line 6`. Since the method has been defined with the `yield` keyword, the block code is executed which outputs `"Hello"` and returns `nil`. The `exec_block` method then outputs `"World!"`, and returns `nil`.

### block_given?

If a method has been defined with `yield`, the `Kernel#block_given?` method allows the programmer to call a method with and without a block. We do this by wrapping the `yield` keyword in a conditional using `Kernel#block_given?`. This ensures Ruby will not raise a `LocalJumpError` if the method is invoked without a block.

```ruby
1 def yield_without_block_error
2   yield
3   puts "Hello World!"
4 end
5
6 yield_without_block_error
```

In the example above on line 6, we invoke the `yield_without_block_error` method without a block. Since `yield_without_block_error` has been defined with the `yield` keyword, the method expects a block to be passed in. Since no block has been passed to the method, Ruby raises a `LocalJumpError`.

```ruby
1 def yield_without_block_no_error
2   yield if block_given?
3   puts "Hello World!"
4 end
5
6 yield_without_block_no_error
```

In the example above on line 6, we invoke the `yield_without_block_no_error` method without a block. Since `yield_without_block_no_error` has been defined with `yield` and wrapped in a conditional with the `Kernel#block_given?` method, Ruby does not raise a `LocalJumpError`. This is because `block_given?` is `false` and `yield` is not called. Therefore the method simply outputs, `"Hello World!"` and returns `nil`.

```ruby
1 def yield_with_block_no_error
2   yield if block_given?
3   puts "Goodnight World!"
4 end
5
6 yield_with_block_no_error { puts "Hello World!"}
```

In the example above on line 6, we invoke the `yield_with_block_no_error` method with a block. The method has been defined with `yield` and wrapped in a conditional with the `Kernel#block_given?` method to ensure Ruby does not raise a `LocalJumpError` in case the method is invoked without a block. However, since a block was passed to the method, `block_given?` returns `true` and `yield` is called. This executes the block code and outputs, `"Hello World!"` and returns `nil`. Next the `yield_with_block_no_error` method itself outputs, `"Goodnight World!"` and returns `nil`.

<hr>

### Passing execution to the block

`yield` is a keyword that executes a block from within a method. It passes execution from the method implementation over to the block that's passed into a method during method invocation. Being able to distinguish between method implementation and method invocation is critical to understanding the sequence of code execution when yielding to a block.

<hr>

```ruby
1 def greeting(name)
2   yield if block_given?
3   puts "How are ya #{name}!"
4 end
5
6 name = "Tom"
7 greeting(name) { puts "Hello there!"}
```

In the example above, line 7 is the method invocation while lines 1-4 defines the method implementation.

1. Execution starts at method invocation, on line 7. The `greeting` method is invoked with two arguments: a string referenced by `name`, and a block. The block is not part of the method definition and therefore is an implicit parameter.
2. Execution moves to line 1, where the method local variable `name` is assigned to the string `"Tom"`. The block is passed implicitly and not assigned to a variable.
3. Execution continues to line 2 which is the first line of the method implementation, where `Kernel#block_given?` checks to see if a block was passed. Since this returns true, yield executes the block on line 7, which outputs `"Hello there!"`
4. Execution continues in the method implementation on line 3 which outputs `"How are ya Tom!"`
5. The `end` method delimiter on line 4 ends the method and since `puts` is the last line of the `greeting` method, this method returns `nil`.

<hr>

### Yielding with an argument

Similar to methods, we can pass arguments to blocks. We do so by calling `yield` with argument(s). These arguments can be assigned to block parameters and referenced within the block as local variables which are scoped at the block level. This provides flexibility as it lets the user decide how to use the block local variables. For example, they can use the block local variables to output a message, or they can pass them over to other methods as arguments. Note that to avoid variable shadowing, block parameter names should have unique names and not conflict with the names of local variables initialized in the block's outer scope.

```ruby
1  def full_name(fname, lname)
2    full_name = "#{fname} #{lname}"
3    if block_given?
4 	   yield(full_name)
5    end
6    full_name
7  end
8
9  first_name = "Oscar"
10 last_name = "Cortes"
11
12 full_name(first_name, last_name) do |name|
13   puts "#{name}"
14 end
```

1.  Execution starts at method invocation, on line 12. The `full_name` method is invoked with three arguments: two strings referenced by `first_name` and `last_name`, and a block. The block is not part of the method definition and therefore is an implicit parameter.
2.  Execution moves to line 1, where the method local variables `fname`, and `lname` are assigned to the strings `"Oscar"` and `"Cortes"`. The block is passed implicitly and not assigned to a variable.
3.  Execution continues to line 2, where we use string interpolation to concatenate the `fname` and `lname` local variables and assign the return value to the local variable `full_name`.
4.  Execution continues to line 3, which is a conditional that checks for a passed-in block. This returns true, and execution moves to line 4.
5.  On line 4, we call `yield` with `full_name` as an argument. This yields execution to the block with `"Oscar Cortes"` as a block argument.
6.  Execution moves to line 12, where the block local variable `name` is assigned to `"Oscar Cortes"`.
7.  Execution continues to line 13 where we output the block local variable `name`.
8.  Execution moves to line 14 where the end of the block is reached.
9.  Execution jumps back to the method implementation where we just finished executing line 4.
10. Execution continues to line 5 which is the end of the `if` statement.
11. Line 6 returns the value of the concatenated string to line 12.
12. The program ends without using the return value of the `full_name` method.

<hr>

### Arity

Unlike `methods`, and `lambdas` which have have `strict arity`, `blocks` and `procs` have `lenient arity`. Arity refers to the rule regarding the number of arguments that one must pass to a `block`, `proc`, or `lambda`. With `strict arity`, the number of arguments must be equal to the number of parameters that have been defined for a `method` or `lambda`. Otherwise Ruby will raise an `ArgumentError`. With `lenient arity`, it's possible to pass less or extra arguments over to `blocks` and `procs` without Ruby raising an error.

<hr>

```ruby
1 def passing_exta_args_to_block
2   yield("one", "two")
3 end
4
5 passing_extra_args_to_block do |block_param1|
6  puts "#{block_param1}"
7 end
```

In the example above, we invoke the `passing_extra_args_to_block` method with a block. The block is not part of the method definition and therefore is an implicit parameter.

On line 2 we `yield` to the block with two arguments. Although the block has been defined with only one block parameter, ruby does not raise an `ArgumentError`. Instead the extra argument passed to the block is ignored and the code outputs `one`.

<hr>

```ruby
1 def passing_less_args_to_block
2   yield("one")
4 end
5
6 passing_less_args_to_block do |block_param1, block_param2|
7   puts "#{block_param1} #{block_param2}"
8 end
```

In the example above, we invoke the `passing_less_args_to_block` method with a block. The block is not part of the method definition and therefore is an implicit parameter.

On line 2 we `yield` to the block with one argument. Although the block has been defined with with two block parameters, ruby does not raise an `ArgumentError`. Instead the block local variable `block_param2` referenced on line 7 is `nil`. The string interpolation converts `nil` to an empty string and the code outputs the string `one ` containing an empty space at the end.

<hr>

### Return value of yielding to the block

Similar to methods, blocks can return a value. The return value of a block is based on the last evaluated expression within the block and can be assigned to a local variable within the method.

<hr>

```ruby
1  def block_demo(arr)
2     block_return_value = yield(arr)
3     puts "The block's return value is: #{block_return_value}"
4  end
5
6  alpha = ['a', 'b', 'c']
7
8  non_mutating(alpha) { |list| list.first }
9  end
```

On line 2 in the example above, we call `yield` with an argument which yields to the block and executes the block code. Since `list.first` is the last evaluated expression within the block, the block returns `a`. The local variable `block_return_value` in the `block_demo` method implementation is assigned to the block's return value and now references `a`. We then include `block_return_value` within string interpolation to output, `"The block's return value is: a"`.

<hr>

In addition to returning a value, blocks like methods can also mutate the passed-in argument with a destructive method.

```ruby
alpha = ['a', 'b', 'c']

def mutating_block_demo(arr)
    puts "Array Before: #{arr}"
    puts "Block's return value: #{yield(arr)}"
    puts "Array After: #{arr}"
end

mutating_block_demo(alpha) do |list|
    list.shift
end
```
