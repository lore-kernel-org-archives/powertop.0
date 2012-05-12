Content-Type: multipart/mixed; boundary="===============4629362567948930018=="
MIME-Version: 1.0
From: Jan Engelhardt <jengelh at inai.de>
Subject: Re: [Powertop] [PATCH] Fix trying to use libnl-2.0 when only
 libnl-3.0 is installed
Date: Sat, 12 May 2012 23:57:50 +0200
Message-ID: <alpine.LNX.2.01.1205122353410.19371@frira.vanv.qr>
In-Reply-To: 4FAECE05.9080109@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4629362567948930018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On Saturday 2012-05-12 22:54, Arjan van de Ven wrote:
>> =

>>     When using libnl-3.0 we need to link with libnl-genl also, if not, we
>>     get a lot of undefined symbols.
>>     ---
>>      has_libnl_ver=3D0
>>      PKG_CHECK_MODULES([LIBNL], [libnl-1], [has_libnl_ver=3D1], [
>>     -       AC_SEARCH_LIBS([nl_socket_alloc], [nl], [has_libnl_ver=3D2],=
 [
>>     +       AC_SEARCH_LIBS([nl_socket_alloc], [libnl-2.0],
>>     [has_libnl_ver=3D2], [
>> =

>> are you sure you want the linker to check for -llibnl-2.0? that means
>> it's going to try to find a "liblibnl-2.0.so <http://liblibnl-2.0.so>"
>> (note the double "lib" here).
>
>this autoconf stuff is giving me a headache
>
>maybe we should ask the libnl guys if they have some snippet that they
>recommend.... after all I doubt we're the only ones dealing with their
>library.

libnl2 always has nl_socket_alloc, does it not? Why check for it?

(Why even bother with libnl1 and libnl2 anyway? They are obsolete.)

--===============4629362567948930018==--

