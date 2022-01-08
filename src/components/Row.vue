<template>
  <div class="row">
    <input
      v-for="(l, i) in guess"
      :key="i"
      v-model="guess[i]"
      type="text"
      maxlength="1"
      class="square"
      :class="{
        'incorrect': l && !currentWord.includes(l),
        'right-letter': l && currentWord.includes(l) && currentWord[i] !== l,
        'right-place': l && currentWord[i] === l
      }"
    />
 </div>
</template>

<script>
import { ref } from 'vue'

export default {
  name: 'Row',
  setup() {
    const guess = ref(['','','','','']);

    return { guess };
  },
  props: {
    currentWord: String,
  },
}
</script>

<style>
.row {
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: center;
  margin: auto;
}

.square {
  height: 15vw;
  width: 15vw;
  max-height: 50px;
  max-width: 50px;
  background-color: transparent;
  border: 2px solid #666;
  color: #fff;
  font-size: 32px;
  font-weight: bold;
  text-transform: uppercase;
  text-align: center;
  margin: 3px;
  outline: none;
}

.square:focus {
  border-color: #eee;
}

.right-place {
  background-color: green;
  border-color: green;
}

.right-letter {
  background-color: yellow;
  border-color: yellow;
  color: #222;
}

.incorrect {
  background-color: #666;
}
</style>