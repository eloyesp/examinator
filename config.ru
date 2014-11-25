# config.ru

use Rack::Reloader

require_relative 'app'

run App.new
