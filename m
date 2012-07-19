Content-Type: multipart/mixed; boundary="===============2070769996477001453=="
MIME-Version: 1.0
From: Howard, James D <james.d.howard at intel.com>
Subject: [Powertop] building on Fedora 17
Date: Thu, 19 Jul 2012 23:45:14 +0000
Message-ID: <04DD5571759C064D967CF1D07D73B6284909C331@fmsmsx109.amr.corp.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2070769996477001453==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I downloaded PowerTop ver. 2.0 and attempted to build it with:
   ./autogen.sh
then
   ./configure
The configure script is not finding "LIBNL" and nl_socket_alloc.

My Fedora 17 installation seems to have libnl and the looked-for symbol:
   $ rpm -qa | grep libnl
   libnl3-3.2.7-1.fc17.x86_64
   libnl-1.1-15.fc17.x86_64
And, nl_socket_alloc is defined in (at least) the 64-bit library /usr/lib64=
/libnl-3.so.200:
   $ nm --dynamic /usr/lib64/libnl-3.so.200 | grep nl_socket_alloc
   00000039c360f740 T nl_socket_alloc
   00000039c360f6d0 T nl_socket_alloc_cb

Is this something that the Fedora 17 distribution has changed in the libnl =
naming string -- again?

--
james.d.howard(a)intel.com  Principal Engineer
//Intel/SSG/DRD/PAE/FACE/DCE
+1-503-712-8608

--===============2070769996477001453==--

