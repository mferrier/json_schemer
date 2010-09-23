module JSONSchemer
  class String < Node
    def initialize
      super
      @hash[:type] = 'string'
    end
  end
end