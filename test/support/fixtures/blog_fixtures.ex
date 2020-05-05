defmodule DemoLiveApp.BlogFixtures do
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        body: "some body",
        rating: 42,
        title: "some title"
      })
      |> DemoLiveApp.Blog.create_post()

    post
  end
end
