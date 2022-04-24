<template>
  <div>
    <div v-for="(line, index) in lines" :key="index" class="row">
      <div class="col-lg-6">
        <div class="row">
  
          <div class="col-10">
            <q-input
              v-model="line.number"
              label="New Field
              placeholder=""
              type="text"
              value=""
            />
          </div>
        </div>
      </div>


      <div class="col-lg-2">
        <div class="block float-right">
          <q-btn round @click="removeLine(index)" icon="delete" />
          <q-btn round v-if="index + 1 === lines.length" @click="addLine" icon="playlist-plus" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'PhoneNumberLine',
  data () {
    return {
      lines: [],
      blockRemoval: true,

    }
  },
  watch: {
    lines () {
      this.blockRemoval = this.lines.length <= 1
    }
  },
  methods: {
    addLine () {
      let checkEmptyLines = this.lines.filter(line => line.number === null)
      if (checkEmptyLines.length >= 1 && this.lines.length > 0) {
        return
      }
      this.lines.push({
        countryCode: null,
        number: null,
        phoneUsageType: null
      })
    },
    removeLine (lineId) {
      if (!this.blockRemoval) {
        this.lines.splice(lineId, 1)
      }
    }
  },
  mounted () {
    this.addLine()
  }
}
</script>