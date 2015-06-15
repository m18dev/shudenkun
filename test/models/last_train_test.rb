# encoding: utf-8

require 'test_helper'

class LastTrainTest < ActiveSupport::TestCase
  test "ensure" do
    lt = LastTrain.ensure("溜池山王", "新宿")
    assert_equal lt.depature, "溜池山王"
    assert_equal lt.destination, "新宿"
    assert_not_nil lt.depature_at
  end

  test "depature_time_at" do
    lt = LastTrain.new()
    lt.depature_at = "23:30"
    assert_equal lt.depature_time_at.strftime("%H:%M"), "23:30"
    assert_equal lt.depature_time_at.strftime("%d"), Time.new.strftime("%d")
  end

  test "depature_time_at over midnight" do
    lt = LastTrain.new()
    lt.depature_at = "01:00"
    assert_equal lt.depature_time_at.strftime("%H:%M"), "01:00"
    assert_equal lt.depature_time_at.strftime("%d"), (Time.new + 1.day).strftime("%d")
  end
end
