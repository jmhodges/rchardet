require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/rg'

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require_relative '../lib/rchardet'
