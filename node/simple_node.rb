class JSONSchemer
  class SimpleNode < Node
    def initialize(opts = {})
      super(opts)
    end
    
    private
  
    def add_property(name = nil, properties = {})
      @hash.merge!(properties)
    end
  end
end