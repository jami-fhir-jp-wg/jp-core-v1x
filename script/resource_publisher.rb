require "json"
require 'fileutils'
def srcDir = "./fsh-generated/resources/"
def destDir = "./fsh-generated-renamed/resources/"
def canonical = 'http://jpfhir.jp/fhir/core/'

#Url取得
def getUrl(fl)
  File.open(fl) do |f|
    hash = JSON.load(f)
    return hash["url"].to_s 
  end
end

# フォルダ作成しコピー
def copyFile(src,dest)

  parent = File::dirname(dest)
  if(!Dir.exists?(parent)) then
    FileUtils.mkdir_p(parent)
  end

  p "copy:" + src.to_s + " -> " + dest
  FileUtils.cp(src.to_s, dest)
end

#ファイルコピー処理
def copyResource(fl)
  url = getUrl(fl) 
  dest = destDir + url.sub!(canonical,"") + ".json"
  copyFile(fl, dest)
end

#--- URL抽出処理 ---
def copyResources(prefix, extension = false)
    p "search dir: " + srcDir + prefix + "-*.json"
    files = Dir.glob(srcDir + prefix + "-*.json")

    for fl in files
      copyResource(fl)
    end
end

begin
  #削除
    p "delete dir: " + destDir
  if Dir.exists?(destDir) then
    FileUtils.rm_r(destDir)
  end
  copyResources("ImplementationGuide")
  copyResources("StructureDefinition")
  copyResources("CapabilityStatement")
  copyResources("SearchParameter")
  #todo valueSet,codeSystemは名前空間が修正待ち
  
end
