#!/bin/bash
patch -Np1 -i "${SHED_PKG_PATCH_DIR}/libmad-0.15.1b-fixes-1.patch" && \
sed "s@AM_CONFIG_HEADER@AC_CONFIG_HEADERS@g" -i configure.ac && \
touch NEWS AUTHORS ChangeLog && \
autoreconf -fiv && \
./configure --prefix=/usr \
            --disable-static && \
make -j $SHED_NUM_JOBS && \
make DESTDIR="$SHED_FAKE_ROOT" install && \
install -Dm644 -v "${SHED_PKG_CONTRIB_DIR}/mad.pc" "${SHED_FAKE_ROOT}/usr/lib/pkgconfig/mad.pc"
