module JSONSchemer
  class Array < Node
    def initialize
      super
      @hash[:type] = 'array'
    end
    
    def items(type, properties = {})
      @hash[:items] = properties.merge(:type => type)
    end
  end
end