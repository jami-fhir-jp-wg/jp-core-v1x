require "RubyXL" # https://github.com/weshatheleopard/rubyXL
require "pathname"
require 'optparse'

# 一般名処方マスター CodeSystemファイル生成
def create_ippanmei(codes)
  content = <<~FSH
    // #{File.basename @source_file}
    CodeSystem: JP_MedicationCodeCommon_CS
    Id: jp-medication-code-common-cs
    Title: "JP Core Medication Common Code"
    Description: "医薬品一般名処方コードのコードシステム"
    * ^url = $JP_MedicationCodeCommon_CS
    * ^status = #draft
    * ^caseSensitive = true
    * ^content = #complete
    #{codes.map{ |code| "* ##{code[:ippanmei_code]} #{"\u{22}"}#{code[:name]}#{"\u{22}"}" }.join("\n")}
  FSH

  File.open("./input/fsh/terminologies/JP_MedicationCodeCommon_CS.fsh", "w", :encoding => "utf-8") do |f|
    f << content
  end

  puts "[created] ippanmei_code: #{codes.count}"
end

def create
  workbook = RubyXL::Parser.parse(@source_file)
  worksheet = workbook[0]

  codes = worksheet
            .select{ |row| row.r > 3 } # 3行目以降を取得する
            .map{ |row| { ippanmei_code: row[1].value, name: row[2].value } }

  create_ippanmei codes
end

begin
  args = {}
  parser = OptionParser.new
  parser.on('-f file', '--file') {|v| args[:f] = v} # マスターファイル
  parser.parse!(ARGV)

  dir = Pathname.new(File.dirname(File.expand_path(__FILE__)))
  @source_file = Dir.glob("#{dir}/#{args[:f] || "ippanmeishohoumaster_??????.xlsx"}").sort.last
  raise IOError.new("File is not found") if @source_file.nil?

  create
rescue => e
  puts e.class
  puts e.message
  puts e.backtrace
end
