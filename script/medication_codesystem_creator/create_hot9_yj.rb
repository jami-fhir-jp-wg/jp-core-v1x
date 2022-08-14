require "csv"
require "pathname"
require 'optparse'

# HOT9コード CodeSystemファイル生成
def create_hot9(codes)
  content = <<~FSH
    // #{File.basename @source_file}
    CodeSystem: JP_MedicationCodeHOT9_CS
    Id: jp-medication-code-hot9-cs
    Title: "JP Core Medication HOT9 Code"
    Description: "医薬品HOT9コードのコードシステム"
    * ^url = $JP_MedicationCodeHOT9_CS
    * ^status = #draft
    * ^caseSensitive = true
    * ^content = #complete
    #{codes.map{ |code| "* ##{code[:hot_code]} #{"\u{22}"}#{code[:hot_display]}#{"\u{22}"}" }.join("\n")}
  FSH

  File.open("./input/fsh/terminologies/JP_MedicationCodeHOT9_CS.fsh", "w", :encoding => "utf-8") do |f|
    f << content
  end

  puts "[created] hot_code: #{codes.count}"
end

# YJコード CodeSystemファイル生成
def create_yj(codes)
  content = <<~FSH
    // #{File.basename @source_file}
    CodeSystem: JP_MedicationCodeYJ_CS
    Id: jp-medication-code-yj-cs
    Title: "JP Core Medication YJ Code"
    Description: "医薬品YJコードのコードシステム"
    * ^url = $JP_MedicationCodeYJ_CS
    * ^status = #draft
    * ^caseSensitive = true
    * ^content = #complete  
    #{codes.map{ |code| "* ##{code[:yj_code]} #{"\u{22}"}#{code[:yj_display]}#{"\u{22}"}" }.join("\n")}
  FSH

  File.open("./input/fsh/terminologies/JP_MedicationCodeYJ_CS.fsh", "w", :encoding => "utf-8") do |f|
    f << content
  end

  puts "[created] yj_code: #{codes.count}"
end

def create
  File.open(@source_file, "r", encoding: "CP932:UTF-8", invalid: :replace, undef: :replace, replace: '?') do |f|
    csv = CSV.new(f, headers: true)

    codes = csv.map{ |c| 
              { 
                hot_code: c["基準番号（ＨＯＴコード）"],
                hot_display: "#{c["告示名称"]}　#{c["規格単位"]}（#{c["販売会社"]}）",
                yj_code: c["個別医薬品コード"],
                yj_display: c["レセプト電算処理システム医薬品名"]
              }
            }

    # HOT9コード
    filtered = codes
                 .group_by{ |code| code[:hot_code] }
                 .map{ |_, codes| codes.first }

    create_hot9 filtered

    # YJコード
    filtered = codes
                 .select{ |code| !code[:yj_code].nil? }
                 .group_by{ |code| code[:yj_code] }
                 .map{ |_, codes| codes.first }

    create_yj filtered
  end
end

begin
  args = {}
  parser = OptionParser.new
  parser.on('-f file', '--file') {|v| args[:f] = v} # マスターファイル
  parser.parse!(ARGV)

  dir = Pathname.new(File.dirname(File.expand_path(__FILE__)))
  @source_file = Dir.glob("#{dir}/#{args[:f] || "MEDIS????????_HOT9.TXT"}").sort.last
  raise IOError.new("File is not found") if @source_file.nil?

  create
rescue => e
  puts e.class
  puts e.message
  puts e.backtrace
end
