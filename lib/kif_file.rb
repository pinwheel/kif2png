require "kif_file/version"
require "kif_file/kif2png"

module KifFile
  def self.write_to_png(source, dest, tume=false) 
    Kif2png.new(source, dest, tume).run
  end
end
