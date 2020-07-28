defmodule Dispatcher do
  use Matcher

  define_accept_types [
    json: [ "application/json", "application/vnd.api+json" ],
    html: [ "text/html", "application/xhtml+html" ],
    any: [ "*/*" ]
  ]

  @json %{ accept: %{ json: true } }
  # @html %{ accept: %{ html: true } }

  options "/*_path" do
    conn
    |> Plug.Conn.put_resp_header( "access-control-allow-headers", "content-type,accept" )
    |> Plug.Conn.put_resp_header( "access-control-allow-methods", "*" )
    |> send_resp( 200, "{ \"message\": \"ok\" }" )
  end

  match "/trees/*path", @json do
    Proxy.forward conn, path, "http://resource/trees/"
  end

  match "/tree-nodes/*path", @json do
    Proxy.forward conn, path, "http://resource/tree-nodes/"
  end

  match "/points-of-interest/*path", @json do
    Proxy.forward conn, path, "http://resource/points-of-interest/"
  end

  match "/experiences/*path", @json do
    Proxy.forward conn, path, "http://resource/experiences/"
  end

  match "/entrances/*path", @json do
    Proxy.forward conn, path, "http://resource/entrances/"
  end

  match "/experience-tree-node-scores/*path", @json do
    Proxy.forward conn, path, "http://resource/experience-tree-node-scores/"
  end

  match "/toilets/*path", @json do
    Proxy.forward conn, path, "http://resource/toilets/"
  end

  match "/areas/*path", @json do
    Proxy.forward conn, path, "http://resource/areas/"
  end

  match "/parkings/*path", @json do
    Proxy.forward conn, path, "http://resource/parkings/"
  end

  match "/paths/*path", @json do
    Proxy.forward conn, path, "http://resource/paths/"
  end

  match "/train-stops/*path", @json do
    Proxy.forward conn, path, "http://resource/train-stops/"
  end

  match "/bus-stops/*path", @json do
    Proxy.forward conn, path, "http://resource/bus-stops/"
  end

  match "/tram-stops/*path", @json do
    Proxy.forward conn, path, "http://resource/tram-stops/"
  end

  match "/route-descriptions/*path", @json do
    Proxy.forward conn, path, "http://resource/route-descriptions/"
  end

  match "/favicon.ico/*_path", _ do
    send_resp( conn, 404, "No icon specified" )
  end

  match "/assets/*path", %{ host: full_host } do
    case Enum.reverse( full_host ) do
      ["standalone" | _ ] -> Proxy.forward conn, path, "http://frontend-standalone/assets/"
      ["entry" | _ ] -> Proxy.forward conn, path, "http://frontend-entry/assets/"
    end
  end

  match "/*path", %{ host: full_host, accept: %{ html: true } } do
    case Enum.reverse( full_host ) do
      ["standalone" | _ ] -> Proxy.forward conn, path, "http://frontend-standalone/index.html"
      ["entry" | _ ] -> Proxy.forward conn, path, "http://frontend-entry/index.html"
    end
  end

  match "/*_path", %{ last_call: true } do
    send_resp( conn, 404, "Route not found.  See config/dispatcher.ex" )
  end

end
