require "test_helper"

class DocumentManagerTest < ActiveSupport::TestCase
  test "should be the same instance every time" do
    manager1 = DocumentManager.instance
    manager2 = DocumentManager.instance
    assert_equal manager1.object_id, manager2.object_id
    assert_same manager1, manager2
  end

  test "should open and list a document" do
    manager = DocumentManager.instance
    manager.open_document("Invoice.pdf", "Content of the invoice...")
    assert_includes manager.list_open_documents, "Invoice.pdf"
  end

  test "should close a document" do
    manager = DocumentManager.instance
    manager.open_document("MeetingNotes.txt", "Notes from the meeting.")
    manager.close_document("MeetingNotes.txt")
    assert_not_includes manager.list_open_documents, "MeetingNotes.txt"
  end

  test "should prevent direct instantiation" do
    assert_raises(NoMethodError) do
      DocumentManager.new
    end
  end
end
