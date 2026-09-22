#pragma once
#include <QObject>
#include <QtQmlIntegration/qqmlintegration.h>

class Launcher : public QObject {
    Q_OBJECT
    Q_PROPERTY(bool isOpen READ isOpen WRITE setIsOpen NOTIFY isOpenChanged)
    QML_UNCREATABLE("Launcher is managed by State")

public:
    static Launcher* instance();

    bool isOpen() const;
    void setIsOpen(bool open);

signals:
    void isOpenChanged();

private:
    explicit Launcher(QObject* parent = nullptr);
    bool m_isOpen = false;
};