# claude-on-the-web-demo

**スマホ一台でiOSアプリを開発できるか？** を検証するリポジトリです。

## 目的

Mac不要・スマホのみでSwift/iOSアプリ開発を完結させるワークフローを構築し、その実現可能性を検証します。

初期設定（Apple Developer登録・証明書作成など）にはMacが必要になる場合がありますが、**それ以降の開発はスマホだけで進める**ことを目指します。

## 想定ワークフロー

```
スマホ（Claude Code on the Web）
  ↓ Swiftコードを書く
GitHub へ Push
  ↓
GitHub Actions（macOS ランナー）
  ↓ Xcode でビルド
TestFlight へ配布
  ↓
同じスマホで動作確認
```

## 使用ツール・サービス

| 用途 | ツール |
|------|--------|
| コーディング | [Claude Code on the Web](https://claude.ai/code) |
| バージョン管理 | GitHub |
| ビルド | GitHub Actions（macOS ランナー） |
| 配布・テスト | TestFlight |

## 検証したいこと

- [ ] Claude Code on the Web でSwiftコードを書けるか
- [ ] GitHub Actions でiOSアプリをビルド・署名できるか
- [ ] TestFlight を通じてスマホに配布できるか
- [ ] 上記のサイクルをスマホだけで回せるか

## 検証用アプリ

ワークフローの検証が目的のため、アプリの内容はシンプルなもの（Hello Worldレベル）で構いません。

## 課題・制限事項

- **初期設定**：Apple Developer証明書・プロビジョニングプロファイルの作成は初回のみMacが必要になる可能性あり
- **Xcode**：ビルドはGitHub Actionsに委ねるため、ローカルでの実機デバッグは不可
