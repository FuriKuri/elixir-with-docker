defmodule Elixirdocker.Handler do

  def init(_type, req, []) do
    {:ok, req, :no_state}
  end

  def handle(request, state) do
    IO.puts request
    { :ok, reply } = :cowboy_req.reply( 
      200, 
      [ {"content-type", "text/html"} ],
      "Hello World",
      request
    )
    {:ok, reply, state}
  end

  def terminate(reason, request, state) do
    :ok
  end

  def build_body(request) do
    "Hello World!!"
  end

  def dl_headers(request) do  
    {headers, req2 } = :cowboy_req.headers(request)
    Enum.map(headers, fn item -> "<dt>#{elem(item, 0)}</dt><dd>#{elem(item, 1)}</dd>" end)
  end
end
