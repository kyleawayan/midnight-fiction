import QtQuick 2.5
import QtQuick.Layouts 1.1
import '../Views'

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
    anchors.topMargin: display.screenTopMargin + display.firstRowHeight + display.cellSpacing
    anchors.left: parent.left
    anchors.leftMargin: display.screenLeftMargin

    RowLayout
    {
      spacing: display.cellSpacing

      // VOLUME LABEL //
      Rectangle {

        height: display.firstRowHeight
        width:  display.infoBoxesWidth

        color: display.deckInfo.isStemsActive ? (!display.deckInfo.stemSelectedMuted ? display.deckInfo.stemSelectedMidColor : colors.darkerColor(display.deckInfo.stemSelectedMidColor, 0.5) ) : "grey"
        radius: display.boxesRadius

        Text {
          text: "-5: ?b | -3: ?b"
          font.pixelSize: 24
          font.family: "Roboto"
          font.weight: Font.Normal
          color: "grey"
          anchors.fill: parent
          horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
        }
      }

      // FILTER LABEL //
      Rectangle {
        
        height: display.firstRowHeight
        width:  display.infoBoxesWidth

        color:  display.deckInfo.isStemsActive ? (display.deckInfo.stemSelectedFilterOn ? display.deckInfo.stemSelectedMidColor : colors.darkerColor(display.deckInfo.stemSelectedMidColor, 0.5) ) : "grey"
        radius: display.boxesRadius

        Text {
          text: "+3: ?b | +5: ?b"
          font.pixelSize: 24
          font.family: "Roboto"
          font.weight: Font.Normal
          color: "grey"
          anchors.verticalCenter: parent.verticalCenter
          anchors.rightMargin: display.textMargin
          anchors.leftMargin:  display.textMargin
          anchors.fill: parent
          horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
        }
        
      }
    }

    RowLayout
    {
      spacing: display.cellSpacing
      
      Text {
        text: "Put Piano Here." + (display.infoBoxesWidth*2 + display.cellSpacing) + "x" + display.secondRowHeight
        font.pixelSize: 24
        font.family: "Roboto"
        font.weight: Font.Normal
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
      }
    }
  }
}
