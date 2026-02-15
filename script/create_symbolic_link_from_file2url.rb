# =======================================================
# sushi-config.yaml　special url　生成スクリプト
# 処理概要：
# cannonical urlの命名規則の警告を避けるため、リソースファイル
# url情報を抽出し、sushi-config.yamlを書き換える処理を行なう。
# =======================================================
require "json"
require "uri"

# リソース格納フォルダ
genenareted = "./fsh-generated/resources/"
# sushi-configパス
maptablePath="makeSymbolicLink.bash"

#--- URL抽出処理 ---
def fillUrl(prefix, sb, extension = false)
  files = Dir.glob(prefix + "-*.json").sort
  for fl in files
      File.open(fl) do |f|
          h = JSON.load(f)
          if (h["type"] == "Extension") == extension then
            url = h["url"].to_s
            if url.start_with?("urn:") == false then                    
                pathfilebase = File.basename(URI.parse(fl).path,".json")
                pathdir1 = File.dirname(URI.parse(url).path,level=1)  #最後のファイル名を除く手前までのパス
                pathdir2 = File.dirname(URI.parse(url).path,level=2)  #最後のファイル名と直前のを除く手前までのパス
                pathdir2filebase = File.basename(pathdir2)  #最後のファイル名と直前のを除く手前までのパスの最後のフォルダ名
                pathdir1filebase = File.basename(pathdir1)  #最後のファイル名を除く手前までのパスの最後のフォルダ名
                p "url="+url+" pathdir1="+pathdir1 + " pathdir2=" + pathdir2 + " pathdir1filebase="+pathdir1filebase+ " pathdir2filebase="+pathdir2filebase
                if pathdir2filebase == "CodeSystem" || pathdir2filebase == "ValueSet" then
                  fileID = pathdir1filebase + "-" + File.basename(URI.parse(url).path)
                else
                  fileID = File.basename(URI.parse(url).path)
                end
                if fileID != "" then
                  urlfilebase = prefix + "-" + fileID
                  if pathfilebase != urlfilebase
                    sb << "ln -s " + pathfilebase + ".json.html " + urlfilebase + ".json.html" + "\n"
                    sb << "ln -s " + pathfilebase + ".html " + urlfilebase + ".html" + "\n"
                    sb << "ln -s " + pathfilebase + ".json " + urlfilebase + ".json" + "\n"
                  end
                end
            end
          end
      end
  end
end

# configの読み込み　使わない
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
sb = "# Canonical URLへのアクセスでファイルにアクセスできるようにシンボリックファイルを貼る\n"

Dir.chdir(genenareted)  #カレントディレクトリ移動(fshgenerated/resouces)

p 'url情報取得'
fillUrl("StructureDefinition", sb)
fillUrl("StructureDefinition", sb, true)
fillUrl("CapabilityStatement", sb)
fillUrl("SearchParameter", sb)
fillUrl("CodeSystem", sb)
fillUrl("ValueSet", sb)

Dir.chdir('../..')  ##カレントディレクトリ移動(project配下)

#p 'sushi-configの取得'
#allText = getConfingText(sushiconfigPath)
allText = sb

#p '正規表現による置換'
#regex = /\s{2}special-url:\n(\s{4}-\s(http|urn:oid:).*\n)*/
#allText.gsub!(regex, sb)

#p 'maptablePathファイルに書き込み'
setConfigText(maptablePath, allText)
