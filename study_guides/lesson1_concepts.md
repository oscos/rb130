# Launch School - Lesson 1

## Closures

A closure is a general programming concept that allows programmers to save a chunk of code that can later be executed.

It’s called a closure because it binds the surrounding artifacts that were in scope at the time and location of where and when the closure was created. Thus forming an enclosure around everything so that the artifacts can be referenced when the closure is executed later.

The references or access that a closure retains to these artifacts or in-scope items is known as its binding. These in-scope items include things like variables, methods, and objects.

Because a closure must keep track of its binding it drags around its context or environment. This way it can access the artifacts that are part of its binding when it’s later executed in a different scope such as when you pass it to a method.

In Ruby there are three ways to implement a closure:

1. Creating an object from the Proc class
2. Using Blocks
3. Using Lambdas

## Calling Methods with Blocks

In Ruby every method takes a block as an implicit parameter. However, a method's implementation determines whether or not the block will be executed.

<hr>

```ruby
[1, 2, 3, 4, 5].select {|n| n % 2 == 0 }
```

The code above is an example of a method invocation with a block. The Array object `[1, 2, 3, 4, 5]` is the calling object. The `Array#select` is the method being invoked. The `{|n| n % 2 == 0 }` is the block (chunk of code) which is passed as an argument to the `Array#select` method.

<hr>

## Writing Methods with Blocks

### Yielding

In Ruby every method takes a block as an implicit parameter. However, a method's implementation determines whether or not the block will be executed.

One way that we can ensure that the passed-in block argument is invoked from within the method is by using the `yield` keyword. This is because `yield` executes the block.

This allows a programmer to inject additional code into the method by passing in a block of code as an argument to the method, all without altering the method implementation.

<hr>

```ruby
1  def ingore_block
2    puts "World!"
3  end
4
5  ingore_block { puts "Hello"}
```

In the example above, the `ignore_block` method has been defined on `lines 1-3`, and invoked with a block on `line 5`. However, because the method has been defined without the `yield` keyword, the block is completely ignored and the method simply outputs `"World!"` and returns `nil`.

<hr>

```ruby
1  def exec_block
2    yield
3    puts "World!"
4  end
5
6  exec_block { puts "Hello"}
```

In the example above, the `exec_block` method has been defined on `lines 1-4`, and invoked with a block on `line 6`. Since the method has been defined with the `yield` keyword, the block code is executed which outputs `"Hello"` and returns `nil`. The `exec_block` method then outputs `"World!"`, and returns `nil`.

<hr>

### block_given?

If a method has been defined with `yield`, the `Kernel#block_given?` method allows the programmer to call a method with and without a block. We do this by wrapping the `yield` keyword in a conditional using `Kernel#block_given?`. This ensures Ruby will not raise a `LocalJumpError` if the method is invoked without a block.

<hr>

```ruby
def yield_without_block_error
  yield
  puts "Hello World!"
end

yield_without_block_error
```

In the example above, we invoke the `yield_without_block_error` method without a block. Since `yield_without_block_error` has been defined with the `yield` keyword, the method expects a block to be passed in. Since no block has been passed to the method, Ruby raises a `LocalJumpError`.

<hr>

```ruby
def yield_without_block_no_error
  yield if block_given?
  puts "Hello World!"
end

yield_without_block_no_error
```

In the example above, we invoke the `yield_without_block_no_error` method without a block. Since `yield_without_block_no_error` has been defined with `yield` and wrapped in a conditional with the `Kernel#block_given?` method, Ruby does not raise a `LocalJumpError`. This is because `block_given?` is `false` and `yield` is not called. Therefore the method simply outputs, `"Hello World!"` and returns `nil`.

<hr>

```ruby
def yield_with_block_no_error
  yield if block_given?
  puts "Goodnight World!"
end

yield_with_block_no_error { puts "Hello World!"}
```

In the example above, we invoke the `yield_with_block_no_error` method with a block. The method has been defined with `yield` and wrapped in a conditional with the `Kernel#block_given?` method to ensure Ruby does not raise a `LocalJumpError` in case the method is invoked without a block. However, since a block was passed to the method, `block_given?` returns `true` and `yield` is called. This executes the block code and outputs, `"Hello World!"` and returns `nil`. Next the `yield_with_block_no_error` method itself outputs, `"Goodnight World!"` and returns `nil`.

<hr>

### Passing execution to the block

`yield` is a keyword that executes a block from within a method. It passes execution from the method implementation over to the block that's passed into a method during method invocation. Being able to distinguish between method implementation and method invocation is critical to understanding the sequence of code execution when yielding to a block.

<hr>

```ruby
1  def greeting(name)
2    yield if block_given?
3    puts "How are ya #{name}!"
4  end
5
6  name = "Tom"
7  greeting(name) { puts "Hello there!"}
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

<hr>

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
10  last_name = "Cortes"
11
12  full_name(first_name, last_name) do |name|
13    puts "#{name}"
14  end
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
def passing_exta_args_to_block
  yield("one", "two")
end

passing_extra_args_to_block do |block_param1|
  puts "#{block_param1}"
nd
```

