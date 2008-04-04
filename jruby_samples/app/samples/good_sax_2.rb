import org.xml.sax.helpers.DefaultHandler
import org.xml.sax.helpers.XMLReaderFactory
import org.xml.sax.InputSource
import java.io.FileReader

class MyHandler < DefaultHandler
  def startElement(uri, name, qname, attrs)
    puts "Saw element #{name}"
  end
end

reader = XMLReaderFactory.createXMLReader
reader.content_handler = reader.error_handler = MyHandler.new

reader.parse InputSource.new(FileReader.new("public/404.html"))

