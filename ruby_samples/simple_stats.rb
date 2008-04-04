# codecite require
require 'optparse'
require 'ostruct'
# codecite require

# codecite get_options
def get_options
  options = OpenStruct.new
  opts = OptionParser.new
  # codecite get_options

  # codecite banner
  opts.banner = "Usage: [#{__FILE__}] [options]"
  
  # codecite boolean
  opts.on('-m', '--methods', 'Print methods') {options.methods=true}
  opts.on('-c', '--classes', 'Print classes') {options.classes=true}
  # codecite boolean

  # codecite Integer
  opts.on('-L', '--lines N', Integer, 'Process N lines') do |lines|
    options.lines = lines
  end
  # codecite Integer

  # codecite Array
  opts.on('-s', '--skip w1,w2,...', Array, 'Skip lines containing w1,w2') do |words|
    options.skip = words
  end
  # codecite Array

  # codecite help
  opts.on_tail('-h', '--help', 'Show this message') do
    puts opts
    exit
  end
  # codecite help

  # codecite version
  opts.on_tail('-v', '--version', 'Show version') do
    puts '1.0.0'
    exit
  end
  # codecite version

  # codecite parse
  puts "ARGV=#{ARGV.inspect}"
  opts.parse!(ARGV)
  options  
end
options = get_options
# codecite parse

# codecite debug
options.send(:table).each do |k,v|
  puts "%-15s: %s(%s)" % [k,v.inspect,v.class]
end
# codecite debug

# codecite implementation
catch(:done) do
  while (line=gets)
    catch(:skip) do
      if options.skip
        options.skip.each do |skip|
          throw :skip if line=~Regexp.new(skip)
        end
      end
      if options.methods && line=~/def\s+(\w+)/
        puts $1
      end
      if options.classes && line=~/class\s+(\w+)/
        puts $1
      end
      if options.lines
        options.lines = options.lines - 1
        throw :done if options.lines == 0
      end
    end
  end
end
# codecite implementation
