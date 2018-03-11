#!/bin/bash
patch -Np1 -i "${SHED_PATCHDIR}/libmad-0.15.1b-fixes-1.patch" && \
sed "s@AM_CONFIG_HEADER@AC_CONFIG_HEADERS@g" -i configure.ac && \
touch NEWS AUTHORS ChangeLog && \
autoreconf -fiv && \
./configure --prefix=/usr \
            --disable-static && \
make -j $SHED_NUMJOBS && \
make DESTDIR="$SHED_FAKEROOT" install && \
install -Dm644 -v "${SHED_CONTRIBDIR}/mad.pc" "${SHED_FAKEROOT}/usr/lib/pkgconfig/mad.pc"
