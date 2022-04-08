require "json"
genenareted = "./fsh-generated/resources/"
sushiconfigPath="sushi-config.yaml"

#--- URL抽出処理 ---
def fillUrl(prefix, sb, extension = false)
  files = Dir.glob(prefix + "-*.json")
  for fl in files
      File.open(fl) do |f|
          h = JSON.load(f)
          if (h["type"] == "Extension") == extension then
            sb << "    - " + h["url"].to_s + "\n"
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

#==============================================
# メイン処理（エントリポイント）
#==============================================
begin
  sb = "  special-url:\n"
  
  Dir.chdir(genenareted)  ##fshgenerated/resoucesに移動
  #プロパティ名追加
  
  #URL出力
  fillUrl("StructureDefinition", sb)
  fillUrl("StructureDefinition", sb, true)
  fillUrl("CapabilityStatement", sb)
  fillUrl("SearchParameter", sb)

  Dir.chdir('../..')  ##project配下に戻す
  allText = getConfingText(sushiconfigPath)
  
  regex = /\s{2}special-url:\n(\s{4}-\shttp.*\n)*/
  allText.gsub!(regex, sb)

  setConfigText(sushiconfigPath, allText)
end
