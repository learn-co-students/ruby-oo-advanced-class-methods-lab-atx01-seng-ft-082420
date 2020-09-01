require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
  

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    self.all << song 
    song 
  end 

  def self.new_by_name(song_name)
    song = self.new 
    song.name = song_name
    song
  end 

  def self.create_by_name(song_name)
    song = self.new 
    self.all << song
    song.name = song_name
    song
  end 

  def self.find_by_name(song_name)
    #binding.pry
    self.all.find do |song|
     song.name == song_name 
    end 
  end 
  
  def self.find_or_create_by_name(song_name)
    #binding.pry
    if self.find_by_name(song_name) == nil 
      self.create_by_name(song_name)
    else self.find_by_name(song_name)
    end
  end 

  def self.alphabetical
    @@all.sort_by do |a|
      a.name 
    end 
  end 

  def self.new_from_filename(song_name)
    file = song_name.split(" - ")[1]
    artist_name = song_name.split(" - ")[0]
    song = Song.new_by_name(file.split(".")[0])
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(song_name)
    file = song_name.split(" - ")[1]
    artist_name = song_name.split(" - ")[0]
    song = Song.new_by_name(file.split(".")[0])
    song.artist_name = artist_name
    @@all << song
    song
  end 

  def self.destroy_all
    @@all.clear
  end 

  def self.all
    @@all
  end
end
