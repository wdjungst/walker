desc "Builds the minified CSS and JS assets."
task :minify do
  require './walker.rb'
  puts "Building..."

  files = Sinatra::Minify::Package.build(Walker)
  files.each { |f| puts " * #{File.basename f}" }
  puts "Contruction compelte!"
end
