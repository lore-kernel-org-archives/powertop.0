Content-Type: multipart/mixed; boundary="===============8346982995156555942=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v1] Doxyfile.in: add doxygen support
Date: Thu, 11 Aug 2016 17:19:55 -0700
Message-ID: <1470961195-90314-1-git-send-email-joe.konno@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8346982995156555942==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

To assist PowerTOP developers, adding a Doxyfile for generating
developer documentation with Doxygen and Graphviz.

The Doxyfile will only generate HTML documentation by default, and it
will land in doc/html. Git will ignore both the autoconf-generated
Doxyfile and doc/html.

It makes no sense to bundle the Doxygen-generated documentation with
'make dist', so I didn't add support for it. It is intended solely for
PowerTOP developers, so I discourage distributions from including it in
their packages.

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 .gitignore   |    2 +
 Doxyfile.in  | 2280 ++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++
 configure.ac |    1 +
 3 files changed, 2283 insertions(+)
 create mode 100644 Doxyfile.in

diff --git a/.gitignore b/.gitignore
index 7eb138a094ce..c1fc2be37afe 100644
--- a/.gitignore
+++ b/.gitignore
@@ -18,6 +18,7 @@ Makefile.in
 # individual files
 /ABOUT-NLS
 /ChangeLog
+/Doxyfile
 /aclocal.m4
 /ar-lib
 /autom4te.cache
@@ -34,6 +35,7 @@ Makefile.in
 /install-sh
 /libtool
 /ltmain.sh
+/doc/html
 /m4/codeset.m4
 /m4/fcntl-o.m4
 /m4/gettext.m4
diff --git a/Doxyfile.in b/Doxyfile.in
new file mode 100644
index 000000000000..1f1d8b47f715
--- /dev/null
+++ b/Doxyfile.in
@@ -0,0 +1,2280 @@
+# Doxyfile 1.8.5
+
+# This file describes the settings to be used by the documentation system
+# doxygen (www.doxygen.org) for a project.
+#
+# All text after a double hash (##) is considered a comment and is placed =
in
+# front of the TAG it is preceding.
+#
+# All text after a single hash (#) is considered a comment and will be ign=
ored.
+# The format is:
+# TAG =3D value [value, ...]
+# For lists, items can also be appended using:
+# TAG +=3D value [value, ...]
+# Values that contain spaces should be placed between quotes (\" \").
+
+#-------------------------------------------------------------------------=
--
+# Project related configuration options
+#-------------------------------------------------------------------------=
--
+
+# This tag specifies the encoding used for all characters in the config fi=
le
+# that follow. The default is UTF-8 which is also the encoding used for al=
l text
+# before the first occurrence of this tag. Doxygen uses libiconv (or the i=
conv
+# built into libc) for the transcoding. See http://www.gnu.org/software/li=
biconv
+# for the list of possible encodings.
+# The default value is: UTF-8.
+
+DOXYFILE_ENCODING      =3D UTF-8
+
+# The PROJECT_NAME tag is a single word (or a sequence of words surrounded=
 by
+# double-quotes, unless you are using Doxywizard) that should identify the
+# project for which the documentation is generated. This name is used in t=
he
+# title of most generated pages and in a few other places.
+# The default value is: My Project.
+
+PROJECT_NAME           =3D "PowerTOP"
+
+# The PROJECT_NUMBER tag can be used to enter a project or revision number=
. This
+# could be handy for archiving the generated documentation or if some vers=
ion
+# control system is used.
+
+PROJECT_NUMBER         =3D @VERSION@
+
+# Using the PROJECT_BRIEF tag one can provide an optional one line descrip=
tion
+# for a project that appears at the top of each page and should give viewe=
r a
+# quick idea about the purpose of the project. Keep the description short.
+
+PROJECT_BRIEF          =3D
+
+# With the PROJECT_LOGO tag one can specify an logo or icon that is includ=
ed in
+# the documentation. The maximum height of the logo should not exceed 55 p=
ixels
+# and the maximum width should not exceed 200 pixels. Doxygen will copy th=
e logo
+# to the output directory.
+
+PROJECT_LOGO           =3D "PowerTop.png"
+
+# The OUTPUT_DIRECTORY tag is used to specify the (relative or absolute) p=
ath
+# into which the generated documentation will be written. If a relative pa=
th is
+# entered, it will be relative to the location where doxygen was started. =
If
+# left blank the current directory will be used.
+
+OUTPUT_DIRECTORY       =3D doc
+
+# If the CREATE_SUBDIRS tag is set to YES, then doxygen will create 4096 s=
ub-
+# directories (in 2 levels) under the output directory of each output form=
at and
+# will distribute the generated files over these directories. Enabling this
+# option can be useful when feeding doxygen a huge amount of source files,=
 where
+# putting all generated files in the same directory would otherwise causes
+# performance problems for the file system.
+# The default value is: NO.
+
+CREATE_SUBDIRS         =3D NO
+
+# The OUTPUT_LANGUAGE tag is used to specify the language in which all
+# documentation generated by doxygen is written. Doxygen will use this
+# information to generate all constant output in the proper language.
+# Possible values are: Afrikaans, Arabic, Brazilian, Catalan, Chinese, Chi=
nese-
+# Traditional, Croatian, Czech, Danish, Dutch, English, Esperanto, Farsi,
+# Finnish, French, German, Greek, Hungarian, Italian, Japanese, Japanese-e=
n,
+# Korean, Korean-en, Latvian, Norwegian, Macedonian, Persian, Polish,
+# Portuguese, Romanian, Russian, Serbian, Slovak, Slovene, Spanish, Swedis=
h,
+# Turkish, Ukrainian and Vietnamese.
+# The default value is: English.
+
+OUTPUT_LANGUAGE        =3D English
+
+# If the BRIEF_MEMBER_DESC tag is set to YES doxygen will include brief me=
mber
+# descriptions after the members that are listed in the file and class
+# documentation (similar to Javadoc). Set to NO to disable this.
+# The default value is: YES.
+
+BRIEF_MEMBER_DESC      =3D YES
+
+# If the REPEAT_BRIEF tag is set to YES doxygen will prepend the brief
+# description of a member or function before the detailed description
+#
+# Note: If both HIDE_UNDOC_MEMBERS and BRIEF_MEMBER_DESC are set to NO, the
+# brief descriptions will be completely suppressed.
+# The default value is: YES.
+
+REPEAT_BRIEF           =3D YES
+
+# This tag implements a quasi-intelligent brief description abbreviator th=
at is
+# used to form the text in various listings. Each string in this list, if =
found
+# as the leading text of the brief description, will be stripped from the =
text
+# and the result, after processing the whole list, is used as the annotated
+# text. Otherwise, the brief description is used as-is. If left blank, the
+# following values are used ($name is automatically replaced with the name=
 of
+# the entity):The $name class, The $name widget, The $name file, is, provi=
des,
+# specifies, contains, represents, a, an and the.
+
+ABBREVIATE_BRIEF       =3D
+
+# If the ALWAYS_DETAILED_SEC and REPEAT_BRIEF tags are both set to YES then
+# doxygen will generate a detailed section even if there is only a brief
+# description.
+# The default value is: NO.
+
+ALWAYS_DETAILED_SEC    =3D NO
+
+# If the INLINE_INHERITED_MEMB tag is set to YES, doxygen will show all
+# inherited members of a class in the documentation of that class as if th=
ose
+# members were ordinary class members. Constructors, destructors and assig=
nment
+# operators of the base classes will not be shown.
+# The default value is: NO.
+
+INLINE_INHERITED_MEMB  =3D NO
+
+# If the FULL_PATH_NAMES tag is set to YES doxygen will prepend the full p=
ath
+# before files name in the file list and in the header files. If set to NO=
 the
+# shortest path that makes the file name unique will be used
+# The default value is: YES.
+
+FULL_PATH_NAMES        =3D YES
+
+# The STRIP_FROM_PATH tag can be used to strip a user-defined part of the =
path.
+# Stripping is only done if one of the specified strings matches the left-=
hand
+# part of the path. The tag can be used to show relative paths in the file=
 list.
+# If left blank the directory from which doxygen is run is used as the pat=
h to
+# strip.
+#
+# Note that you can specify absolute paths here, but also relative paths, =
which
+# will be relative from the directory where doxygen is started.
+# This tag requires that the tag FULL_PATH_NAMES is set to YES.
+
+STRIP_FROM_PATH        =3D
+
+# The STRIP_FROM_INC_PATH tag can be used to strip a user-defined part of =
the
+# path mentioned in the documentation of a class, which tells the reader w=
hich
+# header file to include in order to use a class. If left blank only the n=
ame of
+# the header file containing the class definition is used. Otherwise one s=
hould
+# specify the list of include paths that are normally passed to the compil=
er
+# using the -I flag.
+
+STRIP_FROM_INC_PATH    =3D
+
+# If the SHORT_NAMES tag is set to YES, doxygen will generate much shorter=
 (but
+# less readable) file names. This can be useful is your file systems doesn=
't
+# support long names like on DOS, Mac, or CD-ROM.
+# The default value is: NO.
+
+SHORT_NAMES            =3D NO
+
+# If the JAVADOC_AUTOBRIEF tag is set to YES then doxygen will interpret t=
he
+# first line (until the first dot) of a Javadoc-style comment as the brief
+# description. If set to NO, the Javadoc-style will behave just like regul=
ar Qt-
+# style comments (thus requiring an explicit @brief command for a brief
+# description.)
+# The default value is: NO.
+
+JAVADOC_AUTOBRIEF      =3D NO
+
+# If the QT_AUTOBRIEF tag is set to YES then doxygen will interpret the fi=
rst
+# line (until the first dot) of a Qt-style comment as the brief descriptio=
n. If
+# set to NO, the Qt-style will behave just like regular Qt-style comments =
(thus
+# requiring an explicit \brief command for a brief description.)
+# The default value is: NO.
+
+QT_AUTOBRIEF           =3D NO
+
+# The MULTILINE_CPP_IS_BRIEF tag can be set to YES to make doxygen treat a
+# multi-line C++ special comment block (i.e. a block of //! or /// comment=
s) as
+# a brief description. This used to be the default behavior. The new defau=
lt is
+# to treat a multi-line C++ comment block as a detailed description. Set t=
his
+# tag to YES if you prefer the old behavior instead.
+#
+# Note that setting this tag to YES also means that rational rose comments=
 are
+# not recognized any more.
+# The default value is: NO.
+
+MULTILINE_CPP_IS_BRIEF =3D NO
+
+# If the INHERIT_DOCS tag is set to YES then an undocumented member inheri=
ts the
+# documentation from any documented member that it re-implements.
+# The default value is: YES.
+
+INHERIT_DOCS           =3D YES
+
+# If the SEPARATE_MEMBER_PAGES tag is set to YES, then doxygen will produc=
e a
+# new page for each member. If set to NO, the documentation of a member wi=
ll be
+# part of the file/class/namespace that contains it.
+# The default value is: NO.
+
+SEPARATE_MEMBER_PAGES  =3D NO
+
+# The TAB_SIZE tag can be used to set the number of spaces in a tab. Doxyg=
en
+# uses this value to replace tabs by spaces in code fragments.
+# Minimum value: 1, maximum value: 16, default value: 4.
+
+TAB_SIZE               =3D 8
+
+# This tag can be used to specify a number of aliases that act as commands=
 in
+# the documentation. An alias has the form:
+# name=3Dvalue
+# For example adding
+# "sideeffect=3D@par Side Effects:\n"
+# will allow you to put the command \sideeffect (or @sideeffect) in the
+# documentation, which will result in a user-defined paragraph with heading
+# "Side Effects:". You can put \n's in the value part of an alias to insert
+# newlines.
+
+ALIASES                =3D
+
+# This tag can be used to specify a number of word-keyword mappings (TCL o=
nly).
+# A mapping has the form "name=3Dvalue". For example adding "class=3Ditcl:=
:class"
+# will allow you to use the command class in the itcl::class meaning.
+
+TCL_SUBST              =3D
+
+# Set the OPTIMIZE_OUTPUT_FOR_C tag to YES if your project consists of C s=
ources
+# only. Doxygen will then generate output that is more tailored for C. For
+# instance, some of the names that are used will be different. The list of=
 all
+# members will be omitted, etc.
+# The default value is: NO.
+
+OPTIMIZE_OUTPUT_FOR_C  =3D NO
+
+# Set the OPTIMIZE_OUTPUT_JAVA tag to YES if your project consists of Java=
 or
