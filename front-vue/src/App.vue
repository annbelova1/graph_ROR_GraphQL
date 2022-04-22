<template>
  <div id="app">
  <div class="home">
    <div class="mt-2 md:mt-8 lg:mt-16 max-w-xl mx-auto">
      <div class="bg-white p-8 shadow rounded-lg">
        <br />
        <h1 class="text-3xl uppercase font-semibold tracking-wide text-center">
          Welcome To ToDos
        </h1>
        <div class="text-center m-2" @click="createNodeModal = true">
          <button
            type="button"
            class="px-4 py-2 bg-black text-white rounded-lg"
          >
            <font-awesome-icon
              icon="plus"
              class="text-white"
            ></font-awesome-icon>
            <span class="font-semibold uppercase"> Add Node</span>
          </button>
        </div>
        <custom-modal
          :showing="createNodeModal"
          @close="createNodeModal = false"
        >
          <ApolloMutation
            :mutation="require('@/graphql/mutations/createNode.gql')"
            :variables="{ name }"
            @done="NodeCreated"
          >
            <template v-slot="{ mutate, loading, error }">
              <form action="#" class="mt-5" @submit.prevent="mutate()">
                <div class="form-group mb-5">
                  <input
                    type="text"
                    name="name"
                    class="rounded w-full shadow p-2 border border-gray-900 tracking-wide text-lg"
                    placeholder="Name"
                    id="create-list-name"
                    autocomplete="on"
                    v-model="name"
                    autofocus
                  />
                </div>
                <div class="text-center flex justify-between">
                  <a
                    href="#"
                    @click.prevent="createNodeModal = false"
                    class="self-center hover:underline hover:text-gray-800"
                    >Cancel</a
                  >
                  <button
                    type="submit"
                    :disabled="loading"
                    class="px-4 py-2 rounded tracking-wide font-semibold bg-black text-white text-lg hover:bg-gray-800 shadow-lg"
                  >
                    Create
                  </button>
                </div>
              </form>
            </template>
          </ApolloMutation>
        </custom-modal>

      </div>
    </div>
  </div>
    <router-view />
  </div>
</template>


<script>
import gql from "graphql-tag";
export default {
  name: "ListShow",
  props: ["listId"],
  data() {
    return {
      list: {},
      tasks: [],
      name: "",
    };
  },
  apollo: {},
  methods: {

    async deleteNode(task) {
      const result = await this.$apollo.mutate({
        mutation: require("@/graphql/mutations/deleteNode.gql"),
        variables: {
          id: task.id,
        },
      });
      if (!!result.data) {
        await this.loadList();
      }
    },
    taskAdded() {
      this.name = "";
      this.loadList();
    },
  },
  async mounted() {
    await this.loadList();
  },
};
</script>
