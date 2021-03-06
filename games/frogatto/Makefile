# Created by: Alexey Dokuchaev <danfe@FreeBSD.org>
# $FreeBSD$

PORTNAME=	frogatto
PORTVERSION=	1.3.1
PORTREVISION=	4
CATEGORIES=	games

MAINTAINER=	fiziologus@gmail.com
COMMENT=	Old-school 2D classic adventure platformer game

LIB_DEPENDS=	libboost_thread.so:${PORTSDIR}/devel/boost-libs \
		libpng.so:${PORTSDIR}/graphics/png

NO_PACKAGE=	Package will be 144M, set FORCE_PACKAGE if you really want it

USE_GITHUB=	yes
GH_ACCOUNT=	frogatto
GH_TAGNAME=	${PORTVERSION}
GH_COMMIT=	58bd7c6

USES=		gmake pkgconfig
ALL_TARGET=	game server
USE_GL=		glew glu
USE_SDL=	sdl image mixer ttf

PLIST_FILES=	bin/${PORTNAME} bin/${PORTNAME}-server

post-patch:
	@${REINPLACE_CMD} -e 's|-Werror||' ${WRKSRC}/Makefile
	@${REINPLACE_CMD} -e 's,%lu,%u,' ${WRKSRC}/src/server.cpp
	@${REINPLACE_CMD} -e 's,__linux__,__${OPSYS}__,' \
		${WRKSRC}/src/clipboard.cpp
# Point to the right location where to look for resources on FreeBSD
	@${REINPLACE_CMD} -e 's,HAVE_CONFIG_H,__FreeBSD__,' \
		-e 's,DATADIR,"${DATADIR}",' ${WRKSRC}/src/filesystem.cpp
	@${REINPLACE_CMD} -e 's,itor->second,"${DATADIR}/" + &,' \
		${WRKSRC}/src/sound.cpp
	@${REINPLACE_CMD} -e '/\/locale\//s,\.,${PREFIX}/share,' \
		${WRKSRC}/src/i18n.cpp

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/game ${STAGEDIR}${PREFIX}/bin/${PORTNAME}
	${INSTALL_PROGRAM} ${WRKSRC}/server \
		${STAGEDIR}${PREFIX}/bin/${PORTNAME}-server
	cd ${WRKSRC}/modules/frogatto/locale && \
		${MV} hu_HU hu && ${MV} ms_MY ms
	cd ${WRKSRC}/modules/frogatto && ${COPYTREE_SHARE} \
		locale ${STAGEDIR}${PREFIX}/share
	cd ${WRKSRC} && ${COPYTREE_SHARE} "data images music modules utils" \
		${STAGEDIR}${DATADIR}
	cd ${WRKSRC} && ${INSTALL_DATA} *.ttf *.cfg ${STAGEDIR}${DATADIR}
# Dynamically generate part of the PLIST for NLS files and game resources
# (really lots of them)
	@${FIND} ${STAGEDIR}${PREFIX}/share/locale -name ${PORTNAME}.mo | \
		${SED} 's,^${STAGEDIR}${PREFIX}/,,' | ${SORT} >> ${TMPPLIST}
	@${FIND} ${STAGEDIR}${DATADIR} -not -type d | \
		${SED} 's,^${STAGEDIR}${PREFIX}/,,' | ${SORT} >> ${TMPPLIST}
	@${FIND} ${STAGEDIR}${DATADIR} -type d | \
		${SED} 's,^${STAGEDIR}${PREFIX}/,@dirrm ,' | \
			${SORT} -r >> ${TMPPLIST}

.include <bsd.port.mk>
