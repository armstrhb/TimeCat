require 'test_helper'

class TimelinesControllerTest < ActionController::TestCase
  test "/timelines should give you a list of universes (index action)" do
    assert_routing '/timelines', { controller: 'timelines', action: 'index' }
  end

  test "/timelines/:name should map to universe:show for that universe" do
    assert_routing '/timelines/lotr', { controller: 'timelines', action: 'show', name: 'lotr'}
  end

  test "/timelines should give you a list of universes" do
    get :index
    assert_response :success
    assert_not_nil assigns(:universes)
  end

  test "/timelines/:name should give you a universe detail" do
    get :show, name: universes(:lotr).name
    assert_response :success
    assert_not_nil assigns(:universe)
    assert_not_nil assigns(:events)
  end
end
