# コントリビューションガイド / Contributing

本リポジトリ（HL7 FHIR JP Core 実装ガイド）への貢献に関心をお寄せいただきありがとうございます。本プロジェクトは一般社団法人日本医療情報学会 FHIR 国内実装基盤研究会（JAMI）を主体とする共同著作物です。

## ライセンスと貢献の前提

- 本リポジトリの成果物は **[CC0 1.0 Universal](./LICENSE)** で提供されます（第三者用語の取り扱いは [NOTICE.md](./NOTICE.md) を参照）。
- 貢献していただいた内容は、**CC0 1.0 のもとで提供されること**に同意したものとみなします。
- 第三者が権利を有するコード体系・用語を追加する場合は、その出典・権利者・利用条件を明記し（各リソースの `^copyright`）、[NOTICE.md](./NOTICE.md) に追記してください。

## 開発者証明（DCO: Developer Certificate of Origin）

本プロジェクトでは、コントリビューターライセンス契約（CLA）の代わりに **DCO** を採用します。これは [Developer Certificate of Origin 1.1](https://developercertificate.org/) への同意を、各コミットの署名（sign-off）によって表明する軽量な仕組みです。

### やること

すべてのコミットに `Signed-off-by` 行を付与してください。

```bash
git commit -s -m "コミットメッセージ"
```

`-s` を付けると、`git config user.name` / `user.email` を用いて次の行が自動付与されます。

```
Signed-off-by: Your Name <your.email@example.com>
```

- 署名の氏名・メールアドレスは、実在の本人のものを使用してください。
- 既存コミットに付け忘れた場合は `git commit --amend -s`（直近）または `git rebase --signoff <base>`（複数）で付与できます。
- Pull Request 内のすべてのコミットに署名が必要です（CI で確認されます）。

### DCO 1.1 の要旨

コミットに sign-off することで、あなたは以下を証明します。

1. その貢献はあなた自身が作成し、本プロジェクトのライセンス（CC0）で提出する権利を持つ、または
2. その貢献は適切なオープンソースライセンスに基づく既存著作物に由来し、あなたがその権利を持って提出できる、または
3. その貢献は (1)(2) を満たす他者から提供されあなたが改変していない、こと。
4. また、この貢献（および sign-off の個人情報）が公開・再配布されることを理解しています。

全文は <https://developercertificate.org/> を参照してください。

## Pull Request の流れ

1. `develop` から作業ブランチを作成する。
2. 変更を加え、**`git commit -s`** で署名付きコミットを作成する。
3. 必要に応じて `sushi` でビルドが通ることを確認する。
4. `develop` に向けて Pull Request を作成する（[PR テンプレート](./.github/PULL_REQUEST_TEMPLATE.md)のチェック項目を確認）。

ご質問・ご相談は Issue にてお願いします。
