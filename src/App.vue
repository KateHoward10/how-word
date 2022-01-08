<template>
  <h1>How-word</h1>
  <Row />
  <Row />
  <Row />
  <Row />
  <Row />
  <Row />
</template>

<script>
import Row from './components/Row.vue';

export default {
  name: 'App',
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
}
</style>
