import Quickshell
import Quickshell.Io
import QtQuick
import Iris
import qs.qml.irisbar

ShellRoot {

    IpcHandler {
        target: "stateHandler"

        function notchToggle(): void {
            stateHandler.notch.isOpen = !stateHandler.notch.isOpen
        }
    }

    State {
        id: stateHandler
    }

    Variants {
        model: Quickshell.screens

        Notch {
            required property var modelData
            screen: modelData
        }
    }
}