= AssertTriggering

Usage
-------------------

Gemfile:

    gem 'assert_triggering', group: :test

Your tests:

    assert_triggered 'expected.event.name'
    assert_not_triggered 'some.strange.event'
