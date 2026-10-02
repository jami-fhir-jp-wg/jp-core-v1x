# Claude Code 向けビルド手順

IG のビルドは、ルートの CLAUDE.md に記載の `bash _genonce.sh` をホスト上で直接実行せず、`docker/` ディレクトリで Docker Compose を用いて実行すること。

```bash
cd docker
docker compose up
```

- コンテナ内で `_updatePublisher.sh` と `_genonce.sh` が実行され、リポジトリ（`../`）が `/repository` にマウントされる（`docker/entrypoint.sh` 参照）
- コンテナは root で実行されるため、`fsh-generated/`、`output/`、`temp/`、`template/`、`input-cache/` は root 所有となる。ホスト上で `sushi` や `_genonce.sh` を実行すると書き込み権限エラーになるため、ビルド・検証は上記の Docker Compose で行う
- ビルドは時間がかかるため、ユーザーから指示がある場合にのみ実行する
