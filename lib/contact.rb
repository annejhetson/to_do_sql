class Contact
  
  attr_reader :name, :id, :address_id
  
  def initialize(name, id, address_id = nil)
    @name = name
    @id = id
    @address_id = address_id
  end
  
  def Contact.all
    #DB.exec("DELETE FROM contacts *;")
    results = DB.exec("SELECT * FROM contacts;")
    contacts = []
    results.each do |result|
      name = result['name']
      id = result['id'].to_i
      address_id = result['address_id']
      contacts << Contact.new(name, id, address_id)
    end
    contacts
  end
  def save
    DB.exec("INSERT INTO contacts (name) VALUES ('#{@name}') RETURNING id;")
  end
  def Contact.create(name, id, address_id = nil)
    contact = Contact.new(name, id, address_id = nil)
    contact.save
  end
  
  def Address.add_id(address_id_number, id_number)
    #@address_id_number = address_id_number
    #@id_number = id_number
    DB.exec("UPDATE contacts SET address_id = #{address_id_number} WHERE id = #{id_number};")
  end
end
