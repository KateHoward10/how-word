<template>
  <h1 @click="generateWord">How-word</h1>
  <p>{{ message }}</p>
  <Row
    v-for="(guess, i) in guesses"
    :key="i"
    :checkGuess="(g) => checkGuess(i, g)"
    :currentWord="currentWord"
    :disabled="!currentWord || numberOfGuesses < i"
    :checked="numberOfGuesses > i"
  />
</template>

<script>
import { ref, computed } from 'vue';
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

    function generateWord() {
      let newWord = randomWords({ exactly: 1, maxLength: 5 });
      if (newWord[0].length === 5) {
        currentWord.value = newWord[0];
        console.log(currentWord.value);
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

h1 {
  margin: 2px;
  cursor: pointer;
}
</style>
