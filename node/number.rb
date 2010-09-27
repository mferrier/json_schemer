class JSONSchemer
  class Number < SimpleNode
    def initialize(opts = {})
      super(opts)
      @hash[:type] = 'number'
    end
  end
end