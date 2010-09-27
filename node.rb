class JSONSchemer
  class Node
    # valid data types
    @@data_types = %w(number any boolean array null string object integer)
    def self.data_types
      @@data_types
    end
    
    def initialize(opts = {})
      @parent = opts.delete(:parent)
      @refs = []
      @hash = {}
    end
  
    def to_hash
      @hash
    end
  
    def description(txt)
      @hash[:description] = txt
    end
  
    @@data_types.each do |data_type|
      eval <<-EORUBY
        def #{data_type}(name = nil, properties = {})
          node = JSONSchemer::#{data_type.titleize}.new(:parent => self)
          yield node if block_given?

          add_property(name, properties.merge(node.to_hash))
        end
      EORUBY
    end
    
    # for testing
    #
    # def string(name = nil, properties = {})
    #   node = JSONSchemer::String.new(:parent => self)
    #   yield node if block_given?
    #   
    #   add_property(name, properties.merge(node.to_hash))
    # end
    # 
    # def object(name, properties = {})
    #   node = JSONSchemer::Object.new(:parent => self)
    #   yield node if block_given?
    #   
    #   add_property(name, properties.merge(node.to_hash))
    # end
    # 
    # def array(name, properties = {})
    #   node = JSONSchemer::Array.new(:parent => self)
    #   yield node if block_given?
    #   
    #   add_property(name, properties.merge(node.to_hash))
    # end
    
    # a way to walk from any node up to the root node in the tree
    def top_level_node
      @parent || self
    end
    
    def add_ref(ref, node, property_name)
      @refs << {:url => ref, :node => node, :property_name => property_name}
    end
    
    def refs
      @refs
    end
  end
end