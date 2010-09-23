class JSONSchemer
  class Array < Node
    def initialize
      super
      @hash[:type] = 'array'
    end
    
    def items(data_type = nil, properties = {})
      if block_given?
        these_items = Items.new
        yield these_items
        @hash[:items] = these_items.to_a
      else
        @hash[:items] = properties.merge(:type => data_type)
      end
    end
    
    class Items < Node
      def initialize
        @array = []
      end
      
      def to_a
        @array
      end
      
      def to_hash
        raise "#to_hash called in an Items instance. This shouldn't happen!"
      end
      
      private
      
      # override the Node add_property and ignore 'name', as members of the
      # items array have no use for a name
      def add_property(name = nil, properties = {})
        @array << properties
      end
    end
  end
end