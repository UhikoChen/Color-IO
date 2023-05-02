<template>
  <div class="container">
    <div class="title">COLOR IO</div>
    <div class="sub-title">CARD</div>
    <hr />
    <ul id="color-list" class="row row-cols-3">
      <li class="col" v-for="(color, index) in colors" :key="index">
        <div class="color" :style="{ 'background-color': `#${color.hex}` }">
          <div class="del-btn" @click="onDelete(color)">×</div>
        </div>
        <input class="colorHex" maxlength="6" v-model="color.hex" />
      </li>
    </ul>
    <hr />

    <div class="sub-title">Input Color Hex To Add New Color :</div>
    <div class="wrapper">
      <span>#</span>
      <input id="color-hex-input" type="text" maxlength="6" v-model="inputValue" />
      <button @click="onCreateColor">Create</button>
    </div>
    <div class="footer-title">Powered by UhikoChen</div>
  </div>
</template>

<script setup>
import { reactive } from 'vue';

let inputValue = "";
let colors = reactive([
  {
    id: 1,
    hex: "1B3E36",
  },
  {
    id: 2,
    hex: "A0561F",
  },
  {
    id: 3,
    hex: "D5BCAE",
  },
  {
    id: 4,
    hex: "EBE4DD",
  },
  {
    id: 5,
    hex: "EAE8E4",
  },
  {
    id: 6,
    hex: "F7F7F5",
  },
]);

function onCreateColor() {
  colors.push({ id: 0, hex: inputValue });
}

function onDelete(color) {
  const index = colors.indexOf(color);
  if (index > -1) {
    colors.splice(index, 1);
  }
}
</script>

<style>
* {
  box-sizing: border-box;
}

body {
  font-family: "Roboto", sans-serif;
  font-weight: 400;
  background-color: #f5f4f2;
  color: #b7b4ad;
}

ul {
  padding: 50px 0;
  margin: 0;
}

li {
  padding: 0;
  list-style: none;
  box-shadow: 2px 2px 4px 2px #ccc;
}

hr {
  color: #d9d8d4;
}

button {
  border-radius: 5px;
  height: 26px;
  border: 1px solid #ccc;
  cursor: pointer;
}

.container {
  max-width: 960px;
  margin: 0 auto;
  padding: 0 15px;
}

.title {
  margin-top: 60px;
}

.sub-title {
  padding: 20px 0;
}

.wrapper {
  display: grid;
  grid-template-columns: repeat(3, auto);
  justify-content: start;
  align-items: center;
  padding: 10px 0;
}

.row-cols-3 {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  align-content: space-around;
  column-gap: 50px;
  row-gap: 50px;
}

@media (max-width: 767.98px) {
  .row-cols-3 {
    grid-template-columns: repeat(2, auto);
  }
}

.row {
  padding: 0;
  margin: 50px 0;
}

.color {
  min-height: 300px;
  position: relative;
}

@media (max-width: 499.98px) {
  .color {
    min-height: 200px;
  }
}

.color:active {
  pointer-events: none;
}

@media (min-width: 1200px) {
  .del-btn {
    display: none;
  }

  .color:hover>.del-btn {
    display: block;
    font-size: 20pt;
    position: absolute;
    top: 0;
    right: 10px;
    cursor: pointer;
    pointer-events: auto;
    text-shadow: 1px 1px 2px rgba(255, 255, 255, 0.8);
  }
}

@media (max-width: 1200px) {
  .color>.del-btn {
    font-size: 20pt;
    position: absolute;
    top: 0;
    right: 10px;
    cursor: pointer;
    pointer-events: auto;
    text-shadow: 1px 1px 2px rgba(255, 255, 255, 0.8);
  }
}

.colorHex {
  background-color: white;
  width: 100%;
  padding: 20px 0;
  font-size: 12pt;
  text-align: center;
  color: #b7b6b1;
  outline-style: none;
  border: 0px;
}

#color-hex-input {
  border-radius: 5px;
  height: 24px;
  outline-style: none;
  border: 0px;
  border: 1px solid #ccc;
  width: 100px;
  font-size: 14pt;
  margin: 0 10px;
}

.footer-title {
  margin: 100px 0 80px 0;
  text-align: center;
}
</style>
