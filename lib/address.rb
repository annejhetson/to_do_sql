class Address
  
  attr_reader :city, :state, :id
  
  def initialize(city, state, id)
    @city = city
    @state = state
    @id = id
  end
  
  def Address.all
    results = DB.exec("SELECT * FROM address;")
    addresses = []
    results.each do |result|
      city = result['city']
      state = result['state']
      id = result['id'].to_i
      addresses << Address.new(city, state, id)
    end
    addresses
  end
  
  def save
    DB.exec("INSERT INTO address (city, state) VALUES ('#{@city}', '#{@state}') RETURNING id;")
  end
  def Address.create(city, state, id)
    address = Address.new(city, state, id)
    address.save
  end
end