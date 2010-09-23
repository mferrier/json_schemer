module JSONSchemer
  class Object < Node
    def initialize
      super
      @hash[:type] = 'object'
    end
    
    private
  
    def add_property(name = nil, properties = {})
      node_properties = (@hash['properties'] ||= {})
      node_properties[name.to_s] = properties
    end
  end
end