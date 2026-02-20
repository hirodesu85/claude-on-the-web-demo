# claude-on-the-web-demo

Claude Code on the Web を活用するためのデモ・テンプレートリポジトリです。

## このプロジェクトで実現したいこと

このリポジトリは、**Claude Code on the Web** をすぐに使い始めるためのスターターテンプレートとして機能することを目的としています。

### 主な目標

1. **Claude Code on the Web のセットアップ方法を示す**
   - ブラウザ上で Claude Code を使用する際に必要な設定を整備する
   - SessionStart フックを使って、セッション開始時に環境を自動準備する

2. **再現性のある開発環境を提供する**
   - どのセッションでも同じ環境が立ち上がるよう、起動フックで環境構築を自動化する
   - テスト・リンターなどのツールがすぐに使える状態にする

3. **Claude Code on the Web のベストプラクティスを示す**
   - `.claude/hooks/session-start.sh` による依存関係インストールの自動化
   - `.claude/settings.json` によるフックの登録方法

## プロジェクト構成

```
.
├── README.md
└── .claude/
    ├── settings.json          # Claude Code の設定ファイル
    └── hooks/
        └── session-start.sh   # セッション開始時に実行されるフック
```

## セットアップ

このリポジトリを Claude Code on the Web で使用する場合、SessionStart フックが自動的に実行され、環境が準備されます。

### SessionStart フック

`.claude/hooks/session-start.sh` は、Claude Code on the Web のセッション開始時に自動実行されます。
フックは `CLAUDE_CODE_REMOTE=true` の環境でのみ動作します（ローカル環境では何もしません）。

## 使い方

1. このリポジトリをフォークまたはクローンする
2. `.claude/hooks/session-start.sh` にプロジェクト固有の依存関係インストールコマンドを追記する
3. Claude Code on the Web でリポジトリを開くと、フックが自動的に実行される

## 関連リンク

- [Claude Code ドキュメント](https://docs.anthropic.com/claude-code)
- [Claude Code on the Web について](https://claude.ai/code)
