defmodule Blog.HelloController do
  use Blog.Web, :controller

  def world(conn, %{"name" => name}) do
    render conn, "world.html", name: name
  end
end