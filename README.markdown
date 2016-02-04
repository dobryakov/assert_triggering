= AssertTriggering

![](http://ruby-gem-downloads-badge.herokuapp.com/assert_triggering?type=total)

Usage
-------------------

Gemfile:

    gem 'assert_triggering', group: :test

Your tests:

    assert_triggered 'expected.event.name'
    assert_not_triggered 'some.strange.event'
