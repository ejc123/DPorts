# Created by: trasz <trasz@pin.if.uz.zgora.pl>
# $FreeBSD: head/emulators/dtcyber/Makefile 375061 2014-12-20 18:17:19Z bapt $

PORTNAME=	dtcyber
PORTVERSION=	2.0b1
PORTREVISION=	2
CATEGORIES=	emulators
MASTER_SITES=	http://members.iinet.net.au/~tom-hunter/ \
		${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	trasz
DISTNAME=	dtcyber20b1

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Desktop CYBER Emulator

USES=		dos2unix zip
USE_XORG=	x11
NO_WRKSUBDIR=	yes
INSTALL_TARGET=
MAKEFILE=	Makefile.x11
CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

SUB_FILES=	pkg-message
PLIST_FILES=	bin/dtcyber %%EXAMPLESDIR%%/cyber.ini %%EXAMPLESDIR%%/cos.tap

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/dtcyber ${STAGEDIR}${PREFIX}/bin
	@${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/cyber.ini ${STAGEDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/Os/cos.tap ${STAGEDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
