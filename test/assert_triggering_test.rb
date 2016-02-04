require 'test_helper'

class AssertTriggeringTest < ActiveSupport::TestCase

  test "truth" do
    assert_kind_of Module, AssertTriggering
  end

  test "false" do
    assert_false false
  end

  test "triggering event" do

    event_name = 'global.test.event.name'
    payload    = { time: Time.now }

    ActiveSupport::Notifications.instrument event_name, payload do

    end

    assert_triggered event_name
    assert_not_triggered 'some.strange.event'

    # event is not triggered twice, so
    assert_not_triggered event_name

  end

end
