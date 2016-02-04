module AssertTriggering

  class DelayedJobObserver

    def initialize

      self.flush

      ActiveSupport::Notifications.subscribe do |*args|
        event_name = args[0]
        payload    = args[4]
        @events[event_name] = {} if @events[event_name].nil?
        @events[event_name]['pointer'] = 0 if @events[event_name]['pointer'].nil?
        @events[event_name]['history'] = [] if @events[event_name]['history'].nil?
        @events[event_name]['history'].push ({event_name: event_name, payload: payload})
      end

      super

    end

    def events
      @events
    end

    def flush
      @events = {}
    end

    def assert_triggered(event_name)
      if @events[event_name].nil? || @events[event_name]['history'].count == @events[event_name]['pointer']
        false
      else
        @events[event_name]['pointer'] = @events[event_name]['history'].count
        true
      end
    end

  end

  class ActiveSupport::TestCase

    def assert_false(test, message="Expected: false. Actual: #{test}.")
      assert_equal false, test, message
    end

    setup do
      @delayed_job_observer = DelayedJobObserver.new
    end

    def assert_triggered(event_name, message = nil)
      assert @delayed_job_observer.assert_triggered(event_name), message
    end

    def assert_not_triggered(event_name, message = nil)
      assert_false @delayed_job_observer.assert_triggered(event_name), message
    end

  end

end
