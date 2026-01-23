import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

PanelWindow {
    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 50
    color: "black"

    RowLayout {
        anchors.fill: parent
        anchors.margins: 8

        Repeater {
            model: 9

            Text {
                property var ws: Hyprland.workspace.values.find(w => w.id === index + 1)
                property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)

                text: index + 1
                color: isActive ? "#0db9d7" : (ws ? "#7aa2f7" : "#444b6a")
                font { pixelSize: 14; bold: true }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        Hyprland.dispatch("workspace " + (index + 1))
                    }
                }
            }
        }
    }
}
