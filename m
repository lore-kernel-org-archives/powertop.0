Content-Type: multipart/mixed; boundary="===============0335758153050882954=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH 07/12] move options structure to function scope
Date: Sun, 03 Aug 2014 12:52:18 +0900
Message-ID: <20140803035218.GA952@swordfish>
In-Reply-To: CAG27Bk3YC1TNt=OLOQE_jO7q6izjB3iLAjWeC3xhnXBZth9Bjg@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0335758153050882954==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On (08/02/14 23:20), Sami Kerola wrote:
> On 2 August 2014 14:47, Sergey Senozhatsky <sergey.senozhatsky(a)gmail.co=
m> wrote:
> >> Subject: [Powertop] [PATCH 07/12] move options structure to function s=
cope
> >
> > what for?
> =

> They've told me keeping variables in as narrow scope as possible is a
> virtue. Even if it would not be I don't see any harm of moving
> everything out of global scope when ever possible.
> =

> https://www.securecoding.cert.org/confluence/display/cplusplus/DCL07-CPP.=
+Minimize+the+scope+of+variables+and+methods

this is different. let's keep it as is.

	-ss

--===============0335758153050882954==--

