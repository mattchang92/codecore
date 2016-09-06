// Question 1
$('a:contains("eal")').css('color','red')

// Question 2
$('a').on('click',function(event){
  event.preventDefault();
  $(this).fadeOut('slow');
})

// Question 3
// Comment out above jquery statements to test filter function below
var isEven = function(x) {
  return x % 2 == 0;
}

var filter = function(arrayInput, someFunction){
  var output = [];
  for (var i = 0; i < arrayInput.length; i++) {
    if (someFunction(arrayInput[i])) {
      output.push(arrayInput[i]);
    }
  }
  return output;
}

console.log(filter([1,2,3,4],isEven));
