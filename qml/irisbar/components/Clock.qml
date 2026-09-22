import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.globals

Rectangle {
    width: textHandler.width + 12
    height: parent.height - 12
    color: Theme.md3.primary
    radius: height / 2

    SystemClock {
        id: sysClock
    }

    Text {
        id: textHandler
        anchors.centerIn: parent
        text: Qt.formatDateTime(sysClock.date, "hh:mm")
        font.family: "Google Sans"
        font.weight: Font.Bold
        font.pixelSize: 16
        color: Theme.md3.on_primary
    }
}