# Created by: Grzegorz Blach <gblach@FreeBSD.org>
# $FreeBSD$

PORTNAME=	rage
PORTVERSION=	0.1.0
CATEGORIES=	multimedia enlightenment
MASTER_SITES=	http://download.enlightenment.org/rel/apps/${PORTNAME}/

MAINTAINER=	gblach@FreeBSD.org
COMMENT=	EFL video and audio player with some extra bells and whistles

LICENSE=	BSD2CLAUSE

LIB_DEPENDS=	libefl.so:${PORTSDIR}/devel/efl \
		libelementary.so:${PORTSDIR}/x11-toolkits/elementary

DIST_SUBDIR=	enlightenment
GNU_CONFIGURE=	yes
USES=		desktop-file-utils pkgconfig tar:bzip2

.include <bsd.port.mk>
