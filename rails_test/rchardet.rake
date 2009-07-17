require 'rubygems'
require 'rchardet'

# Create a new rails app and put this under lib/tasks

CONTENTS = "\345\225\206\346\245\255\346\234\215\345\213\231\347\232\204Ruby on Rails HTTP Cluster\350\247\200\345\277\265\345\217\212\346\270\254\350\251\246 &raquo; Kiwi\346\240\274\347\266\262\346\212\200\350\241\223\351\226\213\347\231\274\347\253\231"

def guess_encoding(data)
  cd = CharDet.detect(data)
  encoding = cd['encoding']
  confidence = cd['confidence'] # 0.0 <= confidence <= 1.0
  puts "encoding = %s, confidense = %s" % [encoding, confidence]
end

namespace :rchardet do
  desc "Test rchardet without rails enviroment"
  task :test do
    guess_encoding(CONTENTS)
  end

  desc "Test rchardet within rails environment"
  task :test_rails => :environment do
    guess_encoding(CONTENTS)
  end
end
