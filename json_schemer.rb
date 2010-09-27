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

class JSONSchemer
  def initialize
    @hash = {}
  end

  def define(properties = {})
    output = properties.merge(:type => 'object')
    # top level is always an object
    node = JSONSchemer::Object.new
    yield node if block_given?
    @hash = output.merge(node.to_hash)
  end
  
  def to_json
    JSON.pretty_generate(@hash)
  end
  
  def to_hash
    # run it through and back to stringify keys
    # FIXME: steal ActiveSupport's Hash#stringify_keys
    JSON.parse(JSON.generate(@hash))
  end
end