Content-Type: multipart/mixed; boundary="===============3996219608580571805=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] 64bit-portability-issue
Date: Sat, 28 Dec 2013 15:43:10 +0100
Message-ID: <52BEE37E.1060600@linux.intel.com>
In-Reply-To: 52BED799.3020805@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3996219608580571805==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/28/2013 2:52 PM, denisart benjamin2 wrote:
>
> Hello everyone,
>
> I'm a openSUSE maintainer and I have an issue with powertop 2.5 about
> implicit implementation, classic stdio.h,... Obviously, I tried to patch
> event-parce.c but it doesn't work
>
> I: Program is using implicit definitions of functions getting
>     pointers or implemented by macros. These functions need to use their
>     correct prototypes to allow correct argument passing on e.g. x86_64 .
>     - Implicit memory/string functions need #include <string.h>.
>     - Implicit *printf functions need #include <stdio.h>.
>     - Implicit *printf functions need #include <stdio.h>.
>     - Implicit *read* functions need #include <unistd.h>.
>     - Implicit *recv* functions need #include <sys/socket.h>.
> W: powertop implicit-pointer-decl event-parse.c:856
> E: powertop 64bit-portability-issue event-parse.c:5120
>
adding Steve since this is his upstream code...

btw this code will be a standalone upstream library very soon...
... I assume OpenSUSE will include this library ?


--===============3996219608580571805==--

