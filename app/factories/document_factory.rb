class DocumentFactory
  def self.create_document(type, title)
    case type
    when :word
      WordDocument.new(title)
    when :excel
      ExcelDocument.new(title)
    when :text
      TextDocument.new(title)
    else
      raise ArgumentError, "Invalid document type: #{type}"
    end
  end
end
