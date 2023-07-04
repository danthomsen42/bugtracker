// Get references to the content and button elements
const content = document.getElementById('content');
const button1 = document.getElementById('button1');
const button2 = document.getElementById('button2');


//Create an "onload" function that loads the same info as what is present on button 1. 

// Add click event listeners to the buttons
button1.addEventListener('click', () => {
  content.textContent = 'Button 1 Content';
  button1.classList.add('active');
  button2.classList.remove('active');
});

button2.addEventListener('click', () => {
  content.textContent = 'Button 2 Content';
  button1.classList.remove('active');
  button2.classList.add('active');
});