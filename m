Content-Type: multipart/mixed; boundary="===============7318591116012153594=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: Re: [Powertop] [PATCH v2 1/8] Properly cleaning up the display tabs
Date: Wed, 22 Oct 2014 07:49:09 -0700
Message-ID: <5447C3E5.7020404@linux.intel.com>
In-Reply-To: 20141022121725.GC950@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7318591116012153594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

While I do not agree, I understand.

Irrespective of the OS's handling of allocated memory on exit, I
consider it best practice to free all allocated memory at each and every
program exit point. Call me pedantic, but there it is.

Cheers-- I appreciate your reviews and feedback

On 10/22/2014 05:17 AM, Sergey Senozhatsky wrote:
> =

> free(p) before exit(0) is really useless, the kernel will clean
> up everything.
>=20

--===============7318591116012153594==--

