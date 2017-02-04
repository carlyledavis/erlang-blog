defmodule Blog.Webplug do
    use Plug.Router

    plug :match
    plug :dispatch

    def init(options) do
      options
    end

    def start_link do
      Plug.Adapters.Cowboy.http(Plugger.Router, [])
    end

    get "/" do
      IO.puts "This is asking for something."
      send_resp( conn, 200, "ok" )
    end

    get "/:resource" do
      send_resp( conn, 200, (Earmark.to_html (File.read! resource)))
    end

    get "articles/:resource" do
      send_resp( conn, 200, (Earmark.to_html (article_route resource)))
    end

    def article_route(path) do
        File.read! "articles/" <> path
    end

    def parse_route( "/" <> remaining) do
        tokens = String.split( remaining, "/" )
    end


end