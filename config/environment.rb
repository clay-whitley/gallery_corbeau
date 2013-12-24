require 'sinatra'
require 'active_record'
require 'pg'
require 'pathname'
require 'uri'
require 'erb'

APP_ROOT = Pathname.new(File.expand_path('../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

require File.expand_path(File.join(File.dirname(__FILE__), 'db.rb'))
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'helpers.rb'))

include_all('lib', 'routes')