## Installation

```ruby
gem install brainfucker
```

### Usage

```ruby
interpreter = Brainfucker.new("
  ++++++++++[>+++++++>++++++++++>+++>++++<
  <<<-]>++.>+.+++++++..+++.>>++++.<++.<+++
  +++++.--------.+++.------.--------.>+.
")

interpreter.run

Hello World!
=> nil
```