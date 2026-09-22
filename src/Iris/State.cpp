#include "State.h"

State::State(QObject* parent) : QObject(parent) {
}

Launcher* State::launcher() const {
    return Launcher::instance();
}