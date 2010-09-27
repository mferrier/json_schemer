require 'json_schemer'

module Card
  extend self
  
  def schema
    schema = JSONSchemer.new
    schema.define do |card|
      card.description "A representation of a person, company, organization, or place"

      card.string :fn, :optional => true do |fn|
        fn.description "Formatted Name"
      end

      card.string :familyName
      card.string :givenName
      card.array :additionalName, :optional => true do |additionalName|
        additionalName.items "string"
      end
      card.array :honorificPrefix, :optional => true do |honorificPrefix|
        honorificPrefix.items "string"
      end
      card.array :honorificSuffix, :optional => true do |honorificSuffix|
        honorificSuffix.items "string"
      end
      card.string :sound, :optional => true, :format => :attachment
      card.string :nickname, :optional => true
      card.string :url, :format => :url, :optional => true
      card.object :email, :optional => true do |email|
        email.string :type
        email.string :value, :format => :email
      end
      card.object :tel, :optional => true do |tel|
        tel.string :type
        tel.string :value, :format => :phone
      end
      card.object :adr, :optional => true, :ref => "http://json-schema.org/address#properties"
      card.string :tz, :optional => true
      card.object :geo, :optional => true, :ref => "http://json-schema.org/geo#properties"
      card.string :photo, :format => :image, :optional => true
      card.string :logo, :format => :image, :optional => true
      card.string :bday, :format => :date, :optional => true
      card.string :title, :optional => true
      card.string :role, :optional => true
      card.object :org, :optional => true do |org|
        org.string :organizationName
        org.string :organizationUnit
      end
        
      card.array :children, :optional => true do |children|
        children.items do |items|
          items.string
          items.object :name do |name|
            name.string :first_name
            name.string :last_name
          end
        end
      end
        
      card.number :height_in_meters
      card.integer :age
      card.boolean :male
      card.null :nil
    end
    schema
  end
end