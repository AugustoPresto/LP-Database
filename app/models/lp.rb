class Lp
  attr_reader :id
  attr_accessor :artist, :title, :year, :price

  def initialize(attributes = {})
    @id = attributes[:id]
    @artist = attributes[:artist]
    @title = attributes[:title]
    @year = attributes[:year]
    @price = attributes[:price] || 0
  end

  def self.find(id)
    DB.results_as_hash = true
    query = DB.execute("SELECT * FROM lps WHERE id = ?", id)
    unless query.empty?
      lp = query.first
      artist = lp["artist"]
      title = lp["title"]
      year = lp["year"]
      price = lp["price"]
      found_lp = Lp.new(id: id, artist: artist, title: title, year: year, price: price)
    end
  end

  def self.all
    DB.results_as_hash = true
    all_results = []
    DB.execute("SELECT * FROM lps").each do |lp|
      lp_instance = Lp.new(id: lp["id"], artist: lp["artist"], title: lp["title"], year: lp["year"], price: lp["price"])
      all_results << lp_instance
    end
    all_results
  end

  def destroy
    query = <<-SQL
      DELETE FROM lps
      WHERE id = #{@id}
    SQL
    DB.execute(query)
  end

  def save
    if @id.nil?
      DB.execute("INSERT INTO lps (title, price, year, artist) VALUES (?, ?, ?, ?)", @title, @price, @year, @artist)
      @id = DB.last_insert_row_id
    else
      DB.execute("UPDATE lps SET title = ?, price = ?, year = ?, artist = ? WHERE id = ?", @title, @price, @year, @artist, @id)
    end
  end
end
