module JSONSchemer
  class Null < SimpleNode
    def initialize
      super
      @hash[:type] = 'null'
    end
  end
end