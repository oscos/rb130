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

The code above is an example of a method invocation with a block. The Array object `[1, 2, 3, 4, 5]` is the calling object.  The `Array#select` is the method being invoked.  The `{|n| n % 2 == 0 }` is the block (chunk of code) which is passed as an argument to the `Array#select` method.

In Ruby every method takes a block as an implicit parameter.  However, a method's implementation determines whether or not the block will be executed.

## Writing Methods with Blocks

#### Yielding

Once a method has been defined, we can invoke the method with a block. If the method has been defined with the `yield` keyword, the block will be passed to the method as an argument whereby the method will execute the block. This allows a programmer to inject additional code into the method by passing in a block as an argument to the method, all without altering the method definition.

```ruby
def ingore_block
  puts "World!"
end

ingore_block { puts "Hello"}
```

In the example above, the `ignore_block` method has been defined on `lines 1-3`, and invoked with a block on `line 5`. However, because the method has been defined without the `yield` keyword, the block is completely ignored and the method simply outputs `"World!"` and returns `nil`.

```ruby
def exec_block
  yield
  puts "World!"
end

exec_block { puts "Hello"}
```

In the example above, the `exec_block` method has been defined on `lines 1-4`, and invoked with a block on `line 6`.  Since the method has been defined with the `yield` keyword, the block code is executed which outputs `"Hello"` and returns `nil`. The `exec_block` method then outputs `"World!"`, and returns `nil`.

#### block_given?

If a method has been defined with `yield`, the `Kernel#block_given?` method allows the programmer to call a method with and without a block.  We do this by wrapping the `yield` keyword in a conditional using `Kernel#block_given?`. This ensures Ruby will not raise a `LocalJumpError` if the method is invoked without a block. 


```ruby
def yield_without_block_error
  yield
  puts "Hello World!"
end

yield_without_block_error
```

In the example above on line 6, we invoke the `yield_without_block_error` method without a block. Since `yield_without_block_error` has been defined with the `yield` keyword, the method expects a block to be passed in.  Since no block has been passed to the method, Ruby raises a `LocalJumpError`.


```ruby
def yield_without_block_no_error
  yield if block_given?
  puts "Hello World!"
end

yield_without_block_no_error
```

In the example above on line 6, we invoke the `yield_without_block_no_error` method without a block. Since `yield_without_block_no_error` has been defined with `yield` and wrapped in a conditional with the `Kernel#block_given?` method, Ruby does not raise a `LocalJumpError`.  This is because `block_given?` is `false` and `yield` is not called.  Therefore the method simply outputs, `"Hello World!"` and returns `nil`.

```ruby
def yield_with_block_no_error
  yield if block_given?
  puts "Goodnight World!"
end

yield_with_block_no_error { puts "Hello World!"}
```

In the example above on line 6, we invoke the `yield_with_block_no_error` method with a block. The method has been defined with `yield` and wrapped in a conditional with the `Kernel#block_given?` method to ensure Ruby does not raise a `LocalJumpError` in case the method is invoked without a block.  However, since a block was passed to the method, `block_given?` returns `true` and `yield` is called. This executes the block code and outputs, `"Hello World!"` and returns `nil`.  Next the `yield_with_block_no_error` method itself outputs, `"Goodnight World!"` and returns `nil`.

#### Passing execution to the block

```ruby
def greeting(name)
  yield if block_given?
  puts "How are ya #{name}!"
end

name = "Tom"
greeting(name) { puts "Hello there!"}
```

Execution starts at method invocation, on line 7. The `greeting` method is invoked with two arguments: a string referenced by `name`, and a block.  The block is not part of the method definition and therefore is an implicit parameter.
  
Execution moves to line 1, where the method local variable `name` is assigned to the string `"Tom"`. The block is passed implicitly and not assigned to a variable.
  
Execution continues to line 2 which is the first line of the method implementation, where `Kernel#block_given?` checks to see if a block was passed.  Since this returns true, yield executes the block on line 7, which outputs `"Hello there!"`

Execution continues in the method implementation on line 3 which outputs `"How are ya Tom!"`

The `end` method delimiter on line 4 ends the method and since `puts` is the last line of the `greeting` method, this method returns `nil`.

#### Yielding with an argument

One way in which blocks are similar to methods is they too can take in arguments. These arguments can be assigned as block parameters when the block is invoked.  This provides users with flexibility when invoking a method.  They can assign the block parameters to local variables within the block which can then be used to output a message or pass the local variables as arguments to other methods.

```ruby
def greeting(name)
  yield(name) if block_given?
  puts "How the heck are ya?!"
end

name = "Tom"
greeting(name) { |n| puts "Hello #{n}"}
```