defmodule DemoLiveApp.BlogTest do
  use DemoLiveApp.DataCase

  alias DemoLiveApp.Blog

  describe "posts" do
    import DemoLiveApp.BlogFixtures

    alias DemoLiveApp.Blog.Post

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Blog.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Blog.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      post_attrs = post_attrs_fixture()

      assert {:ok, %Post{} = post} = Blog.create_post(post_attrs)

      assert post.body == post_attrs.body
      assert post.rating == post_attrs.rating
      assert post.title == post_attrs.title
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, changeset} = Blog.create_post(invalid_post_attrs_fixture())

      assert %{body: ["can't be blank"]} = errors_on(changeset)
      assert %{rating: ["can't be blank"]} = errors_on(changeset)
      assert %{title: ["can't be blank"]} = errors_on(changeset)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      update_attrs = update_post_attrs_fixture()

      assert {:ok, %Post{} = post} = Blog.update_post(post, @update_attrs)

      assert post.body == update_attrs.body
      assert post.rating == update_attrs.rating
      assert post.title == update_attrs.title
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_post(post, invalid_post_attrs_fixture())
      assert post == Blog.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Blog.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      assert %Ecto.Changeset{} = changeset = Blog.change_post(%Post{})

      assert %{body: ["can't be blank"]} = errors_on(changeset)
      assert %{rating: ["can't be blank"]} = errors_on(changeset)
      assert %{title: ["can't be blank"]} = errors_on(changeset)
    end
  end
end
