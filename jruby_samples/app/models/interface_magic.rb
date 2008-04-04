import 'javax.xml.parsers.DocumentBuilderFactory'

DomDoc = org.w3c.dom.Document

class DomDoc
  def self.new
    DocumentBuilderFactory.newInstance.newDocumentBuilder.newDocument
  end
end
