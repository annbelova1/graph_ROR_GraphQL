Rails.application.routes.draw do
  mount GraphqlPlayground::Rails::Engine, at: "/graphiql", graphql_path: "graphql#execute"
  post "/graphql", to: "graphql#execute"

  get "/download", to: "download_graph#download"
end
