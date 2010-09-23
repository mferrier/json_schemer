class JSONSchemer
  class Number < SimpleNode
    def initialize
      super
      @hash[:type] = 'number'
    end
  end
end