import QtQuick 2.5
import QtQuick.Layouts 1.1
import '../Views'
import '../utils/harmonicKeys.js' as HarmonicKeys

//----------------------------------------------------------------------------------------------------------------------
//  Piano Overlay - for reference when matching keys of tracks
//  This is based off StemOverlay.qml
//----------------------------------------------------------------------------------------------------------------------


Item {
  id: display
  Colors {id: colors}
  Dimensions {id: dimensions}
  
  width  : 320
  height : 240

  // LAYOUT + DESIGN //

  property real infoBoxesWidth:   dimensions.infoBoxesWidth
  property real firstRowHeight:   dimensions.firstRowHeight
  property real secondRowHeight:  dimensions.secondRowHeight
  property real remixCellWidth:   dimensions.thirdRowHeight
  property real screenTopMargin:  dimensions.screenTopMargin
  property real screenLeftMargin: dimensions.screenLeftMargin

  property real boxesRadius:  5
  property real cellSpacing:  dimensions.spacing
  property real textMargin:   13

  property variant lightGray: colors.colorDeckGrey
  property variant darkGray:  colors.colorDeckDarkGrey

  property int keyIdx: deckInfo.resultingKeyIdx

  function getClosestHarmonicKeyName() {
    if (!deckInfo.hasKey) {
      return "No key";
    }
    return HarmonicKeys.calculateHarmonicKeys(keyIdx).closestHarmonic.keyName;
  }

  function getFormattedHarmonicKeys() {
    if (!deckInfo.hasKey) {
      return "No key";
    }
    return HarmonicKeys.calculateHarmonicKeys(keyIdx).harmonicKeys.slice(1).join(", ");
  }

  Rectangle
  {
    width:  display.width
    height: 2*display.firstRowHeight + display.secondRowHeight + 3*display.cellsSpacing
    color:        colors.defaultBackground
  }

  ColumnLayout 
  {
    spacing: display.cellSpacing
    anchors.top: parent.top
    anchors.topMargin: display.screenTopMargin
    anchors.left: parent.left
    anchors.leftMargin: display.screenLeftMargin

    DeckHeader
    {
      title:  "Closest harmonic:  " + getClosestHarmonicKeyName()
      height: display.firstRowHeight
      width:  2*display.infoBoxesWidth + display.cellSpacing
    }

    RowLayout
    {
      spacing: display.cellSpacing

      Rectangle {

        height: display.firstRowHeight
        width:  display.infoBoxesWidth

        color: colors.defaultBackground

        Text {
          text: "Other:  " + getFormattedHarmonicKeys()
          font.pixelSize: 24
          font.family: "Roboto"
          font.weight: Font.Normal
          color: "white"
          anchors.fill: parent
          verticalAlignment: Text.AlignVCenter
        }
      }
    }

    RowLayout
    {
      spacing: display.cellSpacing
      
      Image {
        id: piano_overlay_image
        width: 306
        height: 72
        clip: true
        fillMode: Image.Stretch
        source: "../Images/piano_overlay.png"
      }
    }
  }
}
