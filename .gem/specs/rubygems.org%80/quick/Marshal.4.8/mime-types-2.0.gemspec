u:Gem::SpecificationS[I"
2.0.7:ETi	I"mime-types; TU:Gem::Version[I"2.0; TIu:	Time�g�    :@_zoneI"UTC; TI"oThe mime-types library provides a library and registry for information about MIME content type definitions; TU:Gem::Requirement[[[I">=; TU;[I"
1.9.2; TU;	[[[I">=; TU;[I"0; TI"	ruby; F[o:Gem::Dependency
:
@nameI"rubyforge; T:@requirementU;	[[[I">=; TU;[I"
2.0.4; T:
@type:development:@prereleaseF:@version_requirementsU;	[[[I">=; TU;[I"
2.0.4; To;

;I"minitest; T;U;	[[[I"~>; TU;[I"5.0; T;;;F;U;	[[[I"~>; TU;[I"5.0; To;

;I"	rdoc; T;U;	[[[I"~>; TU;[I"4.0; T;;;F;U;	[[[I"~>; TU;[I"4.0; To;

;I"hoe-bundler; T;U;	[[[I"~>; TU;[I"1.2; T;;;F;U;	[[[I"~>; TU;[I"1.2; To;

;I"hoe-doofus; T;U;	[[[I"~>; TU;[I"1.0; T;;;F;U;	[[[I"~>; TU;[I"1.0; To;

;I"hoe-gemspec2; T;U;	[[[I"~>; TU;[I"1.1; T;;;F;U;	[[[I"~>; TU;[I"1.1; To;

;I"hoe-git; T;U;	[[[I"~>; TU;[I"1.5; T;;;F;U;	[[[I"~>; TU;[I"1.5; To;

;I"hoe-rubygems; T;U;	[[[I"~>; TU;[I"1.0; T;;;F;U;	[[[I"~>; TU;[I"1.0; To;

;I"hoe-travis; T;U;	[[[I"~>; TU;[I"1.2; T;;;F;U;	[[[I"~>; TU;[I"1.2; To;

;I"	rake; T;U;	[[[I"~>; TU;[I"	10.0; T;;;F;U;	[[[I"~>; TU;[I"	10.0; To;

;I"simplecov; T;U;	[[[I"~>; TU;[I"0.7; T;;;F;U;	[[[I"~>; TU;[I"0.7; To;

;I"hoe; T;U;	[[[I"~>; TU;[I"3.7; T;;;F;U;	[[[I"~>; TU;[I"3.7; TI"mime-types; T[I"austin@rubyforge.org; T[I"Austin Ziegler; TI"�The mime-types library provides a library and registry for information about
MIME content type definitions. It can be used to determine defined filename
extensions for MIME types, or to use filename extensions to look up the likely
MIME type definitions.

MIME content types are used in MIME-compliant communications, as in e-mail or
HTTP traffic, to indicate the type of content which is transmitted. The
mime-types library provides the ability for detailed information about MIME
entities (provided as an enumerable collection of MIME::Type objects) to be
determined and used programmatically. There are many types defined by RFCs and
vendors, so the list is long but by definition incomplete; don't hesitate to to
add additional type definitions (see Contributing.rdoc). The primary sources
for MIME type definitions found in mime-types is the IANA collection of
registrations (see below for the link), RFCs, and W3C recommendations.

The mime-types library uses semantic versioning. This is release 2.0; there are
incompatible changes in the API provided by mime-types, mostly around registry
initialization (see History.rdoc for full details), and the removal of support
for Ruby 1.8 interpreters.

mime-types (previously called MIME::Types for Ruby) was originally based on
MIME::Types for Perl by Mark Overmeer, copyright 2001 - 2009. It is built to
conform to the MIME types of RFCs 2045 and 2231. It tracks the {IANA
registry}[http://www.iana.org/assignments/media-types/]
({ftp}[ftp://ftp.iana.org/assignments/media-types]) with some unofficial types
added from the {LTSW collection}[http://www.ltsw.se/knbase/internet/mime.htp]
and added by the users of mime-types.; TI"%http://mime-types.rubyforge.org/; TT@[I"MIT; TI"Artistic 2.0; TI"
GPL-2; T