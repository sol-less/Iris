import QtQuick
import Quickshell
import Quickshell.Hyprland
import QtQuick.Layouts
import Iris
import M3i
import M3Shapes

Item {
    id: root
    readonly property int wsActiveId: Hyprland.focusedWorkspace?.id

    height: parent.height - 12
    width: rowHandler.width + 12

    RowLayout {
        id: rowHandler
        anchors.centerIn: parent

        Repeater {
            model: 5

            delegate: MaterialShape {
                required property int index
                implicitSize: 20
                shape: index + 1 === root.wsActiveId ? MaterialShape.Cookie4Sided : MaterialShape.Cookie12Sided
                color: "red"
            }
        }
    }
}