# =======================================================
# Markdown Link作成スクリプト
# 処理概要：
# fsh-generatedフォルダに作成されたリソースファイル(JSON)
# を解析し、input/includes/markdown-link-references.md
# にエイリアスに利用できるLink情報を書き込みます。
# リソースのNameとURL情報を取得します。
# =======================================================

require "json"

# -------------------------------------------------------
# 定義情報
# -------------------------------------------------------
# リソースファイル格納フォルダ
genenareted = "./fsh-generated/resources/"
# 書き込み先リンクファイル
linkpage = "./input/includes/markdown-link-references.md"
# リンク先頭部分
header = <<-EOS
<!-- Temporary changes to fix formatting for changelog -->
<style>
  ul.new-content {
    padding-left: 25px !important;
  }
</style>
<!-- ページ内リンク指定 -->
[JP_Observation_Common_interaction]: StructureDefinition-jp-observation-common.html#インタラクション一覧
[JP_Observation_Common_Search]: StructureDefinition-jp-observation-common.html#search-parameter一覧
[JP_Observation_Common_Operation]: StructureDefinition-jp-observation-common.html#operation一覧
[JP_DiagnosticReport_Common_interaction]: StructureDefinition-jp-diagnosticreport-common.html#interaction一覧
EOS

#--- 種別指定書き込み処理 ---
def putMarkdownLink(prefix, fw, extension = false)
    files = Dir.glob(prefix + "-*.json")
    for fl in files
        File.open(fl) do |f|
            hash = JSON.load(f)
            if (hash["type"] == "Extension") == extension then
              fw.puts "[" + hash["name"] +"]: " + fl.gsub(/.json/, '.html') 
            end
        end
    end
end

# -------------------------------------------------------
# メイン処理（エントリポイント）
# -------------------------------------------------------
File.open(linkpage,"w") do |fw|
  fw.puts header
  Dir.chdir(genenareted)
  
  fw.puts "\n<!-- ImplementationGuide -->" 
  putMarkdownLink("ImplementationGuide", fw)
  fw.puts "\n<!-- StructureDefinition: Profile, DataType -->" 
  putMarkdownLink("StructureDefinition", fw)
  fw.puts "\n<!-- StructureDefinition: Extension -->" 
  putMarkdownLink("StructureDefinition", fw, true)

  fw.puts "\n<!-- CapabilityStatement -->" 
  putMarkdownLink("CapabilityStatement", fw)
  fw.puts "\n<!-- SearchParameter -->" 
  putMarkdownLink("SearchParameter", fw)

  fw.puts "\n<!-- CodeSystem -->" 
  putMarkdownLink("CodeSystem", fw)
  fw.puts "\n<!-- ValueSet -->" 
  putMarkdownLink("ValueSet", fw)
end 
