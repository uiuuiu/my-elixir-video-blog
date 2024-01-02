defmodule Blog.WatchController do
  use Blog.Web, :controller
  alias Blog.Video

  def show(conn, %{"id" => id}) do
    video = Repo.get!(Video, id)
    render conn, "show.html", video: video
  end
end