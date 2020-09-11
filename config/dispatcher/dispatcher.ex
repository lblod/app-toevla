defmodule Dispatcher do
  use Matcher

  define_accept_types [
    json: [ "application/json", "application/vnd.api+json" ],
    html: [ "text/html", "application/xhtml+html" ],
    image: ["image/*"],
    any: [ "*/*" ]
  ]

  @json %{ accept: %{ json: true } }
  @image %{ accept: %{ image: true } }
  # @html %{ accept: %{ html: true } }

  options "/*_path" do
    conn
    |> Plug.Conn.put_resp_header( "access-control-allow-headers", "content-type,accept" )
    |> Plug.Conn.put_resp_header( "access-control-allow-methods", "*" )
    |> send_resp( 200, "{ \"message\": \"ok\" }" )
  end

  match "/trees/*path", @json do
    Proxy.forward conn, path, "http://cache/trees/"
  end

  match "/tree-nodes/*path", @json do
    Proxy.forward conn, path, "http://cache/tree-nodes/"
  end

  match "/points-of-interest/*path", @json do
    Proxy.forward conn, path, "http://cache/points-of-interest/"
  end

  match "/experiences/*path", @json do
    Proxy.forward conn, path, "http://cache/experiences/"
  end

  match "/entrances/*path", @json do
    Proxy.forward conn, path, "http://cache/entrances/"
  end

  match "/experience-tree-node-scores/*path", @json do
    Proxy.forward conn, path, "http://cache/experience-tree-node-scores/"
  end

  match "/toilets/*path", @json do
    Proxy.forward conn, path, "http://cache/toilets/"
  end

  match "/areas/*path", @json do
    Proxy.forward conn, path, "http://cache/areas/"
  end

  match "/parkings/*path", @json do
    Proxy.forward conn, path, "http://cache/parkings/"
  end

  match "/paths/*path", @json do
    Proxy.forward conn, path, "http://cache/paths/"
  end

  match "/train-stops/*path", @json do
    Proxy.forward conn, path, "http://cache/train-stops/"
  end

  match "/bus-stops/*path", @json do
    Proxy.forward conn, path, "http://cache/bus-stops/"
  end

  match "/tram-stops/*path", @json do
    Proxy.forward conn, path, "http://cache/tram-stops/"
  end

  match "/route-descriptions/*path", @json do
    Proxy.forward conn, path, "http://cache/route-descriptions/"
  end

  match "/routes/*path", @json do
    Proxy.forward conn, path, "http://cache/routes/"
  end

  match "/files/*path", @json do
    Proxy.forward conn, path, "http://cache/files/"
  end

  match "/guided-tours/*path", @json do
    Proxy.forward conn, path, "http://cache/guided-tours/"
  end

  match "/auditoria/*path", @json do
    Proxy.forward conn, path, "http://cache/auditoria/"
  end

  match "/restaurants/*path", @json do
    Proxy.forward conn, path, "http://resource/restaurants/"
  end

  match "/shops/*path", @json do
    Proxy.forward conn, path, "http://resource/shops/"
  end

  match "/images/*path", @image do
    Proxy.forward conn, path, "http://imageservice/image/"
  end

  match "/file-service/files/*path", _ do
    Proxy.forward conn, path, "http://file/files/"
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

  match "/@appuniversum/*path", %{ host: full_host } do
    case Enum.reverse( full_host ) do
      ["standalone" | _ ] -> Proxy.forward conn, path, "http://frontend-standalone/@appuniversum/"
      ["entry" | _ ] -> Proxy.forward conn, path, "http://frontend-entry/@appuniversum/"
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
