// var slideIndex = 1;
var slideIndex = 0;
var myVar;
// var n = 0;
// showSlides(slideIndex);
// // Next/previous controls function plusSlides(n) {
// showSlides(slideIndex += n); 
// // Thumbnail image controls function currentSlide(n) {
// showSlides(slideIndex = n);
  
// Thumbnail image controls
// function currentSlide(n) {
//     showSlides(slideIndex = n);
//   }

// Next/previous controls
function plusSlides(n) {

  console.log('first n value ' + n);

  // clearTimeout(myVar);
  showManSlides(slideIndex += n);
}

showAutoSlides();

function showAutoSlides() {

  var i;
  var slides = document.getElementsByClassName("mySlides");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}
  slides[slideIndex-1].style.display = "block";
  setTimeout(showAutoSlides, 3000); // Change image every 2 seconds
}

function showManSlides(n) {

  var i;
  var slides = document.getElementsByClassName("mySlides");
  // var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  // for (i = 0; i < dots.length; i++) {
  //     dots[i].className = dots[i].className.replace(" active", "");
  // }
  slides[slideIndex-1].style.display = "block";
  // dots[slideIndex-1].className += " active";
}