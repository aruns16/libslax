#
# $Id$
#
# Copyright 2013, Juniper Networks, Inc.
# All rights reserved.
# This SOFTWARE is licensed under the LICENSE provided in the
# ../Copyright file. By downloading, installing, copying, or otherwise
# using the SOFTWARE, you agree to be bound by the terms of that
# LICENSE.

if SLAX_WARNINGS_HIGH
SLAX_WARNINGS = HIGH
endif
include ${top_srcdir}/warnings.mk

ext_exsltincdir = ${includedir}/libslax

AM_CFLAGS = \
    -DLIBSLAX_XMLSOFT_NEED_PRIVATE \
    -I${top_srcdir} \
    -I${top_srcdir}/libslax \
    ${LIBXSLT_CFLAGS} \
    ${LIBXML_CFLAG} \
    ${WARNINGS}

AM_CFLAGS += \
 -DSLAX_EXTDIR=\"${SLAX_EXTDIR}\"

LIBNAME = libext_exslt
pkglib_LTLIBRARIES = libext_exslt.la
LIBS = \
    ${LIBXSLT_LIBS} \
    -lexslt \
    ${LIBXML_LIBS} \
    -L${top_builddir}/libslax -lslax

LDADD = ${top_builddir}/libslax/libslax.la

if HAVE_READLINE
LIBS += -L/opt/local/lib -lreadline
endif

libext_exslt_la_SOURCES = \
    ext_exslt.c

slaxextdir = ${SLAX_EXTDIR}
pkglibdir = ${slaxextdir}
ext_exsltlibdir = ${slaxextdir}
#slaxext_LIBRARIES = libext_exslt.la

UGLY_NAMES = \
    exsl.prefix:http%3A%2F%2Fexslt.org%2Fcommon.ext \
    crypto.prefix:http%3A%2F%2Fexslt.org%2Fcrypto.ext \
    math.prefix:http%3A%2F%2Fexslt.org%2Fmath.ext \
    set.prefix:http%3A%2F%2Fexslt.org%2Fsets.ext \
    func.prefix:http%3A%2F%2Fexslt.org%2Ffunctions.ext \
    str.prefix:http%3A%2F%2Fexslt.org%2Fstrings.ext \
    date.prefix:http%3A%2F%2Fexslt.org%2Fdates-and-times.ext \
    dyn.prefix:http%3A%2F%2Fexslt.org%2Fdynamic.ext \
    saxon.prefix:http%3A%2F%2Ficl.com%2Fsaxon.ext

install-exec-hook:
	@DLNAME=`sh -c '. ./libext_exslt.la ; echo $$dlname'` ; \
		if [ x"$$DLNAME" = x ]; \
                    then DLNAME=${LIBNAME}.${SLAX_LIBEXT}; fi ; \
		echo Install link $$DLNAME "->" ${UGLY_NAME} "..." ; \
		mkdir -p ${DESTDIR}${SLAX_EXTDIR} ; \
		cd ${DESTDIR}${SLAX_EXTDIR} \
		&& chmod +w . \
		&& rm -f ${UGLY_NAMES} \
		&& for name in ${UGLY_NAMES}; do \
			prefix=`echo $$name | awk -F: '{ print $$1 }'` \
			&& url=`echo $$name | awk -F: '{ print $$2 }'` \
			&& rm -f $$prefix $$url \
			&& ${LN_S} $$DLNAME $$url \
			&& ${LN_S} $$url $$prefix; \
		done
