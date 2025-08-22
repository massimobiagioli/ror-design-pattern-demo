class Document
  include Observable

  attr_reader :title, :content

  def initialize(title, content = "")
    super()
    @title = title
    @content = content
  end

  def add_content(text)
    @content += text
  end

  def open
    raise NotImplementedError, "Devi implementare il metodo open nelle sottoclassi"
  end

  def save
    puts "Saving document: #{@title}"
    notify_observers(:document_saved, { title: @title, content: @content })
  end
end
