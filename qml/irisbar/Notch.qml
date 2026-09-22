import QtQuick
import QtQuick.Layouts
import Quickshell
import Iris
import M3i
import qs.globals
import "./components"

PanelWindow {
    id: root

    readonly property real visibleBarHeight: Math.max(0, (notchContainer.y + notchContainer.height) - 8)

    anchors {
        top: true
    }

    State {
        id: stateHandler
    }

    height: 36
    width: notchContainer.width + 36
    exclusiveZone: 12
    color: "transparent"

    Corner {
        corner: 3
        anchors.left: notchContainer.right
        anchors.top: root.top
        implicitWidth: 12
        implicitHeight: Math.min(12, root.visibleBarHeight)
        color: Theme.md3.background
    }

    Corner {
        corner: 2
        anchors.right: notchContainer.left
        anchors.top: root.top
        implicitWidth: 12
        implicitHeight: Math.min(12, root.visibleBarHeight)
        color: Theme.md3.background
    }

    Rectangle {
        id: notchContainer
        anchors.horizontalCenter: parent.horizontalCenter
        width: rowHandler.width + 12
        height: parent.height
        y: stateHandler.launcher.isOpen ? 0 : -height + 12
        color: Theme.md3.background
        bottomLeftRadius: 12
        bottomRightRadius: 12

        Behavior on y {
            NumberAnimation {
                duration: 350
                easing.type: Easing.OutQuint
            }
        }

        RowLayout {
            id: rowHandler
            anchors.centerIn: parent
            height: parent.height
            opacity: stateHandler.launcher.isOpen ? 1 : 0
            visible: opacity > 0

            Behavior on opacity {
                NumberAnimation {
                    duration: 350
                    easing.type: Easing.OutQuint
                }
            }

            Workspaces {}

            Clock {}
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            stateHandler.launcher.isOpen = !stateHandler.launcher.isOpen;
        }
    }
}
