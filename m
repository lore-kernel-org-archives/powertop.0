Content-Type: multipart/mixed; boundary="===============0675047905506226336=="
MIME-Version: 1.0
From: Kok, Auke-jan H <auke-jan.h.kok at intel.com>
Subject: Re: [Powertop] How does powertop make power consumption estimation?
Date: Sat, 11 May 2013 09:33:33 -0700
Message-ID: <CABsxX9JmrwXF8H4DjMvSHM91ipQRzKoBhASpkh=jnY=Tw_6GzQ@mail.gmail.com>
In-Reply-To: CAAq0_yrTMeNJ9HUSo=Gtp1rgwNUmnUH0BYOCi4SA1vL_DB-wVA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0675047905506226336==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 8, 2013 at 10:27 PM, Kevin Qiu <explodeandroid(a)gmail.com> wro=
te:
> I am looking into the source code, but it's a bunch of codes. And lack
> of knowledge of CPP itself brings me more troubles. Can some one
> described to me how powertop makes power consumption estimation. And
> which files does the job for make estimation for different devices? Are
> there similar linux open source software does the similar job?
> KevinQ

I believe some of this is covered in the README... Powertop looks at
your laptop battery if one is present, and infers the power drain from
there. It can also use an external power meter.

The estimation algirithm itself is in the code, check out the
calibration parts for more details.

Auke

--===============0675047905506226336==--

