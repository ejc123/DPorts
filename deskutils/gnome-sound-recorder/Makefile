# Created by: Gustau Perez <gustau.perez@gmail.com>
# $FreeBSD$

PORTNAME=	gnome-sound-recorder
PORTVERSION=	3.14.2
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	gnome@FreeBSD.org
COMMENT=	GNOME sound recorder application

LIB_DEPENDS=	libgjs.so:${PORTSDIR}/lang/gjs

USES=		gettext gmake libtool pathfix pkgconfig python:3 tar:xz
USE_GNOME=	gnomedesktop3 gnomeprefix gtk30 intlhack \
		introspection:build
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
GLIB_SCHEMAS=	org.gnome.gnome-sound-recorder.gschema.xml

.include <bsd.port.mk>
