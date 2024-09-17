# Midnight Fiction
My Traktor Kontrol S4 MK3 mods.

## Features
- Scrolling waveform
- "Key Match Assist" to help with harmonic mixing. When holding SHIFT to change the key, keys compatible with the current deck's key are shown (only in musical format).
- Toggle stem FX sends from pads
- Display stable tempo percentage
- Change deck 3 and 4 colors to red and orange, respectively

## Options
Note that I did not code an interface to change the options within the screen, so you will need to edit the QML files directly.

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

## Development
Note the scripts only work on macOS.

- **`make import`**: Copies Traktor Pro 4 QML files related to the mod into the project.
- **`make install`**: Backs up the Traktor QML folder, updates ownership if needed, and copies modified QML files back to Traktor.
- **`make install-and-run`**: Closes Traktor Pro 4, installs the modified QML files, and then reopens the application.


## Todo
### Planned Features
- [ ] Auto key sync

### Documentation
- [ ] Basic installation instructions for non-code users
- [ ] Screenshots/Videos
