#!/usr/bin/ruby

# Play an arbitrary mp3 from within a specified zip file
# 
# Usage: ./play_zipped_audio [FILE.zip] [KEYWORD]

require 'zip'

def check_errors(word, zipname)
  if !zipname
    abort("  No zipname specified.")
  end

  if !File.exist?(zipname)
    abort("  No such file found.")
  end

  if File.extname(zipname) != ".zip"
    abort("  This is not a zip file.")
  end

  if !word
    abort("  No keyword to look up.")
  end
end

zipname = ARGV[0]
word = ARGV[1]

check_errors(word, zipname)

Zip::File.open(zipname) do |zipfile|
  folder_basename = File.basename(zipname, ".zip")
  zipfile.each do |entry|
    filename = "#{folder_basename}/#{word}.mp3"
    if entry.name.force_encoding('UTF-8') == filename
      mp3 = entry.get_input_stream.read
      IO.popen('mplayer -really-quiet -cache 1024 -', 'w') do |pipe|
        pipe.puts(mp3)
        pipe.close_write
      end
      exit
    end
  end
end

abort("  Keyword not found.")
