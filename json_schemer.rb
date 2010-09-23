require 'rubygems'
require 'json/ext'
require 'node'
require 'node/string'
require 'node/object'
require 'node/array'

require 'ruby-debug'

module JSONSchemer
  extend self
  
  def object(properties = {})
    output = properties.merge(:type => 'object')
    node = JSONSchemer::Object.new
    yield node if block_given?
    JSON.pretty_generate(output.merge(node.to_hash))
  end
end