require 'rubygems'
require 'json/ext'
require 'string'

require 'node'
require 'node/simple_node'
require 'node/integer'
require 'node/number'
require 'node/null'
require 'node/boolean'
require 'node/string'
require 'node/object'
require 'node/array'

require 'ruby-debug'

module JSONSchemer
  extend self
  
  def object(properties = {})
    output = properties.merge(:type => 'object')
    # top level is always an object
    node = JSONSchemer::Object.new
    yield node if block_given?
    JSON.pretty_generate(output.merge(node.to_hash))
  end
end