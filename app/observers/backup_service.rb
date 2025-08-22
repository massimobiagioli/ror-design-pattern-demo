class BackupService
  def update(event_type, data)
    if event_type == :document_saved
      puts "BackupService: Backing up document '#{data[:title]}'."
    end
  end
end
