# spec/csv_etl_spec.rb
RSpec.describe "csv_etl.rb" do
  before do
    Dir.mkdir("tmp") unless Dir.exist?("tmp")
    File.write("tmp/people.csv", <<~CSV)
      name,age
      Alice,30
      Bob,25
    CSV
    File.delete("tmp/out.csv") if File.exist?("tmp/out.csv")
  end

  describe "output csv" do
    it "transforms and writes new csv", points: 3 do
      run_script_and_capture_lines("csv_etl.rb", "tmp/people.csv", "tmp/out.csv")
      data = File.read("tmp/out.csv").lines.map(&:chomp)
      expect(data[0]).to eq("name,age")
      expect(data[1]).to eq("ALICE,31")
      expect(data[2]).to eq("BOB,26")
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("csv_etl.rb")) }

    it "uses CSV.foreach with headers", points: 1 do
      expect(source_code).to match(/CSV\.foreach\(.+headers:\s*true/),
        "Iterate with CSV.foreach(..., headers: true)."
    end

    it "writes via CSV.open in write mode", points: 1 do
      expect(source_code).to match(/CSV\.open\(.+,\s*["']w["']\)/),
        "Write using CSV.open(output, 'w')."
    end
  end
end
