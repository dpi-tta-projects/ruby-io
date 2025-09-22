# spec/append_log_spec.rb
RSpec.describe "append_log.rb" do
  before do
    Dir.mkdir("tmp") unless Dir.exist?("tmp")
    File.delete("tmp/activity.log") if File.exist?("tmp/activity.log")
  end

  describe "output file" do
    it "appends a new line each time", points: 2 do
      run_script_and_capture_lines("append_log.rb", "tmp/activity.log", "User signed in")
      run_script_and_capture_lines("append_log.rb", "tmp/activity.log", "User signed out")

      lines = File.read("tmp/activity.log").lines.map(&:chomp)
      expect(lines.size).to eq(2)
      expect(lines[0]).to match(/\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z - User signed in/)
      expect(lines[1]).to match(/\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z - User signed out/)
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("append_log.rb")) }

    it "uses append mode 'a'", points: 1 do
      expect(source_code).to match(/File\.open\(.+?,\s*["']a["']\)/),
        "Open the log file in append mode ('a')."
    end

    it "formats timestamps as ISO-8601 (utc)", points: 1 do
      expect(source_code).to match(/Time\.now\.utc\.iso8601/),
        "Use Time.now.utc.iso8601 for timestamps."
    end
  end
end
