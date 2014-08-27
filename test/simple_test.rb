require_relative "test_helper"

describe "Simple" do
  def assert_chardet_spec_detect(file, expected)
    content = File.open("test/simple_assets/#{file}.txt", 'rb'){|io| io.read }
    assert_equal expected, CharDet.detect(content)
  end

  def pending
    yield
  rescue StandardError
    skip
  else
    raise "Fixed"
  end

  it "detects EUC_JP" do 
    assert_chardet_spec_detect 'EUC-JP', {
      "encoding" => 'EUC-JP', "confidence" => 0.99
    }
  end

  it "detects Shift_JIS" do
    assert_chardet_spec_detect 'Shift_JIS', {
      "encoding" => 'SHIFT_JIS', "confidence" => (RUBY_VERSION > "1.9.3" ? 0.99 : 1) # TODO the 1.9 value might be wrong but I cannot find any bug
    }
  end

  it "detects UTF_8" do
    assert_chardet_spec_detect 'UTF-8' , {
      "encoding" => 'utf-8', "confidence" => 0.99
    }
  end

  it "detects eucJP_ms" do
    assert_chardet_spec_detect 'eucJP-ms' , {
      "encoding" => 'EUC-JP', "confidence" => 0.99
    }
  end
  
  it "detects UTF_16BE" do
    assert_chardet_spec_detect 'UTF-16BE' , {
      "encoding" => 'UTF-16BE', "confidence" => 1
    }
  end

  it "detects UTF_16LE" do
    assert_chardet_spec_detect 'UTF-16LE' , {
      "encoding" => 'UTF-16LE', "confidence" => 1
    }
  end  

  it "detects ISO_2022_JP" do
    assert_chardet_spec_detect  'ISO-2022-JP'  , {
      "encoding" => 'ISO-2022-JP', "confidence" => 0.99
    }
  end

  it "detects big5" do
    assert_chardet_spec_detect  'big5'  , {
      "encoding" => 'Big5', "confidence" => 0.99
    }
  end

  it "does not blow up on invalid encoding" do
    pending do
      CharDet.detect("bad encoding: \xc3\x28")
    end
  end
end
