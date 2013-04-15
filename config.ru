require File.expand_path(File.dirname(__FILE__) + '/walker')

use Rack::StaticCache, :urls => ["/images"], :root => Dir.pwd + '/public'
run Walker.new
