require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => 'mysql2',
  :host => 'localhost',
  :encoding => 'utf8',
  :database => 'walker',
  :password => 'password'
)

class Pledge < ActiveRecord::Base
  attr_accessible :amount
  ActiveRecord::Migration.class_eval do
    unless table_exists? 'pledges'
      create_table :pledges do |t|
        t.integer :amount
      end
    end
  end
end
