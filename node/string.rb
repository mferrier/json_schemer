class JSONSchemer
  class String < SimpleNode
    def initialize(opts = {})
      super(opts)
      @hash[:type] = 'string'
    end
  end
end