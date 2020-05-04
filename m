Content-Type: multipart/mixed; boundary="===============2682429055708405408=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH 3/3 v1] Add CONTRIBUTE.md
Date: Mon, 04 May 2020 09:50:14 -0700
Message-ID: <20200504165014.6409-4-joe.konno@linux.intel.com>
In-Reply-To: 20200504165014.6409-1-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2682429055708405408==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

It's time that PowerTOP had a contributors' guide.

Reviewed-by: Doug Martin <doug.martin(a)intel.com>
Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 CONTRIBUTE.md | 188 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 188 insertions(+)
 create mode 100644 CONTRIBUTE.md

diff --git a/CONTRIBUTE.md b/CONTRIBUTE.md
new file mode 100644
index 000000000000..4287d41c854c
--- /dev/null
+++ b/CONTRIBUTE.md
@@ -0,0 +1,188 @@
+# How to Contribute to PowerTOP
+
+If you are interested in PowerTOP and wish to put some time and effort int=
o it,
+this is the document for you. Filing bug reports, translating text strings,
+editing or creating documentation, helping fellow users, or making changes=
 to
+the program source code are some of the ways you can contribute to the pro=
ject.
+
+Thank you for your interest in PowerTOP. We appreciate your effort, time, =
and
+continued participation in this project.
+
+
+# Official source code repository
+
+The official source code repository is hosted on GitHub*, so a GitHub acco=
unt is
+strongly recommended for effective collaboration. All bug filings, changes=
, and
+releases are hosted there:
+* [Official Upstream Repository][upstream]
+
+Developers, check out the "Code Conventions" section further down. We look
+forward to your pull requests!
+
+
+# Finding bugs
+
+No software is perfect. Since PowerTOP is a diagnostic/debug tool concerned
+with your system, different hardware may behave differently than we expect,
+resulting in weird behaviors (or crashes). There are plenty of bugs to be =
found
+and squashed, and we appreciate your willingness to help.
+
+Bugs will be filed here:
+* [Official Upstream Repository][upstream]
+
+It is important to note that bug filings are the start of a conversation, =
and
+conversations are two-way streets. When you find a bug, do not merely "fil=
e and
+forget". Expect follow-up questions to be asked. We may even ask you to pa=
tch,
+re-compile, and re-run to see if our change(s) fix your issue, especially =
if
+your system's particular behavior(s) have revealed the bug.
+
+If one of us asks you to do something that tests the limits of your comfor=
t or
+ability, say so, and we will do our best to help you.
+
+
+# Writing documentation
+
+Here is the layout of PowerTOP's documentation:
+* `CONTRIBUTE.md` is this document
+* `README.md` covers cloning, building, and getting started with PowerTOP
+* `doc/powertop.8` is the (roff) manual page for the project
+* Code comments (or lack thereof)
+
+PowerTOP, at present, does not generate a library for use by other program=
s, so
+there is no "PowerTOP API". The source code does have internal functions a=
nd
+APIs for specific duties that are key to program functionality. Those need=
 to
+be thoroughly documented for future developers.
+
+Markdown documents follow the latest CommonMark spec. Generally speaking,
+do not use GitHub's proprietary extensions to Markdown syntax.
+* [CommonMark Specifications][cmark]
+
+The manual page uses roff syntax.
+* `man 7 roff`, or
+* [man 7 roff (in html)][manroff]
+
+Code comments are described in the "Code Conventions" section further down.
+
+
+# Localization
+
+PowerTOP uses `gettext` for localization. Translating strings is done usin=
g PO
+files, and those are contributed back to PowerTOP through a GitHub pull
+request.
+
+If you are new to `gettext`, here is the official documentation for it:
+* [Creating PO Files][gettext_create]
+
+The `gettext` project also has some links to commonly-used PO editors:
+* [Editing PO Files][gettext_edit]
+
+
+# Code conventions
+
+PowerTOP's maintainers will enforce the Linux* kernel coding style.
+* [Linux Kernel Coding Style][kernel_style]
+
+That style guide is tailored for the Linux kernel, so "I" is Linus Torvald=
s.
+For the purposes of the PowerTOP project, the maintainers of PowerTOP have=
 the