+# Python sources only. Doxygen will then generate output that is more tail=
ored
+# for that language. For instance, namespaces will be presented as package=
s,
+# qualified scopes will look different, etc.
+# The default value is: NO.
+
+OPTIMIZE_OUTPUT_JAVA   =3D NO
+
+# Set the OPTIMIZE_FOR_FORTRAN tag to YES if your project consists of Fort=
ran
+# sources. Doxygen will then generate output that is tailored for Fortran.
+# The default value is: NO.
+
+OPTIMIZE_FOR_FORTRAN   =3D NO
+
+# Set the OPTIMIZE_OUTPUT_VHDL tag to YES if your project consists of VHDL
+# sources. Doxygen will then generate output that is tailored for VHDL.
+# The default value is: NO.
+
+OPTIMIZE_OUTPUT_VHDL   =3D NO
+
+# Doxygen selects the parser to use depending on the extension of the file=
s it
+# parses. With this tag you can assign which parser to use for a given
+# extension. Doxygen has a built-in mapping, but you can override or exten=
d it
+# using this tag. The format is ext=3Dlanguage, where ext is a file extens=
ion, and
+# language is one of the parsers supported by doxygen: IDL, Java, Javascri=
pt,
+# C#, C, C++, D, PHP, Objective-C, Python, Fortran, VHDL. For instance to =
make
+# doxygen treat .inc files as Fortran files (default is PHP), and .f files=
 as C
+# (default is Fortran), use: inc=3DFortran f=3DC.
+#
+# Note For files without extension you can use no_extension as a placehold=
er.
+#
+# Note that for custom extensions you also need to set FILE_PATTERNS other=
wise
+# the files are not read by doxygen.
+
+EXTENSION_MAPPING      =3D
+
+# If the MARKDOWN_SUPPORT tag is enabled then doxygen pre-processes all co=
mments
+# according to the Markdown format, which allows for more readable
+# documentation. See http://daringfireball.net/projects/markdown/ for deta=
ils.
+# The output of markdown processing is further processed by doxygen, so yo=
u can
+# mix doxygen, HTML, and XML commands with Markdown formatting. Disable on=
ly in
+# case of backward compatibilities issues.
+# The default value is: YES.
+
+MARKDOWN_SUPPORT       =3D NO
+
+# When enabled doxygen tries to link words that correspond to documented
+# classes, or namespaces to their corresponding documentation. Such a link=
 can
+# be prevented in individual cases by by putting a % sign in front of the =
word
+# or globally by setting AUTOLINK_SUPPORT to NO.
+# The default value is: YES.
+
+AUTOLINK_SUPPORT       =3D YES
+
+# If you use STL classes (i.e. std::string, std::vector, etc.) but do not =
want
+# to include (a tag file for) the STL sources as input, then you should se=
t this
+# tag to YES in order to let doxygen match functions declarations and
+# definitions whose arguments contain STL classes (e.g. func(std::string);
+# versus func(std::string) {}). This also make the inheritance and collabo=
ration
+# diagrams that involve STL classes more complete and accurate.
+# The default value is: NO.
+
+BUILTIN_STL_SUPPORT    =3D YES
+
+# If you use Microsoft's C++/CLI language, you should set this option to Y=
ES to
+# enable parsing support.
+# The default value is: NO.
+
+CPP_CLI_SUPPORT        =3D NO
+
+# Set the SIP_SUPPORT tag to YES if your project consists of sip (see:
+# http://www.riverbankcomputing.co.uk/software/sip/intro) sources only. Do=
xygen
+# will parse them like normal C++ but will assume all classes use public i=
nstead
+# of private inheritance when no explicit protection keyword is present.
+# The default value is: NO.
+
+SIP_SUPPORT            =3D NO
+
+# For Microsoft's IDL there are propget and propput attributes to indicate
+# getter and setter methods for a property. Setting this option to YES wil=
l make
+# doxygen to replace the get and set methods by a property in the document=
ation.
+# This will only work if the methods are indeed getting or setting a simple
+# type. If this is not the case, or you want to show the methods anyway, y=
ou
+# should set this option to NO.
+# The default value is: YES.
+
+IDL_PROPERTY_SUPPORT   =3D YES
+
+# If member grouping is used in the documentation and the DISTRIBUTE_GROUP=
_DOC
+# tag is set to YES, then doxygen will reuse the documentation of the first
+# member in the group (if any) for the other members of the group. By defa=
ult
+# all members of a group must be documented explicitly.
+# The default value is: NO.
+
+DISTRIBUTE_GROUP_DOC   =3D NO
+
+# Set the SUBGROUPING tag to YES to allow class member groups of the same =
type
+# (for instance a group of public functions) to be put as a subgroup of th=
at
+# type (e.g. under the Public Functions section). Set it to NO to prevent
+# subgrouping. Alternatively, this can be done per class using the
+# \nosubgrouping command.
+# The default value is: YES.
+
+SUBGROUPING            =3D YES
+
+# When the INLINE_GROUPED_CLASSES tag is set to YES, classes, structs and =
unions
+# are shown inside the group in which they are included (e.g. using \ingro=
up)
+# instead of on a separate page (for HTML and Man pages) or section (for L=
aTeX
+# and RTF).
+#
+# Note that this feature does not work in combination with
+# SEPARATE_MEMBER_PAGES.
+# The default value is: NO.
+
+INLINE_GROUPED_CLASSES =3D NO
+
+# When the INLINE_SIMPLE_STRUCTS tag is set to YES, structs, classes, and =
unions
+# with only public data fields or simple typedef fields will be shown inli=
ne in
+# the documentation of the scope in which they are defined (i.e. file,
+# namespace, or group documentation), provided this scope is documented. I=
f set
+# to NO, structs, classes, and unions are shown on a separate page (for HT=
ML and
+# Man pages) or section (for LaTeX and RTF).
+# The default value is: NO.
+
+INLINE_SIMPLE_STRUCTS  =3D NO
+
+# When TYPEDEF_HIDES_STRUCT tag is enabled, a typedef of a struct, union, =
or
+# enum is documented as struct, union, or enum with the name of the typede=
f. So
+# typedef struct TypeS {} TypeT, will appear in the documentation as a str=
uct
+# with name TypeT. When disabled the typedef will appear as a member of a =
file,
+# namespace, or class. And the struct will be named TypeS. This can typica=
lly be
+# useful for C code in case the coding convention dictates that all compou=
nd
+# types are typedef'ed and only the typedef is referenced, never the tag n=
ame.
+# The default value is: NO.
+
+TYPEDEF_HIDES_STRUCT   =3D NO
+
+# The size of the symbol lookup cache can be set using LOOKUP_CACHE_SIZE. =
This
+# cache is used to resolve symbols given their name and scope. Since this =
can be
+# an expensive process and often the same symbol appears multiple times in=
 the
+# code, doxygen keeps a cache of pre-resolved symbols. If the cache is too=
 small
+# doxygen will become slower. If the cache is too large, memory is wasted.=
 The
+# cache size is given by this formula: 2^(16+LOOKUP_CACHE_SIZE). The valid=
 range
+# is 0..9, the default is 0, corresponding to a cache size of 2^16=3D65536
+# symbols. At the end of a run doxygen will report the cache usage and sug=
gest
+# the optimal cache size from a speed point of view.
+# Minimum value: 0, maximum value: 9, default value: 0.
+
+LOOKUP_CACHE_SIZE      =3D 0
+
+#-------------------------------------------------------------------------=
--
+# Build related configuration options
+#-------------------------------------------------------------------------=
--
+
+# If the EXTRACT_ALL tag is set to YES doxygen will assume all entities in
+# documentation are documented, even if no documentation was available. Pr=
ivate
+# class members and static file members will be hidden unless the
+# EXTRACT_PRIVATE respectively EXTRACT_STATIC tags are set to YES.
+# Note: This will also disable the warnings about undocumented members tha=
t are
+# normally produced when WARNINGS is set to YES.
+# The default value is: NO.
+
+EXTRACT_ALL            =3D YES
+
+# If the EXTRACT_PRIVATE tag is set to YES all private members of a class =
will
+# be included in the documentation.
+# The default value is: NO.
+
+EXTRACT_PRIVATE        =3D YES
+
+# If the EXTRACT_PACKAGE tag is set to YES all members with package or int=
ernal
+# scope will be included in the documentation.
+# The default value is: NO.
+
+EXTRACT_PACKAGE        =3D YES
+
+# If the EXTRACT_STATIC tag is set to YES all static members of a file wil=
l be
+# included in the documentation.
+# The default value is: NO.
+
+EXTRACT_STATIC         =3D YES
+
+# If the EXTRACT_LOCAL_CLASSES tag is set to YES classes (and structs) def=
ined
+# locally in source files will be included in the documentation. If set to=
 NO
+# only classes defined in header files are included. Does not have any eff=
ect
+# for Java sources.
+# The default value is: YES.
+
+EXTRACT_LOCAL_CLASSES  =3D YES
+
+# This flag is only useful for Objective-C code. When set to YES local met=
hods,
+# which are defined in the implementation section but not in the interface=
 are
+# included in the documentation. If set to NO only methods in the interfac=
e are
+# included.
+# The default value is: NO.
+
+EXTRACT_LOCAL_METHODS  =3D NO
+
+# If this flag is set to YES, the members of anonymous namespaces will be
+# extracted and appear in the documentation as a namespace called
+# 'anonymous_namespace{file}', where file will be replaced with the base n=
ame of
+# the file that contains the anonymous namespace. By default anonymous nam=
espace
+# are hidden.
+# The default value is: NO.
+
+EXTRACT_ANON_NSPACES   =3D YES
+
+# If the HIDE_UNDOC_MEMBERS tag is set to YES, doxygen will hide all
+# undocumented members inside documented classes or files. If set to NO th=
ese
+# members will be included in the various overviews, but no documentation
+# section is generated. This option has no effect if EXTRACT_ALL is enable=
d.
+# The default value is: NO.
+
+HIDE_UNDOC_MEMBERS     =3D NO
+
+# If the HIDE_UNDOC_CLASSES tag is set to YES, doxygen will hide all
+# undocumented classes that are normally visible in the class hierarchy. I=
f set
+# to NO these classes will be included in the various overviews. This opti=
on has
+# no effect if EXTRACT_ALL is enabled.
+# The default value is: NO.
+
+HIDE_UNDOC_CLASSES     =3D NO
+
+# If the HIDE_FRIEND_COMPOUNDS tag is set to YES, doxygen will hide all fr=
iend
+# (class|struct|union) declarations. If set to NO these declarations will =
be
+# included in the documentation.
+# The default value is: NO.
+
+HIDE_FRIEND_COMPOUNDS  =3D NO
+
+# If the HIDE_IN_BODY_DOCS tag is set to YES, doxygen will hide any
+# documentation blocks found inside the body of a function. If set to NO t=
hese
+# blocks will be appended to the function's detailed documentation block.
+# The default value is: NO.
+
+HIDE_IN_BODY_DOCS      =3D NO
+
+# The INTERNAL_DOCS tag determines if documentation that is typed after a
+# \internal command is included. If the tag is set to NO then the document=
ation
+# will be excluded. Set it to YES to include the internal documentation.
+# The default value is: NO.
+
+INTERNAL_DOCS          =3D NO
+
+# If the CASE_SENSE_NAMES tag is set to NO then doxygen will only generate=
 file
+# names in lower-case letters. If set to YES upper-case letters are also
+# allowed. This is useful if you have classes or files whose names only di=
ffer
+# in case and if your file system supports case sensitive file names. Wind=
ows
+# and Mac users are advised to set this option to NO.
+# The default value is: system dependent.
+
+CASE_SENSE_NAMES       =3D YES
+
+# If the HIDE_SCOPE_NAMES tag is set to NO then doxygen will show members =
with
+# their full class and namespace scopes in the documentation. If set to YE=
S the
+# scope will be hidden.
+# The default value is: NO.
+
+HIDE_SCOPE_NAMES       =3D NO
+
+# If the SHOW_INCLUDE_FILES tag is set to YES then doxygen will put a list=
 of
+# the files that are included by a file in the documentation of that file.
+# The default value is: YES.
+
+SHOW_INCLUDE_FILES     =3D YES
+
+# If the FORCE_LOCAL_INCLUDES tag is set to YES then doxygen will list inc=
lude
+# files with double quotes in the documentation rather than with sharp bra=
ckets.
+# The default value is: NO.
+
+FORCE_LOCAL_INCLUDES   =3D NO
+
+# If the INLINE_INFO tag is set to YES then a tag [inline] is inserted in =
the
+# documentation for inline members.
+# The default value is: YES.
+
+INLINE_INFO            =3D YES
+
+# If the SORT_MEMBER_DOCS tag is set to YES then doxygen will sort the
+# (detailed) documentation of file and class members alphabetically by mem=
ber
+# name. If set to NO the members will appear in declaration order.
+# The default value is: YES.
+
+SORT_MEMBER_DOCS       =3D YES
+
+# If the SORT_BRIEF_DOCS tag is set to YES then doxygen will sort the brief
+# descriptions of file, namespace and class members alphabetically by memb=
er
+# name. If set to NO the members will appear in declaration order.
+# The default value is: NO.
+
+SORT_BRIEF_DOCS        =3D NO
+
+# If the SORT_MEMBERS_CTORS_1ST tag is set to YES then doxygen will sort t=
he
+# (brief and detailed) documentation of class members so that constructors=
 and
