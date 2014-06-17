require 'test_helper'

class UsedWordsControllerTest < ActionController::TestCase
  setup do
    @used_word = used_words(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:used_words)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create used_word" do
    assert_difference('UsedWord.count') do
      post :create, used_word: { round_id: @used_word.round_id, word_id: @used_word.word_id }
    end

    assert_redirected_to used_word_path(assigns(:used_word))
  end

  test "should show used_word" do
    get :show, id: @used_word
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @used_word
    assert_response :success
  end

  test "should update used_word" do
    patch :update, id: @used_word, used_word: { round_id: @used_word.round_id, word_id: @used_word.word_id }
    assert_redirected_to used_word_path(assigns(:used_word))
  end

  test "should destroy used_word" do
    assert_difference('UsedWord.count', -1) do
      delete :destroy, id: @used_word
    end

    assert_redirected_to used_words_path
  end
end
