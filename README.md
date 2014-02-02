## Summary

In keeping with the Brainfuck style, I made this interpreter extremely terse and difficult to understand. It's composed of 20 lines of Ruby code and was made as a sort of 'code golf' challenge to myself.

### Usage

```ruby
Brainfucker.load("
  ++++++++++[>+++++++>++++++++++>+++>++++<
  <<<-]>++.>+.+++++++..+++.>>++++.<++.<+++
  +++++.--------.+++.------.--------.>+.
")

Hello, world!=> nil
```