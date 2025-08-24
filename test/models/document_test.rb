require "test_helper"

class DocumentTest < ActiveSupport::TestCase
  def setup
    @doc = Document.new("My Report")
  end

  test "observers are notified when the document is saved" do
    backup_service = Minitest::Mock.new
    logger_service = Minitest::Mock.new

    backup_service.expect(:update, nil, [ :document_saved, { title: "My Report", content: "" } ])
    logger_service.expect(:update, nil, [ :document_saved, { title: "My Report", content: "" } ])

    @doc.add_observer(:backup, backup_service)
    @doc.add_observer(:logger, logger_service)

    @doc.save

    assert_equal @doc.title, "My Report"

    backup_service.verify
    logger_service.verify
  end

  test "removing an observer prevents notification" do
    backup_service = Minitest::Mock.new
    logger_service = Minitest::Mock.new

    backup_service.expect(:update, nil, [ :document_saved, { title: "My Report", content: "" } ])
    logger_service.expect(:update, nil, [ :document_saved, { title: "My Report", content: "" } ])

    @doc.add_observer(:backup, backup_service)
    @doc.add_observer(:logger, logger_service)
    @doc.remove_observer(:logger)

    @doc.save

    assert_equal @doc.title, "My Report"

    backup_service.verify

    assert_raises(MockExpectationError) do
      logger_service.verify
    end
  end

  test "adding export strategy" do
    export_strategy = Minitest::Mock.new

    export_strategy.expect(:export, nil, [ @doc ])

    @doc.set_export_strategy(export_strategy)
    @doc.export

    export_strategy.verify
  end
end
