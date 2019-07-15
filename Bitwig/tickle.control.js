/*

A Bitwig Controller Script for the Tickle Instrument by The Center for Haptic Audio Interaction Research (CHAIR)

*/


loadAPI(8);

// Remove this if you want to be able to use deprecated methods without causing script to stop.
// This is useful during development.
host.setShouldFailOnDeprecatedUse(true);

host.defineController("CHAIR", "Tickle", "1.0", "e28b3740-a65b-11e9-b475-0800200c9a66", "Max Neupert");
host.defineMidiPorts(1, 1);
host.addDeviceNameBasedDiscoveryPair(["tickle MIDI 1"], ["tickle MIDI 1"]);

function init()
{
    host.getMidiInPort(0).setMidiCallback(onTickleMidi);
    // host.getMidiInPort(0).setSysexCallback(onSysex0);
 
    // TODO: Perform further initialization here.
    println("Tickle initialized!");
}


// Called when a short MIDI message is received on MIDI input port 0.
function onTickleMidi(status, data1, data2)
{
    printMidi(status, data1, data2)
    noteIn = host.getMidiInPort(0).createNoteInput("Tickle Pads", "B001??", "80????", "90????", "B040??", "D0????", "E0????");

}

function flush() {
    // TODO: Flush any output to your controller here.
 }

function exit()
{
    println("exit.");
}