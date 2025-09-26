# spec/zodiac_spec.rb
require "csv"

RSpec.describe "zodiac.rb" do
  before do
    Dir.mkdir("tmp") unless Dir.exist?("tmp")
    File.write("tmp/famous_birthdays.csv", <<~CSV)
      Name,Birthday
      Albert Einstein,1879-03-14
      Ada Lovelace,1815-12-10
    CSV
    File.delete("tmp/famous_zodiacs.csv") if File.exist?("tmp/famous_zodiacs.csv")
  end

  describe "output file" do
    it "creates a CSV with Name and Zodiac", points: 3 do
      run_script_and_capture_lines("zodiac.rb",
        argv: ["tmp/famous_birthdays.csv", "tmp/famous_zodiacs.csv"])

      data = CSV.read("tmp/famous_zodiacs.csv", headers: true)
      expect(data.headers).to eq(["Name", "Zodiac"])
      expect(data[0]["Name"]).to eq("Albert Einstein")
      expect(data[1]["Name"]).to eq("Ada Lovelace")

      expect(%w[Rat Ox Tiger Rabbit Dragon Snake Horse Goat Monkey Rooster Dog Pig])
        .to include(data[0]["Zodiac"])
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("zodiac.rb")) }

    it "requires CSV", points: 1 do
      expect(source_code).to match(/require ["']csv["']/i)
    end

    it "uses modulo operator for zodiac calculation", points: 1 do
      expect(source_code).to match(/%/),
        "Use modulo (%) to calculate zodiac cycle"
    end
  end
end
