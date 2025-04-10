# =======================================================
# リソース情報一覧(CSV)作成スクリプト
# 目的：
# id,name,url等の記載を比較ため
# 処理概要：
# fshgeneretedに出力されたリソースファイルを解析し、
# 対象項目をピックアップして、tempフォルダに一覧を出力する。
# =======================================================
require "json"

#--- 種別指定書き込み処理 ---
def putRecord(prefix, fw, extension = false)
    files = Dir.glob(prefix + "-*.json")
    for fl in files.sort_by{ |s| [s.downcase, s] }
        File.open(fl) do |f|
            h = JSON.load(f)
            if (h["type"] == "Extension") == extension then
              fw.puts  fl + "," + h["resourceType"].to_s + "," + h["type"].to_s + "," + h["id"].to_s + "," + h["name"].to_s + "," + h["title"].to_s + "," + h["url"].to_s
              #fw.puts h["name"].to_s + "," + h["title"].to_s + "," + h["url"].to_s
            end
        end
    end
end

def putResourceSet(dir, output, work)
  if !Dir.exist?(work) then
    p "mkdir:" + work
    Dir.mkdir(work)
  end

  File.open(output,"w") do |fw|
    p output

    fw.puts  "path,resourceType,type,id,name,title,url"
    
    curentDir = Dir.getwd;
    p curentDir
    Dir.chdir(dir)     
    p dir
    putRecord("ImplementationGuide", fw)
    putRecord("StructureDefinition", fw)
    putRecord("StructureDefinition", fw, true)
    putRecord("CapabilityStatement", fw)
    putRecord("SearchParameter", fw)
    putRecord("CodeSystem", fw)
    putRecord("ValueSet", fw)
    Dir.chdir(curentDir);
  end

end
# -------------------------------------------------------
# メイン処理（エントリポイント）
# -------------------------------------------------------
work = "./temp/scriptwork/"

target1 = Dir.home.to_s + "/.fhir/packages/jpfhir-terminology.r4#1.3.0/package"
file1 = "resource_info_terminlogy.csv"

target2 = "./fsh-generated/resources/"
file2 = "resource_info_jpcore.csv"

putResourceSet(target1, work + file1, work)
putResourceSet(target2, work + file2, work)
