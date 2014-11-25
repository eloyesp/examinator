# config.ru
require_relative 'app'

use Rack::Reloader
use Rack::Static, :urls => ["/css", "/images"]
run Rack::Directory.new 'examenes', App.new
use Rack::ShowStatus
