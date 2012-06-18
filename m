Content-Type: multipart/mixed; boundary="===============5617943452418547256=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: Re: [Powertop] Please revert the workload patch
Date: Mon, 18 Jun 2012 22:59:00 +0200
Message-ID: <1340053140.5088.1.camel@sara>
In-Reply-To: 4FDF5A96.9010009@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5617943452418547256==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-06-18 at 09:43 -0700, Chris Ferron wrote:
> Hi Magnus,
>      Sorry about that, that patch was lost in the shuffle. All patches =

> have now been applied upstream, and all should now be well.
> -Chris

Yes, this is fixed in the current head version.

/MF

> On 06/18/2012 08:19 AM, Dirk Brandewie wrote:
> > Hi Magnus,
> >
> > This patch should fix your problem.  I will work with Chris to get it
> > pushed out.
> >
> > BTW could not find the commit you quoted
> >
> > --Dirk
> >
> > diff --git a/src/main.cpp b/src/main.cpp
> > index 880d745..c57c984 100644
> > --- a/src/main.cpp
> > +++ b/src/main.cpp
> > @@ -452,7 +452,7 @@ int main(int argc, char **argv)
> >
> >      while (!leave_powertop) {
> >          show_cur_tab();
> > -        one_measurement(time_out, workload);
> > +        one_measurement(time_out, NULL);
> >          learn_parameters(15, 0);
> >      }
> >  #ifndef DISABLE_NCURSES
> =




--===============5617943452418547256==--

