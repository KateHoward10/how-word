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
        'incorrect': checked && l && !currentWord.includes(l),
        'right-letter': checked && l && currentWord.includes(l) && currentWord[i] !== l,
        'right-place': checked && l && currentWord[i] === l
      }"
      :disabled="disabled"
    />
    <button
      @click="checkGuess(guess.join(''))"
      class="submit-button"
      :disabled="!guess.every(l => l)"
    >✐</button>
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
    checkGuess: Function,
    disabled: Boolean,
    checked: Boolean
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
  height: 10vw;
  width: 10vw;
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

.square:disabled {
  border-color: #333;
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

.submit-button {
  height: 10vw;
  width: 10vw;
  max-height: 50px;
  max-width: 50px;
  background-color: #000;
  color: #fff;
  font-size: 24px;
  font-weight: bold;
  text-align: center;
  margin: 3px;
}

.submit-button:disabled {
  background-color: #111;
  color: #444;
  cursor: default;
}
</style>