Content-Type: multipart/mixed; boundary="===============8239856754752602866=="
MIME-Version: 1.0
From: Swaminathan, Nivedita <nivedita.swaminathan at intel.com>
Subject: Re: [Powertop] powertop-2.8 Fedora compile fix
Date: Tue, 17 Nov 2015 23:46:50 +0000
Message-ID: <203C9A218350B94EAF34403F81F162AE1974E6AA@ORSMSX116.amr.corp.intel.com>
In-Reply-To: 1583929279.7774917.1447167703465.JavaMail.zimbra@redhat.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8239856754752602866==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thank you for sending your patch. Your patch has been added to the github r=
epository.

Regards,
Nivedita =


-----Original Message-----
From: PowerTop [mailto:powertop-bounces(a)lists.01.org] On Behalf Of Jarosl=
av Skarvada
Sent: Tuesday, November 10, 2015 7:02 AM
To: powertop(a)lists.01.org
Subject: [Powertop] powertop-2.8 Fedora compile fix

Hi,

thanks for the powertop-2.8 release. In Fedora we have ImplicitDSOLinking [=
1], so for pthreads usage it needs to link with the -lpthread. But the incl=
uded ax_pthread.m4 macro find -pthreads CFLAGS, not LDFLAGS. From the GCC m=
anual page:

> -pthreads
> Add support for multithreading using the POSIX threads library.
> This option sets flags for both the preprocessor and linker.

This means that you need to add the PTHREAD_CFLAGS in order to compile powe=
rtop on systems with ImplicitDSOLinking and recent GCC. The attached patch =
do it and fixed the problem for me in Fedora

thanks & regards

Jaroslav

[1] https://fedoraproject.org/wiki/Features/ChangeInImplicitDSOLinking

--===============8239856754752602866==--

