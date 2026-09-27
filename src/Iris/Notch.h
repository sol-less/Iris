#pragma once
#include <QObject>
#include <QtQmlIntegration/qqmlintegration.h>

class Notch : public QObject {
    Q_OBJECT
    Q_PROPERTY(bool isOpen READ isOpen WRITE setIsOpen NOTIFY isOpenChanged)
    QML_UNCREATABLE("Notch is managed by State")

public:
    static Notch* instance();

    bool isOpen() const;
    void setIsOpen(bool open);

signals:
    void isOpenChanged();

private:
    explicit Notch(QObject* parent = nullptr);
    bool m_isOpen = false;
};