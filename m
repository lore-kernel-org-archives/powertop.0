Content-Type: multipart/mixed; boundary="===============2577763492929294641=="
MIME-Version: 1.0
From: Eugene Syromyatnikov <evgsyr at gmail.com>
Subject: Re: [Powertop] [PATCH v2 02/19] main.cpp: append __TIME__ to
 --version output
Date: Thu, 04 Aug 2016 14:48:13 +0300
Message-ID: <CACGkJdtaJAUUURNu72ntQsxT8RhMQ2uvBTU7sZV04XNrEsQqXg@mail.gmail.com>
In-Reply-To: 1470272369-218664-3-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2577763492929294641==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 4, 2016 at 3:59 AM, Joe Konno <joe.konno(a)linux.intel.com> wro=
te:
> From: Joe Konno <joe.konno(a)intel.com>
> -       printf(_("PowerTOP version " POWERTOP_VERSION ", compiled on " __=
DATE__ "\n"));
> +       printf(_("PowerTOP version " POWERTOP_VERSION ", compiled on " __=
DATE__ " at " __TIME__ "\n"));
By the way, there is a warning regarding reproducibility produced
during build of Debian package.

main.cpp:101:78: warning: macro "__DATE__" might prevent reproducible
builds [-Wdate-time]
 printf(("PowerTOP version " POWERTOP_VERSION ", compiled on " __DATE_ "\n"=
));
                                                                           =
  ^

I'm not aware whether powertop project cares about build
reproducibility, but in case you are, may be it's better to put
generation of timestamps in version string under some development
define (#ifdef DEVEL or something) =E2=80=94
https://reproducible-builds.org/docs/timestamps/.

-- =

Eugene "eSyr" Syromyatnikov
mailto:evgSyr(a)gmail.com
xmpp:eSyr(a)jabber.{ru|org}

--===============2577763492929294641==--

