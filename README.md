# WorkDocs-NWchecker

## What is this?
Amazon WorkDocs sync クライアントをある特定のWiFiに接続されている時は、プロセスを停止するスクリプト。PoweShellでコーディング。

このURLで公開：
[http://qiita.com/yo1t/items/bf9d3c3c6baeaaafc681](http://qiita.com/yo1t/items/bf9d3c3c6baeaaafc681)


## インストール方法と使用方法
### Windowsの場合

- workdocs-NWchecker.ps1 を適当なフォルダに置く。


### MacOS Xの場合

- MacOS X El capitan, MacOS Sierraで動作確認済み。
- Mac OS X用のPowerShellをインストール。下記ののリンクから最新の.pkgをダウンロードし、インストールする。
  - [https://github.com/PowerShell/PowerShell/releases/](https://github.com/PowerShell/PowerShell/releases/)
- workdocs-NWchecker.ps1 を適当なフォルダに置く。


## 使用方法（ver. 0.2の場合）

- powershell workdocs-NWchecker.ps1 を実行。（例： powershell workdocs-NWchecker.ps1 -t 30 -ssid yo1-mobile ）
  - -t  [interval(second) ] 指定した秒数でプロセスをチェックする。（3秒から3600秒まで指定可能。）　例： -t 30
  - -ssid [WiFi-SSID ] 指定したWiFi SSIDをチェック対象にする。　　例： -ssid yo1-007

- WorkDocsが管理者権限で起動されている場合は、PowerShellも管理者権限で起動する。
- このスクリプトは、Windows/MacOS両対応です。PowerShellでのOSの識別方法がいまいち不明ではあるが、$Homeに「:」が含まれる場合は（C:などのドライブレターが含まれない場合は）MacOSとして判断しています。


---
Yoichi Takizawa
