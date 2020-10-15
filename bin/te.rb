#!/usr/bin/env ruby

DEFAULT_IP = '127.0.0.1'


require 'erb'
require 'json'
require 'net/http'
require 'getoptlong'


opts = GetoptLong.new(
  [ '--help', '-h', GetoptLong::NO_ARGUMENT ],
  [ '--ip', GetoptLong::REQUIRED_ARGUMENT ],
  [ '--il', '-i', GetoptLong::REQUIRED_ARGUMENT ],
  [ '--ol', '-o', GetoptLong::REQUIRED_ARGUMENT ],
  [ '--translate', '-t', GetoptLong::NO_ARGUMENT ],
  [ '--local', GetoptLong::NO_ARGUMENT ]
)

il='fr'
ol='fr'
ip = DEFAULT_IP
need_translation = false
is_local = false
opts.each do |opt, arg|
  case opt
    when '--help'
      puts <<-EOF
Usage: te [OPTION]... TEXT
Play sound of TEXT (translated or not)

  -h, --help\tshow help
  -i, --il\tinput language
  -o, --ol\toutput language
      --local\tlocal playing
      --translate\ttranslate text from [il] to [ol]
      --ip\tip of target

TEXT: The text to translate and play.
      EOF
      exit 0
    when '--ip'
      if arg != ''
        ip = arg
      end
    when '--il'
      if arg != ''
        il = arg
      end
    when '--ol'
      if arg != ''
        ol = arg
      end
    when '--translate'
      need_translation = true
    when '--local'
      is_local = true
  end
end

if ARGV.length != 1
  puts "Missing text argument (try --help)"
  exit 1
end

text   = ARGV.shift
text_e = ERB::Util::url_encode(text)

if need_translation
  puts "Translate \"#{text}\" from #{il} to #{ol}"

  trad = Net::HTTP.get('translate.google.fr', "/translate_a/single?client=t&sl=#{il}&tl=#{ol}&dt=t&ie=UTF-8&oe=UTF-8&q=#{text_e}")
  trad.gsub!(/,,/, ',');
  hash = JSON.parse trad
  text   = hash[0][0][0]
  text_e = ERB::Util::url_encode(text)
end

puts "Play \"#{text}\" in #{ol} on #{ip}"

url="https://translate.google.fr/translate_tts?ie=UTF-8&q=#{text_e}&textlen=#{text_e.length}&tl=#{ol}"
if is_local
  system("wget \"#{url}\" -O - --user-agent \"\" | mpg123 -")
else
  #system("sshpass -p password ssh user@#{ip}  'wget \"#{url}\" -O - --user-agent \"\" | mpg123 -'")
  system("echo 'wget \"#{url}\" -O - --user-agent \"\" | mpg123 - \n\n' | netcat #{ip} 9999");
end

