defmodule Blog.Web do
  @moduledoc """
  A module that keeps using definitions for controllers,
  views and so on.

  This can be used in your application as:

      use Blog.Web, :controller
      use Blog.Web, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below.
  """

  def model do
    quote do
      use Ecto.Schema

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
    end
  end

  def controller do
    quote do
      use Phoenix.Controller

      alias Blog.Repo
      import Ecto
      import Ecto.Query

      alias Blog.Router.Helpers, as: Routes
      import Blog.Gettext
      import Blog.Auth, only: [authenticate_user: 2, prevent_logged_in_user: 2]
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "web/templates"

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_csrf_token: 0, get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      alias Blog.Router.Helpers, as: Routes
      import Blog.ErrorHelpers
      import Blog.Gettext
    end
  end

  def router do
    quote do
      use Phoenix.Router

      import Blog.Auth, only: [authenticate_user: 2, prevent_logged_in_user: 2]
    end
  end

  def channel do
    quote do
      use Phoenix.Channel

      alias Blog.Repo
      import Ecto
      import Ecto.Query
      import Blog.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
