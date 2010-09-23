class JSONSchemer
  class Integer < SimpleNode
    def initialize
      super
      @hash[:type] = 'integer'
    end
  end
end