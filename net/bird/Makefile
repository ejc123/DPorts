# Created by: Pav Lucistnik <pav@FreeBSD.org>
# $FreeBSD$

PORTNAME?=	bird
PORTVERSION=	1.4.5
PORTREVISION=	2
CATEGORIES=	net
MASTER_SITES=	ftp://bird.network.cz/pub/bird/ \
		http://bird.mpls.in/distfiles/bird/

MAINTAINER=	melifaro@ipfw.ru
COMMENT?=	Dynamic IP routing daemon (IPv4 version)

LICENSE=	GPLv2

USES=		bison gmake readline
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--localstatedir=/var
USE_CSTD=	gnu89

OPTIONS_DEFINE?=	FIREWALL AGG EXP
FIREWALL_DESC=	Enable firewall protocol
AGG_DESC=	Enable aggregation protocol (EXPERIMENTAL)
EXP_DESC=	Enable some experimental patches
NO_OPTIONS_SORT=	yes

MAKE_JOBS_UNSAFE=	yes

USE_RC_SUBR=	${PORTNAME}

SUB_LIST+=	PORTNAME=${PORTNAME}

PLIST_SUB?=	VER=""

FIREWALL_EXTRA_PATCHES+=	${FILESDIR}/firewall_support.patch
AGG_EXTRA_PATCHES+=	${FILESDIR}/agg_support.patch
EXP_EXTRA_PATCHES+=	${FILESDIR}/exp-templates.patch ${FILESDIR}/exp-ll.patch ${FILESDIR}/exp-locks.patch

.include <bsd.port.options.mk>

post-patch:
.if ${PORT_OPTIONS:MAGG}
	@${REINPLACE_CMD} -e 's/^\(all_protocols=".*\)"/\1 agg"/' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e '/proto_build(&proto_device);/{G;s/$$/  proto_build(\&proto_agg);/;}' ${WRKSRC}/nest/proto.c
	@${REINPLACE_CMD} -e '/CONFIG_BFD/{G;s/$$/#undef CONFIG_AGG/;}' ${WRKSRC}/sysdep/autoconf.h.in
	@${REINPLACE_CMD} -e 's/\(proto_bfd\)/\1, proto_agg/' ${WRKSRC}/nest/protocol.h
.endif
.if ${PORT_OPTIONS:MFIREWALL}
	@${REINPLACE_CMD} -e 's/^\(all_protocols=".*\)"/\1 firewall"/' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e '/proto_build(&proto_device);/{G;s/$$/  proto_build(\&proto_firewall);/;}' ${WRKSRC}/nest/proto.c
	@${REINPLACE_CMD} -e '/CONFIG_PIPE/{G;s/$$/#undef CONFIG_FIREWALL_IPSET/;}' ${WRKSRC}/sysdep/autoconf.h.in
	@${REINPLACE_CMD} -e '/CONFIG_PIPE/{G;s/$$/#undef CONFIG_FIREWALL_PF/;}' ${WRKSRC}/sysdep/autoconf.h.in
	@${REINPLACE_CMD} -e '/CONFIG_PIPE/{G;s/$$/#undef CONFIG_FIREWALL_IPFW/;}' ${WRKSRC}/sysdep/autoconf.h.in
	@${REINPLACE_CMD} -e '/CONFIG_PIPE/{G;s/$$/#undef CONFIG_FIREWALL/;}' ${WRKSRC}/sysdep/autoconf.h.in
	@${REINPLACE_CMD} -e 's/\(proto_bfd\)/\1, proto_firewall/' ${WRKSRC}/nest/protocol.h
.endif

.include <bsd.port.mk>
