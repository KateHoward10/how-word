<template>
  <div class="header">
    <h1>How-word</h1>
    <button class="play-button" @click="generateWord">Play</button>
  </div>
  <p v-if="message">{{ message }}</p>
  <Row
    v-for="(guess, i) in guesses"
    :key="i"
    :checkGuess="(g) => checkGuess(i, g)"
    :currentWord="currentWord"
    :disabled="!currentWord || numberOfGuesses < i"
    :checked="numberOfGuesses > i"
  />
  <Keyboard />
</template>

<script>
import { ref, computed } from 'vue';
import Keyboard from './components/Keyboard.vue';
import Row from './components/Row.vue';
const randomWords = require('random-words');

export default {
  name: 'App',
  setup() {
    const currentWord = ref('');
    const guesses = ref(['','','','','','']);
    const message = ref('');
    const numberOfGuesses = computed({
      get: () => guesses.value.filter(g => g).length,
      set: (value) => guesses.value = value
    });

    function reset() {
      guesses.value = ['','','','','',''];
      message.value = '';
    }

    function generateWord() {
      let newWord = randomWords({ exactly: 1, maxLength: 5 });
      if (newWord[0].length === 5) {
        reset();
        currentWord.value = newWord[0];
      } else {
        generateWord();
      }
    }

    function checkGuess(index, guess) {
      guesses.value[index] = guess;
      if (guess === currentWord.value) {
        message.value = "Well done!";
      } else if (numberOfGuesses.value === 6) {
        message.value = `Bad luck, the answer was ${currentWord.value}`;
      }
    }

    return { currentWord, guesses, numberOfGuesses, generateWord, checkGuess, message };
  },
  components: {
    Keyboard,
    Row
  }
}
</script>

<style>
body {
  margin: 0;
}

#app {
  min-height: 100vh;
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  background-color: #222;
  color: #fff;
  padding: 1rem;
  text-transform: uppercase;
}

.header {
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: center;
}

h1 {
  margin: 5px 0;
}

button {
  display: flex;
  align-items: center;
  justify-content: center;
  outline: none;
  cursor: pointer;
  border: none;
  border-radius: 4px;
}

.play-button {
  margin-left: 12px;
  cursor: pointer;
  background-color: green;
  border: none;
  color: #fff;
  font-size: 16px;
  font-weight: bold;
  text-transform: uppercase;
  padding: 5px;
}

p {
  margin: 3px 0;
}
</style>
