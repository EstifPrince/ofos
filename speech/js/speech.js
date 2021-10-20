// Init SpeechSynth API
const synth = window.speechSynthesis;

// DOM Elements
const names = document.querySelectorAll('.name');
const prices = document.querySelectorAll('.price');
const speakBtn = document.querySelector('.speak-btn');
const quantity = document.querySelectorAll('.quantity')


//Browser identifier
// Firefox 1.0+
var isFirefox = typeof InstallTrigger !== 'undefined';

// Chrome 1+
// var isChrome = !!window.chrome && !!window.chrome.webstore;
var isChrome = !!window.chrome;
console.log(isChrome);

// Init voices array
let voices = [];

const getVoices = () => {
  voices = synth.getVoices();
};

//Line 35, 36 causes voice list duplication
/*getVoices();
if (synth.onvoiceschanged !== undefined) {
  synth.onvoiceschanged = getVoices;
}*/

//Fix for duplication, run code depending on the browser
if (isFirefox) {
    getVoices();
}
if (isChrome) {
    if (synth.onvoiceschanged !== undefined) {
        synth.onvoiceschanged = getVoices;
    }
}

// Speak
const speak = (current_name) => {
  // Check if speaking
  if (synth.speaking) {
    console.error('Already speaking...');
    return;
  }
  if (current_name !== '') {
    // Get speak text
    const speakText = new SpeechSynthesisUtterance(current_name);
    console.log(current_name);
    // Speak end
    speakText.onend = e => {
      console.log('Done speaking...');
    };

    // Speak error
    speakText.onerror = e => {
      console.error('Something went wrong');
    };

    // Selected voice
    const selectedVoice = voices[0];

    // Loop through voices
    voices.forEach(voice => {
      if (voice.name === selectedVoice) {
        speakText.voice = voice;
      }
    });

    // Set pitch and rate
    speakText.rate = 1;
    speakText.pitch = 1;
    // Speak
    synth.speak(speakText);
  }
};

// EVENT LISTENERS

index = 0;
const singleClick = () => {
  if (index < names.length){
    speakString = names[index].innerHTML + ', and ' + 'price is ' + prices[index].innerHTML 
    speak(speakString);
    index ++;
  } else {
    speak('Menu has Ended. Starting from the Top.');
    index = 0;
  }
};

const doubleClick = () => {
  i = index - 1;
  if (index > 0){
    if (quantity[i].value == ''){
      quantity[i].value = 0;
    }
    quantity[i].value ++; 
    speak(quantity[i].value);

  }
  
};

var clickCount = 0;
// Text form submit
speakBtn.addEventListener('click', e => {
  e.preventDefault();
  clickCount++;
  if (clickCount === 1 ){
    singleClickTimer = setTimeout(() => {
      clickCount = 0;
      singleClick();
    }, 400);
  } else if (clickCount === 2){
    clearTimeout(singleClickTimer);
    clickCount = 0;
    doubleClick();
  }
}, false);