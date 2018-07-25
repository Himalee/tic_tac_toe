require "console"

describe Console do
  it "prints hello" do
    output = StringIO.new
    input = StringIO.new
    console = Console.new(output, input)
    message = "hello\n"
    console.present(message)
    expect(output.string).to eql("hello\n")
  end

  it "receives and prints world" do
    output = StringIO.new
    input = StringIO.new("world")
    console = Console.new(output, input)
    expect(console.receive).to eql("world")
  end
end
