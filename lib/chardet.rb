######################## BEGIN LICENSE BLOCK ########################
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
# 
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
# 
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
# 02110-1301  USA
######################### END LICENSE BLOCK #########################
require 'chardet/charsetprober'
require 'chardet/mbcharsetprober'

require 'chardet/big5freq'
require 'chardet/big5prober'
require 'chardet/chardistribution'
require 'chardet/charsetgroupprober'

require 'chardet/codingstatemachine'
require 'chardet/constants'
require 'chardet/escprober'
require 'chardet/escsm'
require 'chardet/eucjpprober'
require 'chardet/euckrfreq'
require 'chardet/euckrprober'
require 'chardet/euctwfreq'
require 'chardet/euctwprober'
require 'chardet/gb2312freq'
require 'chardet/gb2312prober'
require 'chardet/hebrewprober'
require 'chardet/jisfreq'
require 'chardet/jpcntx'
require 'chardet/langbulgarianmodel'
require 'chardet/langcyrillicmodel'
require 'chardet/langgreekmodel'
require 'chardet/langhebrewmodel'
require 'chardet/langhungarianmodel'
require 'chardet/langthaimodel'
require 'chardet/latin1prober'

require 'chardet/mbcsgroupprober'
require 'chardet/mbcssm'
require 'chardet/sbcharsetprober'
require 'chardet/sbcsgroupprober'
require 'chardet/sjisprober'
require 'chardet/universaldetector'
require 'chardet/utf8prober'
include CharDet
def CharDet.detect(aBuf)
  u = UniversalDetector.new
  u.reset
  u.feed(aBuf)
  u.close
  return u.result
end
