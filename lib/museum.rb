class Museum
  attr_reader :name,
              :exhibits,
              :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(person)
    @exhibits.find_all do |exhibit|
      person.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    sorted = {}
    @exhibits.each do |exhibit|
      sorted[exhibit] = []
      @patrons.each do |patron|
        if patron.interests.include?(exhibit.name)
          sorted[exhibit] << patron
        end
      end
    end
    sorted 
  end
end
