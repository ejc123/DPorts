# $FreeBSD: Mk/bsd.default-versions.mk 331361 2013-10-23 10:26:23Z mat $
#
# MAINTAINER:	ports@FreeBSD.org
#
# Handle the default versions for users chosable multi versions.
#
# It expects users to define DEFAULT_VERSIONS in their make.conf
# Syntax is the following:
#
# DEFAULT_VERSIONS=	perl5=5.18 ruby=2.0

.if !defined(_INCLUDE_BSD_DEFAULT_VERSIONS_MK)
_INCLUDE_BSD_DEFAULT_VERSIONS_MK=	yes

.for lang in ${DEFAULT_VERSIONS}
_l=		${lang:C/=.*//g}
${_l:tu}_DEFAULT=	${lang:C/.*=//g}
.endfor

PERL5_DEFAULT?=		5.16
RUBY_DEFAULT?=		1.9
TCLTK_DEFAULT?=		8.6
PYTHON_DEFAULT?=	2.7
PYTHON2_DEFAULT?=	2.7
PYTHON3_DEFAULT?=	3.3

.endif
