<template>
  <div class="row">
    <input v-for="index in [0,1,2,3,4]" :key="index" type="text" class="square" />
 </div>
</template>

<script>
export default {
  name: 'Row',
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
  margin: 3px;
}
</style>