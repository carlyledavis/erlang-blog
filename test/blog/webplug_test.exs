defmodule Blog.Webplug.Test do
  @moduledoc false
  @doctest Blog.Webplug
  use ExUnit.Case, async: true

  test "Can digest routes and translated into a directory" do
    output = Blog.Webplug.parse_route "/test/route"
    assert output == {"/test", "route"}
  end

  test "Can digest routes that are nested" do
    output = Blog.Webplug.parse_route "/test/nested/route"
    assert output == { "/test/nested", "route"}
   end
end