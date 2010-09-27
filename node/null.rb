class JSONSchemer
  class Null < SimpleNode
    def initialize(opts = {})
      super(opts)
      @hash[:type] = 'null'
    end
  end
end