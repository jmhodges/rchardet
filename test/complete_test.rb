require 'test/unit'
require File.dirname(__FILE__) + '/../lib/rchardet'

class CompleteTest < Test::Unit::TestCase
  def self.suite()
    suite = Test::Unit::TestSuite.new(name)
    base_path = File.join(File.dirname(__FILE__), 'assets')
    entries = Dir[File.join(base_path, "*")]
    entries.each do |path|
      next if !File.directory?(path)
      encoding = File.basename(path)
      Dir[File.join(path, "*")].each do |file_name|
        if ['.html', '.txt', '.xml'].include?(File.extname(file_name))
          suite << CompleteTest.new(file_name, encoding)
        end
      end
    end
    suite
  end

  SUFFIXES =[
             '-bulgarian',
             '-cyrillic',
             '-greek',
             '-hebrew',
             '-hungarian',
             '-turkish'
            ]

  def initialize(file_path, encoding)
    @file_path = file_path
    encoding = encoding.downcase
    @name = "#{encoding}:#{File.basename(file_path)}"
    SUFFIXES.each do |suffix|
      if encoding.end_with?(suffix)
        encoding, _, _ = encoding.rpartition(suffix)
      end
    end
    @encoding = encoding
    super("check")
  end

  def method_name
    @name
  end
  
  def name
    @name
  end

  def check
    u = CharDet::UniversalDetector.new
    File.open(@file_path, 'rb') do |f|
      f.readlines.each do |line|
        u.feed(line)
        if u.done
          break
        end
      end
      u.close
    end
    assert_not_nil u.result, "result should not be nil"
    assert_not_nil u.result['encoding'], "encoding should not be nil, result: #{u.result.inspect}"
    assert_equal(@encoding, u.result['encoding'].downcase)
  end
end
