require "test_helper"

class DocumentFactoryTest < ActiveSupport::TestCase
  test "should create a WordDocument instance" do
    doc = DocumentFactory.create_document(:word, "Test Report")
    assert_instance_of WordDocument, doc
  end

  test "should create an ExcelDocument instance" do
    doc = DocumentFactory.create_document(:excel, "Test Spreadsheet")
    assert_instance_of ExcelDocument, doc
  end

  test "should create a TextDocument instance" do
    doc = DocumentFactory.create_document(:text, "Test Text Document")
    assert_instance_of TextDocument, doc
  end

  test "should raise an error for an invalid document type" do
    assert_raises(ArgumentError) do
      DocumentFactory.create_document(:pdf, "Invalid Document")
    end
  end
end
