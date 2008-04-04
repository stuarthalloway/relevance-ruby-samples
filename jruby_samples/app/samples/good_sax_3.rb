require 'java'
import org.xml.sax.ContentHandler
import org.xml.sax.helpers.XMLReaderFactory
import org.xml.sax.InputSource
import java.io.FileReader

reader = XMLReaderFactory.createXMLReader
reader.content_handler = ContentHandler.impl do |meth, *args|
  puts "Saw #{meth} with #{args.inspect}"
end

reader.parse InputSource.new(FileReader.new("public/404.html"))

