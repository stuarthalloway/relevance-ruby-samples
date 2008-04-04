require 'java'

class MyHandler < org.xml.sax.helpers.DefaultHandler
  def startElement(uri, name, qname, attrs)
    puts "Saw element #{name}"
  end
end

reader = org.xml.sax.helpers.XMLReaderFactory.createXMLReader
handler = MyHandler.new
reader.setContentHandler handler
reader.setErrorHandler handler

reader.parse org.xml.sax.InputSource.new(java.io.FileReader.new("public/404.html"))

