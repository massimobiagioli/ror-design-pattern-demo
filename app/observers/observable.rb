module Observable
  def initialize
    @observers = {}
  end

  def add_observer(key, observer)
    @observers[key] = observer
  end

  def remove_observer(key)
    @observers.delete(key)
  end

  def notify_observers(event_type, data)
    @observers.values.each do |observer|
      observer.update(event_type, data)
    end
  end
end
