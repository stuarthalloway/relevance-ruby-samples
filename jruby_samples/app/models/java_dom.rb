require 'java'

import 'org.w3c.dom.Document'
import 'javax.xml.parsers.DocumentBuilderFactory'

def Document.new
  DocumentBuilderFactory.newInstance.newDocumentBuilder.newDocument
end
