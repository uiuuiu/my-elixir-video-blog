defmodule Blog.CategoryRepoTest do
  use Blog.ModelCase
  alias Blog.Category

  test "alphabetical/1 orders by name" do
    Repo.insert!(%Category{name: "c"})
    Repo.insert!(%Category{name: "a"})
    Repo.insert!(%Category{name: "b"})
    query = Category |> Category.alphabetical()
    query = from c in query, select: c.name
    assert Repo.all(query) == ~w(a b c)
  end
end