In the example above, we invoke the `passing_extra_args_to_block` method with a block. The block is not part of the method definition and therefore is an implicit parameter.

Within the method we `yield` to the block with two arguments. Although the block has been defined with only one block parameter, ruby does not raise an `ArgumentError`. Instead the extra argument passed to the block is ignored and the code outputs `one`.

<hr>

```ruby
def passing_less_args_to_block
  yield("one")
end

passing_less_args_to_block do |block_param1, block_param2|
  puts "#{block_param1} #{block_param2}"
end
```

In the example above, we invoke the `passing_less_args_to_block` method with a block. The block is not part of the method definition and therefore is an implicit parameter.

Within the method, we `yield` to the block with one argument. Although the block has been defined with with two block parameters, ruby does not raise an `ArgumentError`. Instead the block local variable `block_param2` references `nil`. The string interpolation converts `nil` to an empty string and the code outputs the string `one` containing an empty space at the end.

<hr>

### Return value of yielding to the block

Similar to methods, blocks can return a value or mutate the passed-in argument with a destructive method. The return value of a block is based on the last evaluated expression within the block and can be assigned to a local variable.

<hr>

```ruby
def block_demo(arr)
   block_return_value = yield(arr)
   puts "The block's return value is: #{block_return_value}"
end

alpha = ['a', 'b', 'c']

non_mutating(alpha) { |list| list.first }
end
```

In the example above, we call `yield` with an argument which yields to the block and executes the block code. Since `list.first` is the last evaluated expression within the block, the block returns `a`. Within the `block_demo` method, the local variable `block_return_value` is assigned to the block's return value and now references `a`. We use string interpoloation and include `block_return_value` to output, `"The block's return value is: a"`.

<hr>

### When to use blocks in your own Methods

#### There are two main uses cases for blocks.

1. To defer some implementation code to the method invocation decision.

   When the method implmementor (developer) is unsure how exactly a method may be called, the method implementor can leave some of the specific details out of the method implementation.

   By doing so, we can leave the decision of how best to implement specific details to the method caller (could be same person/developer) when the method is invoked.

   This allows the method caller the ability to inject additional code into the method by passing in a block of code as an argument to the method, all without altering the original method implementation for other users.

   Many of the methods in the Ruby core library are useful precisely because they are built in a generic way which allows the method caller to refine the method through a block when the method is invoked. This helps reduce the number of methods that would have to be create and memorize in order to accomadate specific scenarios.

   <hr>

   ```ruby
   def calculate(num)
     result = yield(num)
     puts "The calculated result is: #{result}"
   end

   calculate(7) { |n| n + n }
   calculate(7) { |n| n * n }
   ```

   <hr>

2. Method that need to perform some "before" and "after" actions - sandwich code.

   There are times when we want to write some generic method that peforms some `before` and `after` action. One example is tracking the `start time` and `end time` in order to `time` how long a process takes to execute. Another example is `opening` and `closing` a file while processing its contents.

   This is a good use case for using blocks in our methods.

   When writing this type of method implementation known as `sandwich code`, the method implementor does care about the specific details of the block of code that is executed `between` the `before` and `after` actions defined in the method. Insted, the method implementor can defer implemention over to the method caller at method invocation time.

   <hr>

   ```ruby
   def elapsed_time
     start_time = Time.now
     yield if block_given?
     end_time = Time.now

     delta = end_time - start_time
     puts "The process took #{delta} seconds."
   end

   elapsed_time { sleep(1.5) }
   elapsed_time { sleep(2) }
   ```

  <hr>

### Methods with an explicit parameter

Regardless of whether or not a method uses or ingores a passed-in block argument, in Ruby, every method can accept a block as an implicit parameter.

A block however, can also be passed to a method explicitly. This is referred to as an explicit block.

Unlike an `implicit` block, an `explicit` block is part of the method definition and is assigned to a method parameter so that it can be manage like any other object.

While we can only `yield` to an `implicit` block, with explicit blocks, the method parameter serves as a handle (a variable) that we can use to reassign, pass to other methods, and invoked many times.

This differs from an `explicit` block since we can only assign the return value of yielding to an `implicit` block and not the block itself.

To define an explicit block, you add a parameter to the method definition where the name begins with a `&` character. This is a special parameter that converts the block argument to a simple `Proc` object.

Inside the method, you can reference the parameter without the `&`. In cases where a method is defined with more than one parameter, the parameter with the `&` character must be the last parameter defined for the method.

<hr>

```ruby
def explicit_block_to_proc(&block_to_proc)
  block_to_proc
end

p explicit_block_to_proc { 3 * 5 }  #<Proc:0x0000557e82ab9360@main.rb:5>
```

In the example above, the `explicit_block_to_proc` method is invoked with a block as an argument. Since the block is part of the method definition, it is an `explicit` block. It is assigned to the method parameter `&block` so that it can be manage like any other object.

The `&block` parameter converts the block to a simple `proc` object. Inside the method, we reference the `proc` object using its variable name `block_to_proc`, which drops the `&` from the parameter name. We can now reasign, pass to other methods, or invoke it.

