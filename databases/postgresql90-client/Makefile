# Created by: Palle Girgensohn <girgen@FreeBSD.org>
# $FreeBSD$

PORTNAME=	postgresql
COMMENT=	PostgreSQL database (client)
PORTREVISION=	1

MASTERDIR=	${.CURDIR}/../postgresql90-server

BUILD_DIRS=	config src/include src/interfaces src/port \
		src/bin/pg_dump src/bin/psql src/bin/scripts src/bin/pg_config \
		doc src/makefiles
INSTALL_DIRS=	${BUILD_DIRS}
CLIENT_ONLY=	yes
COMPONENT=	-client
USE_LDCONFIG=	yes

.include "${MASTERDIR}/Makefile"
