require "json"
genenareted = "./fsh-generated/resources/"
work = "./temp/scriptwork/"
linkpage= work + "specialurls.txt"

#--- URL抽出処理 ---
def putUrl(prefix, fw, extension = false)
    files = Dir.glob(prefix + "-*.json")
    for fl in files
        File.open(fl) do |f|
            h = JSON.load(f)
            if (h["type"] == "Extension") == extension then
              fw.puts "    - " + h["url"].to_s
            end
        end
    end
end

begin
  if !Dir.exists?(work) then
    Dir.mkdir(work)
  end
  File.open(linkpage,"w") do |fw|
    Dir.chdir(genenareted)
    #プロパティ名追加
    fw.puts  "  special-url:"
    #URL出力
    putUrl("StructureDefinition", fw)
    putUrl("StructureDefinition", fw, true)
    putUrl("CapabilityStatement", fw)
    putUrl("SearchParameter", fw)
  end 
end
