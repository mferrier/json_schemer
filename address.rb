require 'json_schemer'

schema = JSONSchemer.new
schema.define do |address|
  address.description "An Address following the convention of http://microformats.org/wiki/hcard"
  address.string "post-office-box", :optional => true
  address.string "extended-address", :optional => true
  address.string "locality"
  address.string "region"
  address.string "postal-code", :optional => true
  address.string "country-name"
end

puts schema.to_json