# Created by: Autrijus Tang <autrijus@autrijus.org>
# $FreeBSD$

PORTNAME=	SVN-Mirror
PORTVERSION=	0.75
PORTREVISION=	3
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Mirror remote subversion repository to local

BUILD_DEPENDS=	p5-Data-UUID>=0:${PORTSDIR}/devel/p5-Data-UUID \
		p5-subversion>=0:${PORTSDIR}/devel/p5-subversion \
		p5-Term-ReadKey>=0:${PORTSDIR}/devel/p5-Term-ReadKey \
		p5-Class-Accessor>=0:${PORTSDIR}/devel/p5-Class-Accessor \
		p5-TimeDate>=0:${PORTSDIR}/devel/p5-TimeDate \
		p5-File-chdir>=0:${PORTSDIR}/devel/p5-File-chdir \
		p5-SVN-Simple>=0:${PORTSDIR}/devel/p5-SVN-Simple \
		p5-URI>=0:${PORTSDIR}/net/p5-URI \
		p5-VCP-autrijus>=0:${PORTSDIR}/devel/p5-VCP-autrijus
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5
USE_PERL5=	configure

regression-test:
	cd ${WRKSRC} && ${MAKE} test

.include <bsd.port.mk>
