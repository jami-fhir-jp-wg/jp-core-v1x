# 入力ファイルの各行を読み込み、文字列"simplifier"が含まれる行について次のようなURL変換処理をする。
# https://simplifier.net/resolve?scope=jp-core.r4@1.1.1-snap&amp;canonical=http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_Common
#    ↓
# https://jpfhir.jp/fhir/core/1.1.1/StructureDefinition-jp-observation-common.html
# その後、その行を出力する。
# また、文字列"simpifier"ではじまる上のポターンが含まれない行については、そのまま出力する。
# なお、入力ファイルは、コマンドライン引数で指定する。
# 例：python test2.py input.html

import re
import sys

with open(sys.argv[1], "r") as f:
    for line in f:
#        sys.stderr.write(line)
# 次のようなパターンを見つけて、canonical= 値の部分だけに置き換える：https://simplifier.net/resolve?canonical=http%3A%2F%2Fjpfhir.jp%2Ffhir%2Fcore%2FValueSet%2FJP_MedicationSubstitutionNotAllowedReason_VS&scope=jpfhir-terminology@1.1.1
        if "https://simplifier.net/resolve?" in line:
            m1 = re.finditer('https:\/\/simplifier\.net\/resolve\?scope=(.*?)&amp;canonical=',line)
            m2 = re.finditer('https:\/\/simplifier\.net\/resolve\?canonical=(.*?)&amp;scope=(.*?)"',line)
            m11 = re.finditer('https:\/\/simplifier\.net\/resolve\?scope=(.*?)&amp;amp;canonical=',line)
            m12 = re.finditer('https:\/\/simplifier\.net\/resolve\?canonical=(.*?)&amp;amp;scope=(.*?)"',line)
            if m1 :
                for mm in m1:
                    scope = mm.group(1)
                    line = line.replace('https://simplifier.net/resolve?scope='+scope+'&amp;canonical=','', 1)
            elif m2 :
                for mm in m2:
                    canonical = mm.group(1)
                    scope = mm.group(2)
                    line = line.replace('https://simplifier.net/resolve?canonical='+canonical+'&amp;scope='+scope,canonical, 1)
            if m11 :
                for mm in m11:
                    scope = mm.group(1)
                    line = line.replace('https://simplifier.net/resolve?scope='+scope+'&amp;amp;canonical=','', 1)
            elif m12 :
                for mm in m12:
                    canonical = mm.group(1)
                    scope = mm.group(2)
                    line = line.replace('https://simplifier.net/resolve?scope='+canonical+'&amp;amp;scope=','', 1)
            else:
                print(line, end="")
                continue
            print(line, end="")
        else:
            print(line, end="")
