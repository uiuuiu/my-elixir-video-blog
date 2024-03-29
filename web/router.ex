defmodule Blog.Router do
  use Blog.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Blog.Auth, repo: Blog.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Blog do
    # Use the default browser stack
    pipe_through :browser

    get "/hello/:name", HelloController, :world
    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    get "/watch/:id", WatchController, :show
  end

  scope "/manage", Blog do
    pipe_through [:browser, :authenticate_user]
    resources "/videos", VideoController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Blog do
  #   pipe_through :api
  # end
end
