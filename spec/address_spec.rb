require 'spec_helper'

describe Address do
  it 'is initialized with city and state' do
    address = Address.new('portland', 'or', 1)
    address.should be_an_instance_of Address
    address.city.should eq 'portland'
    address.state.should eq 'or'
  end
  
   it 'starts with an empty array' do
     address = Address.new('portland', 'or', 1)
     Address.all[0].address_id.should eq []
  end
  
  it 'saves name into the database' do
    address = Address.create('portland', 'or', 1)
    Address.all[0].city.should eq 'portland'    
    Address.all[0].id.should be_an_instance_of Fixnum
  end
    
  end