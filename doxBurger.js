
/* Toggle between showing and hiding the navigation menu links when the user clicks on the hamburger menu / bar icon */

function myFuncDox() {
  var x = document.getElementById("myDox");
  if (x.style.display === "block") {
    x.style.display = "none";
  } else {
    x.style.display = "block";
  }
} 