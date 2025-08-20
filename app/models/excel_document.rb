class ExcelDocument < Document
  def open
    "Opening Excel spreadsheet: #{@title}"
  end
end
