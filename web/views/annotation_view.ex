defmodule Blog.AnnotationView do
  use Blog.Web, :view
  def render("annotation.json", %{annotation: ann}) do
    %{
      id: ann.id,
      body: ann.body,
      at: ann.at,
      user: render_one(ann.user, Blog.UserView, "user.json")
    }
  end
end