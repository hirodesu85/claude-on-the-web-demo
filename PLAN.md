# PLAN.md — claude-on-the-web-demo

## 1. プロジェクト概要

**目的**: スマホ一台でiOSアプリを開発・ビルド・配布できるかを検証する実験的プロジェクト。

**制約**: Mac を使用しない。開発・ビルド・配布のすべてを **スマホ + クラウド** で完結させる。

---

## 2. ワークフロー

```
スマホ（Claude Code on the Web）
  ↓ Swiftコードを編集・Push
GitHub
  ↓ mainブランチへのPushをトリガー
GitHub Actions（macos-15 ランナー）
  ├─ XcodeGen でプロジェクト生成
  ├─ Fastlane Match で証明書・プロファイル取得
  ├─ xcodebuild でリリースビルド
  └─ TestFlight へアップロード
    ↓
スマホで TestFlight から動作確認
```

---

## 3. 技術スタック

| 役割 | ツール |
|------|--------|
| コーディング環境 | Claude Code on the Web |
| 言語 / UI | Swift 5.0 / SwiftUI |
| プロジェクト定義 | XcodeGen（project.yml） |
| CI/CD | GitHub Actions（macos-15） |
| ビルド・署名・配布 | Fastlane（Match + beta lane） |
| 配布先 | TestFlight |

---

## 4. フェーズ別ロードマップ

### Phase 1 ✅ — iOSアプリ初期実装
- SwiftUI Hello World アプリ作成
- XcodeGen で project.yml 定義

### Phase 2 ✅ — CI/CD パイプライン構築
- GitHub Actions ワークフロー（ios-build.yml）
- Fastlane beta レーン（ビルド・署名・アップロード）

### Phase 3 🔄 — 署名 & TestFlight 配布
- Fastlane Match で証明書・プロビジョニングプロファイル管理
- App Store Connect API キー設定
- GitHub Secrets に必要な環境変数を登録

### Phase 4 ⬜ — 動作検証 & 結果まとめ
- TestFlight 経由でスマホに配布・動作確認
- スマホのみで一周できたか結果をまとめる
- 課題・限界点の整理

---

## 5. 必要な GitHub Secrets（Phase 3 完了に必要）

| Secret 名 | 用途 |
|-----------|------|
| `APP_STORE_CONNECT_API_KEY_ID` | App Store Connect API 認証 |
| `APP_STORE_CONNECT_API_ISSUER_ID` | App Store Connect API 認証 |
| `APP_STORE_CONNECT_API_KEY_CONTENT` | App Store Connect API 認証 |
| `MATCH_PASSWORD` | Fastlane Match の暗号化パスワード |
| `MATCH_GIT_BASIC_AUTH` | Match リポジトリへのアクセス認証 |
| `MATCH_GIT_URL` | Match リポジトリの URL |
| `DEVELOPMENT_TEAM` | Apple Developer Team ID |

---

## 6. 課題・制約

- 初期証明書作成には Mac が必要な可能性がある
- ローカル実機デバッグ不可（ビルドはすべて GitHub Actions 経由）
