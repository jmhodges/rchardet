#require 'bacon'
#Bacon.summary_on_exit
require File.dirname( __FILE__ ) + '/../lib/rchardet'

describe CharDet do
  def chardet_spec_detect(file)
    content = File.open("spec/asset/#{file}.txt", 'rb'){|io| io.read }
    CharDet.detect(content)
  end

  it 'detect EUC-JP' do
    chardet_spec_detect('EUC-JP').should == {
      "encoding" => 'EUC-JP', "confidence" => 0.99
    }
  end

  it 'detect Shift_JIS' do
    chardet_spec_detect('Shift_JIS').should == {
      "encoding" => 'SHIFT_JIS', "confidence" => 1
    }
  end

  it 'detect UTF-8' do
    chardet_spec_detect('UTF-8').should == {
      "encoding" => 'utf-8', "confidence" => 0.99
    }
  end

  it 'detect eucJP-ms' do
    chardet_spec_detect('eucJP-ms').should == {
      "encoding" => 'EUC-JP', "confidence" => 0.99
    }
  end
  
  it 'detect UTF-16BE' do
    chardet_spec_detect('UTF-16BE').should == {
      "encoding" => 'UTF-16BE', "confidence" => 1
    }
  end

  it 'detect UTF-16LE' do
    chardet_spec_detect('UTF-16LE').should == {
      "encoding" => 'UTF-16LE', "confidence" => 1
    }
  end  

  it 'detect ISO-2022-JP' do
    chardet_spec_detect( 'ISO-2022-JP' ).should == {
      "encoding" => 'ISO-2022-JP', "confidence" => 0.99
    }
  end

  it 'detect big5' do
    chardet_spec_detect( 'big5' ).should == {
      "encoding" => 'Big5', "confidence" => 0.99
    }
  end
end

__END__
# all the specs down here fail, i don't expect passes until i can find files in
# that encoding

  describe 'CP51932' do
    it 'detects correctly' do
      chardet_spec_detect('CP51932').should == {
        "encoding" => Encoding":CP51932," "confidence" => 0.99
      }
    end
  end

  describe 'GB18030' do
    it 'detects correctly' do
      chardet_spec_detect('GB18030').should == {
        "encoding" => Encoding":GB18030," "confidence" => 0.99
      }
    end
  end

  describe 'UTF-32BE' do
    it 'detects correctly' do
      chardet_spec_detect('UTF-32BE').should == {
        "encoding" => Encoding":UTF_32BE," "confidence" => 0.99
      }
    end
  end

  describe 'EUC-JP' do
    it 'detects correctly' do
      chardet_spec_detect('EUC-JP').should == {
        "encoding" => nil, "confidence" => 0.99
      }
    end
  end

  describe 'UTF-32LE' do
    it 'detects correctly' do
      chardet_spec_detect('UTF-32LE').should == {
        "encoding" => Encoding":UTF_32LE," "confidence" => 0.99
      }
    end
  end

  describe 'Windows-31J' do
    it 'detects correctly' do
      chardet_spec_detect('Windows-31J').should == {
        "encoding" => nil, "confidence" => 0.99
      }
    end
  end

  describe 'stateless-ISO-2022-JP' do
    it 'detects correctly' do
      chardet_spec_detect('stateless-ISO-2022-JP').should == {
        "encoding" => nil, "confidence" => 0.99
      }
    end
  end
end
