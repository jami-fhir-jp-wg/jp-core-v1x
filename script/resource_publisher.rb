# =======================================================
# Resourceファイルアップロード準備作業スクリプト
# outputにjsonが展開される後に実行すること(※対象はfsh_generatedフォルダではない)
# =======================================================
require "json"
require 'fileutils'

# -------------------------------------------------------
# 定義情報
# -------------------------------------------------------
# コピー元フォルダ
def srcDir = "./output/"
#def srcDir = "./fsh-generated/resources/"  #jsonファイルはoutputを正とする。
# 書き込み先フォルダ
def destDir = "./fsh-generated-renamed/"
# cannonical site定義
def canonicalBase = 'http://jpfhir.jp/fhir/'

#ファイルコピー（フォルダチェック付）
def copyFile(src, dest)
  parent = File::dirname(dest)
  if(!Dir.exists?(parent)) then
    p "create dir:" + parent
    FileUtils.mkdir_p(parent)
  end

  p "copy: " + src + " -> " + dest
  FileUtils.cp(src, dest)
end

#Resourceファイルを解析し定義URLを取得
def getUrl(fl)
  File.open(fl) do |f|
    hash = JSON.load(f)
    return hash["url"].to_s 
  end
end

#ファイルコピー処理
def copyResource(fl)
  url = getUrl(fl) 
  dest = destDir + url.sub(canonicalBase,"") + ".json"
  copyFile(fl.to_s, dest)
end

#ファイル検索対象を指定してコピー
def copyResources(prefix)
    searchPatturn =  srcDir + prefix + "-*.json"
    p "search dir: " + searchPatturn
    files = Dir.glob(searchPatturn)

    for fl in files
      copyResource(fl)
    end
end

# -------------------------------------------------------
# メイン処理（エントリポイント）
# -------------------------------------------------------
p "出力先フォルダクリア（削除）"
  p "delete dir: " + destDir
if Dir.exists?(destDir) then
  FileUtils.rm_r(destDir)
end

p "コピー処理開始"
copyResources("ImplementationGuide")
copyResources("StructureDefinition")
copyResources("CapabilityStatement")
copyResources("SearchParameter")
copyResources("CodeSystem")
copyResources("ValueSet")
p "コピー処理終了"

