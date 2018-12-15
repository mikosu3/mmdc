# MMDクレジット  
MikuMikuDanceで利用したモデルやアクセサリ情報をまとめるサービスです。  
<http://mmdc.tiger-star.net/>にて運用中。

## 環境
* Ruby 2.5
* Ruby on Rails 5.1
* MySQL 5.5

## 機能
* MikuMikuEffectが保存したemmファイルからモデル、アクセ情報を取り出してDBへ保存する
* モデル、アクセの作者、配布先情報をユーザーが登録する
* 解る範囲で作者、配布先情報を埋めた使用モデル一覧表をダウンロードできるようにする

## 除外ファイル
* 下記設定ファイルはコミットされていません。各々でご用意ください。
    * config/database.yml
    * config/secrets.yml
