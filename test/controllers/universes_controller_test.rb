require 'test_helper'

class UniversesControllerTest < ActionController::TestCase
  test "/(root) should give you a list of universes (index action)" do
    assert_routing '/', { controller: 'universes', action: 'index' }
    assert_routing '', { controller: 'universes', action: 'index' }
  end

  test "/:name should give you universe detail" do
    assert_routing '/lotr', { controller: 'universes', action: 'show', name: 'lotr' }
  end

  test "/:name/description (put) should route to universe update_description" do
    assert_routing({ method: 'post', path: '/lotr/description' }, { controller: 'universes', action: 'update_description', name: 'lotr'})
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

  test "post /:name/description updates the universes's description" do
    xhr :post, :update_description, { name: universes(:lotr).name, description: universes(:lotr).description + " and even more!" }
    assert_response :success
  end
end
