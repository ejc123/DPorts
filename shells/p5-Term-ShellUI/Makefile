# Created by: Sergey Matveychuk <sem@FreeBSD.org>
# $FreeBSD$

PORTNAME=	Term-ShellUI
PORTVERSION=	0.92
PORTREVISION=	2
CATEGORIES=	shells perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Fully-featured shell-like command line environment

BUILD_DEPENDS=	p5-ReadLine-Gnu>=0:${PORTSDIR}/devel/p5-ReadLine-Gnu
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5
USE_PERL5=	configure

OPTIONS_DEFINE=	EXAMPLES

post-install:
	@${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	(cd ${WRKSRC}/examples/ && ${INSTALL_SCRIPT} \
		fileman-example synopsis synopsis-big tui-sample ${STAGEDIR}${EXAMPLESDIR})

.include <bsd.port.mk>
