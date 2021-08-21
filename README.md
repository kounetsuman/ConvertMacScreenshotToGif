# Convert Mac screenshot to gif

- Macのスクリーンショット結果を、拡張子毎のフォルダに振り分ける
- Macのスクリーンショット(動画)をgifに変換する

## 仕様

- `tmp # スクリーンショットの結果を保存する`
- `conv # 変換後のスクリーンショット結果`
    - `# 拡張子名のフォルダ`

## 環境

- OS(BigSur v11.5.2)
- bash

## 初期設定

```
# ファイル実行形式変更
chmod 777 screenshot.sh

# スクリーンショット(画像)の保存名プレフィクス変更
defaults write com.apple.screencapture name screenshot

# スクリーンショット(画像)の保存先変更
defaults write com.apple.screencapture location ~/tmp

# 設定反映
killall SystemUIServer

# コマンド設定
echo 'alias sss=~/workspaces/screenshot/screenshot.sh' >> ~/.bashrc
```
