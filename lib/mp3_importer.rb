class MP3Importer
attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    #@mp3s_without_path = []
    files = []
    filenames = []
    files = Dir[self.path].each {|file| files << file}
    files.each {|file| filenames << file.split("mp3s/")[1]}
    filenames
  end

  def import
    self.files.each {|filename| Song.new_by_filename(filename)}
  end
end
