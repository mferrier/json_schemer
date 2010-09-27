class JSONSchemer
  class Integer < SimpleNode
    def initialize(opts = {})
      super(opts)
      @hash[:type] = 'integer'
    end
  end
end