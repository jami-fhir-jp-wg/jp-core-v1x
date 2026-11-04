#!/usr/bin/env bash
set -Eeuo pipefail

# スクリプトの配置ディレクトリ
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
OUTPUT_DIR="$PROJECT_DIR/output"

cd "$SCRIPT_DIR"

START_TIME=$SECONDS

echo "=== 1. Build script started ==="

# 終了時に総所要時間を表示
show_elapsed() {
    local status=$?
    local elapsed=$((SECONDS - START_TIME))

    printf '\n==================================\n'
    printf 'Total elapsed time: %02d:%02d:%02d\n' \
        $((elapsed / 3600)) \
        $(((elapsed % 3600) / 60)) \
        $((elapsed % 60))
    printf '==================================\n'

    if [ "$status" -ne 0 ]; then
        echo "Build failed (exit code: $status)"
    fi
}
trap show_elapsed EXIT

echo "=== 2. Docker build ==="
docker compose build ig_compiler

mkdir -p "$OUTPUT_DIR"

echo "=== 3. Docker run ==="

# コンテナ内で実行する処理
read -r -d '' COMMAND <<'EOF' || true
set -e

echo "=== 4. Sync source ==="
rsync -rlt --delete \
    --omit-dir-times \
    --no-perms --no-owner --no-group \
    --exclude='/.git/' \
    --exclude='/output/' \
    --exclude='/temp/' \
    --exclude='/input-cache/' \
    --exclude='/fsh-generated/' \
    --exclude='/node_modules/' \
    /source/ /repository/

echo "=== 5. Run IG Publisher ==="
bash /bin/entrypoint.sh

echo "=== 6. Copy output ==="
mkdir -p /destination
cp -a /repository/output/. /destination/

echo "=== 7. Build completed ==="
EOF


# コンテナを1回だけ作成
# Git Bashによるパス自動変換を無効化
MSYS_NO_PATHCONV=1 MSYS2_ARG_CONV_EXCL='*' \
docker compose run --rm --no-deps \
    --entrypoint /bin/bash \
    -v "$PROJECT_DIR:/source:ro" \
    -v "$OUTPUT_DIR:/destination" \
    ig_compiler -c "$COMMAND"

echo "=== 8. IG Publisher build completed ==="
