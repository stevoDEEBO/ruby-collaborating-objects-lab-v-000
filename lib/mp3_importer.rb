class MP3Importer
attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = []
    filenames = []
    files = Dir.new(self.path).each {|file| files << file if file.name == "*.mp3"}
    files.each {|file| filenames << file.split("mp3s/")[1]}
    filenames
  end

  def import
    self.files.each {|filename| Song.new_by_filename(filename)}
  end
end
