Content-Type: multipart/mixed; boundary="===============5337814070477445118=="
MIME-Version: 1.0
From: =?utf-8?q?Peter_H=C3=BCwe_=3CPeterHuewe_at_gmx=2Ede=3E?=
Subject: Re: [Powertop] PowerTOP 2.0 bugs
Date: Tue, 15 May 2012 00:23:07 +0200
Message-ID: <201205150023.08181.PeterHuewe@gmx.de>
In-Reply-To: 4FB181A0.9020803@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5337814070477445118==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Am Dienstag 15 Mai 2012, 00:05:20 schrieb Chris Ferron:

> > On Thu, Jan 13, 2011 at 9:14 PM, Marti Raudsepp<marti(a)juffo.org>  wro=
te:
> >> First, I also see an empty "Idle stats" screen, as reported by Ian
> >> Kumlien earlier. Old PowerTOP didn't report idle state statistics
> >> either, but at least it had an explanatory message.
> > =

> > "Idle stats page" is still empty:
> >           Package   |            CPU 0
> >           =

> >                     |            CPU 1
> >                     |            CPU 2
> >                     |            CPU 3
> >> =

> >> Fourth, the "Frequency stats" screen starts up showing good numbers,
> >> but after the first refresh, all per-core numbers turn bogus. For each
> >> core, the percentages always add up to 1895% !
> > =

> > Still occurs, but now the magic constant is always 1961.1%
> > =

> >             Package |            CPU 0
> > =

> > Idle         0.0%   | Idle         0.6%
> > =

> >   800 MHz     0.0%   |  800 MHz     0.4%
> > =

> > 3.00 GHz   100.0%   | 3.00 GHz   1960.1%
> > 1.80 GHz     0.0%   | 2.31 GHz     0.0%
> > 2.31 GHz     0.0%   |
> > =

> >                     |            CPU 1
> >                     | =

> >                     | Idle         2.6%
> >                     | =

> >                     |  800 MHz     0.3%
> >                     | =

> >                     | 3.00 GHz   1958.1%
> >                     | 2.31 GHz     0.0%
> >                     | =

> >                     |            CPU 2
> >                     | =

> >                     | Idle         2.0%
> >                     | =

> >                     |  800 MHz     0.3%
> >                     | =

> >                     | 3.00 GHz   1958.8%
> >                     | 1.80 GHz     0.0%
> >                     | 2.31 GHz     0.0%
> >                     | =

> >                     |            CPU 3
> >                     | =

> >                     | Idle         1.9%
> >                     | =

> >                     |  800 MHz     0.2%
> >                     | =

> >                     | 3.00 GHz   1958.7%
> >                     | 1.80 GHz     0.3%
> >                     | 2.31 GHz     0.0%
> > =


> =

> Your bug was not ignored, it was not seen before release during our
> testing.
> I have spent three hours testing this bug using your test case above,
> and am not seeing the issue.
> So it may very well be there is an hardware corner case I need to track
> down. Which is why I asked the above questions.

The same does happen on my cpu here,
which is an  AMD Athlon(tm) 64 X2 Dual Core Processor 3800+ =


                    |            CPU 1
                    | Idle       713,8%
                    | 1000 MHz   1182,6%
                    | 2,00 GHz    23,9%
                    | 1,80 GHz     9,5%

And the idlestats are empty for the second core =


          Package   |            CPU 0
POLL        0,0%    | POLL        0,0%    0,0 ms
C1         79,6%    | C1         79,5%    2,7 ms

                    |            CPU 1
                    |
                    |



Peter





--===============5337814070477445118==--

