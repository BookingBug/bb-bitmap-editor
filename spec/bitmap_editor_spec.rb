require_relative '../lib/bitmap_editor'

describe BitmapEditor do
  let(:image) { double(:image) }
  subject(:run_command) { BitmapEditor.new(image).run(command) }

  describe "I M N" do
    context "with a well formatted command" do
      describe "I 2 2" do
        let(:command) { 'I 2 2' }

        it "creates a 2x2 white image" do
          expect(image).to receive(:create).with(width: 2, height: 2)

          run_command
        end
      end

      describe "I 3 3" do
        let(:command) { 'I 3 3' }
        it "creates a 3x3 white image" do
          expect(image).to receive(:create).with(width: 3, height: 3)

          run_command
        end
      end

      describe "I 3 9" do
        let(:command) { 'I 3 9' }

        it "creates a 3x9 white image" do
          expect(image).to receive(:create).with(width: 3, height: 9)

          run_command
        end
      end
    end

    context "with a poorly formatted command" do
      xit "returns an informative error" do # speak to PM to determine desired behaviour
        expect(image).to receive(:create).with(height: "a", width: "a")

        BitmapEditor.new(image).run('I a a')
      end
    end
  end

  describe "L X Y C" do
    context "with a well formatted command" do
      describe "L 1 1 B" do
        let(:command) { "L 1 1 B" }
        it "colours the pixel at 1 1 black" do
          point = OpenStruct.new(x: 1, y: 1)
          expect(image).to receive(:add_colour).with(point, "B")

          run_command
        end
      end

      describe "L 2 9 R" do
        let(:command) { "L 2 9 R" }
        it "colours the pixel at 2 9 red" do
          point = OpenStruct.new(x: 2, y: 9)
          expect(image).to receive(:add_colour).with(point, "R")

          run_command
        end
      end
    end
  end

  describe "V X Y1 Y2 C" do
    context "with a well formatted command" do
      describe "V 1 1 1 R" do
        let(:command) { "V 1 1 1 R" }
        it "draws a red line in column 1 between rows 1 and 1" do
          expect(image).to receive(:draw_vertical_colour_line).with(x: 1, y1: 1, y2: 1, colour: "R")

          run_command
        end
      end

      describe "V 3 1 1 R" do
        let(:command) { "V 3 1 1 R" }
        it "draws a red line in column 3 between rows 1 and 1" do
          expect(image).to receive(:draw_vertical_colour_line).with(x: 3, y1: 1, y2: 1, colour: "R")

          run_command
        end
      end

      describe "V 1 3 1 R" do
        let(:command) { "V 1 3 1 R" }
        it "draws a red line in column 1 between rows 3 and 1" do
          expect(image).to receive(:draw_vertical_colour_line).with(x: 1, y1: 3, y2: 1, colour: "R")

          run_command
        end
      end

      describe "V 1 1 3 R" do
        let(:command) { "V 1 1 3 R" }
        it "draws a red line in column 1 between rows 1 and 3" do
          expect(image).to receive(:draw_vertical_colour_line).with(x: 1, y1: 1, y2: 3, colour: "R")

          run_command
        end
      end

      describe "V 1 1 1 B" do
        let(:command) { "V 1 1 1 B" }
        it "draws a black line in column 1 between rows 1 and 1" do
          expect(image).to receive(:draw_vertical_colour_line).with(x: 1, y1: 1, y2: 1, colour: "B")

          run_command
        end
      end

      describe "V 5 4 6 Y" do
        let(:command) { "V 5 4 6 Y" }
        it "draws a yellow line in column 5 between rows 4 and 6" do
          expect(image).to receive(:draw_vertical_colour_line).with(x: 5, y1: 4, y2: 6, colour: "Y")

          run_command
        end
      end
    end
  end
end
