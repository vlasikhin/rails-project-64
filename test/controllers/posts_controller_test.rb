# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @user = users(:edric)
    sign_in(@user)

    @attrs = {
      title: [Faker::Books::Dune.title, Faker::Books::Dune.title].join(' '),
      body: [Faker::Books::Dune.quote, Faker::Books::Dune.quote].join(' '),
      category_id: categories(:arrakis).id
    }
  end

  test 'should get index / root' do
    get root_url
    assert_response :success
  end

  test 'should get show' do
    get post_url(@post)
    assert_response :success
  end

  test 'should get new' do
    get new_post_url
    assert_response :success
  end

  test 'should get create' do
    sign_in(@user)
    post posts_url, params: { post: @attrs }

    assert_redirected_to post_url(Post.last)

    post = Post.find_by(title: @attrs[:title])
    assert { post }
  end

  test 'should get edit' do
    get edit_post_url(@post)

    assert_response :success
  end

  test 'should get update' do
    sign_in(@user)
    patch post_url(@post), params: { post: @attrs }

    assert_redirected_to post_url(@post)

    @post.reload

    assert { @post.title == @attrs[:title] }
    assert { @post.body == @attrs[:body] }
  end

  test 'should get destroy' do
    delete post_url(@post)
    assert_response :redirect

    assert { !Post.find_by(id: @post.id) }
  end
end
