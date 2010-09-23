require 'json_schemer'

str = JSONSchemer.object do |card|
  card.description "A representation of a person, company, organization, or place"

  card.string :fn, :optional => true do |fn|
    fn.description "Formatted Name"
  end

  card.string :family_name
  card.string :givenName
  card.array :additionalName do |additionalName|
    additionalName.items "string"
  end
  card.array :honorificPrefix do |honorificPrefix|
    honorificPrefix.items "string"
  end
  card.array :honorificSuffix do |honorificSuffix|
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
  card.string :familyName
  card.string :photo, :format => :image, :optional => true
  card.string :logo, :format => :image, :optional => true
  card.string :bday, :format => :date, :optional => true
  card.string :title, :optional => true
  card.string :role, :optional => true
  card.object :org, :optional => true do |org|
    org.string :organizationName
    org.string :organizationUnit
  end
end

puts str