import QtQuick
import Quickshell

PanelWindow {
  anchors.left: true
  anchors.right: true
  anchors.top: true
  color: "#1a1b26"
  implicitHeight: 30

  Text {
    anchors.centerIn: parent
    color: "#fff"
    font.pixelSize: 14
    text: "Bar!!"
  }
}
