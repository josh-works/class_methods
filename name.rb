  require 'csv'
  class Name
    attr_reader :year, :bio_gender, :ethnicity, :name, :count, :rank
    @@filename = 'Popular_Baby_Names.csv'
    @@test = 'test.csv'
    # @@test is just a smaller file for testing
    def initialize(data)
      @year = data["Year of Birth"]
      @bio_gender = data["Gender"]
      @ethnicity = data["Ethnicity"]
      @name = data["Child's First Name"]
      @count = data["Count"]
      @rank = data["Rank"]
    end
    
    
    
    def load_data(file_name)
      CSV.read().each do |row|
        Name.new(row)
      end
    end
    
    def self.find_by_name(name)
      rows = CSV.read(@@filename, headers: true)
      result = []
      # require "pry"; binding.pry
      rows.each do |row|
        result << self.new(row) if row["Child's First Name"] == name
      end
      result
    end
    
    def self.find_by_year(year)
      rows = CSV.read(@@filename, headers: true)
      result = []
      rows.each do |row|
        result << self.new(row) if row["Year of Birth"] == year
      end
      result
    end
    
    def self.where(details)
      rows = CSV.read(@@test, headers: true)
      names_array = rows.map do |row|
        self.new(row)
      end
      # how do i check hash in details against attributes
      # in each Name object?!
    end
  end
# the following two work
Name.load_data # loads data
p Name.find_by_name("GIA")
p Name.find_by_year("2016").count
# don't understand how to use the following
# hash given as the query for the .where class method.
p Name.where( {rank: "15"} )