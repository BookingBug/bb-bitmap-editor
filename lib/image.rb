class Image
  attr_reader :pixels

  def create(width:, height:)
    @pixels = []
    height.times { @pixels << 'O'*width }
  end
end
