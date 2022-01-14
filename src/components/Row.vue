<template>
  <div class="row">
    <div
      v-for="i in [0,1,2,3,4]"
      :key="i"
      type="text"
      maxlength="1"
      class="square"
      :class="{
        'active': !disabled && activeIndex === i,
        'incorrect': checked && guess[i] && !currentWord.includes(guess[i]),
        'right-letter': checked && guess[i] && currentWord.includes(guess[i]) && currentWord[i] !== guess[i],
        'right-place': checked && guess[i] && currentWord[i] === guess[i]
      }"
      :disabled="disabled"
    >{{ guess[i] }}</div>
    <button
      @click="checkGuess"
      class="submit-button"
      :disabled="checked || guess.length !== 5"
    >➡</button>
 </div>
</template>

<script>
export default {
  name: 'Row',
  props: {
    currentWord: String,
    guess: String,
    disabled: Boolean,
    checked: Boolean,
    activeIndex: Number,
    checkGuess: Function
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
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: transparent;
  border: 2px solid #666;
  color: #fff;
  font-size: 32px;
  font-weight: bold;
  text-transform: uppercase;
  text-align: center;
  margin: 3px;
}

.active {
  border-color: #eee;
}

.square:disabled {
  border-color: #333;
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
  margin: 3px;
}

.submit-button:disabled {
  background-color: #111;
  color: #444;
  cursor: default;
}
</style>