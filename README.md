# 残業時間計算ツール

## 概要
このツールは（時刻　休憩時間　残業時間）を返すツールです。  
時間は１５分区切りで、切り捨てされます。(例：0:10 → 0:00)

## 使い方
1. 下記コマンドを実行し、アプリをCF上にpushする
```
$ cf push
```

## API
| endpoint | query | 時刻 |
|:---:|:---:|:---:|
| / |なし|現時刻|
| / |add|現時刻からadd分後|
| /next |なし|現時刻から15分後|