# =======================================================
# sushi-config.yaml　special url　生成スクリプト
# 処理概要：
# cannonical urlの命名規則の警告を避けるため、リソースファイル
# url情報を抽出し、sushi-config.yamlを書き換える処理を行なう。
# =======================================================
require "json"
# リソース格納フォルダ
genenareted = "./fsh-generated/resources/"
# sushi-configパス
sushiconfigPath="sushi-config.yaml"

#--- URL抽出処理 ---
def fillUrl(prefix, urls, extension = false)
  files = Dir.glob(prefix + "-*.json").sort
  for fl in files
      File.open(fl) do |f|
          h = JSON.load(f)
          if (h["type"] == "Extension") == extension then
            urls << "    - " + h["url"].to_s
          end
      end
  end
end

# configの読み込み
def getConfingText(path)
  File.open(path, 'r') do |fr|
    return fr.read()
  end
end

# configの書き込み
def setConfigText(path, text)
  File.open(path, 'w') do |fw|
    fw.write(text)
  end
end

# -------------------------------------------------------
# メイン処理（エントリポイント）
# -------------------------------------------------------
sb = "  special-url:\n"

Dir.chdir(genenareted)  #カレントディレクトリ移動(fshgenerated/resouces)

urls= []

p 'url情報取得'
fillUrl("StructureDefinition", urls)
fillUrl("StructureDefinition", urls, true)
fillUrl("CapabilityStatement", urls)
fillUrl("SearchParameter", urls)
fillUrl("CodeSystem", urls)
fillUrl("ValueSet", urls)

sb << urls.sort_by{ |s| [s.downcase, s] }.join("\n")

Dir.chdir('../..')  ##カレントディレクトリ移動(project配下)

p 'sushi-configの取得'
allText = getConfingText(sushiconfigPath)

p '正規表現による置換'
regex = /\s{2}special-url:\n(\s{4}-\s(http|urn:).*\n)*/
allText.gsub!(regex, sb)

p 'sushi-configによる書き込み'
setConfigText(sushiconfigPath, allText)
