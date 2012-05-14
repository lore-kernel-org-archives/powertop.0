Content-Type: multipart/mixed; boundary="===============6957911924145068835=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] Any way to show HH:MM for time left instead of just
 minutes?
Date: Mon, 14 May 2012 10:44:05 -0700
Message-ID: <4FB14465.7040902@linux.intel.com>
In-Reply-To: CAEoL4DPSsmxeCL6ubn7ao9_+22QsNDfSqkpJGvthK8mFwKfvyA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6957911924145068835==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 05/12/2012 07:07 PM, corrupt wrote:
> You're absolutely right.
> I don't know C++ very well, but I was able to make an amateur patch =

> that does this.
>
> If anyone wants the patch, here it is (it converts time left to HH:MM =

> on the display): http://pastebin.com/raw.php?i=3DDf2ttb9e
>
Hi,
    Thanks for the patch. Next time just include the patch in the mail, =

but for this time I applied it manually.
-Chris

> On Sat, May 12, 2012 at 6:03 PM, Kok, Auke-jan H =

> <auke-jan.h.kok(a)intel.com <mailto:auke-jan.h.kok(a)intel.com>> wrote:
>
>
>
>     On Sat, May 12, 2012 at 5:58 PM, corrupt <corrupt(a)gmail.com
>     <mailto:corrupt(a)gmail.com>> wrote:
>
>         I just upgraded to Powertop 2.0 and I'm frankly I'm
>         disappointed with the new interface.
>
>         It shows how many minutes there is left on my battery (267
>         minutes), which is kind of odd that it's not in HH:MM format
>         like the previous versions.
>
>         Any way to change this?
>
>     You could write a patch that divides the amount of minutes by 60,
>     and changes the display!
>
>     Cheers,
>
>     Auke
>
>
>
>
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop


--===============6957911924145068835==--

