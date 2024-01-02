defmodule Blog.VideoViewTest do
  use Blog.ConnCase, async: true
  import Phoenix.View

  test "renders index.html", %{conn: conn} do
    videos = [%Blog.Video{id: "1", title: "dogs"},
    %Blog.Video{id: "2", title: "cats"}]
    content = render_to_string(Blog.VideoView, "index.html",
    conn: conn, videos: videos)
    assert String.contains?(content, "Listing videos")
    for video <- videos do
      assert String.contains?(content, video.title)
    end
  end

  test "renders new.html", %{conn: conn} do
    changeset = Blog.Video.changeset(%Blog.Video{})
    categories = [{"cats", 123}]
    content = render_to_string(Blog.VideoView, "new.html",
    conn: conn, changeset: changeset, categories: categories)
    assert String.contains?(content, "New video")
  end
end