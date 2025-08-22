class Logger
  def update(event_type, data)
    if event_type == :document_saved
      puts "Logger: Document '#{data[:title]}' was saved at #{Time.now}."
    end
  end
end
