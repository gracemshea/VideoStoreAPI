require "test_helper"

describe MoviesController do
  let(:movie) { movies(:wild) }
  describe "index" do
    it "should get index" do
      get movies_path

      expect(response.header["Content-Type"]).must_include "json"
      must_respond_with :success
    end

    it "returns an Array with all movies" do
      get movies_path

      body = JSON.parse(response.body)

      expect(body).must_be_kind_of Array
      expect(body.length).must_equal Movie.count
    end

    it "returns movies with exactly the required fields" do
      keys = %w(id release_date title)

      get movies_path

      body = JSON.parse(response.body)

      body.each do |movie|
        expect(movie.keys.sort).must_equal keys
        expect(movie.keys.length).must_equal keys.length
      end
    end
  end

  describe "show" do
    it "can get a movie" do
      get movie_path(movies(:wild).id)

      must_respond_with :success
      expect(response.header["Content-Type"]).must_include "json"

      body = JSON.parse(response.body)
      body.must_be_kind_of Hash

      expected_keys = ["title", "overview", "release_date", "inventory", "available_inventory"]

      body.keys.each do |key|
        expected_keys.must_include key
      end
    end

    it "will return an error message if movie is not found" do
      id = -1
      get movie_path(id)
      must_respond_with :not_found
    end
  end
  # it "should get create" do
  #   get movies_create_url
  #   value(response).must_be :success?
  # end
end
