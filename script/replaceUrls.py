# 入力ファイルの各行を読み込み、文字列"simplifier"が含まれる行について次のようなURL変換処理をする。
# https://simplifier.net/resolve?scope=jp-core.r4@1.1.1-snap&amp;canonical=http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_Common
#    ↓
# https://jpfhir.jp/fhir/core/1.1.1/StructureDefinition-jp-observation-common.html
# その後、その行を出力する。
# また、文字列"simpifier"ではじまる上のポターンが含まれない行については、そのまま出力する。
# なお、入力ファイルは、コマンドライン引数で指定する。
# 例：python test2.py input.html

#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import re
import sys
from urllib.parse import urlparse, parse_qs, unquote
from html import unescape

# resolveリンクだけを拾う正規表現（http/https 両対応、空白/引用符/< で打ち切る）
_RESOLVE_RE = re.compile(r'https?://simplifier\.net/resolve\?[^"\'>\s]+')

def rewrite_simplifier_links(html):
    def _repl(m):
        url = m.group(0)
        # HTML属性中だと & が &amp; になるので正式にアンエスケープ
        url_for_parse = unescape(url)
        qs = parse_qs(urlparse(url_for_parse).query)
        canonical = qs.get('canonical', [None])[0]
        return unquote(canonical) if canonical else url  # なければ元のURLを返す
    return _RESOLVE_RE.sub(_repl, html)

def main():
    if len(sys.argv) < 2:
        print("Usage: {} input.html".format(sys.argv[0]), file=sys.stderr)
        sys.exit(1)

    input_file = sys.argv[1]
    with open(input_file, encoding="utf-8") as f:
        html = f.read()

    converted_html = rewrite_simplifier_links(html)
    sys.stdout.write(converted_html)

if __name__ == "__main__":
    main()
