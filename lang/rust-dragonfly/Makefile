# Created by: Michael Neumann <mneumann@ntecs.de>
# $FreeBSD$

PORTNAME=	rust
RUST_SNAP_DATE=	2015-03-08
PORTVERSION=	1.0.0.${RUST_SNAP_DATE:S/-//g}
CATEGORIES=	lang
MASTER_SITES=	http://www.ntecs.de/downloads/rust/:bootstrap \
		http://static.rust-lang.org/dist/${RUST_SNAP_DATE}/:rust \
PKGNAMESUFFIX=	-dragonfly
DISTFILES=	${RUST_BOOT}:bootstrap \
		${RUST_SOURCE}:rust
DIST_SUBDIR=	rust-dragonfly/${RUST_SNAP_DATE}
EXTRACT_ONLY=	${RUST_SOURCE}

MAINTAINER=	mneumann@ntecs.de
COMMENT=	Language with a focus on memory safety and concurrency

LICENSE=	APACHE20 MIT
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE-APACHE \
		${WRKSRC}/LICENSE-MIT

BUILD_DEPENDS=	curl:${PORTSDIR}/ftp/curl

RUST_SOURCE=	rustc-nightly-src.tar.gz
RUST_BOOT=	rust-stage0-${RUST_BOOT_SIG}.tar.bz2
RUST_BOOT_SIG=	2015-02-25-880fb89-dragonfly-x86_64-3fc829ad999d56d664401054a8bb6a801c19d146
PLIST_SUB=	DIGEST=4e7c5e5c

USES=		gmake perl5 python:2
WRKSRC=		${WRKDIR}/rustc-nightly
HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-docs --mandir=${MANPREFIX}/man
MAKE_ENV=	SNAPSHOT_FILE=${DISTDIR}/${DIST_SUBDIR}/${RUST_BOOT}
USE_LDCONFIG=	yes
USE_PERL5=	build
USE_GCC=	4.7	# specified in README, possibly by bootstrap too

.if defined(VERBOSE) || defined(DPORTS_BUILDER)
MAKE_ARGS+=	VERBOSE=1
.endif

post-build:
	# Rust install target continues to build, so we need to move the
	# building portion into the "build" phase and out of the stage phase
	(cd ${INSTALL_WRKSRC} && \
		${SETENV} ${MAKE_ENV} ${MAKE_CMD} ${MAKE_FLAGS} \
		${MAKEFILE} ${_MAKE_JOBS} ${MAKE_ARGS} prepare_install)
	@${ECHO_MSG} "Please 'make regression-test' to run regression tests"

regression-test: build
	(cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} \
		${MAKE_CMD} ${_MAKE_JOBS} ${MAKE_ARGS} check)

post-install:
	# This manifest refers to the build directory (STAGEDIR)
	# While it could be fixed with sed, remove it as lang/rust does
	${RM} ${STAGEDIR}${PREFIX}/lib/rustlib/manifest-rustc

.include <bsd.port.mk>
