# Hands-on Elm Project

このプロジェクトは、Elmプログラミング言語を学ぶためのハンズオンガイドです。

## プロジェクトの概要

このリポジトリには、Elmの基本的な概念と実践的な例を通じて、Elmの使い方を学ぶための資料が含まれています。

## セットアップ手順

1. [Elmの公式サイト](https://elm-lang.org/)からElmをインストールします。
2. このリポジトリをクローンします:
    ```sh
    git clone https://github.com/timeless-residents/handson-elm.git
    ```
3. プロジェクトディレクトリに移動します:
    ```sh
    cd handson-elm
    ```
4. 依存関係は自動的に処理されます。

## 使用方法

1. 開発サーバーを起動します:
    ```sh
    elm reactor
    ```
2. ブラウザで[http://localhost:8000](http://localhost:8000)にアクセスします。
3. `src/Main.elm`ファイルを編集して、Elmのコードを試してみてください。

## ディレクトリ構造

```
handson-elm/
├── src/
│   ├── Main.elm
│   └── ...
├── tests/
│   └── ...
└── README.md
```

## デプロイ手順

GitHub Pagesにデプロイするには、以下の手順に従ってください。

1. リポジトリのSettingsに移動し、PagesセクションでGitHub Pagesを有効にします。
2. `.github/workflows/deploy.yml`ファイルを作成し、以下の内容を追加します:
    ```yaml
    name: Deploy to GitHub Pages

    on:
      push:
        branches:
          - main

    jobs:
      build:
        runs-on: ubuntu-latest
        permissions:
          contents: write

        steps:
          - name: Checkout repository
            uses: actions/checkout@v2

          - name: Setup Node.js
            uses: actions/setup-node@v2
            with:
              node-version: "14"

          - name: Install Elm
            run: npm install -g elm

          - name: Create dist directory
            run: mkdir -p dist

          - name: Build project
            run: elm make src/Main.elm --optimize --output=dist/elm.js

          - name: Copy public files to dist
            run: |
              if [ -d "public" ]; then
                cp -r public/* dist/
              else
                echo "Public directory not found. Please create a public directory with index.html"
                exit 1

          - name: Deploy to GitHub Pages
            uses: peaceiris/actions-gh-pages@v3
            with:
              github_token: ${{ secrets.GITHUB_TOKEN }}
              publish_dir: ./dist
    ```

## 参考資料

- [Elm公式ドキュメント](https://guide.elm-lang.org/)
- [Elm入門ガイド](https://elm-lang.org/docs)

## ライセンス

このプロジェクトはMITライセンスの下で公開されています。詳細は[LICENSE](LICENSE)ファイルを参照してください。
