# Created by: Jun-ichiro itojun Hagino <itojun@itojun.org>
# $FreeBSD$

PORTNAME=	portlint
PORTVERSION=	2.16.2
CATEGORIES=	ports-mgmt
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	marcus@FreeBSD.org
COMMENT=	Verifier for FreeBSD port directory

LICENSE=	ITOJUN
LICENSE_NAME=	Itojun License
LICENSE_TEXT=	All rights reserved. Freely redistributable.  Absolutely no warranty.
LICENSE_PERMS=	auto-accept dist-mirror dist-sell pkg-mirror pkg-sell

NO_BUILD=	yes
WRKSRC=		${WRKDIR}/src
USES=		perl5
USE_PERL5=	run

SRC=		${.CURDIR}/src

PLIST_FILES=	bin/portlint \
		man/man1/portlint.1.gz
USES+=		shebangfix
SHEBANG_FILES=	*.pl

PORTEXAMPLES=	portlintgrep

OPTIONS_DEFINE=	EXAMPLES

do-extract:
	@${MKDIR} ${WRKSRC}
	@${CP} ${SRC}/* ${WRKSRC}/

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/ports|/usr/dports|g' ${WRKSRC}/portlint*

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/portlint.pl \
	    ${STAGEDIR}${PREFIX}/bin/portlint
	${INSTALL_MAN} ${WRKSRC}/portlint.1 \
	    ${STAGEDIR}${MAN1PREFIX}/man/man1
	${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/portlintgrep.pl \
	    ${STAGEDIR}${EXAMPLESDIR}/portlintgrep

.include <bsd.port.mk>
