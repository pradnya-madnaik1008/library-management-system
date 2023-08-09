# frozen_string_literal: true

require 'test_helper'

class LibrariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @library = libraries(:one)
  end

  test 'should get index' do
    get libraries_url, as: :json
    assert_response :success
  end

  test 'should create library' do
    assert_difference('Library.count') do
      post libraries_url,
           params: { library: { borrow_limit: @library.borrow_limit, location: @library.location, name: @library.name, overdue_fines: @library.overdue_fines, university: @library.university } }, as: :json
    end

    assert_response 201
  end

  test 'should show library' do
    get library_url(@library), as: :json
    assert_response :success
  end

  test 'should update library' do
    patch library_url(@library),
          params: { library: { borrow_limit: @library.borrow_limit, location: @library.location, name: @library.name, overdue_fines: @library.overdue_fines, university: @library.university } }, as: :json
    assert_response 200
  end

  test 'should destroy library' do
    assert_difference('Library.count', -1) do
      delete library_url(@library), as: :json
    end

    assert_response 204
  end
end
