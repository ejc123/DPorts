# Created by: chuckr@FreeBSD.org
# $FreeBSD$

PORTNAME=	octave
PORTVERSION=	3.8.2
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	octave

MAINTAINER=	maho@FreeBSD.org
COMMENT=	High-level interactive language for numerical computations

LICENSE=	GPLv3

BUILD_DEPENDS=	gnuplot:${PORTSDIR}/math/gnuplot \
		${LOCALBASE}/bin/gperf:${PORTSDIR}/devel/gperf \
		gsed:${PORTSDIR}/textproc/gsed \
		${LOCALBASE}/bin/makeinfo:${PORTSDIR}/print/texinfo
RUN_DEPENDS=	gnuplot:${PORTSDIR}/math/gnuplot \
		gsed:${PORTSDIR}/textproc/gsed \
		${LOCALBASE}/bin/makeinfo:${PORTSDIR}/print/texinfo
LIB_DEPENDS=	libGraphicsMagick.so:${PORTSDIR}/graphics/GraphicsMagick \
		libarpack.so:${PORTSDIR}/math/arpack \
		libcurl.so:${PORTSDIR}/ftp/curl \
		libfftw3.so:${PORTSDIR}/math/fftw3 \
		libfftw3f.so:${PORTSDIR}/math/fftw3-float \
		libfltk.so:${PORTSDIR}/x11-toolkits/fltk \
		libftgl.so:${PORTSDIR}/graphics/ftgl \
		libhdf5.so:${PORTSDIR}/science/hdf5 \
		libpcre.so:${PORTSDIR}/devel/pcre \
		libqhull.so.5:${PORTSDIR}/math/qhull5 \
		libqrupdate.so:${PORTSDIR}/math/qrupdate \
		libumfpack.so:${PORTSDIR}/math/suitesparse \
		libglpk.so:${PORTSDIR}/math/glpk \
		libgl2ps.so:${PORTSDIR}/print/gl2ps \
		libqscintilla2.so:${PORTSDIR}/devel/qscintilla2

USES=		charsetfix fortran gmake libtool perl5 pkgconfig tar:bzip2
USE_LDCONFIG=	yes
USE_PERL5=	build
USE_TEX=	dvipsk:build
GNU_CONFIGURE=	yes
USE_JAVA=	yes
JAVA_VERSION=	1.7+
USE_QT4=	gui network uic_build moc_build rcc_build linguist_build

OCTAVE_VERSION=	${PORTVERSION}
GNU_HOST=	${CONFIGURE_TARGET}
PLIST_SUB=	OCTAVE_VERSION=${OCTAVE_VERSION} GNU_HOST=${GNU_HOST}
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ENV=	GPERF="${LOCALBASE}/bin/gperf" \
		JAVA_HOME=${JAVA_HOME} \
		MAKEINFO=${LOCALBASE}/bin/makeinfo
CONFIGURE_ARGS=	--host=${GNU_HOST} \
		--with-blas="-L${LOCALBASE}/lib ${BLASLIB}" \
		--with-lapack="${LAPACKLIB}" \
		--enable-shared \
		--disable-jit

OPTIONS_DEFINE=	DOCS

OPTIONS_RADIO=	BLAS
OPTIONS_RADIO_BLAS=	REFERENCE ATLAS OBLAS
OPTIONS_DEFAULT=	REFERENCE

REFERENCE_DESC=	Blas / Lapack
REFERENCE_USES=	blaslapack:netlib

ATLAS_DESC=	ATLAS
ATLAS_USES=	blaslapack:atlas

OBLAS_DESC=	Openblas
OBLAS_USES=	blaslapack:openblas

INFO=		octave liboctave

.include <bsd.port.options.mk>

post-patch:
	${REINPLACE_CMD} 's+"makeinfo"+"${LOCALBASE}/bin/makeinfo"+' ${WRKSRC}/libinterp/corefcn/help.cc
	${REINPLACE_CMD} 's+lapack lapack_rs6k+${LAPACKLIB:C/-l//}+' ${WRKSRC}/configure
	${REINPLACE_CMD} 's+-lumfpack+-lumfpack -lsuitesparseconfig -lamd -lcholmod -lcolamd ${LAPACKLIB}+' ${WRKSRC}/configure
	${REINPLACE_CMD} 's+-lcholmod+-lumfpack -lsuitesparseconfig -lamd -lcholmod -lcolamd ${LAPACKLIB}+' ${WRKSRC}/configure

post-install:
	${INSTALL_DATA} ${WRKSRC}/etc/icons/octave.desktop \
		${STAGEDIR}${DESKTOPDIR}/www.octave.org-octave.desktop
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
. for file in liboctave/liboctave.ps \
	refcard/refcard-a4.ps refcard/refcard-legal.ps \
	refcard/refcard-letter.ps interpreter/octave.ps
	${INSTALL_DATA} ${WRKSRC}/doc/${file} ${STAGEDIR}${DOCSDIR}
. endfor
.endif

check regression-test: build
	@(cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE_CMD} ${MAKE_ARGS} check)

.include <bsd.port.mk>
