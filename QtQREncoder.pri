QRENCODER_VERSION = 3.4.4

isEmpty(QRENCODER_LIBRARY_TYPE) {
    QRENCODER_LIBRARY_TYPE = shared
}

QRENCODER_INCLUDEPATH += $${PWD}/qrencode

QRENCODER_LIBS = -lqrencode

contains(QRENCODER_LIBRARY_TYPE, staticlib) {
    DEFINES += QRENCODER_STATIC
} else {
    DEFINES += QRENCODER_SHARED
    win32:QRENCODER_LIBS = -lqrencode1
}

isEmpty(PREFIX) {
    unix {
        PREFIX = /usr
    } else {
        PREFIX = $$[QT_INSTALL_PREFIX]
    }
}
isEmpty(LIBDIR) {
    LIBDIR = lib
}

