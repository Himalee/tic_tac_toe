require "console"

describe Console do

  before :each do
    @output = StringIO.new
  end

  it "prints hello" do
    input = StringIO.new
    console = Console.new(@output, input)
    console.present("hello\n")
    expect(@output.string).to eql("hello\n")
  end

  it "receives and prints world" do
    input = StringIO.new("world")
    console = Console.new(@output, input)
    expect(console.receive).to eql("world")
  end
end
