class JSONSchemer
  class Object < Node
    def initialize(opts = {})
      super(opts)
      @hash[:type] = 'object'
    end
    
    # merge a set of properties into the current properties, overwriting
    # any collisions
    def merge_properties!(props = {})
      @hash[:properties].deep_merge!(props)
    end
    
    private
  
    # objects can have a 'ref' property, which is an URL that represents
    # the json object that should be placed here
    def add_property(name = nil, properties = {})
      node_properties = (@hash[:properties] ||= {})
      if ref = properties.delete(:ref)
        top_level_node.add_ref(ref, self, name)
      end
      node_properties[name] = properties
    end
  end
end