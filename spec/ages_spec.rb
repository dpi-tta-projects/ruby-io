# spec/ages_spec.rb
require "date"

RSpec.describe "famous_ages.rb" do
  before do
    Dir.mkdir("tmp") unless Dir.exist?("tmp")
    File.write("tmp/famous.csv", <<~CSV)
      Name,Birthday
      Albert Einstein,1879-03-14
      Ada Lovelace,1815-12-10
    CSV
  end

  describe "output" do
    it "prints names and ages", points: 3 do
      output = run_script_and_capture_lines("ages.rb", argv: ["tmp/famous.csv"])

      expect(output[0]).to match(/Albert Einstein is \d+ years old/)
      expect(output[1]).to match(/Ada Lovelace is \d+ years old/)

      # sanity check one value
      age_einstein = Date.today.year - 1879
      expect(output[0]).to include(age_einstein.to_s)
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("ages.rb")) }

    it "requires CSV and Date", points: 1 do
      expect(source_code).to match(/require ["']csv["']/i)
      expect(source_code).to match(/require ["']date["']/i)
    end

    it "uses CSV.foreach with headers", points: 1 do
      expect(source_code).to match(/CSV\.foreach\(.+headers:\s*true/),
        "Use CSV.foreach(..., headers: true)"
    end
  end
end
