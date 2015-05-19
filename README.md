# KifFile

Convert kakinoki kifFile to png format file.

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
