<template>
  <h1 @click="generateWord">How-word</h1>
  <Row />
  <Row />
  <Row />
  <Row />
  <Row />
  <Row />
</template>

<script>
import Row from './components/Row.vue';
const randomWords = require('random-words');

export default {
  name: 'App',
  setup() {
    function generateWord() {
      let newWord = randomWords({ exactly: 1, maxLength: 5 });
      if (newWord[0].length === 5) {
        console.log(newWord[0]);
      } else {
        generateWord();
      }
    }

    return { generateWord };
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
