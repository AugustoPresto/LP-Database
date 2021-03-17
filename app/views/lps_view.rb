class LpsView
  def index(lps)
    puts ""
    puts "Listing all your LPs..."
    lps.each do |lp|
      puts "#{lp.id}. #{lp.artist} - #{lp.title} - #{lp.year} - R$ #{lp.price}"
    end
  end

  def ask_for(string)
    puts "#{string}?"
    print "> "
    gets.chomp
  end
end
