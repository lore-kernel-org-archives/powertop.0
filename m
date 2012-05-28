Content-Type: multipart/mixed; boundary="===============1164213917879823922=="
MIME-Version: 1.0
From: Andreas Mohr <andi at lisas.de>
Subject: [Powertop] autoconf madness, AGAIN
Date: Mon, 28 May 2012 18:55:54 +0200
Message-ID: <20120528165554.GA22853@rhlx01.hs-esslingen.de>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1164213917879823922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[resend - mail to deprecated list power(a)bughost.org did not make it to li=
st]

Hi,

[trying to test current fenrus75 powertop master]

it seems whenever I'm forced to build an autoconf-based app,
there's a >>> 50% chance of ending up something like that:

| autoreconf: running: aclocal -I m4
| configure.ac:4: error: Autoconf version 2.68 or higher is required
| configure.ac:4: the top level
| autom4te: /usr/bin/m4 failed with exit status: 63
| aclocal: /usr/bin/autom4te failed with exit status: 63
| autoreconf: aclocal failed with exit status: 63

(or choose one of the almost universal "unknown macro ..."
or something else errors instead)


I'm running Debian stable (MEPIS 11.0) here, with the following package
deals of the day:

$ apt-cache search autoconf
...
autoconf - automatic configure script builder
autoconf2.13 - automatic configure script builder (obsolete version)
autoconf2.59 - automatic configure script builder (obsolete version)
autoconf2.64 - automatic configure script builder (obsolete version)


What does that tell us? That's a truly impressive list of versionitis
workaround options for a supposedly universally applicable build environmen=
t.
Yet even that massive list is miraculously unable to fulfill the
"version requirements of the day" that powertop (or some other
autoconf-based software) exhibits.

IMHO that means that powertop's autoconf version requirements
are too aggressive and should be fixed. ESPECIALLY since even the newest
autoconf release is only one version number newer than this requirement.
I could try to work on that if this is
"something that is deemed worthy of fixing".

Thanks,

Andreas Mohr

P.S.: full disclosure: more active on the CMake side of development -
which in certain areas isn't always rosy either though ;)

--===============1164213917879823922==--

