# Claude on the Web Demo

**スマホだけでiOSアプリ開発を完結させる**ことを目指したデモプロジェクトです。

## コンセプト

MacもPCも使わず、**iPhoneだけ**でiOSアプリの開発・ビルド・動作確認まで完結させます。

```
iPhone
  └── Claude Code on the Web
        └── コードを書く / 修正する
              └── CI/CD (GitHub Actions)
                    └── ビルド → TestFlight
                          └── 同じ iPhone でアプリを確認
```

## ゴール

- [ ] Claude Code on the Web からコードを編集できる
- [ ] push をトリガーに GitHub Actions が自動ビルドする
- [ ] TestFlight 経由でスマホに自動配信される
- [ ] 上記がすべてスマホ上で完結する

## 開発セットアップ（Mac が必要なのは初回のみ）

### 依存ツール

```sh
brew install xcodegen
```

### プロジェクト生成

```sh
xcodegen generate
open ClaudeOnTheWebDemo.xcodeproj
```

## プロジェクト構成

```
.
├── project.yml                # XcodeGen 設定（これだけ管理）
├── ClaudeOnTheWebDemo/
│   ├── ClaudeOnTheWebDemoApp.swift
│   ├── ContentView.swift
│   └── Info.plist
└── .github/
    └── workflows/             # CI/CD パイプライン（予定）
```

## 技術スタック

- **言語**: Swift / SwiftUI
- **プロジェクト管理**: XcodeGen
- **CI/CD**: GitHub Actions（予定）
- **配信**: TestFlight（予定）
