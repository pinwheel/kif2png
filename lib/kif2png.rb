require 'kif2png/version'
require 'kif2png/kif2png'

#
# Convert kakinoki kifFile to png format file.
#
module Kif2png
  def self.write_to_png(source, dest, tume = false)
    Kif2png.new(source, dest, tume).run
  end
end