+# destructors are listed first. If set to NO the constructors will appear =
in the
+# respective orders defined by SORT_BRIEF_DOCS and SORT_MEMBER_DOCS.
+# Note: If SORT_BRIEF_DOCS is set to NO this option is ignored for sorting=
 brief
+# member documentation.
+# Note: If SORT_MEMBER_DOCS is set to NO this option is ignored for sorting
+# detailed member documentation.
+# The default value is: NO.
+
+SORT_MEMBERS_CTORS_1ST =3D NO
+
+# If the SORT_GROUP_NAMES tag is set to YES then doxygen will sort the hie=
rarchy
+# of group names into alphabetical order. If set to NO the group names will
+# appear in their defined order.
+# The default value is: NO.
+
+SORT_GROUP_NAMES       =3D NO
+
+# If the SORT_BY_SCOPE_NAME tag is set to YES, the class list will be sort=
ed by
+# fully-qualified names, including namespaces. If set to NO, the class lis=
t will
+# be sorted only by class name, not including the namespace part.
+# Note: This option is not very useful if HIDE_SCOPE_NAMES is set to YES.
+# Note: This option applies only to the class list, not to the alphabetical
+# list.
+# The default value is: NO.
+
+SORT_BY_SCOPE_NAME     =3D NO
+
+# If the STRICT_PROTO_MATCHING option is enabled and doxygen fails to do p=
roper
+# type resolution of all parameters of a function it will reject a match b=
etween
+# the prototype and the implementation of a member function even if there =
is
+# only one candidate or it is obvious which candidate to choose by doing a
+# simple string match. By disabling STRICT_PROTO_MATCHING doxygen will sti=
ll
+# accept a match between prototype and implementation in such cases.
+# The default value is: NO.
+
+STRICT_PROTO_MATCHING  =3D NO
+
+# The GENERATE_TODOLIST tag can be used to enable ( YES) or disable ( NO) =
the
+# todo list. This list is created by putting \todo commands in the
+# documentation.
+# The default value is: YES.
+
+GENERATE_TODOLIST      =3D YES
+
+# The GENERATE_TESTLIST tag can be used to enable ( YES) or disable ( NO) =
the
+# test list. This list is created by putting \test commands in the
+# documentation.
+# The default value is: YES.
+
+GENERATE_TESTLIST      =3D YES
+
+# The GENERATE_BUGLIST tag can be used to enable ( YES) or disable ( NO) t=
he bug
+# list. This list is created by putting \bug commands in the documentation.
+# The default value is: YES.
+
+GENERATE_BUGLIST       =3D YES
+
+# The GENERATE_DEPRECATEDLIST tag can be used to enable ( YES) or disable =
( NO)
+# the deprecated list. This list is created by putting \deprecated command=
s in
+# the documentation.
+# The default value is: YES.
+
+GENERATE_DEPRECATEDLIST=3D YES
+
+# The ENABLED_SECTIONS tag can be used to enable conditional documentation
+# sections, marked by \if <section_label> ... \endif and \cond <section_la=
bel>
+# ... \endcond blocks.
+
+ENABLED_SECTIONS       =3D
+
+# The MAX_INITIALIZER_LINES tag determines the maximum number of lines tha=
t the
+# initial value of a variable or macro / define can have for it to appear =
in the
+# documentation. If the initializer consists of more lines than specified =
here
+# it will be hidden. Use a value of 0 to hide initializers completely. The
+# appearance of the value of individual variables and macros / defines can=
 be
+# controlled using \showinitializer or \hideinitializer command in the
+# documentation regardless of this setting.
+# Minimum value: 0, maximum value: 10000, default value: 30.
+
+MAX_INITIALIZER_LINES  =3D 30
+
+# Set the SHOW_USED_FILES tag to NO to disable the list of files generated=
 at
+# the bottom of the documentation of classes and structs. If set to YES th=
e list
+# will mention the files that were used to generate the documentation.
+# The default value is: YES.
+
+SHOW_USED_FILES        =3D YES
+
+# Set the SHOW_FILES tag to NO to disable the generation of the Files page=
. This
+# will remove the Files entry from the Quick Index and from the Folder Tre=
e View
+# (if specified).
+# The default value is: YES.
+
+SHOW_FILES             =3D YES
+
+# Set the SHOW_NAMESPACES tag to NO to disable the generation of the Names=
paces
+# page. This will remove the Namespaces entry from the Quick Index and fro=
m the
+# Folder Tree View (if specified).
+# The default value is: YES.
+
+SHOW_NAMESPACES        =3D YES
+
+# The FILE_VERSION_FILTER tag can be used to specify a program or script t=
hat
+# doxygen should invoke to get the current version for each file (typicall=
y from
+# the version control system). Doxygen will invoke the program by executin=
g (via
+# popen()) the command command input-file, where command is the value of t=
he
+# FILE_VERSION_FILTER tag, and input-file is the name of an input file pro=
vided
+# by doxygen. Whatever the program writes to standard output is used as th=
e file
+# version. For an example see the documentation.
+
+FILE_VERSION_FILTER    =3D
+
+# The LAYOUT_FILE tag can be used to specify a layout file which will be p=
arsed
+# by doxygen. The layout file controls the global structure of the generat=
ed
+# output files in an output format independent way. To create the layout f=
ile
+# that represents doxygen's defaults, run doxygen with the -l option. You =
can
+# optionally specify a file name after the option, if omitted DoxygenLayou=
t.xml
+# will be used as the name of the layout file.
+#
+# Note that if you run doxygen from a directory containing a file called
+# DoxygenLayout.xml, doxygen will parse it automatically even if the LAYOU=
T_FILE
+# tag is left empty.
+
+LAYOUT_FILE            =3D
+
+# The CITE_BIB_FILES tag can be used to specify one or more bib files cont=
aining
+# the reference definitions. This must be a list of .bib files. The .bib
+# extension is automatically appended if omitted. This requires the bibtex=
 tool
+# to be installed. See also http://en.wikipedia.org/wiki/BibTeX for more i=
nfo.
+# For LaTeX the style of the bibliography can be controlled using
+# LATEX_BIB_STYLE. To use this feature you need bibtex and perl available =
in the
+# search path. Do not use file names with spaces, bibtex cannot handle the=
m. See
+# also \cite for info how to create references.
+
+CITE_BIB_FILES         =3D
+
+#-------------------------------------------------------------------------=
--
+# Configuration options related to warning and progress messages
+#-------------------------------------------------------------------------=
--
+
+# The QUIET tag can be used to turn on/off the messages that are generated=
 to
+# standard output by doxygen. If QUIET is set to YES this implies that the
+# messages are off.
+# The default value is: NO.
+
+QUIET                  =3D NO
+
+# The WARNINGS tag can be used to turn on/off the warning messages that are
+# generated to standard error ( stderr) by doxygen. If WARNINGS is set to =
YES
+# this implies that the warnings are on.
+#
+# Tip: Turn warnings on while writing the documentation.
+# The default value is: YES.
+
+WARNINGS               =3D YES
+
+# If the WARN_IF_UNDOCUMENTED tag is set to YES, then doxygen will generate
+# warnings for undocumented members. If EXTRACT_ALL is set to YES then thi=
s flag
+# will automatically be disabled.
+# The default value is: YES.
+
+WARN_IF_UNDOCUMENTED   =3D YES
+
+# If the WARN_IF_DOC_ERROR tag is set to YES, doxygen will generate warnin=
gs for
+# potential errors in the documentation, such as not documenting some para=
meters
+# in a documented function, or documenting parameters that don't exist or =
using
+# markup commands wrongly.
+# The default value is: YES.
+
+WARN_IF_DOC_ERROR      =3D YES
+
+# This WARN_NO_PARAMDOC option can be enabled to get warnings for function=
s that
+# are documented, but have no documentation for their parameters or return
+# value. If set to NO doxygen will only warn about wrong or incomplete par=
ameter
+# documentation, but not about the absence of documentation.
+# The default value is: NO.
+
+WARN_NO_PARAMDOC       =3D NO
+
+# The WARN_FORMAT tag determines the format of the warning messages that d=
oxygen
+# can produce. The string should contain the $file, $line, and $text tags,=
 which
+# will be replaced by the file and line number from which the warning orig=
inated
+# and the warning text. Optionally the format may contain $version, which =
will
+# be replaced by the version of the file (if it could be obtained via
+# FILE_VERSION_FILTER)
+# The default value is: $file:$line: $text.
+
+WARN_FORMAT            =3D "$file:$line: $text"
+
+# The WARN_LOGFILE tag can be used to specify a file to which warning and =
error
+# messages should be written. If left blank the output is written to stand=
ard
+# error (stderr).
+
+WARN_LOGFILE           =3D
+
+#-------------------------------------------------------------------------=
--
+# Configuration options related to the input files
+#-------------------------------------------------------------------------=
--
+
+# The INPUT tag is used to specify the files and/or directories that conta=
in
+# documented source files. You may enter file names like myfile.cpp or
+# directories like /usr/src/myproject. Separate the files or directories w=
ith
+# spaces.
+# Note: If this tag is empty the current directory is searched.
+
+INPUT                  =3D src traceevent
+
+# This tag can be used to specify the character encoding of the source fil=
es
+# that doxygen parses. Internally doxygen uses the UTF-8 encoding. Doxygen=
 uses
+# libiconv (or the iconv built into libc) for the transcoding. See the lib=
iconv
+# documentation (see: http://www.gnu.org/software/libiconv) for the list of
+# possible encodings.
+# The default value is: UTF-8.
+
+INPUT_ENCODING         =3D UTF-8
+
+# If the value of the INPUT tag contains directories, you can use the
+# FILE_PATTERNS tag to specify one or more wildcard patterns (like *.cpp a=
nd
+# *.h) to filter out the source-files in the directories. If left blank the
+# following patterns are tested:*.c, *.cc, *.cxx, *.cpp, *.c++, *.java, *.=
ii,
+# *.ixx, *.ipp, *.i++, *.inl, *.idl, *.ddl, *.odl, *.h, *.hh, *.hxx, *.hpp,
+# *.h++, *.cs, *.d, *.php, *.php4, *.php5, *.phtml, *.inc, *.m, *.markdown,
+# *.md, *.mm, *.dox, *.py, *.f90, *.f, *.for, *.tcl, *.vhd, *.vhdl, *.ucf,
+# *.qsf, *.as and *.js.
+
+FILE_PATTERNS          =3D
+
+# The RECURSIVE tag can be used to specify whether or not subdirectories s=
hould
+# be searched for input files as well.
+# The default value is: NO.
+
+RECURSIVE              =3D YES
+
+# The EXCLUDE tag can be used to specify files and/or directories that sho=
uld be
+# excluded from the INPUT source files. This way you can easily exclude a
+# subdirectory from a directory tree whose root is specified with the INPU=
T tag.
+#
+# Note that relative paths are relative to the directory from which doxyge=
n is
+# run.
+
+EXCLUDE                =3D
+
+# The EXCLUDE_SYMLINKS tag can be used to select whether or not files or
+# directories that are symbolic links (a Unix file system feature) are exc=
luded
+# from the input.
+# The default value is: NO.
+
+EXCLUDE_SYMLINKS       =3D NO
+
+# If the value of the INPUT tag contains directories, you can use the
+# EXCLUDE_PATTERNS tag to specify one or more wildcard patterns to exclude
+# certain files from those directories.
+#
+# Note that the wildcards are matched against the file with absolute path,=
 so to
+# exclude all test directories for example use the pattern */test/*
+
+EXCLUDE_PATTERNS       =3D
+
+# The EXCLUDE_SYMBOLS tag can be used to specify one or more symbol names
+# (namespaces, classes, functions, etc.) that should be excluded from the
+# output. The symbol name can be a fully qualified name, a word, or if the
+# wildcard * is used, a substring. Examples: ANamespace, AClass,
+# AClass::ANamespace, ANamespace::*Test
+#
+# Note that the wildcards are matched against the file with absolute path,=
 so to
+# exclude all test directories use the pattern */test/*
+
+EXCLUDE_SYMBOLS        =3D
+
+# The EXAMPLE_PATH tag can be used to specify one or more files or directo=
ries
+# that contain example code fragments that are included (see the \include
+# command).
+
+EXAMPLE_PATH           =3D
+
+# If the value of the EXAMPLE_PATH tag contains directories, you can use t=
he
+# EXAMPLE_PATTERNS tag to specify one or more wildcard pattern (like *.cpp=
 and
+# *.h) to filter out the source-files in the directories. If left blank all
+# files are included.
+
+EXAMPLE_PATTERNS       =3D
+
+# If the EXAMPLE_RECURSIVE tag is set to YES then subdirectories will be
+# searched for input files to be used with the \include or \dontinclude co=
mmands
+# irrespective of the value of the RECURSIVE tag.
+# The default value is: NO.
+
+EXAMPLE_RECURSIVE      =3D NO
+
+# The IMAGE_PATH tag can be used to specify one or more files or directori=
es
+# that contain images that are to be included in the documentation (see the
+# \image command).
+
+IMAGE_PATH             =3D
+
+# The INPUT_FILTER tag can be used to specify a program that doxygen should
+# invoke to filter for each input file. Doxygen will invoke the filter pro=
gram
+# by executing (via popen()) the command:
+#
+# <filter> <input-file>
+#
+# where <filter> is the value of the INPUT_FILTER tag, and <input-file> is=
 the
+# name of an input file. Doxygen will then use the output that the filter
+# program writes to standard output. If FILTER_PATTERNS is specified, this=
 tag
+# will be ignored.
+#
+# Note that the filter must not add or remove lines; it is applied before =
the
+# code is scanned, but not when the output code is generated. If lines are=
 added
+# or removed, the anchors will not be placed correctly.
+
+INPUT_FILTER           =3D
+
+# The FILTER_PATTERNS tag can be used to specify filters on a per file pat=
tern
+# basis. Doxygen will compare the file name with each pattern and apply the
+# filter if there is a match. The filters are a list of the form: pattern=
=3Dfilter
+# (like *.cpp=3Dmy_cpp_filter). See INPUT_FILTER for further information o=
n how
+# filters are used. If the FILTER_PATTERNS tag is empty or if none of the
+# patterns match the file name, INPUT_FILTER is applied.
+
+FILTER_PATTERNS        =3D
+
+# If the FILTER_SOURCE_FILES tag is set to YES, the input filter (if set u=
sing
+# INPUT_FILTER ) will also be used to filter the input files that are used=
 for
+# producing the source files to browse (i.e. when SOURCE_BROWSER is set to=
 YES).
