# coding: utf-8
require 'cairo'

#
# draw shogiboard
#
class ShogiBoard
  SCALE = 10
  MARGIN = 0.8
  BAN_WIDTH = 31.6
  MATH_WIDTH = BAN_WIDTH / 9.0
  BAN_HEIGHT = 34.8
  MATH_HEIGHT = BAN_HEIGHT / 9.0
  RUBI_SIZE = 1.6
  HAND_RUBI_SIZE = 2
  FONT_SIZE = 3.2

  def initialize(params)
    margin_setting(params)
    @width = BAN_WIDTH + @right_margin + @left_margin
    @height = BAN_HEIGHT + @top_margin + @bottom_margin

    @surface = Cairo::ImageSurface.new(@width * SCALE, @height * SCALE)
    @context = Cairo::Context.new(@surface)
    context_setting
  end

  def draw
    draw_top_number
    draw_height_line
    draw_right_number
    draw_width_line
  end

  def write_text(x, y, text, reverse)
    return if text == '・'
    plot_x = @left_margin + MATH_WIDTH * x + 0.1
    plot_x += FONT_SIZE if reverse
    plot_y = @top_margin + MATH_HEIGHT * y + FONT_SIZE
    plot_y += BAN_HEIGHT / 9 - FONT_SIZE * 2 if reverse
    rotate = reverse ? 3.14 : 0

    @context.set_font_size(FONT_SIZE)
    draw_text(plot_x, plot_y, text, rotate)
  end

  def write_hand(text, reverse)
    @context.set_font_size(HAND_RUBI_SIZE)
    x = @left_margin - 0.2
    x += BAN_WIDTH + RUBI_SIZE + 0.4 unless reverse
    y = @top_margin + MATH_HEIGHT
    y -= RUBI_SIZE * 2 if reverse
    rotate = reverse ? 3.14 : 0
    text = "持駒 #{text}".gsub('　', '').strip
    text.reverse! if reverse
    text.each_char.with_index do |chr, i|
      draw_text(x, y + HAND_RUBI_SIZE * i, chr, rotate)
    end
  end

  def write_to_png(filename)
    @context.stroke
    @surface.write_to_png(filename)
  end

  private

  def margin_setting(params)
    @top_margin = MARGIN + RUBI_SIZE
    @bottom_margin = MARGIN
    @left_margin = MARGIN
    @left_margin += HAND_RUBI_SIZE unless params[:t]
    @right_margin = MARGIN + RUBI_SIZE + HAND_RUBI_SIZE
  end

  def context_setting
    @context.scale(SCALE, SCALE)
    @context.set_source_color(Cairo::Color::BLACK)
    @context.set_line_width(0.2)
    @context.select_font_face('fonts-japanese-gothic')
  end

  def draw_top_number
    @context.set_font_size(RUBI_SIZE)
    0.upto(8) do |i|
      plot_x = @left_margin + MATH_WIDTH * (i + 0.3)
      draw_text(plot_x, @top_margin - 0.2, (9 - i).to_s, 0)
    end
  end

  def draw_right_number
    @context.set_font_size(RUBI_SIZE)
    0.upto(8) do |i|
      draw_text(@left_margin + BAN_WIDTH + 0.1,
                @top_margin + MATH_HEIGHT * (i + 0.7),
                %w(一 二 三 四 五 六 七 八 九)[i],
                0)
    end
  end

  def draw_height_line
    @context.translate(@left_margin, @top_margin)
    0.upto(9) do |i|
      @context.move_to(MATH_WIDTH * i, 0)
      @context.line_to(MATH_WIDTH * i, BAN_HEIGHT)
    end
    @context.translate(-@left_margin, -@top_margin)
  end

  def draw_width_line
    @context.translate(@left_margin, @top_margin)
    0.upto(9) do |i|
      @context.move_to(0, MATH_HEIGHT * i)
      @context.line_to(BAN_WIDTH, MATH_HEIGHT * i)
    end
    @context.translate(-@left_margin, -@top_margin)
  end

  def draw_text(x, y, text, rotate)
    @context.move_to(x, y)
    @context.rotate(rotate)
    @context.show_text(text)
    @context.rotate(-rotate)
  end
end
