// creates new synth call synth
var synthDefault = new Tone.Synth().toMaster();
var synthDuo = new Tone.DuoSynth ().toMaster();
var synthMetal = new Tone.MetalSynth ().toMaster();

window.addEventListener('keydown', onkeydown)
window.addEventListener('keydown', highlightPianoKey)
window.addEventListener('keyup', unhighlightPianoKey)


// highlight the piano key by changing the element id
function highlightPianoKey(e){
  change = document.getElementById(e.key);
  change.id = "press";
  console.log('keydown');
}
// unhighlight Piano Key by changing id back to orignial
function unhighlightPianoKey(e){
  changeBack = document.getElementById("press")
  changeBack.id = e.key
  console.log('keyup');
}

const piano = {

  keyToPitch: { "z":"C3", "s":"C#3", "x":"D3", "d":"D#3", "c":"E3", "v":"F3", "g":"F#3", "b":"G3", "h":"G#3", "n":"A3", "j":"A#3", "m":"B3", ",":"C4" },

  synthWork: function (synthType, note) {
  // make sound
    Tone.context.resume().then(() => {
  // calls trigger attack on the synth object
      synthType.triggerAttackRelease(this.keyToPitch[note.key], "8n")
    });
  }

}
function onkeydown(note){
  piano.synthWork(synthDuo, note)
  console.log('playnote');
}
