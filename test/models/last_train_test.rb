# encoding: utf-8

require 'test_helper'

class LastTrainTest < ActiveSupport::TestCase
  test "ensure" do
    lt = LastTrain.ensure("溜池山王", "新宿")
    assert_equal lt.depature, "溜池山王"
    assert_equal lt.destination, "新宿"
    assert_not_nil lt.depature_at
  end

end
