# KifFile

Convert kakinoki kifFile to png format file.

sample input
# ----  柿木将棋Ⅷ V8.01 棋譜ファイル  ----
開始日時：2015/05/05 02:10:58
終了日時：2015/05/05 02:10:58
手合割：平手　　
後手の持駒：飛二　角　金四　桂四　香四　歩十八　
  ９ ８ ７ ６ ５ ４ ３ ２ １
+---------------------------+
| ・ ・ ・v銀v玉v銀 ・ ・ ・|一
| ・ ・ ・ ・ ・ ・ ・ ・ ・|二
| ・ ・ ・ ・ 銀 ・ ・ ・ ・|三
| ・ ・ ・ ・ ・ ・ ・ ・ ・|四
| ・ 角 ・ ・ ・ ・ ・ ・ ・|五
| ・ ・ ・ ・ ・ ・ ・ ・ ・|六
| ・ ・ ・ ・ ・ ・ ・ ・ ・|七
| ・ ・ ・ ・ ・ ・ ・ ・ ・|八
| ・ ・ ・ ・ ・ ・ ・ ・ ・|九
+---------------------------+
先手の持駒：銀　
先手：
後手：
手数----指手---------消費時間--
   1 ５二角成(85) ( 0:00/00:00:00)
   2 同　銀(41)   ( 0:00/00:00:00)
   3 ４二銀打     ( 0:00/00:00:00)
*柿木将棋Ⅷ V8.01(長) 解 0:00
   4 詰み         ( 0:00/00:00:00)
まで3手で詰み

output
![Normal png](https://raw.githubusercontent.com/wiki/pinwheel/kif_file/images/bod.png)
![Tume png](https://raw.githubusercontent.com/wiki/pinwheel/kif_file/images/tume.png)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kif_file'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kif_file

## Usage

```ruby
# 柿木kiffile path
@source = File.join(@dir, 'sample.kif')
# outputpng path
@dest = File.join(@dir, 'sample.png')
tumeShogiMode = true
KifFile.write_to_png(@source, @dest, tumeShogiMode)
```
