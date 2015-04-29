Content-Type: multipart/mixed; boundary="===============2427699206395877274=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] Too much memory consumption by powertop
Date: Wed, 29 Apr 2015 10:39:37 -0700
Message-ID: <53172.10.24.5.14.1430329177.squirrel@linux.intel.com>
In-Reply-To: s5hvbgg83a0.wl-tiwai@suse.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2427699206395877274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> At Tue, 28 Apr 2015 10:14:17 -0700 (PDT),
> Alexandra Yates wrote:
>>
>>
>> > As powertop list is for subscribers only, here Takashi's
>> > findings concerning a big memory waste fowarded:
>> >
>> > ----------  Forwarded Message  ----------
>> >
>> > Subject: Too much memory consumption by powertop
>> > Date: Tuesday, April 28, 2015, 05:32:41 PM
>> > From: Takashi Iwai <tiwai(a)suse.de>
>> > To: powertop(a)lists.01.org
>> > CC: trenn(a)suse.de
>> >
>> > Hi,
>> >
>> > I noticed that powertop consumes way too much memory than needed.  It
>> > constantly takes over 170MB RES, sometimes over 200MB.
>> >
>> > Then I looked at profile, and it showed that most of memory is
>> > allocated for newpad_sp().  Indeed, the current code allocates a pad
>> > of the fixed size of 1000x1000 (!) for each tab, and we have five
>> > tabs, so five times of that.  No wonder that such a small neat CUI
>> > program is so hungry.
>> >
>> > For example, a hack like below already reduces the memory footprint
>> > to around 20MB, 90% cut.  Not bad.
>> >
>> > --- a/src/display.cpp
>> > +++ b/src/display.cpp
>> > @@ -48,7 +48,7 @@ void create_tab(const string &name, cons
>> >         if (!w)
>> >                 w =3D new(class tab_window);
>> >
>> > -       w->win =3D newpad(1000,1000);
>> > +       w->win =3D newpad(80,160); // XXX FIXME XXX
>> >         tab_names.push_back(name);
>> >         tab_windows[name] =3D w;
>> >         tab_translations[name] =3D translation;
>> >
>> > Can anyone look into this and give a better / smarter solution?
>> >
>> >
>> > thanks,
>> >
>> > Takashi
>> > -----------------------------------------
>> > _______________________________________________
>> > PowerTop mailing list
>> > PowerTop(a)lists.01.org
>> > https://lists.01.org/mailman/listinfo/powertop
>> >
>>
>> To avoid the high memory consumption on testing run it on HTML mode so
>> that the powertop.html report is generated in the background.
>
> Yeah, starting firefox is smaller than powertop, indeed :)
>
>
> Takashi
>

Now if you really want save resources you could go by having your output
on a .txt file.

Thank you,
Alexandra.

--===============2427699206395877274==--

