defmodule Dispatcher do
  use Matcher

  define_accept_types [
    json: [ "application/json", "application/vnd.api+json" ],
    html: [ "text/html", "application/xhtml+html" ],
    image: ["image/*"],
    any: [ "*/*" ]
  ]

  define_layers [ :cors, :static, :api, :frontend_fallback, :not_found ]

  @json_service %{ accept: [:json], layer: :api }
  @image %{ accept: [:image] }
  # @html %{ accept: %{ html: true } }

  options "/*_path", %{ layer: :cors } do
    conn
    |> Plug.Conn.put_resp_header( "access-control-allow-headers", "content-type,accept" )
    |> Plug.Conn.put_resp_header( "access-control-allow-methods", "*" )
    |> send_resp( 200, "{ \"message\": \"ok\" }" )
  end

  match "/trees/*path", @json_service do
    Proxy.forward conn, path, "http://cache/trees/"
  end

  match "/tree-nodes/*path", @json_service do
    Proxy.forward conn, path, "http://cache/tree-nodes/"
  end

  match "/points-of-interest/*path", @json_service do
    Proxy.forward conn, path, "http://cache/points-of-interest/"
  end

  match "/experiences/*path", @json_service do
    Proxy.forward conn, path, "http://cache/experiences/"
  end

  match "/entrances/*path", @json_service do
    Proxy.forward conn, path, "http://cache/entrances/"
  end

  match "/experience-tree-node-scores/*path", @json_service do
    Proxy.forward conn, path, "http://cache/experience-tree-node-scores/"
  end

  match "/toilets/*path", @json_service do
    Proxy.forward conn, path, "http://cache/toilets/"
  end

  match "/areas/*path", @json_service do
    Proxy.forward conn, path, "http://cache/areas/"
  end

  match "/parkings/*path", @json_service do
    Proxy.forward conn, path, "http://cache/parkings/"
  end

  match "/paths/*path", @json_service do
    Proxy.forward conn, path, "http://cache/paths/"
  end

  match "/train-stops/*path", @json_service do
    Proxy.forward conn, path, "http://cache/train-stops/"
  end

  match "/bus-stops/*path", @json_service do
    Proxy.forward conn, path, "http://cache/bus-stops/"
  end

  match "/tram-stops/*path", @json_service do
    Proxy.forward conn, path, "http://cache/tram-stops/"
  end

  match "/route-descriptions/*path", @json_service do
    Proxy.forward conn, path, "http://cache/route-descriptions/"
  end

  match "/routes/*path", @json_service do
    Proxy.forward conn, path, "http://cache/routes/"
  end

  match "/files/*path", @json_service do
    Proxy.forward conn, path, "http://cache/files/"
  end

  match "/guided-tours/*path", @json_service do
    Proxy.forward conn, path, "http://cache/guided-tours/"
  end

  match "/auditoria/*path", @json_service do
    Proxy.forward conn, path, "http://cache/auditoria/"
  end

  match "/restaurants/*path", @json_service do
    Proxy.forward conn, path, "http://cache/restaurants/"
  end

  match "/shops/*path", @json_service do
    Proxy.forward conn, path, "http://cache/shops/"
  end

  match "/images/*path", %{ layer: :static } do
    Proxy.forward conn, path, "http://imageservice/image/"
  end

  match "/file-service/files/*path", %{ layer: :api } do
    Proxy.forward conn, path, "http://file/files/"
  end

  match "/favicon.ico/*_path", _ do
    send_resp( conn, 404, "No icon specified" )
  end    

  match "/assets/*path", %{ reverse_host: ["standalone" | _rest ], layer: :static } do
    Proxy.forward conn, path, "http://frontend-standalone/assets/"
  end

  match "/assets/*path", %{ reverse_host: ["entry" | _rest ], layer: :static } do
    Proxy.forward conn, path, "http://frontend-entry/assets/"
  end

  match "/@appuniversum/*path", %{ reverse_host: ["standalone" | _rest ], layer: :static } do
    Proxy.forward conn, path, "http://frontend-standalone/@appuniversum/"
  end

  match "/@appuniversum/*path", %{ reverse_host: ["entry" | _rest ], layer: :static } do
    Proxy.forward conn, path, "http://frontend-entry/@appuniversum/"
  end

  match "/*path", %{ reverse_host: ["standalone" | _rest], layer: :frontend_fallback } do
    Proxy.forward conn, path, "http://frontend-standalone/index.html"
  end

  match "/*path", %{ reverse_host: ["entry" | _rest], layer: :frontend_fallback } do
    Proxy.forward conn, path, "http://frontend-entry/index.html"
  end

  match "/*_path", %{ last_call: true } do
    send_resp( conn, 404, "Route not found.  See config/dispatcher.ex" )
  end
end
