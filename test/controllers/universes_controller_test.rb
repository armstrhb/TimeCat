require 'test_helper'

class UniversesControllerTest < ActionController::TestCase
  test "/(root) should give you a list of universes (index action)" do
    assert_routing '/', { controller: 'universes', action: 'index' }
    assert_routing '', { controller: 'universes', action: 'index' }
  end

  test "/:name should give you universe detail" do
    assert_routing '/lotr', { controller: 'universes', action: 'show', name: 'lotr' }
  end

  test "/(root) should give you a list of universes" do
    get :index
    assert_response :success
    assert_not_nil assigns(:universes)
  end

  test "/:name should give you a universe detail" do
    get :show, name: universes(:lotr).name
    assert_response :success
    assert_not_nil assigns(:universe)
    assert_not_nil assigns(:events)
  end
end
