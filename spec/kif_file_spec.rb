require 'spec_helper'

describe KifFile do
  before(:all) do
    @dir = File.expand_path('../../sample', __FILE__)
    @source = File.join(@dir, 'sample.kif')
    @dest = File.join(@dir, 'sample.png')

    @str=<<'EOS'
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
EOS

    File.write(@source, @str) unless File.exist?(@source)
  end

  before(:each) do
    File.delete(@dest) if File.exist?(@dest)
  end

  it 'has a version number' do
    expect(KifFile::VERSION).not_to be nil
  end

  it 'output tume kif' do
    KifFile.write_to_png(@source, @dest, true)
    FileUtils.cp(@dest, File.join(@dir, 'tume.png'))
    expect(File.exist?(@dest)).to eq(true)
  end

  it 'output bod kif' do
    KifFile.write_to_png(@source, @dest, false)
    FileUtils.cp(@dest, File.join(@dir, 'bod.png'))
    expect(File.exist?(@dest)).to eq(true)
  end
end
