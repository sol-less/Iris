#include "Launcher.h"

Launcher::Launcher(QObject* parent) : QObject(parent) {}

Launcher* Launcher::instance() {
    static Launcher* _instance = new Launcher();
    return _instance;
}

bool Launcher::isOpen() const {
    return m_isOpen;
}

void Launcher::setIsOpen(bool open) {
    if (m_isOpen != open) {
        m_isOpen = open;
        emit isOpenChanged();
    }
}