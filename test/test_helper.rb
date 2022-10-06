require 'bundler/setup'
require 'maxitest/autorun'

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require_relative '../lib/rchardet'
