module JSONSchemer
  class Node
    # valid data types
    @@data_types = %w(number any boolean array null string object integer)
  
    def initialize
      @hash = {}
    end
  
    def to_hash
      @hash
    end
  
    def description(txt)
      @hash[:description] = txt
    end
  
    # @@data_types.each do |data_type|
    #   eval <<-EORUBY
    #     def #{data_type}(name, properties = {})
    #       if block_given?
    #         node = Node.new(:#{data_type})
    #         yield node
    #       end
    # 
    #       add_property(name, properties.merge((node || {}).to_hash).merge(:type => '#{data_type}'))
    #     end
    #   EORUBY
    # end
  
    def string(name, properties = {})
      node = JSONSchemer::String.new
      yield node if block_given?
      
      add_property(name, properties.merge(node.to_hash))
    end

    def object(name, properties = {})
      node = JSONSchemer::Object.new
      yield node if block_given?
      
      add_property(name, properties.merge(node.to_hash))
    end

    def array(name, properties = {})
      node = JSONSchemer::Array.new
      yield node if block_given?
      
      add_property(name, properties.merge(node.to_hash))
    end

  
    private
  
    def add_property(name, properties = {})
      node_properties = (@hash['properties'] ||= {})
      node_properties[name.to_s] = properties
    end
  end
end