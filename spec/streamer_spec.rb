# spec/streamer_spec.rb
RSpec.describe "streamer.rb" do
  before do
    Dir.mkdir("tmp") unless Dir.exist?("tmp")
    File.write("tmp/note.txt", "Hello\nworld\n")
  end

  describe "output" do
    it "prints file as-is", points: 1 do
      out = run_script_and_capture_lines("streamer.rb", "tmp/note.txt")
      expect(out).to eq(["Hello", "world"])
    end

    it "prints file uppercased with --uppercase", points: 1 do
      out = run_script_and_capture_lines("streamer.rb", "--uppercase", "tmp/note.txt")
      expect(out).to eq(["HELLO", "WORLD"])
    end

    it "reads from STDIN when filename is '-'", points: 2 do
      # Provide stdin via helper; if your helper differs, adjust as needed.
      input = "a\nb\n"
      out = run_script_with_input_and_capture_lines("streamer.rb", "-", stdin_data: input)
      expect(out).to eq(["a", "b"])
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("streamer.rb")) }

    it "uses OptionParser", points: 1 do
      expect(source_code).to match(/OptionParser\.new/),
        "Use OptionParser to handle the --uppercase flag."
    end

    it "streams line-by-line (no full-file read)", points: 1 do
      expect(source_code).to match(/each_line/),
        "Stream with each_line (avoid File.read)."
      expect(source_code).not_to match(/File\.read/),
        "Avoid reading the whole file at once."
    end
  end
end
