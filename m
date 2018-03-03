Content-Type: multipart/mixed; boundary="===============5175969107256431727=="
MIME-Version: 1.0
From: Mingye Wang (Artoria2e5) <arthur2e5 at aosc.io>
Subject: [Powertop] [PATCH 0/2] Align multi-column characters properly (SPLIT
 [po] Updated zh_CN translation)
Date: Sat, 03 Mar 2018 14:49:09 -0500
Message-ID: <ffa8a2ae-46b8-3c55-4feb-9aa581c4cbea@aosc.io>
In-Reply-To: 72eb9191-c31e-465a-e0a9-8439a3692e74@aosc.io
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5175969107256431727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi folks,

On 18/03/03 03:14, Mingcong Bai wrote:
> Updated Mingye Wang's patches to fix build - PowerTOP has been built and =

> tested and columns are now aligned correctly when using zh_CN.
> =

> Best Regards,
> Mingcong Bai

I will post the patches below, as I just found something else to revise. =

Here are some quick answers to typical code reviewer questions:

Q. What strings does measure_string fail on?
A. Strings with invalid multibyte sequences (-3), non-printable =

characters such as newlines and tabs (-1), NULL (-2), and huge strings =

that fail malloc (-2).

Q. Why is measure_string returning an int instead of a size_t?
A. I blame wcswidth.

Q. What does measure_string depend on?
A. malloc/free, mbsrtowcs, and wcswidth.

Q. Is align_string slower now?
A. Yes. It needs to do a full encoding conversion in measure_string =

instead of just counting.

Q. Are you making a more "naive" version of align_string?
A. Not now. But note that the unit-printing parts (watts, rpm...) =

generally only involve printable ASCII, so strlen() will suffice for =

them. It should not matter too much.

Q. Is the "ctr" variable useless in cpu.cpp now?
A. Yes, but it still should sync up with the actual column count.

Things we want you all to fix up that aren't included in the patch:

1. LINGUAS, or we will never see the translations used.

2. The use of #include <stdfoo.h> in C++ where #include <cstdfoo> is =

available. The C++ variants of these headers work much better (you don't =

have to memset the mbstate_t, for example) in C++.

3. Use some C++ strings maybe? It's not that bad for me as compilers =

know how to optimize out stuff like "if (strlen(x))", but those new =

stuff sure are much easier to use.

--
Regards,
Mingye Wang


--===============5175969107256431727==--

