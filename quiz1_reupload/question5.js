// Write a function in JavaScript that takes in a number n and returns the first n even numbers.

function evenNumbers(number) {
  var array = []
  for (i=2; i<=(2*number); i+=2) {
    array.push(i);
  }
  return array;
}

console.log(evenNumbers(5));
console.log(evenNumbers(10));
console.log(evenNumbers(15));
console.log(evenNumbers(20));
