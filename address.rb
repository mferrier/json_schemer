require 'json_schemer'
JSONSchemer.object do |address|
  address.description "An Address following the convention of http://microformats.org/wiki/hcard"
  address.string "post-office-box", :optional => true
  address.string "extended-address", :optional => true
  address.string "locality"
  address.string "region"
  address.string "postal-code", :optional => true
  address.string "country-name"
end
