require 'rubygems'
require 'json'

class Pledge
  include Mongoid::Document
  store_in database: 'walker'

  field :pledge, type: Integer
end
