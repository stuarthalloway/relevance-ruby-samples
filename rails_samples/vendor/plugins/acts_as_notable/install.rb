# codecite install
TARGET_PATH = File.join((RAILS_ROOT), 'app', 'models', 'note.rb')
LOCAL_PATH = File.join(File.dirname(__FILE__), 'models', 'note.rb')
unless File.exist?(File.join((RAILS_ROOT), 'app', 'models', 'note.rb'))
  FileUtils.cp(LOCAL_PATH, TARGET_PATH)
end
# codecite install