+# The default value is: NO.
+
+FILTER_SOURCE_FILES    =3D NO
+
+# The FILTER_SOURCE_PATTERNS tag can be used to specify source filters per=
 file
+# pattern. A pattern will override the setting for FILTER_PATTERN (if any)=
 and
+# it is also possible to disable source filtering for a specific pattern u=
sing
+# *.ext=3D (so without naming a filter).
+# This tag requires that the tag FILTER_SOURCE_FILES is set to YES.
+
+FILTER_SOURCE_PATTERNS =3D
+
+# If the USE_MDFILE_AS_MAINPAGE tag refers to the name of a markdown file =
that
+# is part of the input, its contents will be placed on the main page
+# (index.html). This can be useful if you have a project on for instance G=
itHub
+# and want to reuse the introduction page also for the doxygen output.
+
+USE_MDFILE_AS_MAINPAGE =3D
+
+#-------------------------------------------------------------------------=
--
+# Configuration options related to source browsing
+#-------------------------------------------------------------------------=
--
+
+# If the SOURCE_BROWSER tag is set to YES then a list of source files will=
 be
+# generated. Documented entities will be cross-referenced with these sourc=
es.
+#
+# Note: To get rid of all source code in the generated output, make sure t=
hat
+# also VERBATIM_HEADERS is set to NO.
+# The default value is: NO.
+
+SOURCE_BROWSER         =3D YES
+
+# Setting the INLINE_SOURCES tag to YES will include the body of functions,
+# classes and enums directly into the documentation.
+# The default value is: NO.
+
+INLINE_SOURCES         =3D YES
+
+# Setting the STRIP_CODE_COMMENTS tag to YES will instruct doxygen to hide=
 any
+# special comment blocks from generated source code fragments. Normal C, C=
++ and
+# Fortran comments will always remain visible.
+# The default value is: YES.
+
+STRIP_CODE_COMMENTS    =3D YES
+
+# If the REFERENCED_BY_RELATION tag is set to YES then for each documented
+# function all documented functions referencing it will be listed.
+# The default value is: NO.
+
+REFERENCED_BY_RELATION =3D YES
+
+# If the REFERENCES_RELATION tag is set to YES then for each documented fu=
nction
+# all documented entities called/used by that function will be listed.
+# The default value is: NO.
+
+REFERENCES_RELATION    =3D YES
+
+# If the REFERENCES_LINK_SOURCE tag is set to YES and SOURCE_BROWSER tag i=
s set
+# to YES, then the hyperlinks from functions in REFERENCES_RELATION and
+# REFERENCED_BY_RELATION lists will link to the source code. Otherwise the=
y will
+# link to the documentation.
+# The default value is: YES.
+
+REFERENCES_LINK_SOURCE =3D YES
+
+# If SOURCE_TOOLTIPS is enabled (the default) then hovering a hyperlink in=
 the
+# source code will show a tooltip with additional information such as prot=
otype,
+# brief description and links to the definition and documentation. Since t=
his
+# will make the HTML file larger and loading of large files a bit slower, =
you
+# can opt to disable this feature.
+# The default value is: YES.
+# This tag requires that the tag SOURCE_BROWSER is set to YES.
+
+SOURCE_TOOLTIPS        =3D YES
+
+# If the USE_HTAGS tag is set to YES then the references to source code wi=
ll
+# point to the HTML generated by the htags(1) tool instead of doxygen buil=
t-in
+# source browser. The htags tool is part of GNU's global source tagging sy=
stem
+# (see http://www.gnu.org/software/global/global.html). You will need vers=
ion
+# 4.8.6 or higher.
+#
+# To use it do the following:
+# - Install the latest version of global
+# - Enable SOURCE_BROWSER and USE_HTAGS in the config file
+# - Make sure the INPUT points to the root of the source tree
+# - Run doxygen as normal
+#
+# Doxygen will invoke htags (and that will in turn invoke gtags), so these
+# tools must be available from the command line (i.e. in the search path).
+#
+# The result: instead of the source browser generated by doxygen, the link=
s to
+# source code will now point to the output of htags.
+# The default value is: NO.
+# This tag requires that the tag SOURCE_BROWSER is set to YES.
+
+USE_HTAGS              =3D NO
+
+# If the VERBATIM_HEADERS tag is set the YES then doxygen will generate a
+# verbatim copy of the header file for each class for which an include is
+# specified. Set to NO to disable this.
+# See also: Section \class.
+# The default value is: YES.
+
+VERBATIM_HEADERS       =3D YES
+
+#-------------------------------------------------------------------------=
--
+# Configuration options related to the alphabetical class index
+#-------------------------------------------------------------------------=
--
+
+# If the ALPHABETICAL_INDEX tag is set to YES, an alphabetical index of all
+# compounds will be generated. Enable this if the project contains a lot of
+# classes, structs, unions or interfaces.
+# The default value is: YES.
+
+ALPHABETICAL_INDEX     =3D YES
+
+# The COLS_IN_ALPHA_INDEX tag can be used to specify the number of columns=
 in
+# which the alphabetical index list will be split.
+# Minimum value: 1, maximum value: 20, default value: 5.
+# This tag requires that the tag ALPHABETICAL_INDEX is set to YES.
+
+COLS_IN_ALPHA_INDEX    =3D 5
+
+# In case all classes in a project start with a common prefix, all classes=
 will
+# be put under the same header in the alphabetical index. The IGNORE_PREFI=
X tag
+# can be used to specify a prefix (or a list of prefixes) that should be i=
gnored
+# while generating the index headers.
+# This tag requires that the tag ALPHABETICAL_INDEX is set to YES.
+
+IGNORE_PREFIX          =3D
+
+#-------------------------------------------------------------------------=
--
+# Configuration options related to the HTML output
+#-------------------------------------------------------------------------=
--
+
+# If the GENERATE_HTML tag is set to YES doxygen will generate HTML output
+# The default value is: YES.
+
+GENERATE_HTML          =3D YES
+
+# The HTML_OUTPUT tag is used to specify where the HTML docs will be put. =
If a
+# relative path is entered the value of OUTPUT_DIRECTORY will be put in fr=
ont of
+# it.
+# The default directory is: html.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_OUTPUT            =3D html
+
+# The HTML_FILE_EXTENSION tag can be used to specify the file extension fo=
r each
+# generated HTML page (for example: .htm, .php, .asp).
+# The default value is: .html.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_FILE_EXTENSION    =3D .html
+
+# The HTML_HEADER tag can be used to specify a user-defined HTML header fi=
le for
+# each generated HTML page. If the tag is left blank doxygen will generate=
 a
