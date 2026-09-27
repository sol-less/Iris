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
    property string mode: "notch"

    anchors {
        top: true
        left: true
        right: true
    }

    State {
        id: stateHandler
    }

    height: mode === "notch" ? 36 : mainLauncher.height
    exclusiveZone: 12
    color: "transparent"

    mask: Region {
        item: notchContainer
    }

    Corner {
        corner: 3
        anchors.left: notchContainer.right
        anchors.top: root.top
        implicitWidth: 12
        implicitHeight: Math.min(6, root.visibleBarHeight)
        color: Theme.md3.background
    }

    Corner {
        corner: 2
        anchors.right: notchContainer.left
        anchors.top: root.top
        implicitWidth: 12
        implicitHeight: Math.min(6, root.visibleBarHeight)
        color: Theme.md3.background
    }

    Rectangle {
        id: notchContainer
        anchors.horizontalCenter: parent.horizontalCenter
        width: root.mode === "notch" ? mainNotch.width + 12 : mainLauncher.width
        height: parent.height
        y: stateHandler.notch.isOpen ? 0 : -height + 12
        color: Theme.md3.background
        bottomLeftRadius: 12
        bottomRightRadius: 12

        Behavior on y {
            NumberAnimation {
                duration: 350
                easing.type: Easing.OutQuint
            }
        }

        Item {
            id: mainLauncher
            width: 500
            height: 200

            Launcher {
                id: launcher

            }
        }

        Item {
            id: mainNotch
            anchors.centerIn: parent
            height: parent.height
            width: rowHandler.width
            opacity: root.mode === "notch" ? 1 : 0
            visible: opacity > 0
            
            RowLayout {
                id: rowHandler
                anchors.centerIn: parent
                height: parent.height
                opacity: stateHandler.notch.isOpen ? 1 : 0
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
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            stateHandler.notch.isOpen = !stateHandler.notch.isOpen;
        }
    }
}
