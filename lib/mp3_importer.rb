class MP3Importer
attr_accessor :path

  def initialize(path)
    @path = path
    @mp3s = []
    @mp3s_without_path = []
  end

  def files
    #@mp3s_without_path = []
    files = []
    filename = []
    files = Dir[self.path].each {|file| files << file}
    files.each {|file| filenames << file.split("mp3s/")[1]}
    filenames
  end

  def import
    @mp3s_without_path.each do |filename|
      Song.new_by_filename(filename)
    end
  end
end
