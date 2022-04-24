<template>
<div>
    <div class="bg-white p-8 shadow rounded-lg">
      <button type="button"
        <BreadcrumbItem>
          <a href="http://localhost:3000/download" class="px-4 py-2 rounded tracking-wide font-semibold bg-black text-white text-lg hover:bg-gray-800 shadow-lg"> Download Graph </a>
          </BreadcrumbItem>
        </button>
      </div>
      <ApolloMutation
            :mutation="require('@/graphql/mutations/createNode.gql')"
            :variables="{ node: { label: label }}"
            @done="taskAdded">
            <template v-slot="{ mutate, loading, error }">
              <form action="#" @submit.prevent="mutate()">
                <input
                  type="text"
                  name="name"
                  class="mb-2 rounded shadow p-2 border border-gray-900 tracking-wide text-lg pl-12"
                  style="width=50px; margin: 1em 10em;"
                  placeholder="Node Label"
                  id="node-label"
                  autocomplete="on"
                  v-model="label"/>    
 
                <div class="text-center flex justify-between">
                  <button
                    type="submit"
                    style="width=50px;margin: 1em 10em;"
                    :disabled="loading"
                    class="px-4 py-2 rounded tracking-wide font-semibold bg-black text-white text-lg hover:bg-gray-800 shadow-lg"
                  >
                    Create
                  </button>
                </div>
                </form>

            </template>
          </ApolloMutation>
        <hr />
        <ApolloMutation
            :mutation="require('@/graphql/mutations/createEdge.gql')"
            :variables="{ firstNodeIndex: first_index, secondNodeIndex: second_index, undirected: undirected }"
            @done="taskAdded">

           <template v-slot="{ mutate, loading, error }">

            <form action="#" @submit.prevent="mutate()">
                <input
                  type="number"
                  class="mb-2 rounded shadow p-2 border border-gray-900 tracking-wide text-lg pl-12"
                  style="width=50px; margin: 1em 10em;"
                  placeholder="First Node Index"
                  id="node-index"
                  v-model="first_index"/>

                <input
                  type="number"
                  class="mb-2 rounded shadow p-2 border border-gray-900 tracking-wide text-lg pl-12"
                  style="width=50px; margin: 1em 10em;"
                  placeholder="Second Node Index"
                  id="node-index"
                  v-model="second_index"/>
 
                <div class="text-center flex justify-between">
                  <button
                    type="submit"
                    style="width=50px;margin: 1em 10em;"
                    :disabled="loading"
                    class="px-4 py-2 rounded tracking-wide font-semibold bg-black text-white text-lg hover:bg-gray-800 shadow-lg"
                  >
                    Create Undirected Edge
                  </button>
                </div>
              </form>

            </template>
        </ApolloMutation> 

        <hr />  
      <div style="margin: 1em 3em;">

      </ul>
      <li class="mb-2 p-2 pl-5 shadow tracking-wide rounded-lg text-xl">
        <span> Index </span>
        <span> Label</span>
        <span> Edges</span>
        <span> Custom Fields </span>
      </li>
      <br>
      <li
        v-for="node in nodes"
        :key="node.id"
        class="mb-2 p-2 pl-5 shadow tracking-wide rounded-lg text-xl"
        placeholder=node.id
      >
        
    
      <span> {{ node.nodeIndex }}</span>
      <span> {{ node.label }}</span>
      <span> {{ node._neighbours.join(', ') }}</span>
      <span style="margin: 10px;" v-for="(value, name) in node.customizedFields">
        {{ name }}: {{ value }}
      </span>

      <span @click.prevent="removeNode(node)">
        <font-awesome-icon
          icon="trash"
          class="text-black float-right"
        ></font-awesome-icon>
      </span>
    </li>
  </ul>
  </div>
  </div>
</template>

<style>
a:link, a:visited {
  background-color: white;
  color: black;
  border: 2px solid green;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}

a:hover, a:active {
  background-color: green;
  color: white;
}

hr {
    margin: 20px 0;
    border: 1px solid green;
}

span {
  margin: 80px;
}
</style>

<script>
import gql from "graphql-tag";
export default {
  name: "ListShow",
  data() {
    return {
      list: {},
      nodes: [],
      label: "",
      first_index: null,
      second_index: null,
 
    };
  },
  apollo: {},
  methods: {
    async getList() {
      return await this.$apollo.query({
        query: require("@/graphql/queries/showList.gql"),
        variables: { },
        fetchPolicy: "network-only",
      });
    },
    async loadList() {
      const result = await this.getList();
      if (!!result.data) {
        this.nodes = result.data.showList;
      }
    },

    async removeNode(node) {
      const result = await this.$apollo.mutate({
        mutation: require("@/graphql/mutations/removeNode.gql"),
        variables: {
          nodeIndex: node.nodeIndex,
        },
      });
      if (!!result.data) {
        await this.loadList();
      }
    },
    taskAdded() {
      this.name = "";
      this.first_index = "";
      this.second_index = "";
      this.undirected = false;
      this.loadList();
    },
  },
  async mounted() {
    await this.loadList();
  },
};
</script>
