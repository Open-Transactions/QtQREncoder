include(QtQREncoder.pri)

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

INCLUDEPATH += $$PWD
TEMPLATE = lib
TARGET = qrencode
QT += core gui
DEFINES += QRENCODER_BUILD
CONFIG += $${QRENCODER_LIBRARY_TYPE}
VERSION = $${QRENCODER_VERSION}
win32:DESTDIR = $$OUT_PWD
macx:QMAKE_LFLAGS_SONAME = -Wl,-install_name,@rpath/


#Msvc wasn't finding the "config.h" file in the project dir
#and this includepath takes care of that.


SOURCES += widget.cpp \
    qrencode/bitstream.c \
    qrencode/mask.c \
    qrencode/mmask.c \
    qrencode/mqrspec.c \
    qrencode/qrencode.c \
    qrencode/qrinput.c \
    qrencode/qrspec.c \
    qrencode/rscode.c \
    qrencode/split.c


HEADERS  += widget.h \
    qrencode/bitstream.h \
    qrencode/mask.h \
    qrencode/mmask.h \
    qrencode/mqrspec.h \
    qrencode/qrencode.h \
    qrencode/qrencode_inner.h \
    qrencode/qrinput.h \
    qrencode/qrspec.h \
    qrencode/rscode.h \
    qrencode/split.h \


FORMS    += widget.ui

# install
headers.files = $${INSTALL_HEADERS}
headers.path = $${PREFIX}/include/qrencode
target.path = $${PREFIX}/$${LIBDIR}
INSTALLS += headers target

# pkg-config support
CONFIG += create_pc create_prl no_install_prl
QMAKE_PKGCONFIG_DESTDIR = pkgconfig
QMAKE_PKGCONFIG_LIBDIR = $$target.path
QMAKE_PKGCONFIG_INCDIR = $$headers.path
equals(QRENCODER_LIBRARY_TYPE, staticlib) {
QMAKE_PKGCONFIG_CFLAGS = -DQRENCODER_STATIC
} else {
QMAKE_PKGCONFIG_CFLAGS = -DQRENCODER_SHARED
}
unix:QMAKE_CLEAN += -r pkgconfig lib$${TARGET}.prl

