$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'submarine'
require 'rspec'
require 'rspec/autorun'

Spec::Runner.configure do |config|
end
