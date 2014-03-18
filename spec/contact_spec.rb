require 'spec_helper'

describe Contact do
  it 'is initialized with name' do
    contact = Contact.new('Bob', 1)
    contact.should be_an_instance_of Contact
    contact.name.should eq 'Bob'
  end
  
  it 'starts with an empty array' do
    contact = Contact.new('Bob', 1)
    Contact.all.should eq []
  end
  
  it 'saves name into the database' do
    contact = Contact.create('Bob', 1)
    Contact.all[0].name.should eq 'Bob'
    Contact.all[0].id.should be_an_instance_of Fixnum
  end
  it 'add address_id into contacts table by selecting id' do
    contact = Contact.create('Bob', 1)
    Address.add_id(2, 67)
    Contact.all[0].address_id.should eq 2
  end
end