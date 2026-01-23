import QuickShell
import QuickShell.Wayland
import QtQuick

PanelWindow {
    anchors.top: true
    anchors.left: true
    anchors.right: true
    implicitHeight: 30
    color: "black"

    Text {
        anchors.centerIn: parent
        text: "Test"
        font.pixelSize: 20
        color: "white"
    }
}