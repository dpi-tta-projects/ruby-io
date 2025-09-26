# spec/dice_spec.rb
RSpec.describe "dice.rb" do
  describe "output" do
    it "rolls one six-sided die by default", points: 1 do
      output = run_script_and_capture_lines("dice.rb", argv: ["6", "1"])
      result = output[0].to_i
      expect(result).to be_between(1, 6)
    end

    it "respects sides and count arguments", points: 2 do
      output = run_script_and_capture_lines("dice.rb", argv: ["6", "3"])
      rolls = output[0].split(",").map(&:to_i)
      expect(rolls.length).to eq(3)
      rolls.each do |r|
        expect(r).to be_between(1, 6)
      end
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("dice.rb")) }

    it "uses rand with a range", points: 1 do
      expect(source_code).to match(/rand\(1\.\.sides\)/),
        "Use rand(1..sides) to generate rolls"
    end
  end
end
