import QtQuick 2.5
import QtQuick.Layouts 1.1

import '../Widgets' as Widgets
import '../../S8_MIDNIGHT_FICTION/Views/Waveform' as WF

//----------------------------------------------------------------------------------------------------------------------
//  Track Screen View - UI of the screen for track
//----------------------------------------------------------------------------------------------------------------------

Item {
  id: display
  Dimensions {id: dimensions}

  // MODEL PROPERTIES //
  property var deckInfo: ({})
  property real boxesRadius:      dimensions.cornerRadius
  property real infoBoxesWidth:   dimensions.infoBoxesWidth
  property real firstRowHeight:   dimensions.firstRowHeight
  property real secondRowHeight:  dimensions.secondRowHeight
  property real spacing:          dimensions.spacing
  property real screenTopMargin:  dimensions.screenTopMargin
  property real screenLeftMargin: dimensions.screenLeftMargin

  width  : 320
  height : 240

  Rectangle
  {
    id: displayBackground
    anchors.fill : parent
    color: colors.defaultBackground
  }

  // SCROLLING WAVEFORM //
  WF.WaveformContainer {
    id: waveformContainer

    deckId:         deckInfo.deckId - 1 
    sampleWidth:    0x800 << 5 // Change the integer here for waveform zoom

    anchors.top:          parent.top
    anchors.left:         parent.left
    anchors.right:        parent.right

    height:   240

    showLoopSize: true
  }
}
