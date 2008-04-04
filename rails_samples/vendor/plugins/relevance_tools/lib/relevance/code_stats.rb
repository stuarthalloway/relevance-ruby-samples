# gradually customizing the Rails stats code into something to generate file stat uploads
# across projects
module Relevance
  module Stats
    class FileStat
      attr_accessor :file, :lines, :classes, :methods, :codelines

      def initialize
        @lines = @classes = @methods = @codelines = 0
      end

      def read(file)
        @file = file
        File.open(file) do |f|
          while line = f.gets
            self.lines += 1
            self.classes += 1 if line =~ /class [A-Z]/
            self.methods += 1 if line =~ /def [a-z]/
            self.codelines += 1 unless line =~ /^\s*$/ || line =~ /^\s*#/
          end
        end
      end
    end

    class DirStat
      attr_accessor :glob, :file_stats, :lines, :classes, :methods, :codelines

      def initialize(glob)
        @lines = @classes = @methods = @codelines = 0
        @glob = glob
        @file_stats = []
        Dir.glob(glob) do |file|
          if !File.stat(file).directory? and (/^\./ !~ file)
            file_stat = FileStat.new
            file_stat.read(file)
            @file_stats << file_stat
          end
        end
        @file_stats.each do |file_stat|
          self.lines += file_stat.lines
          self.classes += file_stat.classes
          self.methods += file_stat.methods
          self.codelines += file_stat.codelines
        end
      end
    end

    class CodeStatistics #:nodoc:
      attr_accessor :code_stats, :test_stats

      def initialize(code_globs, test_globs)
        @code_stats = []
        @test_stats = []
        code_globs.each do |glob|
          @code_stats << DirStat.new(glob)
        end
        test_globs.each do |glob|
          @test_stats << DirStat.new(glob)
        end
      end

      def to_s
        print_header
        @code_stats.each { |stat| print_line(stat) }
        print_splitter
        @test_stats.each { |stat| print_line(stat) }
      end

      private
      def print_header
        print_splitter
        puts "| Name                 | Lines |   LOC | Classes | Methods | M/C | LOC/M |"
        print_splitter
      end

      def print_splitter
        puts "+----------------------+-------+-------+---------+---------+-----+-------+"
      end

      def print_line(stat)
        start = "| #{stat.glob.ljust(20)} "
        puts start + 
             "| #{stat.lines.to_s.rjust(5)} " +
             "| #{stat.codelines.to_s.rjust(5)} " +
             "| #{stat.classes.to_s.rjust(7)} " +
             "| #{stat.methods.to_s.rjust(7)} "
      end
    end
  end
end
