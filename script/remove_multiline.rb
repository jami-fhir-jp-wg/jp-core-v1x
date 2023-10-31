# =======================================================
# outputフォルダにあるhtmlファイルの改行を調整
# =======================================================
require 'fileutils'
# リソース格納フォルダ
target = "./output"


# configの読み込み
def read(path)
  File.open(path, 'r') do |fr|
    return fr.read()
  end
end

# configの書き込み
def write(path, text)
  File.open(path, 'w') do |fw|
    fw.write(text)
  end
end

#ファイルコピー（フォルダチェック付）
def replace(fl)
 p 'replace : ' + fl
 text = read(fl)
 text.gsub!(/\n\n/,"\n")
 write(fl,text)
end

# -------------------------------------------------------
# メイン処理（エントリポイント）
# -------------------------------------------------------

p '対象ディレクトリ : ' + target
Dir.chdir(target)  #カレントディレクトリ移動(fshgenerated/resouces)

files = Dir.glob("*.html")

for fl in files
  replace(fl)
end
