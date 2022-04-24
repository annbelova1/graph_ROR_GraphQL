# APP for GRAPH editing functionalities

## BACKEND

- Ruby on Rails 6
- MongoDB 4
- GraphQL

## FRONTEND
- Vue

## Opportunities -- complexity:
- To create a node -- O(n) # n is the number of graph's nodes
- To add node label and some custom data -- O(n)
- To create an edge(directed/undirected) between two nodes -- O(n)
- To edit node data -- O(n)
- To drop a node -- O(n + e) # e is the edges' number(_neighbours)
- To drop an edge -- O(n)
- To view the graph -- O(n + e)
## To Run

Launch "docker-compose up --build -d" to up all services

Go to link below to launch graphql playground and test backend:

http://localhost:3000/graphiql


Go to link below to show frontend part:

http://localhost:8080


## Some GraphQl Queries Examples
---------------------------------------------------------------------------------
```graphql
mutation {
  createNode(node: {
    name: "llooo", 
    customizedFields: { label: "label", age: 67 }}) {
    node {
      id
      name
      nodeIndex
      customizedFields
      _neighbours
    }
  }
}
```
---------------------------------------------------------------------------------
```graphql
mutation {
  updateNode(nodeIndex: 1, nodeParams: { 
    name: "New Node Name", 
    customizedFields: { label: "New label",  node_age: 67 }}) {
    node {
      id
      name
      nodeIndex
      customizedFields
      _neighbours
    }
  }
}
```
---------------------------------------------------------------------------------
```graphql
mutation {
  createEdge(firstNodeIndex: 1, secondNodeIndex: 3, undirected: true) {
    node {
      id
      name
      nodeIndex
      _neighbours
      customizedFields
    }
  }
}
```
---------------------------------------------------------------------------------
```graphql
mutation {
  removeEdge(firstNodeIndex: 1, secondNodeIndex: 2) {
    node {
      id
      name
      nodeIndex
      _neighbours
      customizedFields
    }
  }
}
```
---------------------------------------------------------------------------------
```graphql
mutation {
  removeNode(nodeIndex: 2) {
   result
    {
      deletedCount
      modifiedCount
    }    
  }
}
```
---------------------------------------------------------------------------------
```graphql
query {
  showList {
    id
    name
    nodeIndex
    _neighbours
    customizedFields
  }
}
```
---------------------------------------------------------------------------------
### Download Graph

To download graph.png to click button "Download Graph" in http://localhost:8080 
or redirect to http://localhost:3000/download

It will be saved in rails-api/public/graph.png

---------------------------------------------------------------------------------


### Planned  tasks: 

- Rspec
- Frontend part



