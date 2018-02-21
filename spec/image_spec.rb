require_relative '../lib/image'

describe Image do
  describe "#create" do

    it "creates a 2x2 white image" do
      expected_image = ['OO', 'OO']
      image = Image.new

      image.create(width: 2, height: 2)

      expect(image.pixels).to eq expected_image
    end

    it "creates a 3x2 white image" do
      expected_image = ['OOO', 'OOO']
      image = Image.new

      image.create(width: 3, height: 2)

      expect(image.pixels).to eq expected_image
    end
  end
end
