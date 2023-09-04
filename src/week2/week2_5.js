function generateRandomNumber(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

const min = 0;
const max = document.getElementById("js-range");
const input = document.getElementById("num");
const rangeForm = document.getElementById("js-range");
const button = document.getElementById("button");
const display = document.getElementById("js-result");

function play() {
  const diplaySpan = display.querySelector("span"); // Select the span tag inside the tag with id form-result

  const ans = generateRandomNumber(min, max.value);

  if (ans == input.value) {
    diplaySpan.innerHTML = "You choose: " + input.value + "the machine choose: " + ans + "<br>You win!";
  } else {
    diplaySpan.innerHTML = "You choose: " + input.value + "the machine choose: " + ans + "<br>You lost!";
  }
}

rangeForm.oninput = function () {
  max.value = this.value;
  document.getElementById("data").innerHTML = max.value;
};
