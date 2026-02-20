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

---

## 進め方（検証ロードマップ）

検証を段階的に進めるため、以下の4フェーズで実施します。

### Phase 1: iOSアプリプロジェクトの作成

**目的**: Claude Code on the Web で Swift コードを実際に書けるかを確認する

- [ ] SwiftUI ベースの最小構成 iOS アプリを作成（Hello World レベル）
- [ ] `*.xcodeproj` を含むプロジェクト構成をリポジトリに追加
- [ ] `.gitignore` に Xcode 向けの除外設定を追加

> **注意**: Xcode プロジェクトファイルは Claude Code on the Web で直接生成する。ローカル Mac は使用しない。

### Phase 2: GitHub Actions ビルド環境の構築

**目的**: macOS ランナーで iOS アプリをビルドできるかを確認する

- [ ] `.github/workflows/build.yml` を作成（`macos-latest` ランナー使用）
- [ ] `xcodebuild` コマンドでビルドが通ることを確認
- [ ] ビルド成功・失敗のログを記録

### Phase 3: 署名 & TestFlight 配布の設定

**目的**: スマホのみで配布パイプラインを完結できるかを確認する

- [ ] App Store Connect で App ID・証明書・プロビジョニングプロファイルを取得（初回のみ Mac が必要な可能性あり）
- [ ] GitHub Secrets に署名に必要な情報（証明書・プロファイル・API キー）を登録
- [ ] GitHub Actions で署名・アーカイブ・TestFlight へのアップロードを自動化
  - ツール候補: `fastlane` または `xcrun altool` / `xcrun notarytool`

### Phase 4: 動作確認 & 結果まとめ

**目的**: 一連のサイクルをスマホだけで回せるかを最終確認する

- [ ] TestFlight からスマホにインストールして動作確認
- [ ] コード修正 → Push → ビルド → TestFlight 反映 → 確認 のサイクルをスマホのみで1周する
- [ ] 結果（成功・失敗・課題）を README に追記する

### 検証の判断基準

| 項目 | 合格条件 |
|------|---------|
| コーディング | Claude Code on the Web で Swift コードを問題なく編集できる |
| ビルド | GitHub Actions でエラーなくビルドが完了する |
| 配布 | TestFlight にアップロードされ、スマホでインストールできる |
| サイクル完結 | 上記すべてをスマホ操作のみで1回完遂できる |
