<template>
  <div v-for="(letters, i) in rows" :key="i" class="keyboard-row">
    <button
      v-for="(l, i) in letters"
      :key="i"
      class="key-button"
    >{{ l }}</button>
    <button v-if="i === 2" class="key-button">
      <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2M3 12l6.414 6.414a2 2 0 001.414.586H19a2 2 0 002-2V7a2 2 0 00-2-2h-8.172a2 2 0 00-1.414.586L3 12z" />
      </svg>
    </button>
 </div>
</template>

<script>
export default {
  name: 'Keyboard',
  setup() {
    const rows = [
      ['Q','W','E','R','T','Y','U','I','O','P'],
      ['A','S','D','F','G','H','J','K','L'],
      ['Z','X','C','V','B','N','M']
    ];

    return { rows };
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
  width: 6vw;
  height: 6vw;
  max-width: 40px;
  max-height: 40px;
  background-color: #666;
  color: #fff;
  margin: 3px;
  font-size: 24px;
  font-weight: bold;
}

</style>