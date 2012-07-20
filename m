Content-Type: multipart/mixed; boundary="===============5372523798567715939=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] building on Fedora 17
Date: Thu, 19 Jul 2012 19:13:39 -0700
Message-ID: <5008BED3.30802@linux.intel.com>
In-Reply-To: 04DD5571759C064D967CF1D07D73B6284909C331@fmsmsx109.amr.corp.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5372523798567715939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7/19/2012 4:45 PM, Howard, James D wrote:
> I downloaded PowerTop ver. 2.0 and attempted to build it with:
>    ./autogen.sh
> then
>    ./configure
> The configure script is not finding "LIBNL" and nl_socket_alloc.
> =

> My Fedora 17 installation seems to have libnl and the looked-for symbol:
>    $ rpm -qa | grep libnl
>    libnl3-3.2.7-1.fc17.x86_64
>    libnl-1.1-15.fc17.x86_64
> And, nl_socket_alloc is defined in (at least) the 64-bit library /usr/lib=
64/libnl-3.so.200:
>    $ nm --dynamic /usr/lib64/libnl-3.so.200 | grep nl_socket_alloc
>    00000039c360f740 T nl_socket_alloc
>    00000039c360f6d0 T nl_socket_alloc_cb
> =

> Is this something that the Fedora 17 distribution has changed in the libn=
l naming string -- again?

do you have the -devel package of these, so that you have the headers ?


--===============5372523798567715939==--

