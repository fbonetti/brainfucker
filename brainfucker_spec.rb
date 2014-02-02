require './brainfucker'
require 'stringio'

describe Brainfucker do
  describe "::load" do
    let(:output) { StringIO.new }

    it "should output 'Hello, world!'" do
      code = "
        ++++++++++[>+++++++>++++++++++>+++>++++<
        <<<-]>++.>+.+++++++..+++.>>++++.<++.<+++
        +++++.--------.+++.------.--------.>+.
      "

      Brainfucker.load(code, "", output)

      output.string.should == "Hello, world!"
    end

    it "should output the first 11 fibonnaci numbers" do
      code = "
        +++++++++++>+>>>>+++++++++++++++++++++++
        +++++++++++++++++++++>++++++++++++++++++
        ++++++++++++++<<<<<<[>[>>>>>>+>+<<<<<<<-
        ]>>>>>>>[<<<<<<<+>>>>>>>-]<[>++++++++++[
        -<-[>>+>+<<<-]>>>[<<<+>>>-]+<[>[-]<[-]]>
        [<<[>>>+<<<-]>>[-]]<<]>>>[>>+>+<<<-]>>>[
        <<<+>>>-]+<[>[-]<[-]]>[<<+>>[-]]<<<<<<<]
        >>>>>[++++++++++++++++++++++++++++++++++
        ++++++++++++++.[-]]++++++++++<[->-<]>+++
        ++++++++++++++++++++++++++++++++++++++++
        +++++.[-]<<<<<<<<<<<<[>>>+>+<<<<-]>>>>[<
        <<<+>>>>-]<-[>>.>.<<<[-]]<<[>>+>+<<<-]>>
        >[<<<+>>>-]<<[<+>-]>[<+>-]<<<-]
      "

      Brainfucker.load(code, "", output)

      output.string.should == "1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89"
    end

    it "should output the reverse of what was input" do
      code = ",[>,]<[.<]"
      Brainfucker.load(code, "Brainfuck is cool!", output)

      output.string.should == "!looc si kcufniarB"
    end
  end
end