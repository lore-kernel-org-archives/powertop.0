Content-Type: multipart/mixed; boundary="===============2151725858426643571=="
MIME-Version: 1.0
From: Jose Luis Rivas <ghostbar at debian.org>
Subject: Re: [Powertop] ia64 builds fails (and maybe alpha too?)
Date: Tue, 03 Sep 2013 18:48:16 -0430
Message-ID: <52266E38.3030307@debian.org>
In-Reply-To: 52266C26.4070705@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2151725858426643571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue Sep  3 18:39:26 2013, Arjan van de Ven wrote:
>
> if your kernel does not have "perf", there is no point in using
> powertop....
> really; it will not work at all.
>
> (including anything asm-generic/foo also is the wrong answer; that
> directory is not architectural
> from a kernel perspective, only for indirect inclusion)
>
>

It does. I was just writing to Julian about this. It seems like it is
actually a bug in the kernel not having it defined in ia64's unistd.h[0]
(checking Linus's master branch).

[0]
https://github.com/torvalds/linux/blob/master/arch/ia64/include/uapi/asm/un=
istd.h

Meaning that it wont fail in alpha, but's failing on ia64 because that
line is missing.

Seems like the right hint, Arjan?
-- =

Jose Luis Rivas
The Debian Project -- http://debian.org

--===============2151725858426643571==--

