class JSONSchemer
  class String < SimpleNode
    def initialize
      super
      @hash[:type] = 'string'
    end
  end
end