class JSONSchemer
  class Boolean < SimpleNode
    def initialize(opts = {})
      super(opts)
      @hash[:type] = 'boolean'
    end
  end
end