require 'stringio'

class Brainfucker

  def initialize(code, input = "", output = STDOUT)
    @code = StringIO.new(code)
    @input = StringIO.new(input)
    @output = output
    reset_state
  end

  def run
    reset_state

    until @code.eof?
      parse_command(@code.getc)
    end

    @output.puts
  end

  def step(n = 1)
    n.times { parse_command(@code.getc) }
    @code.pos
  end

  def reset_state
    @code.rewind
    @input.rewind
    @memory = {}
    @pointer_address = 0
  end

  def code
    @code.string
  end

  def input
    @input.string
  end

  def memory
    Hash[@memory.sort]
  end

  private

  def parse_command(command)
    @memory[@pointer_address] ||= 0

    case command
    when "+"
      increment_value
    when "-"
      decrement_value
    when ">"
      increment_pointer
    when "<"
      decrement_pointer
    when "."
      output_char
    when ","
      input_char
    when "["
      open_loop
    when "]"
      close_loop
    end
  end

  def increment_value
    @memory[@pointer_address] = (@memory[@pointer_address] + 1) % 256
  end

  def decrement_value
    @memory[@pointer_address] = (@memory[@pointer_address] - 1) % 256
  end

  def increment_pointer
    @pointer_address += 1
  end

  def decrement_pointer
    @pointer_address -= 1
  end

  def output_char
    @output.print @memory[@pointer_address].chr
  end

  def input_char
    char = @input.getc || 0x00
    @memory[@pointer_address] = char.ord
  end

  def open_loop
    forward_to_close_bracket if @memory[@pointer_address].zero?
  end

  def close_loop
    rewind_to_open_bracket if @memory[@pointer_address] > 0
  end

  def forward_to_close_bracket
    while @code.getc != "]"; end
  end

  def rewind_to_open_bracket
    @code.seek(-2, IO::SEEK_CUR)
    until @code.getc == "["
      @code.seek(-2, IO::SEEK_CUR)
    end
  end
end
