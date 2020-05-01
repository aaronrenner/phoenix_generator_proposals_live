defmodule DemoLiveApp.BlogFixtures do
  def valid_post_body, do: "some body"
  def valid_post_rating, do: 42
  def valid_post_title, do: "some title"

  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> post_attrs_fixture()
      |> DemoLiveApp.Blog.create_post()

    post
  end

  def post_attrs_fixture(attrs \\ %{}) do
    Enum.into(attrs, %{
      body: valid_post_body(),
      rating: valid_post_rating(),
      title: valid_post_title()
    })
  end

  def update_post_attrs_fixture(attrs \\ %{}) do
    Enum.into(attrs, %{
      body: "some updated body",
      rating: 43,
      title: "some updated title"
    })
  end

  def invalid_post_attrs_fixture(attrs \\ %{}) do
    Enum.into(attrs, %{
      body: nil,
      rating: nil,
      title: nil
    })
  end
end
