# Created by: Sunpoet Po-Chuan Hsieh <sunpoet@FreeBSD.org>
# $FreeBSD$

PORTNAME=	grib_api
PORTVERSION=	1.12.3
PORTREVISION=	1
CATEGORIES=	science
MASTER_SITES=	https://software.ecmwf.int/wiki/download/attachments/3473437/

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	ECMWF API for WMO FM-92 GRIB messages

LICENSE=	APACHE20

LIB_DEPENDS=	libnetcdf.so:${PORTSDIR}/science/netcdf \
		libpng.so:${PORTSDIR}/graphics/png

OPTIONS_SINGLE=	JPEG
OPTIONS_SINGLE_JPEG=	JASPER OPENJPEG
OPTIONS_DEFAULT=OPENJPEG

CONFIGURE_ARGS=	--enable-pthread --with-netcdf=${LOCALBASE} --with-png-support
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USES=		libtool pathfix

JASPER_CONFIGURE_ON=	--with-jasper=${LOCALBASE}
JASPER_LIB_DEPENDS=	libjasper.so:${PORTSDIR}/graphics/jasper
OPENJPEG_CONFIGURE_ON=	--with-openjpeg=${LOCALBASE}
OPENJPEG_LIB_DEPENDS=	libopenjpeg.so:${PORTSDIR}/graphics/openjpeg15

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/tools/grib1to2 ${STAGEDIR}${PREFIX}/bin/grib1to2

.include <bsd.port.mk>
