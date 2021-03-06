# Created by: Martin Matuska <mm@FreeBSD.org>
# $FreeBSD$

PORTNAME=	mod_h264_streaming
CATEGORIES=	www multimedia
PKGNAMEPREFIX=	lighttpd-
DISTNAME=	lighttpd-${PORTVERSION}

MAINTAINER=	mat@FreeBSD.org
COMMENT=	H264 streaming module for lighttpd

BUILD_DEPENDS=	${LOCALBASE}/sbin/lighttpd:${PORTSDIR}/www/lighttpd
RUN_DEPENDS=	${LOCALBASE}/sbin/lighttpd:${PORTSDIR}/www/lighttpd

LICENSE=	CCPL.BY-NC-SA.30
LICENSE_NAME=	Creative Commons Attribution-NonCommercial-ShareAlike 3.0 \
		Unported License
LICENSE_FILE=	${FILESDIR}/COPYING.mod_h264_streaming
LICENSE_DISTFILES=	${PATCHFILES}
LICENSE_PERMS=	dist-mirror pkg-mirror

MASTERDIR=	${.CURDIR}/../lighttpd
PLIST=		${FILESDIR}/pkg-plist.${PORTNAME}
DESCR=		${FILESDIR}/pkg-descr.${PORTNAME}
LATEST_LINK=	lighttpd-${PORTNAME}

.if !defined(DPORTS_BUILDER)
MANUAL_PACKAGE_BUILD=	free for non-commercial use only
.endif

PATCH_SITES+=	${MASTER_SITE_LOCAL}
PATCHFILES+=	lighttpd-1.4.26_mod_h264_streaming-2.2.9.patch.gz
PATCH_SITE_SUBDIR+=	mm

BUILD_WRKSRC=	${WRKSRC}/src
ALL_TARGET=	${PORTNAME}.la

_BUILDING_LIGHTTPD_MODULE=	yes

do-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/lib/lighttpd
	@${INSTALL_LIB} ${WRKSRC}/src/.libs/${PORTNAME}.so \
		${STAGEDIR}${PREFIX}/lib/lighttpd
	@${MKDIR} ${STAGEDIR}${PREFIX}/etc/lighttpd/conf.d
	@${INSTALL_DATA} ${FILESDIR}/h264_streaming.conf \
		${STAGEDIR}${PREFIX}/etc/lighttpd/conf.d/h264_streaming.conf.sample

.include "${MASTERDIR}/Makefile"
