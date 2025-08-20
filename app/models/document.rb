class Document
  def initialize(title)
    @title = title
  end

  def open
    raise NotImplementedError, "Devi implementare il metodo open nelle sottoclassi"
  end
end
