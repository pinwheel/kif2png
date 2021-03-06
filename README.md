# Kif2png

Convert kakinoki kiffile to png format file.

### sample input

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

### sample output (normal, tume)

<img src="https://raw.githubusercontent.com/wiki/pinwheel/kif2png/images/bod.png" title="NormalMode" width="200" height="200" />
<img src="https://raw.githubusercontent.com/wiki/pinwheel/kif2png/images/tume.png" title="TumeShogiMode" width="200" height="200" />

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kif2png', :git => 'https://github.com/pinwheel/kif2png.git'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kif2png

## Usage

```ruby
# 柿木kiffile path
@source = File.join(@dir, 'sample.kif')
# outputpng path
@dest = File.join(@dir, 'sample.png')
tumeShogiMode = true
Kif2png.write_to_png(@source, @dest, tumeShogiMode)
```