+final say on style. If a specific thing does not apply to PowerTOP, the es=
sence
+of the guidance almost surely does. This section will be expanded upon
+as needed.
+
+While C++ is used in some parts of the codebase, C-style comments are
+preferred. This is copy-pasted directly from the kernel style guide:
+
+    /*
+     * This is the preferred style for multi-line
+     * comments in the Linux kernel source code.
+     * Please use it consistently.
+     *
+     * Description:  A column of asterisks on the left side,
+     * with beginning and ending almost-blank lines.
+     */
+
+There are sections of that style guide that are specific to the kernel-- t=
he
+"Allocating Memory" and "Don't re-invent the kernel macros" sections come =
to
+mind. The essential take-aways from those sections are: "Use the right fun=
ction
+for the right job" and "do not re-invent existing functionality". That is =
sound
+development advice for any software project.
+
+The PowerTOP code base is constantly evolving, and the code base has been
+around for a while. Expect to see code that does not follow the kernel sty=
le
+guide. If you find any such code, fix it or let us know. Those are style b=
ugs
+that need fixing.
+
+When you submit a patch to the PowerTOP project, we assume you agree to
+what's written in the "License" section below.
+
+
+# License
+
+PowerTOP is a GPLv2 project (see `COPYING` and `README.md`). All contribut=
ions
+will be licensed under the terms of the GPLv2.
+
+If you create a new source file or header, here is the comment to be place=
d at
+the beginning (from line 1) of the new file:
+
+```
+/*
+ * Copyright (C) yyyy  name of author
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; version 2.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-13=
01, USA.
+ *
+ * SPDX-License-Identifier: GPL-2.0-only
+ */
+```
+
+All contributions to PowerTOP *must* adhere to the Linux kernel's "Develop=
er's
+Certificate of Origin", which we will copy-paste here for completeness:
+
+By making a contribution to this project, you certify that:
+
+```
+a. The contribution was created in whole or in part by me and I have the r=
ight
+   to submit it under the open source license indicated in the file; or
+
+b. The contribution is based upon previous work that, to the best of my
+   knowledge, is covered under an appropriate open source license and I ha=
ve the
+   right under that license to submit that work with modifications, whether
+   created in whole or in part by me, under the same open source license (=
unless I
+   am permitted to submit under a different license), as indicated in the =
file; or
+
+c. The contribution was provided directly to me by some other person who
+   certified (a), (b) or (c) and I have not modified it.
+
+d. I understand and agree that this project and the contribution are publi=
c and
+   that a record of the contribution (including all personal information I=
 submit
+   with it, including my sign-off) is maintained indefinitely and may be
+   redistributed consistent with this project or the open source license(s)
+   involved.
+```
+
+From: [Developer's Cerificate of Origin][kernel_cos]
+
+
+# Thank You!
+
+Again, thank you! Your time and effort are greatly appreciated! We look fo=
rward
+to your contributions, and appreciate your continued participation in the
+project!
+
+
+[upstream]: https://github.com/fenrus75/powertop "Official PowerTOP Reposi=
tory"
+[cmark]: https://spec.commonmark.org/ "External Link: CommonMark Specifica=
tions"
+[manroff]: http://man7.org/linux/man-pages/man7/roff.7.html "External Link=
: man 7 roff"
+[gettext_create]: https://www.gnu.org/software/gettext/manual/html_node/Cr=
eating.html#Creating "External Link: Creating a PO File"
+[gettext_edit]: https://www.gnu.org/software/gettext/manual/html_node/Edit=
ing.html#Editing "External Link: PO File Editors"
+[kernel_style]: https://www.kernel.org/doc/html/latest/process/coding-styl=
e.html "External Link: Linux kernel coding style"
+[kernel_cos]: https://www.kernel.org/doc/html/latest/process/submitting-pa=
tches.html#sign-your-work-the-developer-s-certificate-of-origin "External L=
ink: Developer's Certificate of Origin"
-- =

2.26.2

--===============2682429055708405408==--

