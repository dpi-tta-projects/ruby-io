# spec/line_numbers_spec.rb
RSpec.describe "line_numbers.rb" do
  before do
    Dir.mkdir("tmp") unless Dir.exist?("tmp")
    File.write("tmp/poem.txt", "roses are red\nviolets are blue\n")
  end

  describe "output" do
    it "prints lines with numbers (1-based)", points: 2 do
      output = run_script_and_capture_lines("line_numbers.rb", argv: ["tmp/poem.txt"])
      expect(output[0]).to eq("1: roses are red")
      expect(output[1]).to eq("2: violets are blue")
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("line_numbers.rb")) }

    it "uses File.open with a block", points: 1 do
      expect(source_code).to match(/File\.open\(.+?\)\s+do\s*\|/),
        "Use File.open with a block to ensure the file closes automatically."
    end

    it "reads line-by-line (each_line)", points: 1 do
      expect(source_code).to match(/each_line/),
        "Iterate line-by-line to avoid loading the whole file at once."
    end
  end
end
