module JSONSchemer
  class Object < Node
    def initialize
      super
      @hash[:type] = 'object'
    end
  end
end