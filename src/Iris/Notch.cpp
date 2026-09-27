#include "Notch.h"

Notch::Notch(QObject* parent) : QObject(parent) {}

Notch* Notch::instance() {
    static Notch* _instance = new Notch();
    return _instance;
}

bool Notch::isOpen() const {
    return m_isOpen;
}

void Notch::setIsOpen(bool open) {
    if (m_isOpen != open) {
        m_isOpen = open;
        emit isOpenChanged();
    }
}