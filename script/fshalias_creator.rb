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
linkpage = "./input/fsh/aliases-jpcore.fsh"
# リンク先頭部分

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
def putComment(value, fw, extension = false)
  
  postfix = getAddtionalComment(value, extension)
  p value + postfix
  fw.puts format("\n// %<value>s%<postfix>s", value: value, postfix: postfix)
end

#--- エイリアス情報出力 ---
def putAlias(name, uri, fw)
  fw.puts format("Alias: $%<name>s = %<url>s", name: name, url: uri)
end

#--- 種別指定書き込み処理 ---
def putAliases(prefix, fw, extension = false)
  putComment(prefix, fw, extension)
  files = Dir.glob(prefix + "-*.json").sort
  for fl in files
    File.open(fl) do |f|
      hash = JSON.load(f)
      if (hash["type"] == "Extension") != extension then
        break
      end
      putAlias(hash["name"].to_s, hash["url"].to_s, fw)
    end
  end
end

# -------------------------------------------------------
# メイン処理（エントリポイント）
# -------------------------------------------------------
File.open(linkpage,"w") do |fw|
  Dir.chdir(genenareted)  #カレントディレクトリの移動

  putAliases("ImplementationGuide", fw)
  putAliases("StructureDefinition", fw)
  putAliases("StructureDefinition", fw, true)
  putAliases("CapabilityStatement", fw)
  putAliases("SearchParameter", fw)
  putAliases("CodeSystem", fw)
  putAliases("ValueSet", fw)

end 
