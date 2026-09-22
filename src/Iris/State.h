#pragma once
#include <QObject>
#include <QtQmlIntegration/qqmlintegration.h>
#include "Launcher.h"

class State : public QObject {
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(Launcher* launcher READ launcher CONSTANT)

public:
    explicit State(QObject* parent = nullptr);
    Launcher* launcher() const;
};