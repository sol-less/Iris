import Quickshell
import QtQuick
import qs.qml.irisbar

ShellRoot {
    Variants {
        model: Quickshell.screens

        Notch {
            required property var modelData
            screen: modelData
        }
    }
}