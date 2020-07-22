defmodule Dispatcher do
  use Matcher

  define_accept_types [
    json: [ "application/json", "application/vnd.api+json" ],
    any: [ "*/*" ]
  ]

  # In order to forward the 'themes' resource to the
  # resource service, use the following forward rule.
  #
  # docker-compose stop; docker-compose rm; docker-compose up
  # after altering this file.
  #
  # match "/themes/*path" do
  #   Proxy.forward conn, path, "http://resource/themes/"
  # end
  options "*path" do
    conn =
      conn
      |> Plug.Conn.put_resp_header( "access-control-allow-headers", "content-type,accept" )
      |> Plug.Conn.put_resp_header( "access-control-allow-methods", "*" )

    send_resp( conn, 200, "{ \"message\": \"ok\" }" )
  end

  match "/trees/*path", %{ accept: %{ json: true } } do
    Proxy.forward conn, path, "http://resource/trees/"
  end

  match "/tree-nodes/*path", %{ accept: %{ json: true } } do
    Proxy.forward conn, path, "http://resource/tree-nodes/"
  end

  match "/points-of-interest/*path", %{ accept: %{ json: true } } do
    Proxy.forward conn, path, "http://resource/points-of-interest/"
  end

  match "/experiences/*path", %{ accept: %{ json: true } } do
    Proxy.forward conn, path, "http://resource/experiences/"
  end

  match "/experiences/*path", %{ accept: %{ json: true } } do
    Proxy.forward conn, path, "http://resource/experiences/"
  end

  match "/entrances/*path", %{ accept: %{ json: true } } do
    Proxy.forward conn, path, "http://resource/entrances/"
  end

  match "/experience-tree-node-scores/*path", %{ accept: %{ json: true } } do
    Proxy.forward conn, path, "http://resource/experience-tree-node-scores/"
  end

  match "/toilets/*path", _ do
    Proxy.forward conn, path, "http://resource/toilets/"
  end

  match "/areas/*path", _ do
    Proxy.forward conn, path, "http://resource/areas/"
  end

  match "/parkings/*path", _ do
    Proxy.forward conn, path, "http://resource/parkings/"
  end

  match "/paths/*path", _ do
    Proxy.forward conn, path, "http://resource/paths/"
  end

  match "_*path", %{ last_call: true } do
    send_resp( conn, 404, "Route not found.  See config/dispatcher.ex" )
  end

end
