# Created by: Martin Klaffenboeck <martin.klaffenboeck@gmx.at>
# $FreeBSD$

PORTNAME=	zodb
PORTVERSION=	3.10.5
PORTREVISION=	1
CATEGORIES=	databases
MASTER_SITES=	CHEESESHOP
PKGNAMESUFFIX=	-py${PYTHON_SUFFIX}
DISTNAME=	ZODB3-${PORTVERSION}

MAINTAINER=	zope@FreeBSD.org
COMMENT=	Z - Object Database for python

LICENSE=	ZPL21

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}zconfig>=0:${PORTSDIR}/devel/py-zconfig \
		${PYTHON_PKGNAMEPREFIX}zdaemon>=0:${PORTSDIR}/sysutils/py-zdaemon \
		${PYTHON_PKGNAMEPREFIX}zope.interface>=0:${PORTSDIR}/devel/py-zope.interface \
		${PYTHON_PKGNAMEPREFIX}transaction>=1.1.0:${PORTSDIR}/devel/py-transaction \
		${PYTHON_PKGNAMEPREFIX}zclockfile>=1.0.0:${PORTSDIR}/devel/py-zclockfile \
		${PYTHON_PKGNAMEPREFIX}zope.event>=1.0.0:${PORTSDIR}/devel/py-zope.event

USES=		python:2
USE_PYTHON=	distutils autoplist

.include <bsd.port.mk>
