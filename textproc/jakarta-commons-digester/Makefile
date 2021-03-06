# Created by: Herve Quiroz <hq@FreeBSD.org>
# $FreeBSD$

PORTNAME=	commons-digester
PORTVERSION=	2.1
CATEGORIES=	textproc java devel
MASTER_SITES=	${MASTER_SITE_APACHE_COMMONS_BINARIES}
MASTER_SITE_SUBDIR=	${PORTNAME:S,commons-,,}
PKGNAMEPREFIX=	jakarta-
DISTNAME=	${PORTNAME}-${PORTVERSION}-bin

MAINTAINER=	ports@FreeBSD.org
COMMENT=	XML-to-Java-object mapping utility package

LICENSE=	APACHE20
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${JAR_DEPENDS}
RUN_DEPENDS=	${JAR_DEPENDS}

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}
NO_BUILD=	yes
USE_JAVA=	yes
JAVA_VERSION=	1.6+

JARFILE=	${PORTNAME}.jar
PLIST_FILES=	%%JAVAJARDIR%%/${JARFILE}

OPTIONS_DEFINE=	DOCS

OTHERDOCS=	LICENSE.txt NOTICE.txt RELEASE-NOTES.txt
PORTDOCS=	*

.include <bsd.port.pre.mk>

JAR_DEPENDS=	${JAVALIBDIR}/commons-beanutils.jar:${PORTSDIR}/java/jakarta-commons-beanutils \
		${JAVALIBDIR}/commons-logging.jar:${PORTSDIR}/java/jakarta-commons-logging \
		${JAVALIBDIR}/commons-collections.jar:${PORTSDIR}/java/jakarta-commons-collections
.if ${JAVA_PORT_VERSION:C/^([0-9])\.([0-9])(.*)$/\1.\2/} != "1.4"
JAR_DEPENDS+=	${JAVALIBDIR}/xercesImpl.jar:${PORTSDIR}/textproc/xerces-j
.endif

do-install:
	@${ECHO_MSG} -n ">> Installing JAR as ${JAVAJARDIR}/${JARFILE}..."
	${INSTALL_DATA} ${WRKSRC}/${PORTNAME}-${PORTVERSION}.jar ${STAGEDIR}${JAVAJARDIR}/${JARFILE}
	@${ECHO_MSG} " [ DONE ]"
.if ${PORT_OPTIONS:MDOCS}
	@${ECHO_MSG} -n ">> Installing documentation in ${DOCSDIR}..."
	@cd ${WRKSRC}/apidocs \
	  && ${FIND} . -type d -exec ${MKDIR} ${STAGEDIR}${DOCSDIR}/{} \; \
	  && ${FIND} . -type f -exec ${INSTALL_DATA} {} ${STAGEDIR}${DOCSDIR}/{} \;
	${INSTALL_DATA} ${OTHERDOCS:S,^,${WRKSRC}/,} ${STAGEDIR}${DOCSDIR}/
	@${ECHO_MSG} " [ DONE ]"
.endif

.include <bsd.port.post.mk>
