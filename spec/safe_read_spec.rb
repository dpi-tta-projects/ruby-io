# spec/safe_read_spec.rb
RSpec.describe "safe_read.rb" do
  before do
    Dir.mkdir("tmp") unless Dir.exist?("tmp")
    File.write("tmp/existing.txt", "First line\nSecond line\n")
    File.delete("tmp/missing.txt") if File.exist?("tmp/missing.txt")
  end

  describe "behavior" do
    it "prints first line when file exists", points: 1 do
      out = run_script_and_capture_lines("safe_read.rb", "tmp/existing.txt")
      expect(out[0]).to eq("First line")
    end

    it "prints helpful error to STDERR when file is missing", points: 2 do
      out, err, status = run_script_capture_stdout_stderr_status("safe_read.rb", "tmp/missing.txt")
      expect(err.lines.first&.chomp).to eq("Error: file not found: tmp/missing.txt")
      expect(status).not_to eq(0), "Exit with non-zero status on error."
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("safe_read.rb")) }

    it "rescues Errno::ENOENT", points: 1 do
      expect(source_code).to match(/rescue\s+Errno::ENOENT/),
        "Rescue Errno::ENOENT to handle missing files."
    end

    it "writes to $stderr and exits non-zero", points: 1 do
      expect(source_code).to match(/\$stderr\.puts/),
        "Write error messages to $stderr."
      expect(source_code).to match(/exit\(\s*1\s*\)/),
        "Exit with non-zero status on error."
    end
  end
end
