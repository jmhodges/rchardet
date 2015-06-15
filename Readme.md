Encoding detection for ruby.

```Bash
gem install rchardet
```

Usage
=====

```Ruby
require 'rubygems'
require 'rchardet'

cd = CharDet.detect(some_data)
encoding = cd['encoding']
confidence = cd['confidence'] # 0.0 <= confidence <= 1.0
```

### [Contributors](http://github.com/grosser/pru/contributors)
 - [Jeff Hodges](http://github.com/jmhodges)
 - [Denis Savitsky](https://github.com/sadfuzzy)
 - [Sam Rose](https://github.com/samwho)
 - [Cole Thompson](https://github.com/coledot)
 - [KITAITI Makoto](https://github.com/KitaitiMakoto)

Maintained by [Michael Grosser](http://grosser.it)<br/>
michael@grosser.it<br/>
License: LGPL<br/>
[![Build Status](https://travis-ci.org/jmhodges/rchardet.png)](https://travis-ci.org/jmhodges/rchardet)
Made for [rFeedParser](https://github.com/jmhodges/rfeedparser)
