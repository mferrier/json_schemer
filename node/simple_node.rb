module JSONSchemer
  class SimpleNode < Node
    def initialize
      super
    end
    
    private
  
    def add_property(name = nil, properties = {})
      @hash.merge!(properties)
    end
  end
end