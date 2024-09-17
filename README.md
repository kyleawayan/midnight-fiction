# Midnight Fiction
My Traktor Kontrol S4 MK3 mods, codenamed "Midnight Fiction".

> [!NOTE]  
> I no longer own the Traktor Kontrol S4 MK3, so I will not be maintaining this project anymore.

## Features
- **Scrolling waveform**
  - Note: The S4 MK3 screens have a slow refresh rate, so the scrolling may not be as smooth.
  - See ["Waveform Zoom" section](#waveform-zoom) to customize the zoom level.
- **"Key Match Assist" to help with harmonic mixing**
  - When holding SHIFT to change the key, keys compatible with the current deck's key are shown (only in musical format). It also shows a picture of a single octave piano keyboard for reference.
  - See ["Disabling Key Match Assist" section](#disabling-key-match-assist) to disable this feature.
- **Toggle stem FX sends from pads**
  - Credit: [DJ NUO](https://youtu.be/lhrMLEUKUB0?si=egbV21eVqKqRQboY&t=44). Please see [his video](https://youtu.be/lhrMLEUKUB0?si=egbV21eVqKqRQboY&t=44) on how to use this feature.
- **Display stable tempo percentage**
  - a.k.a. the current tempo's relative percentage from the song's original tempo
- **Change deck colors**
  - Deck 1 through 4 are set to the colors: White, White, Red, Orange
  - Credit: [swightwick](https://gist.github.com/swightwick/4549158840180509a9b2df749bf6a0ec), [Greater Good Beats & Instrumentals](https://www.youtube.com/watch?v=_sti1yfWAqE)
  - To change the colors, see ["Changing Deck Colors" section](#changing-deck-colors) below

## Video Demos
### Scrolling Waveform
TODO

### Key Match Assist
TODO

### Display Stable Tempo Percentage
TODO

## Installation
Only tested with Traktor Pro 4 on macOS.

1. [Download the ZIP of this repository](https://github.com/kyleawayan/midnight-fiction/archive/refs/heads/main.zip)
2. Extract the ZIP file.
3. Locate the `qml` folder in your Traktor Pro 4 installation.
4. Backup the `qml` folder.
5. Replace the following folders and files from the extracted ZIP to your Traktor Pro 4 `qml` folder:
    - `qml/CSI/S4MK3/`
    - `qml/CSI/Common/DeckHelpers.js`
    - `qml/Screens/S4MK3/`
    - `qml/Screens/S8_MIDNIGHT_FICTION/` *(this is a new folder, just copy it over)*

## Options
Note that I did not code an interface to change the options within the screen, so the files will need to be edited manually.

### Disabling "Key Match Assist"
In `qml/Screens/S4MK3/Views/TrackDeck.qml`, delete or comment out the following lines:
```qml
// PIANO OVERLAY //
Widgets.PianoOverlay
{
visible: deckInfo.shift
anchors.top: parent.top
anchors.left: parent.left
}
```

### Changing Deck Colors
In `qml/CSI/Common/DeckHelpers.js`, change the colors returned by `colorForDeck()`. The color choices are commented in the file.
```javascript
function colorForDeck(deckIdx)
{
    switch (deckIdx)
    {
      case 1:
      case 2:
        return Color.White;
      case 3:
        return Color.Fuchsia;
      case 4:
        return Color.Red;
    }

    // Fall-through...
    return Color.Black;
}
```

### Waveform Zoom
In `qml/Screens/S4MK3/Views/TrackDeck.qml`, change the bit-shift amount (the `6` in `0x800 << 6`) to adjust the waveform zoom. The higher the number, the more zoomed out the waveform will be.
```qml
// SCROLLING WAVEFORM //
WF.WaveformContainer {
    id: waveformContainer

    deckId:         deckInfo.deckId - 1 
    sampleWidth:    0x800 << 6 // Change the integer here for waveform zoom

    anchors.left:         parent.left
    anchors.right:        parent.right

    height:   70
}
```


## Development
Note the scripts only work on macOS.

- **`make import`**: Copies Traktor Pro 4 QML files related to the mod into the project.
- **`make install`**: Backs up the Traktor QML folder, updates ownership if needed, and copies modified QML files back to Traktor.
- **`make install-and-run`**: Closes Traktor Pro 4, installs the modified QML files, and then reopens the application.


## Todo
### Planned Features
- [ ] ~~Auto key sync~~ *Dropped, as I do not own the controller anymore.*

### Documentation
- [X] Basic installation instructions for non-code users
- [X] Screenshots/Videos
