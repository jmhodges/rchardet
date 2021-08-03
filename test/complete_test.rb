require_relative "test_helper"

describe "Complex" do
  SUFFIXES =[
    '-bulgarian',
    '-cyrillic',
    '-greek',
    '-hebrew',
    '-hungarian',
    '-turkish'
  ]

  folders = Dir[File.expand_path("../assets/*", __FILE__)]
  folders.select!{ |f| File.directory?(f) }
  tests = folders.flat_map do |path|
    encoding = File.basename(path).downcase
    SUFFIXES.each { |s| encoding.sub!(s, "") }
    Dir[File.join(path, "*.{html,txt,xml}")].map { |file| [encoding, file] }
  end

  tests.each do |encoding, file|
    it "parses #{encoding}:#{File.basename(file)}" do
      u = CharDet::UniversalDetector.new
      File.open(file, 'rb') do |f|
        f.readlines.each do |line|
          u.feed(line)
          break if u.done
        end
        u.close
      end

      assert u.result, "result should not be nil"
      assert u.result['encoding'], "encoding should not be nil, result: #{u.result.inspect}"
      assert u.result['confidence'], "confidence should not be nil, result: #{u.result.inspect}"
      assert_equal u.result['confidence'].class, Float
      assert_equal encoding, u.result['encoding'].downcase
    end
  end
end
