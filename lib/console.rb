class Console
  def initialize(output = $stdout, input = $stdin)
    @output = output
    @input = input
  end

  public
  
  def present(message)
    @output.puts message
  end

  def receive
    @input.gets.chomp
  end
end
