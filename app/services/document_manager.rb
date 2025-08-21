class DocumentManager
  include Singleton

  def initialize
    @open_documents = {}
  end

  def open_document(doc_title, content)
    @open_documents[doc_title] = content
    "Document '#{doc_title}' opened."
  end

  def close_document(doc_title)
    if @open_documents.delete(doc_title)
      "Document '#{doc_title}' closed."
    else
      "Document '#{doc_title}' is not open."
    end
  end

  def list_open_documents
    @open_documents.keys
  end
end
