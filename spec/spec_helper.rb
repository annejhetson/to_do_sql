require 'rspec'
require 'pg'
require 'address'
require 'contact'

DB = PG.connect({:dbname => 'address_test'})

RSpec.configure do |config|
  config.after(:each)do
   DB.exec("DELETE FROM contacts *;")
   DB.exec("DELETE FROM address *;")    
  end
end
