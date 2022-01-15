<template>
  <div v-for="(letters, i) in rows" :key="i" class="keyboard-row">
    <button
      v-for="(l, i) in letters"
      :key="i"
      class="key-button"
      :class="classes[l]"
      @click="selectLetter(l)"
    >{{ l }}</button>
    <button v-if="i === 2" class="key-button" @click="deleteLetter">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2M3 12l6.414 6.414a2 2 0 001.414.586H19a2 2 0 002-2V7a2 2 0 00-2-2h-8.172a2 2 0 00-1.414.586L3 12z" />
      </svg>
    </button>
 </div>
</template>

<script>
export default {
  name: 'Keyboard',
  props: {
    selectLetter: Function,
    deleteLetter: Function,
    rows: Array,
    classes: Object
  }
}
</script>

<style>
.keyboard-row {
  display: flex;
  flex-flow: row wrap;
  align-items: center;
  justify-content: center;
}

.key-button {
  width: 7vw;
  max-width: 50px;
  background-color: #666;
  color: #fff;
  padding: 5px 2px;
  margin: 3px;
  font-size: 24px;
  font-weight: bold;
}

</style>