While we can't return a block in Ruby, we can however return a `Proc` object. Thus when we invoke the `explicit_block_to_proc` method, its return value is the `Proc` object `#<Proc:0x0000557e82ab9360@main.rb:5>`.

<hr>

# @TODO: Add another example with calling the proc block.call

### Using Closures

In Ruby, we can create a closure by using `blocks`, creating `Proc` objects, and `lambda`'s

Because closures retain access to their surrounding scope of where and when they are created, they can use and update variables in that scope when they are executed, even if the closure is called from a different scope.

```ruby
def letter_concat(arr)
  arr.each { |el| yield(el) }
end

arr = %w(a b c d e)
results = []

letter_concat(arr) do |letter|
  if results.empty?
      results << letter
  else
    concat = results[-1] + letter
    results << concat
  end
end

p results
```

In the example above, we invoke the `letter_concat` method with a block. The block is not part of the method definition and is an implicit parameter.

Within `letter_concat`, `yield` executes the block. Even thought the block is executed in a different location from where it was defined, the block can still access the `results` array through the closure.

<hr>

Although in Ruby, we can't return blocks, both methods and blocks have the ability to each return a closure

```ruby
  def pop_off
    arr = [1,2,3,4,5]
    Proc.new { arr.pop }
  end

  n1 = pop_off
  p n1.call # => 5
  p n1.call # => 4
  puts
  n2 = pop_off
  p n2.call # => 5
  p n2.call # => 4
  puts
  p n1.call # => 3
```

### Summary Writing Methods with Blocks

- A closure is a way to pass around an unnamed `chunk of code` to be executed later.
- A block is one way in which Ruby implements closures.
- Similar to methods, blocks can take arguments.
- Unlike methods which have `strict arity` and must be passed the correct number of arguments, blocks have `lenient arity`. This means Ruby won't raise an error if the wrong number of arguments are passed to a block.
- Like methods, blocks also return a value.
- One use case for blocks is to defer some implementation decisions when the method is invoked. This allows the `method caller` to refine a method at the time of invocation for a specific use case. It also allows the `method implementor` to write generic methods that can be used in more than one way.
- A second use case for blocks is for sandwhich code scenarios. That is method that need to perform some before or after action.

<hr>

## Blocks and Variable Scope

### Refresher

Bindings and Closures are at the core of variable scoping rules in Ruby. It is why inner scope can access variables initialized in an outer scope.

Since a block creates a new scope for local variables initialized inside the block, those local variables are not accesible outside the block.

```ruby
outside_var = "outside"

1.times do
  inside_var = 'inside'
  puts outside_var # => outside
end

puts inside_var # Raises NameError:
```

In the example above, we invoke the the `times` method with a block. Since blocks can access and modify variables defined outside the block, it has access to the `outside_var` local variable. Thus when we reference `outside_var` from within the block, the code outputs the string `outside`.

The `inside_var` however has been initialized inside the block. Since a block creates a new scope for local variables, `inside_var` is not accessible outside the block. Thus when we attempt to reference `inside_var` outside the block, Ruby raises an error.

<hr>

### Closure and binding

A closure is a general programming concept that allows programmers to save a chunk of code that can later be executed.

It’s called a closure because it binds the surrounding artifacts that were in scope at the time and location of where and when the closure was created. Thus forming an enclosure around everything so that the artifacts can be referenced when the closure is executed later.

The references or access that a closure retains to these artifacts or in-scope items is known as its binding. These in-scope items include things like variables, methods, and objects.

Because a closure must keep track of its binding it drags around its context or environment. This way it can access the artifacts that are part of its binding when it’s later executed in a different scope such as when you pass it to a method.

In Ruby there are three ways to implement a closure:

1. Creating an object from the Proc class
2. Using Blocks
3. Using Lambdas

<hr>

```ruby
def a_method(greeting)
  greeting.call
end

holiday = "Halloween"
a_proc = Proc.new {puts "Happy #{holiday}!"}
holiday = "Thanks Giving"

a_method(a_proc)
```

In the example above, we initialize the local variable `holiday` to the String, `"Halloween"`. We also create a `Proc` object and assign it to the `a_proc` local variable. Next we reassign `holiday` to the String `Thanks Giving`. Note that up to this point, we have not yet executed `a_proc`.

We then invoke the method, `a_method`, and pass the `Proc` object referenced by `a_proc` as an argument which gets assigned to the `greeting` method parameter.

Inside `a_method`, `a_proc` is executed by invoking the `Proc#call` method on the Proc object referenced by `greeting`. This outputs `"Halloween"` and returns `nil`.

Since a closure keeps track of its binding or surrounding environment/context, `a_proc` retains access to `holiday` even though it was initialized outside the `a_method`. This is because `holiday` was defined before `a_proc` was instantiated and therefor is part of its binding.

Note that the Proc `a_proc` binds to the local variable `holiday` and not to the value that `holiday` references. Therefore even though `holiday` is reassigned after `a_proc` is defined, it is aware of the new value.
