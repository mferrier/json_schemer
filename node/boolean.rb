class JSONSchemer
  class Boolean < SimpleNode
    def initialize
      super
      @hash[:type] = 'boolean'
    end
  end
end