+# standard header.
+#
+# To get valid HTML the header file that includes any scripts and style sh=
eets
+# that doxygen needs, which is dependent on the configuration options used=
 (e.g.
+# the setting GENERATE_TREEVIEW). It is highly recommended to start with a
+# default header using
+# doxygen -w html new_header.html new_footer.html new_stylesheet.css
+# YourConfigFile
+# and then modify the file new_header.html. See also section "Doxygen usag=
e"
+# for information on how to generate the default header that doxygen norma=
lly
+# uses.
+# Note: The header is subject to change so you typically have to regenerat=
e the
+# default header when upgrading to a newer version of doxygen. For a descr=
iption
+# of the possible markers and block names see the documentation.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_HEADER            =3D
+
+# The HTML_FOOTER tag can be used to specify a user-defined HTML footer fo=
r each
+# generated HTML page. If the tag is left blank doxygen will generate a st=
andard
+# footer. See HTML_HEADER for more information on how to generate a default
+# footer and what special commands can be used inside the footer. See also
+# section "Doxygen usage" for information on how to generate the default f=
ooter
+# that doxygen normally uses.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_FOOTER            =3D
+
+# The HTML_STYLESHEET tag can be used to specify a user-defined cascading =
style
+# sheet that is used by each HTML page. It can be used to fine-tune the lo=
ok of
+# the HTML output. If left blank doxygen will generate a default style she=
et.
+# See also section "Doxygen usage" for information on how to generate the =
style
+# sheet that doxygen normally uses.
+# Note: It is recommended to use HTML_EXTRA_STYLESHEET instead of this tag=
, as
+# it is more robust and this tag (HTML_STYLESHEET) will in the future beco=
me
+# obsolete.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_STYLESHEET        =3D
+
+# The HTML_EXTRA_STYLESHEET tag can be used to specify an additional user-
+# defined cascading style sheet that is included after the standard style =
sheets
+# created by doxygen. Using this option one can overrule certain style asp=
ects.
+# This is preferred over using HTML_STYLESHEET since it does not replace t=
he
+# standard style sheet and is therefor more robust against future updates.
+# Doxygen will copy the style sheet file to the output directory. For an e=
xample
+# see the documentation.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_EXTRA_STYLESHEET  =3D
+
+# The HTML_EXTRA_FILES tag can be used to specify one or more extra images=
 or
+# other source files which should be copied to the HTML output directory. =
Note
+# that these files will be copied to the base HTML output directory. Use t=
he
+# $relpath^ marker in the HTML_HEADER and/or HTML_FOOTER files to load the=
se
+# files. In the HTML_STYLESHEET file, use the file name only. Also note th=
at the
+# files will be copied as-is; there are no commands or markers available.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_EXTRA_FILES       =3D
+
+# The HTML_COLORSTYLE_HUE tag controls the color of the HTML output. Doxyg=
en
+# will adjust the colors in the stylesheet and background images according=
 to
+# this color. Hue is specified as an angle on a colorwheel, see
+# http://en.wikipedia.org/wiki/Hue for more information. For instance the =
value
+# 0 represents red, 60 is yellow, 120 is green, 180 is cyan, 240 is blue, =
300
+# purple, and 360 is red again.
+# Minimum value: 0, maximum value: 359, default value: 220.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_COLORSTYLE_HUE    =3D 220
+
+# The HTML_COLORSTYLE_SAT tag controls the purity (or saturation) of the c=
olors
+# in the HTML output. For a value of 0 the output will use grayscales only=
. A
+# value of 255 will produce the most vivid colors.
+# Minimum value: 0, maximum value: 255, default value: 100.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_COLORSTYLE_SAT    =3D 100
+
+# The HTML_COLORSTYLE_GAMMA tag controls the gamma correction applied to t=
he
+# luminance component of the colors in the HTML output. Values below 100
+# gradually make the output lighter, whereas values above 100 make the out=
put
+# darker. The value divided by 100 is the actual gamma applied, so 80 repr=
esents
+# a gamma of 0.8, The value 220 represents a gamma of 2.2, and 100 does not
+# change the gamma.
+# Minimum value: 40, maximum value: 240, default value: 80.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_COLORSTYLE_GAMMA  =3D 80
+
+# If the HTML_TIMESTAMP tag is set to YES then the footer of each generate=
d HTML
+# page will contain the date and time when the page was generated. Setting=
 this
+# to NO can help when comparing the output of multiple runs.
+# The default value is: YES.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_TIMESTAMP         =3D NO
+
+# If the HTML_DYNAMIC_SECTIONS tag is set to YES then the generated HTML
+# documentation will contain sections that can be hidden and shown after t=
he
+# page has loaded.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_DYNAMIC_SECTIONS  =3D NO
+
+# With HTML_INDEX_NUM_ENTRIES one can control the preferred number of entr=
ies
+# shown in the various tree structured indices initially; the user can exp=
and
+# and collapse entries dynamically later on. Doxygen will expand the tree =
to
+# such a level that at most the specified number of entries are visible (u=
nless
+# a fully collapsed tree already exceeds this amount). So setting the numb=
er of
+# entries 1 will produce a full collapsed tree by default. 0 is a special =
value
+# representing an infinite number of entries and will result in a full exp=
anded
+# tree by default.
+# Minimum value: 0, maximum value: 9999, default value: 100.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_INDEX_NUM_ENTRIES =3D 100
+
+# If the GENERATE_DOCSET tag is set to YES, additional index files will be
+# generated that can be used as input for Apple's Xcode 3 integrated devel=
opment
+# environment (see: http://developer.apple.com/tools/xcode/), introduced w=
ith
+# OSX 10.5 (Leopard). To create a documentation set, doxygen will generate=
 a
+# Makefile in the HTML output directory. Running make will produce the doc=
set in
+# that directory and running make install will install the docset in
+# ~/Library/Developer/Shared/Documentation/DocSets so that Xcode will find=
 it at
+# startup. See http://developer.apple.com/tools/creatingdocsetswithdoxygen=
.html
+# for more information.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+GENERATE_DOCSET        =3D NO
+
+# This tag determines the name of the docset feed. A documentation feed pr=
ovides
+# an umbrella under which multiple documentation sets from a single provid=
er
+# (such as a company or product suite) can be grouped.
+# The default value is: Doxygen generated docs.
+# This tag requires that the tag GENERATE_DOCSET is set to YES.
+
+DOCSET_FEEDNAME        =3D "Doxygen generated docs"
+
+# This tag specifies a string that should uniquely identify the documentat=
ion
+# set bundle. This should be a reverse domain-name style string, e.g.
+# com.mycompany.MyDocSet. Doxygen will append .docset to the name.
+# The default value is: org.doxygen.Project.
+# This tag requires that the tag GENERATE_DOCSET is set to YES.
+
+DOCSET_BUNDLE_ID       =3D org.doxygen.Project
+
+# The DOCSET_PUBLISHER_ID tag specifies a string that should uniquely iden=
tify
+# the documentation publisher. This should be a reverse domain-name style
+# string, e.g. com.mycompany.MyDocSet.documentation.
+# The default value is: org.doxygen.Publisher.
+# This tag requires that the tag GENERATE_DOCSET is set to YES.
+
+DOCSET_PUBLISHER_ID    =3D org.doxygen.Publisher
+
+# The DOCSET_PUBLISHER_NAME tag identifies the documentation publisher.
+# The default value is: Publisher.
+# This tag requires that the tag GENERATE_DOCSET is set to YES.
+
+DOCSET_PUBLISHER_NAME  =3D Publisher
+
+# If the GENERATE_HTMLHELP tag is set to YES then doxygen generates three
+# additional HTML index files: index.hhp, index.hhc, and index.hhk. The
+# index.hhp is a project file that can be read by Microsoft's HTML Help Wo=
rkshop
+# (see: http://www.microsoft.com/en-us/download/details.aspx?id=3D21138) on
+# Windows.
+#
+# The HTML Help Workshop contains a compiler that can convert all HTML out=
put
+# generated by doxygen into a single compiled HTML file (.chm). Compiled H=
TML
+# files are now used as the Windows 98 help format, and will replace the o=
ld
+# Windows help format (.hlp) on all Windows platforms in the future. Compr=
essed
+# HTML files also contain an index, a table of contents, and you can searc=
h for
+# words in the documentation. The HTML workshop also contains a viewer for
+# compressed HTML files.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+GENERATE_HTMLHELP      =3D NO
+
+# The CHM_FILE tag can be used to specify the file name of the resulting .=
chm
+# file. You can add a path in front of the file if the result should not be
+# written to the html output directory.
+# This tag requires that the tag GENERATE_HTMLHELP is set to YES.
+
+CHM_FILE               =3D
+
+# The HHC_LOCATION tag can be used to specify the location (absolute path
+# including file name) of the HTML help compiler ( hhc.exe). If non-empty
+# doxygen will try to run the HTML help compiler on the generated index.hh=
p.
+# The file has to be specified with full path.
+# This tag requires that the tag GENERATE_HTMLHELP is set to YES.
+
+HHC_LOCATION           =3D
+
+# The GENERATE_CHI flag controls if a separate .chi index file is generate=
d (
+# YES) or that it should be included in the master .chm file ( NO).
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTMLHELP is set to YES.
+
+GENERATE_CHI           =3D NO
+
+# The CHM_INDEX_ENCODING is used to encode HtmlHelp index ( hhk), content =
( hhc)
+# and project file content.
+# This tag requires that the tag GENERATE_HTMLHELP is set to YES.
+
+CHM_INDEX_ENCODING     =3D
+
+# The BINARY_TOC flag controls whether a binary table of contents is gener=
ated (
+# YES) or a normal table of contents ( NO) in the .chm file.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTMLHELP is set to YES.
+
+BINARY_TOC             =3D NO
+
+# The TOC_EXPAND flag can be set to YES to add extra items for group membe=
rs to
+# the table of contents of the HTML help documentation and to the tree vie=
w.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTMLHELP is set to YES.
+
+TOC_EXPAND             =3D NO
+
+# If the GENERATE_QHP tag is set to YES and both QHP_NAMESPACE and
+# QHP_VIRTUAL_FOLDER are set, an additional index file will be generated t=
hat
+# can be used as input for Qt's qhelpgenerator to generate a Qt Compressed=
 Help
+# (.qch) of the generated HTML documentation.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+GENERATE_QHP           =3D NO
+
+# If the QHG_LOCATION tag is specified, the QCH_FILE tag can be used to sp=
ecify
+# the file name of the resulting .qch file. The path specified is relative=
 to
+# the HTML output folder.
+# This tag requires that the tag GENERATE_QHP is set to YES.
+
+QCH_FILE               =3D
+
+# The QHP_NAMESPACE tag specifies the namespace to use when generating Qt =
Help
+# Project output. For more information please see Qt Help Project / Namesp=
ace
+# (see: http://qt-project.org/doc/qt-4.8/qthelpproject.html#namespace).
+# The default value is: org.doxygen.Project.
+# This tag requires that the tag GENERATE_QHP is set to YES.
+
+QHP_NAMESPACE          =3D org.doxygen.Project
+
+# The QHP_VIRTUAL_FOLDER tag specifies the namespace to use when generatin=
g Qt
+# Help Project output. For more information please see Qt Help Project / V=
irtual
+# Folders (see: http://qt-project.org/doc/qt-4.8/qthelpproject.html#virtua=
l-
+# folders).
+# The default value is: doc.
+# This tag requires that the tag GENERATE_QHP is set to YES.
+
+QHP_VIRTUAL_FOLDER     =3D doc
+
+# If the QHP_CUST_FILTER_NAME tag is set, it specifies the name of a custom
+# filter to add. For more information please see Qt Help Project / Custom
+# Filters (see: http://qt-project.org/doc/qt-4.8/qthelpproject.html#custom-
+# filters).
+# This tag requires that the tag GENERATE_QHP is set to YES.
+
+QHP_CUST_FILTER_NAME   =3D
+
+# The QHP_CUST_FILTER_ATTRS tag specifies the list of the attributes of the
+# custom filter to add. For more information please see Qt Help Project / =
Custom
+# Filters (see: http://qt-project.org/doc/qt-4.8/qthelpproject.html#custom-
+# filters).
+# This tag requires that the tag GENERATE_QHP is set to YES.
+
+QHP_CUST_FILTER_ATTRS  =3D
+
+# The QHP_SECT_FILTER_ATTRS tag specifies the list of the attributes this
+# project's filter section matches. Qt Help Project / Filter Attributes (s=
ee:
+# http://qt-project.org/doc/qt-4.8/qthelpproject.html#filter-attributes).
+# This tag requires that the tag GENERATE_QHP is set to YES.
+
+QHP_SECT_FILTER_ATTRS  =3D
+
+# The QHG_LOCATION tag can be used to specify the location of Qt's
+# qhelpgenerator. If non-empty doxygen will try to run qhelpgenerator on t=
he
+# generated .qhp file.
+# This tag requires that the tag GENERATE_QHP is set to YES.
+
+QHG_LOCATION           =3D
+
+# If the GENERATE_ECLIPSEHELP tag is set to YES, additional index files wi=
ll be
+# generated, together with the HTML files, they form an Eclipse help plugi=
n. To
+# install this plugin and make it available under the help contents menu in
+# Eclipse, the contents of the directory containing the HTML and XML files=
 needs
+# to be copied into the plugins directory of eclipse. The name of the dire=
ctory
+# within the plugins directory should be the same as the ECLIPSE_DOC_ID va=
lue.
+# After copying Eclipse needs to be restarted before the help appears.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+GENERATE_ECLIPSEHELP   =3D NO
+
+# A unique identifier for the Eclipse help plugin. When installing the plu=
gin
+# the directory name containing the HTML and XML files should also have th=
is
+# name. Each documentation set should have its own identifier.
+# The default value is: org.doxygen.Project.
+# This tag requires that the tag GENERATE_ECLIPSEHELP is set to YES.
+
+ECLIPSE_DOC_ID         =3D org.doxygen.Project
+
+# If you want full control over the layout of the generated HTML pages it =
might
+# be necessary to disable the index and replace it with your own. The
+# DISABLE_INDEX tag can be used to turn on/off the condensed index (tabs) =
at top
+# of each HTML page. A value of NO enables the index and the value YES dis=
ables
+# it. Since the tabs in the index contain the same information as the navi=
gation
+# tree, you can set this option to YES if you also set GENERATE_TREEVIEW t=
o YES.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+DISABLE_INDEX          =3D NO
+
+# The GENERATE_TREEVIEW tag is used to specify whether a tree-like index
+# structure should be generated to display hierarchical information. If th=
e tag
+# value is set to YES, a side panel will be generated containing a tree-li=
ke
+# index structure (just like the one that is generated for HTML Help). For=
 this
+# to work a browser that supports JavaScript, DHTML, CSS and frames is req=
uired
+# (i.e. any modern browser). Windows users are probably better off using t=
he
+# HTML help feature. Via custom stylesheets (see HTML_EXTRA_STYLESHEET) on=
e can
+# further fine-tune the look of the index. As an example, the default style
+# sheet generated by doxygen has an example that shows how to put an image=
 at
+# the root of the tree instead of the PROJECT_NAME. Since the tree basical=
ly has
+# the same information as the tab index, you could consider setting
+# DISABLE_INDEX to YES when enabling this option.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+GENERATE_TREEVIEW      =3D YES
+
+# The ENUM_VALUES_PER_LINE tag can be used to set the number of enum value=
s that
+# doxygen will group on one line in the generated HTML documentation.
+#
+# Note that a value of 0 will completely suppress the enum values from app=
earing
+# in the overview section.
+# Minimum value: 0, maximum value: 20, default value: 4.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+ENUM_VALUES_PER_LINE   =3D 4
+
+# If the treeview is enabled (see GENERATE_TREEVIEW) then this tag can be =
used
+# to set the initial width (in pixels) of the frame in which the tree is s=
hown.
+# Minimum value: 0, maximum value: 1500, default value: 250.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+TREEVIEW_WIDTH         =3D 250
+
+# When the EXT_LINKS_IN_WINDOW option is set to YES doxygen will open link=
s to
+# external symbols imported via tag files in a separate window.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+EXT_LINKS_IN_WINDOW    =3D NO
+
+# Use this tag to change the font size of LaTeX formulas included as image=
s in
+# the HTML documentation. When you change the font size after a successful
+# doxygen run you need to manually remove any form_*.png images from the H=
TML
+# output directory to force them to be regenerated.
+# Minimum value: 8, maximum value: 50, default value: 10.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+FORMULA_FONTSIZE       =3D 10
+
+# Use the FORMULA_TRANPARENT tag to determine whether or not the images
+# generated for formulas are transparent PNGs. Transparent PNGs are not
+# supported properly for IE 6.0, but are supported on all modern browsers.
+#
+# Note that when changing this option you need to delete any form_*.png fi=
les in
+# the HTML output directory before the changes have effect.
+# The default value is: YES.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+FORMULA_TRANSPARENT    =3D YES
+
+# Enable the USE_MATHJAX option to render LaTeX formulas using MathJax (see
+# http://www.mathjax.org) which uses client side Javascript for the render=
ing
+# instead of using prerendered bitmaps. Use this if you do not have LaTeX
+# installed or if you want to formulas look prettier in the HTML output. W=
hen
+# enabled you may also need to install MathJax separately and configure th=
e path
+# to it using the MATHJAX_RELPATH option.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+USE_MATHJAX            =3D NO
+
+# When MathJax is enabled you can set the default output format to be used=
 for
+# the MathJax output. See the MathJax site (see:
+# http://docs.mathjax.org/en/latest/output.html) for more details.
+# Possible values are: HTML-CSS (which is slower, but has the best
+# compatibility), NativeMML (i.e. MathML) and SVG.
+# The default value is: HTML-CSS.
+# This tag requires that the tag USE_MATHJAX is set to YES.
+
+MATHJAX_FORMAT         =3D HTML-CSS
+
+# When MathJax is enabled you need to specify the location relative to the=
 HTML
+# output directory using the MATHJAX_RELPATH option. The destination direc=
tory
+# should contain the MathJax.js script. For instance, if the mathjax direc=
tory
+# is located at the same level as the HTML output directory, then
+# MATHJAX_RELPATH should be ../mathjax. The default value points to the Ma=
thJax
+# Content Delivery Network so you can quickly see the result without insta=
lling
+# MathJax. However, it is strongly recommended to install a local copy of
+# MathJax from http://www.mathjax.org before deployment.
+# The default value is: http://cdn.mathjax.org/mathjax/latest.
+# This tag requires that the tag USE_MATHJAX is set to YES.
+
+MATHJAX_RELPATH        =3D http://cdn.mathjax.org/mathjax/latest
+
+# The MATHJAX_EXTENSIONS tag can be used to specify one or more MathJax
+# extension names that should be enabled during MathJax rendering. For exa=
mple
+# MATHJAX_EXTENSIONS =3D TeX/AMSmath TeX/AMSsymbols
+# This tag requires that the tag USE_MATHJAX is set to YES.
+
+MATHJAX_EXTENSIONS     =3D
+
+# The MATHJAX_CODEFILE tag can be used to specify a file with javascript p=
ieces
+# of code that will be used on startup of the MathJax code. See the MathJa=
x site
+# (see: http://docs.mathjax.org/en/latest/output.html) for more details. F=
or an
+# example see the documentation.
+# This tag requires that the tag USE_MATHJAX is set to YES.
+
+MATHJAX_CODEFILE       =3D
+
+# When the SEARCHENGINE tag is enabled doxygen will generate a search box =
for
+# the HTML output. The underlying search engine uses javascript and DHTML =
and
+# should work on any modern browser. Note that when using HTML help
+# (GENERATE_HTMLHELP), Qt help (GENERATE_QHP), or docsets (GENERATE_DOCSET)
+# there is already a search function so this one should typically be disab=
led.
+# For large projects the javascript based search engine can be slow, then
+# enabling SERVER_BASED_SEARCH may provide a better solution. It is possib=
le to
+# search using the keyboard; to jump to the search box use <access key> + S
+# (what the <access key> is depends on the OS and browser, but it is typic=
ally
+# <CTRL>, <ALT>/<option>, or both). Inside the search box use the <cursor =
down
+# key> to jump into the search results window, the results can be navigated
+# using the <cursor keys>. Press <Enter> to select an item or <escape> to =
cancel
+# the search. The filter options can be selected when the cursor is inside=
 the
+# search box by pressing <Shift>+<cursor down>. Also here use the <cursor =
keys>
+# to select a filter and <Enter> or <escape> to activate or cancel the fil=
ter
+# option.
+# The default value is: YES.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+SEARCHENGINE           =3D YES
+
+# When the SERVER_BASED_SEARCH tag is enabled the search engine will be
+# implemented using a web server instead of a web client using Javascript.=
 There
+# are two flavours of web server based searching depending on the
+# EXTERNAL_SEARCH setting. When disabled, doxygen will generate a PHP scri=
pt for
+# searching and an index file used by the script. When EXTERNAL_SEARCH is
+# enabled the indexing and searching needs to be provided by external tool=
s. See
+# the section "External Indexing and Searching" for details.
+# The default value is: NO.
+# This tag requires that the tag SEARCHENGINE is set to YES.
+
+SERVER_BASED_SEARCH    =3D NO
+
+# When EXTERNAL_SEARCH tag is enabled doxygen will no longer generate the =
PHP
+# script for searching. Instead the search results are written to an XML f=
ile
+# which needs to be processed by an external indexer. Doxygen will invoke =
an
+# external search engine pointed to by the SEARCHENGINE_URL option to obta=
in the
+# search results.
+#
+# Doxygen ships with an example indexer ( doxyindexer) and search engine
+# (doxysearch.cgi) which are based on the open source search engine library
+# Xapian (see: http://xapian.org/).
+#
+# See the section "External Indexing and Searching" for details.
+# The default value is: NO.
+# This tag requires that the tag SEARCHENGINE is set to YES.
+
+EXTERNAL_SEARCH        =3D NO
+
+# The SEARCHENGINE_URL should point to a search engine hosted by a web ser=
ver
+# which will return the search results when EXTERNAL_SEARCH is enabled.
+#
+# Doxygen ships with an example indexer ( doxyindexer) and search engine
+# (doxysearch.cgi) which are based on the open source search engine library
+# Xapian (see: http://xapian.org/). See the section "External Indexing and
+# Searching" for details.
+# This tag requires that the tag SEARCHENGINE is set to YES.
+
+SEARCHENGINE_URL       =3D
+
+# When SERVER_BASED_SEARCH and EXTERNAL_SEARCH are both enabled the uninde=
xed
+# search data is written to a file for indexing by an external tool. With =
the
+# SEARCHDATA_FILE tag the name of this file can be specified.
+# The default file is: searchdata.xml.
+# This tag requires that the tag SEARCHENGINE is set to YES.
+
+SEARCHDATA_FILE        =3D searchdata.xml
+
+# When SERVER_BASED_SEARCH and EXTERNAL_SEARCH are both enabled the
+# EXTERNAL_SEARCH_ID tag can be used as an identifier for the project. Thi=
s is
+# useful in combination with EXTRA_SEARCH_MAPPINGS to search through multi=
ple
+# projects and redirect the results back to the right project.
+# This tag requires that the tag SEARCHENGINE is set to YES.
+
+EXTERNAL_SEARCH_ID     =3D
+
+# The EXTRA_SEARCH_MAPPINGS tag can be used to enable searching through do=
xygen
+# projects other than the one defined by this configuration file, but that=
 are
+# all added to the same external search index. Each project needs to have a
+# unique id set via EXTERNAL_SEARCH_ID. The search mapping then maps the i=
d of
+# to a relative location where the documentation can be found. The format =
is:
+# EXTRA_SEARCH_MAPPINGS =3D tagname1=3Dloc1 tagname2=3Dloc2 ...
+# This tag requires that the tag SEARCHENGINE is set to YES.
+
+EXTRA_SEARCH_MAPPINGS  =3D
+
+#-------------------------------------------------------------------------=
--
+# Configuration options related to the LaTeX output
+#-------------------------------------------------------------------------=
--
+
+# If the GENERATE_LATEX tag is set to YES doxygen will generate LaTeX outp=
ut.
+# The default value is: YES.
+
+GENERATE_LATEX         =3D NO
+
+# The LATEX_OUTPUT tag is used to specify where the LaTeX docs will be put=
. If a
+# relative path is entered the value of OUTPUT_DIRECTORY will be put in fr=
ont of
+# it.
+# The default directory is: latex.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_OUTPUT           =3D latex
+
+# The LATEX_CMD_NAME tag can be used to specify the LaTeX command name to =
be
+# invoked.
+#
+# Note that when enabling USE_PDFLATEX this option is only used for genera=
ting
+# bitmaps for formulas in the HTML output, but not in the Makefile that is
+# written to the output directory.
+# The default file is: latex.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_CMD_NAME         =3D latex
+
+# The MAKEINDEX_CMD_NAME tag can be used to specify the command name to ge=
nerate
+# index for LaTeX.
+# The default file is: makeindex.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+MAKEINDEX_CMD_NAME     =3D makeindex
+
+# If the COMPACT_LATEX tag is set to YES doxygen generates more compact La=
TeX
+# documents. This may be useful for small projects and may help to save so=
me
+# trees in general.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+COMPACT_LATEX          =3D NO
+
+# The PAPER_TYPE tag can be used to set the paper type that is used by the
+# printer.
+# Possible values are: a4 (210 x 297 mm), letter (8.5 x 11 inches), legal =
(8.5 x
+# 14 inches) and executive (7.25 x 10.5 inches).
+# The default value is: a4.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+PAPER_TYPE             =3D a4
+
+# The EXTRA_PACKAGES tag can be used to specify one or more LaTeX package =
names
+# that should be included in the LaTeX output. To get the times font for
+# instance you can specify
+# EXTRA_PACKAGES=3Dtimes
+# If left blank no extra packages will be included.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+EXTRA_PACKAGES         =3D
+
+# The LATEX_HEADER tag can be used to specify a personal LaTeX header for =
the
+# generated LaTeX document. The header should contain everything until the=
 first
+# chapter. If it is left blank doxygen will generate a standard header. See
+# section "Doxygen usage" for information on how to let doxygen write the
+# default header to a separate file.
+#
+# Note: Only use a user-defined header if you know what you are doing! The
+# following commands have a special meaning inside the header: $title,
+# $datetime, $date, $doxygenversion, $projectname, $projectnumber. Doxygen=
 will
+# replace them by respectively the title of the page, the current date and=
 time,
+# only the current date, the version number of doxygen, the project name (=
see
+# PROJECT_NAME), or the project number (see PROJECT_NUMBER).
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_HEADER           =3D
+
+# The LATEX_FOOTER tag can be used to specify a personal LaTeX footer for =
the
+# generated LaTeX document. The footer should contain everything after the=
 last
+# chapter. If it is left blank doxygen will generate a standard footer.
+#
+# Note: Only use a user-defined footer if you know what you are doing!
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_FOOTER           =3D
+
+# The LATEX_EXTRA_FILES tag can be used to specify one or more extra image=
s or
+# other source files which should be copied to the LATEX_OUTPUT output
+# directory. Note that the files will be copied as-is; there are no comman=
ds or
+# markers available.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_EXTRA_FILES      =3D
+
+# If the PDF_HYPERLINKS tag is set to YES, the LaTeX that is generated is
+# prepared for conversion to PDF (using ps2pdf or pdflatex). The PDF file =
will
+# contain links (just like the HTML output) instead of page references. Th=
is
+# makes the output suitable for online browsing using a PDF viewer.
+# The default value is: YES.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+PDF_HYPERLINKS         =3D YES
+
+# If the LATEX_PDFLATEX tag is set to YES, doxygen will use pdflatex to ge=
nerate
+# the PDF file directly from the LaTeX files. Set this option to YES to ge=
t a
+# higher quality PDF documentation.
+# The default value is: YES.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+USE_PDFLATEX           =3D YES
+
+# If the LATEX_BATCHMODE tag is set to YES, doxygen will add the \batchmode
+# command to the generated LaTeX files. This will instruct LaTeX to keep r=
unning
+# if errors occur, instead of asking the user for help. This option is als=
o used
+# when generating formulas in HTML.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_BATCHMODE        =3D NO
+
+# If the LATEX_HIDE_INDICES tag is set to YES then doxygen will not includ=
e the
+# index chapters (such as File Index, Compound Index, etc.) in the output.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_HIDE_INDICES     =3D NO
+
+# If the LATEX_SOURCE_CODE tag is set to YES then doxygen will include sou=
rce
+# code with syntax highlighting in the LaTeX output.
+#
+# Note that which sources are shown also depends on other settings such as
+# SOURCE_BROWSER.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_SOURCE_CODE      =3D NO
+
+# The LATEX_BIB_STYLE tag can be used to specify the style to use for the
+# bibliography, e.g. plainnat, or ieeetr. See
+# http://en.wikipedia.org/wiki/BibTeX and \cite for more info.
+# The default value is: plain.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_BIB_STYLE        =3D plain
+
+#-------------------------------------------------------------------------=
--
+# Configuration options related to the RTF output
+#-------------------------------------------------------------------------=
--
+
+# If the GENERATE_RTF tag is set to YES doxygen will generate RTF output. =
The
+# RTF output is optimized for Word 97 and may not look too pretty with oth=
er RTF
+# readers/editors.
+# The default value is: NO.
+
+GENERATE_RTF           =3D NO
+
+# The RTF_OUTPUT tag is used to specify where the RTF docs will be put. If=
 a
+# relative path is entered the value of OUTPUT_DIRECTORY will be put in fr=
ont of
+# it.
+# The default directory is: rtf.
+# This tag requires that the tag GENERATE_RTF is set to YES.
+
+RTF_OUTPUT             =3D rtf
+
+# If the COMPACT_RTF tag is set to YES doxygen generates more compact RTF
+# documents. This may be useful for small projects and may help to save so=
me
+# trees in general.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_RTF is set to YES.
+
+COMPACT_RTF            =3D NO
+
+# If the RTF_HYPERLINKS tag is set to YES, the RTF that is generated will
+# contain hyperlink fields. The RTF file will contain links (just like the=
 HTML
+# output) instead of page references. This makes the output suitable for o=
nline
+# browsing using Word or some other Word compatible readers that support t=
hose
+# fields.
+#
+# Note: WordPad (write) and others do not support links.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_RTF is set to YES.
+
+RTF_HYPERLINKS         =3D NO
+
+# Load stylesheet definitions from file. Syntax is similar to doxygen's co=
nfig
+# file, i.e. a series of assignments. You only have to provide replacement=
s,
+# missing definitions are set to their default value.
+#
+# See also section "Doxygen usage" for information on how to generate the
+# default style sheet that doxygen normally uses.
+# This tag requires that the tag GENERATE_RTF is set to YES.
+
+RTF_STYLESHEET_FILE    =3D
+
+# Set optional variables used in the generation of an RTF document. Syntax=
 is
+# similar to doxygen's config file. A template extensions file can be gene=
rated
+# using doxygen -e rtf extensionFile.
+# This tag requires that the tag GENERATE_RTF is set to YES.
+
+RTF_EXTENSIONS_FILE    =3D
+
+#-------------------------------------------------------------------------=
--
+# Configuration options related to the man page output
+#-------------------------------------------------------------------------=
--
+
+# If the GENERATE_MAN tag is set to YES doxygen will generate man pages for
+# classes and files.
+# The default value is: NO.
+
+GENERATE_MAN           =3D NO
+
+# The MAN_OUTPUT tag is used to specify where the man pages will be put. I=
f a
+# relative path is entered the value of OUTPUT_DIRECTORY will be put in fr=
ont of
+# it. A directory man3 will be created inside the directory specified by
+# MAN_OUTPUT.
+# The default directory is: man.
+# This tag requires that the tag GENERATE_MAN is set to YES.
+
+MAN_OUTPUT             =3D man
+
+# The MAN_EXTENSION tag determines the extension that is added to the gene=
rated
+# man pages. In case the manual section does not start with a number, the =
number
+# 3 is prepended. The dot (.) at the beginning of the MAN_EXTENSION tag is
+# optional.
+# The default value is: .3.
+# This tag requires that the tag GENERATE_MAN is set to YES.
+
+MAN_EXTENSION          =3D .3
+
+# If the MAN_LINKS tag is set to YES and doxygen generates man output, the=
n it
+# will generate one additional man file for each entity documented in the =
real
+# man page(s). These additional files only source the real man page, but w=
ithout
+# them the man command would be unable to find the correct page.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_MAN is set to YES.
+
+MAN_LINKS              =3D NO
+
+#-------------------------------------------------------------------------=
--
+# Configuration options related to the XML output
+#-------------------------------------------------------------------------=
--
+
+# If the GENERATE_XML tag is set to YES doxygen will generate an XML file =
that
+# captures the structure of the code including all documentation.
+# The default value is: NO.
+
+GENERATE_XML           =3D NO
+
+# The XML_OUTPUT tag is used to specify where the XML pages will be put. I=
f a
+# relative path is entered the value of OUTPUT_DIRECTORY will be put in fr=
ont of
+# it.
+# The default directory is: xml.
+# This tag requires that the tag GENERATE_XML is set to YES.
+
+XML_OUTPUT             =3D xml
+
+# The XML_SCHEMA tag can be used to specify a XML schema, which can be use=
d by a
+# validating XML parser to check the syntax of the XML files.
+# This tag requires that the tag GENERATE_XML is set to YES.
+
+XML_SCHEMA             =3D
+
+# The XML_DTD tag can be used to specify a XML DTD, which can be used by a
+# validating XML parser to check the syntax of the XML files.
+# This tag requires that the tag GENERATE_XML is set to YES.
+
+XML_DTD                =3D
+
+# If the XML_PROGRAMLISTING tag is set to YES doxygen will dump the program
+# listings (including syntax highlighting and cross-referencing informatio=
n) to
+# the XML output. Note that enabling this will significantly increase the =
size
+# of the XML output.
+# The default value is: YES.
+# This tag requires that the tag GENERATE_XML is set to YES.
+
+XML_PROGRAMLISTING     =3D YES
+
+#-------------------------------------------------------------------------=
--
+# Configuration options related to the DOCBOOK output
+#-------------------------------------------------------------------------=
--
+
+# If the GENERATE_DOCBOOK tag is set to YES doxygen will generate Docbook =
files
+# that can be used to generate PDF.
+# The default value is: NO.
+
+GENERATE_DOCBOOK       =3D NO
+
+# The DOCBOOK_OUTPUT tag is used to specify where the Docbook pages will b=
e put.
+# If a relative path is entered the value of OUTPUT_DIRECTORY will be put =
in
+# front of it.
+# The default directory is: docbook.
+# This tag requires that the tag GENERATE_DOCBOOK is set to YES.
+
+DOCBOOK_OUTPUT         =3D docbook
+
+#-------------------------------------------------------------------------=
--
+# Configuration options for the AutoGen Definitions output
+#-------------------------------------------------------------------------=
--
+
+# If the GENERATE_AUTOGEN_DEF tag is set to YES doxygen will generate an A=
utoGen
+# Definitions (see http://autogen.sf.net) file that captures the structure=
 of
+# the code including all documentation. Note that this feature is still
+# experimental and incomplete at the moment.
+# The default value is: NO.
+
+GENERATE_AUTOGEN_DEF   =3D NO
+
+#-------------------------------------------------------------------------=
--
+# Configuration options related to the Perl module output
+#-------------------------------------------------------------------------=
--
+
+# If the GENERATE_PERLMOD tag is set to YES doxygen will generate a Perl m=
odule
+# file that captures the structure of the code including all documentation.
+#
+# Note that this feature is still experimental and incomplete at the momen=
t.
+# The default value is: NO.
+
+GENERATE_PERLMOD       =3D NO
+
+# If the PERLMOD_LATEX tag is set to YES doxygen will generate the necessa=
ry
+# Makefile rules, Perl scripts and LaTeX code to be able to generate PDF a=
nd DVI
+# output from the Perl module output.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_PERLMOD is set to YES.
+
+PERLMOD_LATEX          =3D NO
+
+# If the PERLMOD_PRETTY tag is set to YES the Perl module output will be n=
icely
+# formatted so it can be parsed by a human reader. This is useful if you w=
ant to
+# understand what is going on. On the other hand, if this tag is set to NO=
 the
+# size of the Perl module output will be much smaller and Perl will parse =
it
+# just the same.
+# The default value is: YES.
+# This tag requires that the tag GENERATE_PERLMOD is set to YES.
+
+PERLMOD_PRETTY         =3D YES
+
+# The names of the make variables in the generated doxyrules.make file are
+# prefixed with the string contained in PERLMOD_MAKEVAR_PREFIX. This is us=
eful
+# so different doxyrules.make files included by the same Makefile don't
+# overwrite each other's variables.
+# This tag requires that the tag GENERATE_PERLMOD is set to YES.
+
+PERLMOD_MAKEVAR_PREFIX =3D
+
+#-------------------------------------------------------------------------=
--
+# Configuration options related to the preprocessor
+#-------------------------------------------------------------------------=
--
+
+# If the ENABLE_PREPROCESSING tag is set to YES doxygen will evaluate all
+# C-preprocessor directives found in the sources and include files.
+# The default value is: YES.
+
+ENABLE_PREPROCESSING   =3D YES
+
+# If the MACRO_EXPANSION tag is set to YES doxygen will expand all macro n=
ames
+# in the source code. If set to NO only conditional compilation will be
+# performed. Macro expansion can be done in a controlled way by setting
+# EXPAND_ONLY_PREDEF to YES.
+# The default value is: NO.
+# This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
+
+MACRO_EXPANSION        =3D NO
+
+# If the EXPAND_ONLY_PREDEF and MACRO_EXPANSION tags are both set to YES t=
hen
+# the macro expansion is limited to the macros specified with the PREDEFIN=
ED and
+# EXPAND_AS_DEFINED tags.
+# The default value is: NO.
+# This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
+
+EXPAND_ONLY_PREDEF     =3D NO
+
+# If the SEARCH_INCLUDES tag is set to YES the includes files in the
+# INCLUDE_PATH will be searched if a #include is found.
+# The default value is: YES.
+# This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
+
+SEARCH_INCLUDES        =3D YES
+
+# The INCLUDE_PATH tag can be used to specify one or more directories that
+# contain include files that are not input files but should be processed b=
y the
+# preprocessor.
+# This tag requires that the tag SEARCH_INCLUDES is set to YES.
+
+INCLUDE_PATH           =3D
+
+# You can use the INCLUDE_FILE_PATTERNS tag to specify one or more wildcard
+# patterns (like *.h and *.hpp) to filter out the header-files in the
+# directories. If left blank, the patterns specified with FILE_PATTERNS wi=
ll be
+# used.
+# This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
+
+INCLUDE_FILE_PATTERNS  =3D
+
+# The PREDEFINED tag can be used to specify one or more macro names that a=
re
+# defined before the preprocessor is started (similar to the -D option of =
e.g.
+# gcc). The argument of the tag is a list of macros of the form: name or
+# name=3Ddefinition (no spaces). If the definition and the "=3D" are omitt=
ed, "=3D1"
+# is assumed. To prevent a macro definition from being undefined via #unde=
f or
+# recursively expanded use the :=3D operator instead of the =3D operator.
+# This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
+
+PREDEFINED             =3D
+
+# If the MACRO_EXPANSION and EXPAND_ONLY_PREDEF tags are set to YES then t=
his
+# tag can be used to specify a list of macro names that should be expanded=
. The
+# macro definition that is found in the sources will be used. Use the PRED=
EFINED
+# tag if you want to use a different macro definition that overrules the
+# definition found in the source code.
+# This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
+
+EXPAND_AS_DEFINED      =3D
+
+# If the SKIP_FUNCTION_MACROS tag is set to YES then doxygen's preprocesso=
r will
+# remove all refrences to function-like macros that are alone on a line, h=
ave an
+# all uppercase name, and do not end with a semicolon. Such function macro=
s are
+# typically used for boiler-plate code, and will confuse the parser if not
+# removed.
+# The default value is: YES.
+# This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
+
+SKIP_FUNCTION_MACROS   =3D NO
+
+#-------------------------------------------------------------------------=
--
+# Configuration options related to external references
+#-------------------------------------------------------------------------=
--
+
+# The TAGFILES tag can be used to specify one or more tag files. For each =
tag
+# file the location of the external documentation should be added. The for=
mat of
+# a tag file without this location is as follows:
+# TAGFILES =3D file1 file2 ...
+# Adding location for the tag files is done as follows:
+# TAGFILES =3D file1=3Dloc1 "file2 =3D loc2" ...
+# where loc1 and loc2 can be relative or absolute paths or URLs. See the
+# section "Linking to external documentation" for more information about t=
he use
+# of tag files.
+# Note: Each tag file must have an unique name (where the name does NOT in=
clude
+# the path). If a tag file is not located in the directory in which doxyge=
n is
+# run, you must also specify the path to the tagfile here.
+
+TAGFILES               =3D
+
+# When a file name is specified after GENERATE_TAGFILE, doxygen will creat=
e a
+# tag file that is based on the input files it reads. See section "Linking=
 to
+# external documentation" for more information about the usage of tag file=
s.
+
+GENERATE_TAGFILE       =3D
+
+# If the ALLEXTERNALS tag is set to YES all external class will be listed =
in the
+# class index. If set to NO only the inherited external classes will be li=
sted.
+# The default value is: NO.
+
+ALLEXTERNALS           =3D NO
+
+# If the EXTERNAL_GROUPS tag is set to YES all external groups will be lis=
ted in
+# the modules index. If set to NO, only the current project's groups will =
be
+# listed.
+# The default value is: YES.
+
+EXTERNAL_GROUPS        =3D YES
+
+# If the EXTERNAL_PAGES tag is set to YES all external pages will be liste=
d in
+# the related pages index. If set to NO, only the current project's pages =
will
+# be listed.
+# The default value is: YES.
+
+EXTERNAL_PAGES         =3D YES
+
+# The PERL_PATH should be the absolute path and name of the perl script
+# interpreter (i.e. the result of 'which perl').
+# The default file (with absolute path) is: /usr/bin/perl.
+
+PERL_PATH              =3D /usr/bin/perl
+
+#-------------------------------------------------------------------------=
--
+# Configuration options related to the dot tool
+#-------------------------------------------------------------------------=
--
+
+# If the CLASS_DIAGRAMS tag is set to YES doxygen will generate a class di=
agram
+# (in HTML and LaTeX) for classes with base or super classes. Setting the =
tag to
+# NO turns the diagrams off. Note that this option also works with HAVE_DOT
+# disabled, but it is recommended to install and use dot, since it yields =
more
+# powerful graphs.
+# The default value is: YES.
+
+CLASS_DIAGRAMS         =3D YES
+
+# You can define message sequence charts within doxygen comments using the=
 \msc
+# command. Doxygen will then run the mscgen tool (see:
+# http://www.mcternan.me.uk/mscgen/)) to produce the chart and insert it i=
n the
+# documentation. The MSCGEN_PATH tag allows you to specify the directory w=
here
+# the mscgen tool resides. If left empty the tool is assumed to be found i=
n the
+# default search path.
+
+MSCGEN_PATH            =3D
+
+# If set to YES, the inheritance and collaboration graphs will hide inheri=
tance
+# and usage relations if the target is undocumented or is not a class.
+# The default value is: YES.
+
+HIDE_UNDOC_RELATIONS   =3D YES
+
+# If you set the HAVE_DOT tag to YES then doxygen will assume the dot tool=
 is
+# available from the path. This tool is part of Graphviz (see:
+# http://www.graphviz.org/), a graph visualization toolkit from AT&T and L=
ucent
+# Bell Labs. The other options in this section have no effect if this opti=
on is
+# set to NO
+# The default value is: NO.
+
+HAVE_DOT               =3D YES
+
+# The DOT_NUM_THREADS specifies the number of dot invocations doxygen is a=
llowed
+# to run in parallel. When set to 0 doxygen will base this on the number of
+# processors available in the system. You can set it explicitly to a value
+# larger than 0 to get control over the balance between CPU load and proce=
ssing
+# speed.
+# Minimum value: 0, maximum value: 32, default value: 0.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_NUM_THREADS        =3D 0
+
+# When you want a differently looking font n the dot files that doxygen
+# generates you can specify the font name using DOT_FONTNAME. You need to =
make
+# sure dot is able to find the font, which can be done by putting it in a
+# standard location or by setting the DOTFONTPATH environment variable or =
by
+# setting DOT_FONTPATH to the directory containing the font.
+# The default value is: Helvetica.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_FONTNAME           =3D Helvetica
+
+# The DOT_FONTSIZE tag can be used to set the size (in points) of the font=
 of
+# dot graphs.
+# Minimum value: 4, maximum value: 24, default value: 10.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_FONTSIZE           =3D 10
+
+# By default doxygen will tell dot to use the default font as specified wi=
th
+# DOT_FONTNAME. If you specify a different font using DOT_FONTNAME you can=
 set
+# the path where dot can find it using this tag.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_FONTPATH           =3D
+
+# If the CLASS_GRAPH tag is set to YES then doxygen will generate a graph =
for
+# each documented class showing the direct and indirect inheritance relati=
ons.
+# Setting this tag to YES will force the CLASS_DIAGRAMS tag to NO.
+# The default value is: YES.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+CLASS_GRAPH            =3D YES
+
+# If the COLLABORATION_GRAPH tag is set to YES then doxygen will generate a
+# graph for each documented class showing the direct and indirect implemen=
tation
+# dependencies (inheritance, containment, and class references variables) =
of the
+# class with other documented classes.
+# The default value is: YES.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+COLLABORATION_GRAPH    =3D YES
+
+# If the GROUP_GRAPHS tag is set to YES then doxygen will generate a graph=
 for
+# groups, showing the direct groups dependencies.
+# The default value is: YES.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+GROUP_GRAPHS           =3D YES
+
+# If the UML_LOOK tag is set to YES doxygen will generate inheritance and
+# collaboration diagrams in a style similar to the OMG's Unified Modeling
+# Language.
+# The default value is: NO.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+UML_LOOK               =3D NO
+
+# If the UML_LOOK tag is enabled, the fields and methods are shown inside =
the
+# class node. If there are many fields or methods and many nodes the graph=
 may
+# become too big to be useful. The UML_LIMIT_NUM_FIELDS threshold limits t=
he
+# number of items for each type to make the size more manageable. Set this=
 to 0
+# for no limit. Note that the threshold may be exceeded by 50% before the =
limit
+# is enforced. So when you set the threshold to 10, up to 15 fields may ap=
pear,
+# but if the number exceeds 15, the total amount of fields shown is limite=
d to
+# 10.
+# Minimum value: 0, maximum value: 100, default value: 10.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+UML_LIMIT_NUM_FIELDS   =3D 10
+
+# If the TEMPLATE_RELATIONS tag is set to YES then the inheritance and
+# collaboration graphs will show the relations between templates and their
+# instances.
+# The default value is: NO.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+TEMPLATE_RELATIONS     =3D YES
+
+# If the INCLUDE_GRAPH, ENABLE_PREPROCESSING and SEARCH_INCLUDES tags are =
set to
+# YES then doxygen will generate a graph for each documented file showing =
the
+# direct and indirect include dependencies of the file with other document=
ed
+# files.
+# The default value is: YES.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+INCLUDE_GRAPH          =3D YES
+
+# If the INCLUDED_BY_GRAPH, ENABLE_PREPROCESSING and SEARCH_INCLUDES tags =
are
+# set to YES then doxygen will generate a graph for each documented file s=
howing
+# the direct and indirect include dependencies of the file with other docu=
mented
+# files.
+# The default value is: YES.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+INCLUDED_BY_GRAPH      =3D YES
+
+# If the CALL_GRAPH tag is set to YES then doxygen will generate a call
+# dependency graph for every global function or class method.
+#
+# Note that enabling this option will significantly increase the time of a=
 run.
+# So in most cases it will be better to enable call graphs for selected
+# functions only using the \callgraph command.
+# The default value is: NO.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+CALL_GRAPH             =3D YES
+
+# If the CALLER_GRAPH tag is set to YES then doxygen will generate a caller
+# dependency graph for every global function or class method.
+#
+# Note that enabling this option will significantly increase the time of a=
 run.
+# So in most cases it will be better to enable caller graphs for selected
+# functions only using the \callergraph command.
+# The default value is: NO.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+CALLER_GRAPH           =3D YES
+
+# If the GRAPHICAL_HIERARCHY tag is set to YES then doxygen will graphical
+# hierarchy of all classes instead of a textual one.
+# The default value is: YES.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+GRAPHICAL_HIERARCHY    =3D YES
+
+# If the DIRECTORY_GRAPH tag is set to YES then doxygen will show the
+# dependencies a directory has on other directories in a graphical way. The
+# dependency relations are determined by the #include relations between the
+# files in the directories.
+# The default value is: YES.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DIRECTORY_GRAPH        =3D YES
+
+# The DOT_IMAGE_FORMAT tag can be used to set the image format of the imag=
es
+# generated by dot.
+# Note: If you choose svg you need to set HTML_FILE_EXTENSION to xhtml in =
order
+# to make the SVG files visible in IE 9+ (other browsers do not have this
+# requirement).
+# Possible values are: png, jpg, gif and svg.
+# The default value is: png.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_IMAGE_FORMAT       =3D svg
+
+# If DOT_IMAGE_FORMAT is set to svg, then this option can be set to YES to
+# enable generation of interactive SVG images that allow zooming and panni=
ng.
+#
+# Note that this requires a modern browser other than Internet Explorer. T=
ested
+# and working are Firefox, Chrome, Safari, and Opera.
+# Note: For IE 9+ you need to set HTML_FILE_EXTENSION to xhtml in order to=
 make
+# the SVG files visible. Older versions of IE do not have SVG support.
+# The default value is: NO.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+INTERACTIVE_SVG        =3D YES
+
+# The DOT_PATH tag can be used to specify the path where the dot tool can =
be
+# found. If left blank, it is assumed the dot tool can be found in the pat=
h.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_PATH               =3D
+
+# The DOTFILE_DIRS tag can be used to specify one or more directories that
+# contain dot files that are included in the documentation (see the \dotfi=
le
+# command).
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOTFILE_DIRS           =3D
+
+# The MSCFILE_DIRS tag can be used to specify one or more directories that
+# contain msc files that are included in the documentation (see the \mscfi=
le
+# command).
+
+MSCFILE_DIRS           =3D
+
+# The DOT_GRAPH_MAX_NODES tag can be used to set the maximum number of nod=
es
+# that will be shown in the graph. If the number of nodes in a graph becom=
es
+# larger than this value, doxygen will truncate the graph, which is visual=
ized
+# by representing a node as a red box. Note that doxygen if the number of =
direct
+# children of the root node in a graph is already larger than
+# DOT_GRAPH_MAX_NODES then the graph will not be shown at all. Also note t=
hat
+# the size of a graph can be further restricted by MAX_DOT_GRAPH_DEPTH.
+# Minimum value: 0, maximum value: 10000, default value: 50.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_GRAPH_MAX_NODES    =3D 50
+
+# The MAX_DOT_GRAPH_DEPTH tag can be used to set the maximum depth of the =
graphs
+# generated by dot. A depth value of 3 means that only nodes reachable fro=
m the
+# root by following a path via at most 3 edges will be shown. Nodes that l=
ay
+# further from the root node will be omitted. Note that setting this optio=
n to 1
+# or 2 may greatly reduce the computation time needed for large code bases=
. Also
+# note that the size of a graph can be further restricted by
+# DOT_GRAPH_MAX_NODES. Using a depth of 0 means no depth restriction.
+# Minimum value: 0, maximum value: 1000, default value: 0.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+MAX_DOT_GRAPH_DEPTH    =3D 0
+
+# Set the DOT_TRANSPARENT tag to YES to generate images with a transparent
+# background. This is disabled by default, because dot on Windows does not=
 seem
+# to support this out of the box.
+#
+# Warning: Depending on the platform used, enabling this option may lead to
+# badly anti-aliased labels on the edges of a graph (i.e. they become hard=
 to
+# read).
+# The default value is: NO.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_TRANSPARENT        =3D NO
+
+# Set the DOT_MULTI_TARGETS tag to YES allow dot to generate multiple outp=
ut
+# files in one run (i.e. multiple -o and -T options on the command line). =
This
+# makes dot run faster, but since only newer versions of dot (>1.8.10) sup=
port
+# this, this feature is disabled by default.
+# The default value is: NO.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_MULTI_TARGETS      =3D NO
+
+# If the GENERATE_LEGEND tag is set to YES doxygen will generate a legend =
page
+# explaining the meaning of the various boxes and arrows in the dot genera=
ted
+# graphs.
+# The default value is: YES.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+GENERATE_LEGEND        =3D YES
+
+# If the DOT_CLEANUP tag is set to YES doxygen will remove the intermediat=
e dot
+# files that are used to generate the various graphs.
+# The default value is: YES.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_CLEANUP            =3D YES
diff --git a/configure.ac b/configure.ac
index 646b402101bb..da31e48bc632 100644
--- a/configure.ac
+++ b/configure.ac
@@ -11,6 +11,7 @@ AM_INIT_AUTOMAKE([
 AC_LANG([C++])
 AC_CONFIG_FILES([
 	Makefile
+	Doxyfile
 	src/Makefile
 	traceevent/Makefile
 	po/Makefile.in
-- =

1.8.3.1


--===============8346982995156555942==--

