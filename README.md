# WorkDocs-NWchecker

## What is this?
When it is connected to a particular WiFi, the script to stop the process of Amazon WorkDocs sync client. Coding in PoweShell.
Published in this URL: http://qiita.com/yo1t/items/bf9d3c3c6baeaaafc681

## How to download
[https://github.com/yo1t/WorkDocs-NWchecker/releases](https://github.com/yo1t/WorkDocs-NWchecker/releases)

## How to install
### Windows
1. Manual Setup
  - Put workdocs-NWchecker.ps1 to the appropriate folder.
2. Installer (copy to c:\tools)
  - cd installer\windows
  - setup.bat

### MacOS or MacOS X
1. Manual Setup
  - I checked MacOS X El capitan and MacOS Sierra.
  - At the first, install PowerShell for Mac OS X. Download the latest .pkg from the link of the following.
    - https://github.com/PowerShell/PowerShell/releases/
  - Put workdocs-NWchecker.ps1 to the appropriate folder.

2. Installer (copy to /usr/local/bin/)
  - cd ./installer/MacOS
  - chmod +x install.sh
  - ./install.sh

## How to use (in the case of ver. 0.3)
- Run the powershell workdocs-NWchecker.ps1. (Example: powershell workdocs-NWchecker.ps1 -t 30 -ssid yo1-mobile -interface en1)
  - -t [interval (second)] to check the process specified in the number of seconds. (Can be specified from 3 seconds to 3600 seconds.) Example: -t 30
  - -ssid [WiFi-SSID] specified WiFi SSID to be checked. Example: -ssid yo1-007
  - -interface [ethernet device name] specified USB tethering interface to be checked. Example: -interface 'en1'

- If your WorkDocs is started with administrative privileges, PowerShell also start with administrator privileges.
- If you use installer for MacOS, this install script make excutable script at /usr/local/bin/workdocs-NWChecker.
- This script is suported both Windows and MacOS, one script. Although, I don't have good information of identification method of the OS in the PowerShell. If $Home does not contains ":"(C: If you do not include a drive letter, etc.), determined MacOS. 

---
## What is this?
Amazon WorkDocs sync クライアントをある特定のWiFiに接続されている時は、プロセスを停止するスクリプト。PoweShellでコーディング。

このURLで公開：
[http://qiita.com/yo1t/items/bf9d3c3c6baeaaafc681](http://qiita.com/yo1t/items/bf9d3c3c6baeaaafc681)

## ダウンロード
[https://github.com/yo1t/WorkDocs-NWchecker/releases](https://github.com/yo1t/WorkDocs-NWchecker/releases)

## インストール方法と使用方法
### Windowsの場合
1. マニュアルセットアップ
  - workdocs-NWchecker.ps1 を適当なフォルダに置く。
2. インストーラ
（c:\toolsにコピーします。） 
  - cd installer\windows
  - setup.bat

### MacOS Xの場合
1. マニュアルセットアップ
  - MacOS X El capitan, MacOS Sierraで動作確認済み。
  - Mac OS X用のPowerShellをインストール。下記ののリンクから最新の.pkgをダウンロードし、インストールする。
    - [https://github.com/PowerShell/PowerShell/releases/](https://github.com/PowerShell/PowerShell/releases/)
  - workdocs-NWchecker.ps1 を適当なフォルダに置く。
2. インストーラー
（/usr/local/binにコピーします。）
  - cd ./installer/MacOS
  - chmod +x install.sh
  - ./install.sh


## 使用方法（ver. 0.3の場合）

- powershell workdocs-NWchecker.ps1 を実行。（例： powershell workdocs-NWchecker.ps1 -t 30 -ssid yo1-mobile -interface 'Bluetooth ネットワーク接続' ）
  - -t  [interval(second) ] 指定した秒数でプロセスをチェックする。（3秒から3600秒まで指定可能。）　例： -t 30
  - -ssid [WiFi-SSID ] 指定したWiFi SSIDをチェック対象にする。　　例： -ssid yo1-007
  - -interface [デバイス名] 指定したデバイス名のステータスをチェック対象にする。デバイス名はipconfig(Win), ifconfig(MacOS)で探してください。　例： -interface 'Bluetooth ネットワーク接続' ※シングルクォーテーションで囲む('')

- WorkDocsが管理者権限で起動されている場合は、PowerShellも管理者権限で起動する。
- MacOS用のインストーラでセットアップした場合は、/usr/local/bin/workdocs-NWchecker という名前の実行可能なスクリプトを作成します。
- このスクリプトは、Windows/MacOS両対応です。PowerShellでのOSの識別方法がいまいち不明ではあるが、$Homeに「:」が含まれる場合は（C:などのドライブレターが含まれない場合は）MacOSとして判断しています。


---
Yoichi Takizawa
