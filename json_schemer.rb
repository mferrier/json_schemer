require 'json/ext'

module JSONSchemer
  extend self
  
  def object(properties = {})
    output = properties.merge('type' => 'object')
    node = Node.new
    yield node
    output.merge(node.to_h).to_json
  end
  
  class Node
    # valid data types
    @@data_types = %w(number any boolean array null string object integer)
    
    def initialize
      @hash = {}
    end
    
    def to_h
      @hash
    end
    
    def description(txt)
      @hash['description'] = txt
    end
    
    def string(name, properties = {})
      add_property(name, properties.merge('type' => 'string'))
    end
    
    private
    
    def add_property(name, properties = {})
      node_properties = (@hash['properties'] ||= {})
      node_properties[name.to_s] = properties
    end
    
  end
end