# coding: utf-8
require File.expand_path('../shogi_board.rb', __FILE__)
require 'optparse'

module Kif2png
  #
  # kif file to png file.
  #
  class Kif2png
    def initialize(source, dest, tume = false)
      @params = {}
      # banner = 'Usage: kif2png [options] SOURCE.kif DEST.png'
      # OptionParser.new(banner) do |opt|
      #  opt.on('-t', '--tume', 'Display for tumeshogi') { |v| @params[:t] = v }
      #  opt.permute!(ARGV)
      # end
      @params[:source] = source
      @params[:dest] = dest
      @params[:t] = tume
      # fail ArgumentError, banner unless @params[:dest] && @params[:source]
    end

    def run
      draw
    end

    private

    def draw
      board = ShogiBoard.new(@params)
      board.draw
      draw_koma(board)
      board.write_to_png(@params[:dest])
    end

    def draw_koma(board)
      File.open(@params[:source]) do |f|
        f.each_line do |line|
          if line.start_with?('|')
            write_dan(board, line.split('|')[1])
          elsif line.start_with?('先手の持駒')
            board.write_hand(line.split('：')[1], false)
          elsif line.start_with?('後手の持駒') && !@params[:t]
            board.write_hand(line.split('：')[1], true)
          end
        end
      end
    end

    def write_dan(board, text)
      @y ||= 0
      text.each_char.each_slice(2).with_index do |(reverse, str), i|
        board.write_text(i, @y, str, reverse == 'v')
      end
      @y += 1
    end
  end
end

Kif2png.new(Regexp.last_match(1), Regexp.last_match(2)).run if __FILE__ == $PROGRAM_NAME
