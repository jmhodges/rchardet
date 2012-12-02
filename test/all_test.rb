require 'test/unit'
require File.dirname( __FILE__ ) + '/../lib/rchardet'

class TestCharDet < Test::Unit::TestCase

  def assert_chardet_spec_detect(file, expected)
    content = File.open("test/asset/#{file}.txt", 'rb'){|io| io.read }
    assert_equal expected, CharDet.detect(content)
  end

  def test_detect_EUC_JP 
    assert_chardet_spec_detect 'EUC-JP', {
      "encoding" => 'EUC-JP', "confidence" => 0.99
    }
  end

  def test_detect_Shift_JIS
    assert_chardet_spec_detect 'Shift_JIS', {
      "encoding" => 'SHIFT_JIS', "confidence" => 1
    }
  end

  def test_detect_UTF_8
    assert_chardet_spec_detect 'UTF-8' , {
      "encoding" => 'utf-8', "confidence" => 0.99
    }
  end

  def test_detect_eucJP_ms
    assert_chardet_spec_detect 'eucJP-ms' , {
      "encoding" => 'EUC-JP', "confidence" => 0.99
    }
  end
  
  def test_detect_UTF_16BE
    assert_chardet_spec_detect 'UTF-16BE' , {
      "encoding" => 'UTF-16BE', "confidence" => 1
    }
  end

  def test_detect_UTF_16LE
    assert_chardet_spec_detect 'UTF-16LE' , {
      "encoding" => 'UTF-16LE', "confidence" => 1
    }
  end  

  def test_detect_ISO_2022_JP
    assert_chardet_spec_detect  'ISO-2022-JP'  , {
      "encoding" => 'ISO-2022-JP', "confidence" => 0.99
    }
  end

  def test_detect_big5
    assert_chardet_spec_detect  'big5'  , {
      "encoding" => 'Big5', "confidence" => 0.99
    }
  end
end
