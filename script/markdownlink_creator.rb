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
<!-- 本ファイル修正不可。-->
<!-- リソース追加・変更はruby script/markdownlink_creator.mdを実行にて反映される -->
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

def getAddtionalComment(value, extension)
  if(value != "StructureDefinition") then
    return ""
  end

  if(extension) then
    return ": Extension"
  else
    return ": Profile, DataType"
  end
end
#--- コメント出力関数 ---
def putMarkdownComment(value, fw, extension = false)
  
  postfix = getAddtionalComment(value, extension)
  p value + postfix
  fw.puts format("\n<!-- %<value>s%<postfix>s -->", value: value, postfix: postfix)
end

#--- エイリアス情報出力 ---
def putAlias(name, uri, fw)
  fw.puts format("[%<name>s]: %<url>s", name: name, url: uri)
end

#--- 種別指定書き込み処理 ---
def putMarkdownLink(prefix, fw, extension = false)
  putMarkdownComment(prefix, fw, extension)
  files = Dir.glob(prefix + "-*.json").sort
  for fl in files
    File.open(fl) do |f|
      hash = JSON.load(f)
      if (hash["type"] == "Extension") != extension then
        break
      end
      putAlias(hash["name"].to_s, fl.gsub(/.json/, '.html'), fw)
    end
  end
end

# -------------------------------------------------------
# メイン処理（エントリポイント）
# -------------------------------------------------------
File.open(linkpage,"w") do |fw|
  Dir.chdir(genenareted)  #カレントディレクトリの移動
  
  fw.puts header
  putMarkdownLink("ImplementationGuide", fw)
  putMarkdownLink("StructureDefinition", fw)
  putMarkdownLink("StructureDefinition", fw, true)
  putMarkdownLink("CapabilityStatement", fw)
  putMarkdownLink("SearchParameter", fw)
  putMarkdownLink("CodeSystem", fw)
  putMarkdownLink("ValueSet", fw)

end 
