# Created by: jasone
# $FreeBSD$

PORTNAME=	libedit
PORTVERSION=	${EDITVERSION}.${EDITDATE}
DISTVERSION=	${EDITDATE}-${EDITVERSION}
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	http://thrysoee.dk/editline/

MAINTAINER=	bapt@FreeBSD.org
COMMENT=	Command line editor library

LICENSE=	BSD2CLAUSE

USES=		libtool pathfix
EDITVERSION=	3.1
EDITDATE=	20141030
WRKSRC=		${WRKDIR}/${PORTNAME}-20141029-${EDITVERSION}
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip
CONFIGURE_ARGS=	--enable-widec
MAKE_ENV=	LC_ALL=C

CONFLICT_INSTALL=	editline-*

.include <bsd.port.mk>
