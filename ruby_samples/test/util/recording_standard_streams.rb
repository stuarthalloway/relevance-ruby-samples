require 'stringio'

module RecordingStandardStreams
  def recording_stdout
    $stdout = recorder =StringIO.new
    begin
      yield
    ensure
      $stdout = STDOUT
    end
    recorder.rewind
    recorder.read
  end
  def recording_stderr
    $stderr = recorder =StringIO.new
    begin
      yield
    ensure
      $stderr = STDERR
    end
    recorder.rewind
    recorder.read
  end
end

Test::Unit::TestCase.module_eval do
  include RecordingStandardStreams
end

