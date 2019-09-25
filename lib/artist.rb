class Artist
  attr_accessor :name
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    save
  end
  
  def self.all
   @@all
  end
  
  def add_song(song)
    song.artist = self 
  end
  
  def songs
   @songs = Song.all.select {|song| song.artist == self} 
  end
  
  def self.find_or_create_by_name(name)
   unless @@all.find { |artist| artist.name == name}
   artist.new(name)
 else
   @@all.find { |artist| artist.name == name}
   end
  end
   
  # def self.find_by_name(name)
  #   @@all.detect {|artist| artist.name == name}
  # end
   
  # def self.create_by_name(name)
  #   self.new(name).save
  #   self.new(name)
  # end
  
    def save
    @@all << self
    end
  
  def print_songs
    songs.each {|s| puts s.name}
  end
  
end