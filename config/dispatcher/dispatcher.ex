defmodule Dispatcher do
  use Matcher

  define_accept_types [
    json: [ "application/json", "application/vnd.api+json" ],
    html: [ "text/html", "application/xhtml+html" ],
    image: ["image/*"],
    any: [ "*/*" ]
  ]

  define_layers [ :cors, :widget_embedding, :static_with_host, :static, :api, :frontend_fallback_with_host, :frontend_fallback, :not_found ]

  @json_service %{ accept: [:json], layer: :api }
  @image %{ accept: [:image] }


  ### GENERAL CATCHES for further cleaning

  match "/.well-known/*_path", _ do
    send_resp( conn, 200, "{ \"message\": \"ok\" }" )
  end

  match "/favicon.ico/*_path", _ do
    send_resp( conn, 404, "No icon specified" )
  end


  ### CORS

  options "/*_path", %{ layer: :cors } do
    conn
    |> Plug.Conn.put_resp_header( "access-control-allow-headers", "content-type,accept" )
    |> Plug.Conn.put_resp_header( "access-control-allow-methods", "*" )
    |> send_resp( 200, "{ \"message\": \"ok\" }" )
  end


  ###
  ## WIDGET EMBEDDING
  ##
  ## Some overrides for widget paths so we can run the widget from the
  ## data entry path.

  match "/assets/widget/initialize-widget.js", %{ layer: :widget_embedding } do
    Proxy.forward conn, [], "http://frontend-embed/assets/js/initialize-widget.js"
  end

  match "/assets/widget/*path", %{ layer: :widget_embedding } do
    Proxy.forward conn, path, "http://frontend-embed/assets/"
  end


  ###
  ## STATIC
  ##
  ## Normally static resources which we can only fetch through using the
  ## next path because they lack the right Accept Type

  match "/assets/*path", %{ reverse_host: ["widget" | _rest], layer: :static } do
    Proxy.forward conn, path, "http://frontend-standalone/assets/"
  end

  match "/@appuniversum/*path", %{ reverse_host: ["widget" | _rest], layer: :static } do
    Proxy.forward conn, path, "http://frontend-standalone/@appuniversum/"
  end

  match "/assets/*path", %{ layer: :static } do
    Proxy.forward conn, path, "http://frontend-entry/assets/"
  end

  match "/@appuniversum/*path", %{ layer: :static } do
    Proxy.forward conn, path, "http://frontend-entry/@appuniversum/"
  end

  match "/images/*path", %{ layer: :static } do
    Proxy.forward conn, path, "http://imageservice/image/"
  end


  ###
  ## CONTENT-NEGOTIATED ROUTES
  ##
  ## Some routes can be accessed either from the frontend or from the
  ## API.  Content negotiation will yield the right routes.  Basically,
  ## we should prefer the HTML if HTML is accepted so humans can see the
  ## right content.  Otherwise we yield the JSON response with the
  ## logical content.
  ##
  ## We position these together with content-negotiated routes for which
  ## only a single response should be supplied.

  ## Combined routes
  match "/widgets/*_path", %{ layer: :api, accept: %{ html: true } } do
    Proxy.forward conn, [], "http://frontend-standalone/index.html"
  end

  match "/widgets/*path", %{ layer: :api, accept: %{ json: true } } do
    Proxy.forward conn, path, "http://cache/widgets/"
  end

  ## Api Services
  match "/concept-schemes/*path", @json_service do
    Proxy.forward conn, path, "http://cache/concept-schemes/"
  end

  match "/concepts/*path", @json_service do
    Proxy.forward conn, path, "http://cache/concepts/"
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

  match "/scorables/*path", @json_service do
    Proxy.forward conn, path, "http://cache/scorables/"
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

  match "/people/*path", @json_service do
    Proxy.forward conn, path, "http://cache/people/"
  end

  match "/accounts/*path", @json_service do
    Proxy.forward conn, path, "http://cache/accounts/"
  end

  match "/file-service/files/*path", %{ layer: :api } do
    Proxy.forward conn, path, "http://file/files/"
  end

  match "/mocklogin/*path", @json_service do
    Proxy.forward conn, path, "http://mocklogin/"
  end

  post "/sessions/role/*path", @json_service do
    Proxy.forward conn, [], "http://switchrole/sessions/role"
  end
  match "/sessions/*path", @json_service do
    # We go to resource as we expect this might create race conditions
    # with the delta messages otherwise.
    Proxy.forward conn, path, "http://resource/sessions/"
  end
  match "/roles/*path", @json_service do
    Proxy.forward conn, path, "http://cache/roles/"
  end
  match "/validator-roles/*path", @json_service do
    Proxy.forward conn, path, "http://cache/validator-roles/"
  end
  match "/data-entry-roles/*path", @json_service do
    Proxy.forward conn, path, "http://cache/data-entry-roles/"
  end
  match "/accounts/*path", @json_service do
    Proxy.forward conn, path, "http://cache/accounts/"
  end


  match "/transfer/*path", @json_service do
    Proxy.forward conn, path, "http://transfer-museum/"
  end

  # FRONTEND FALLBACK WITH HOST

  match "/*path", %{ reverse_host: ["widget" | _rest], layer: :frontend_fallback } do
    Proxy.forward conn, [], "http://frontend-standalone/index.html"
  end

  match "/*path", %{ layer: :frontend_fallback } do
    Proxy.forward conn, [], "http://frontend-entry/index.html"
  end


  # 404

  match "/*_path", %{ layer: :not_found } do
    send_resp( conn, 404, "{ \"errors\": [{\"status\": \"Not found\", \"code\": \"404\", \"title\": \"The file could not be found\"}] }" )
  end

  match "/*_path", %{ layer: :not_found } do
    send_resp( conn, 404, "Route not found and no applicable 404 method discovered for your accept headers." )
  end
end
