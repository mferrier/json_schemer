require 'rubygems'
require 'json/ext'
require 'string'
require 'hash'
require 'open-uri'

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
  def initialize(properties = {})
    @hash = {}
    output = properties.merge(:type => 'object')
    # top level is always an object
    node = JSONSchemer::Object.new
    yield node if block_given?
    
    # fetch refs if there were any
    if node.refs.any?
      # puts "Fetching " + node.refs.size.to_s + " refs..."
      node.refs.each do |ref|
        # puts "Fetching ref '#{ref[:url]}'"
        ref_str = open(ref[:url]).read
        # puts "Got ref string: "
        # puts ref_str
        ref_hash = JSON.parse(ref_str)
        # puts "Parsed ref hash: "
        # pp ref_hash
        
        # puts "Merging ref hash"
        ref[:node].merge_properties!({ref[:property_name] => ref_hash})
      end
    end
    
    @node = node
    @hash = output.merge(node.to_hash)

    # stringify everything and test for parseability
    @hash = JSON.parse(JSON.generate(@hash))
  end

  def to_json
    JSON.pretty_generate(@hash)
  end
  
  def to_hash
    @hash
  end

  # run it through and back to stringify keys
  # FIXME: steal ActiveSupport's Hash#stringify_keys  
  def stringify_hash_keys!
    @hash = JSON.parse(JSON.generate(@hash))
  end
  
  def root_node
    @node
  end
end