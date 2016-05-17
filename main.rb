require 'io/console'

require_relative("core/jiin.rb")
require_relative("core/collection.rb")
require_relative("core/console.rb")
require_relative("misc/string.rb")

$jiin = Jiin.new

$jiin.console.listen while(true)