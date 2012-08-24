Content-Type: multipart/mixed; boundary="===============8187650483203928552=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH] tuninig: resize scaling support (v1)
Date: Fri, 24 Aug 2012 08:56:41 -0700
Message-ID: <5037A439.7000505@linux.intel.com>
In-Reply-To: 20120823205337.GB3065@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8187650483203928552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/23/2012 01:53 PM, Sergey Senozhatsky wrote:
> On (08/23/12 09:57), Chris Ferron wrote:
>> So this may be nice for the tuning tab, but we have an overall issue
>> with other tabs as well.
>> Maybe we should change the controls around, and just move the pad.
>> That way we could scroll all tabs and not have to truncate strings.
>> ?
>> -Chris
>>
> That was the first one in a upcoming series of patches.
> Because we have separate display logic on every tab, I was moving in a
> direction of teaching each tabs honour resize.
>
>
>> Maybe we should change the controls around, and just move the pad.
>> That way we could scroll all tabs and not have to truncate strings.
> Sorry, I'm not sure I got this one, could you please elaborate?
>
> We can't avaoid string truncation (unless we introduce support for horizo=
ntal
> scrolling as well) when X becomes smaller than the longest string in tab
> (we actually can just ignore it and print beyond the sceen, but I think t=
he
> common behaviour in that case is to let user notice that text has been tr=
uncated
> via ~ for example). I don't know what to do with C, P states tab when we =
only
> have space for "Package" and "Core", or when half of currently required X=
 space for
> "Frequency stats" tab is available -- dynamic re-arrange looks a bit comp=
lex at
> the moment.
>
> As of Y scroll, well, we can come up with a common interface:
> -- for tab w/ cursor
> scrolling happens on every n*Y cursor position, because cursor step is 1.
>
> -- for tab w/o cursor
> scroling happens every cursor step (which is Y in this case).
>
> Schematically, what we need is a common method which will tell the number
> of lines particular tab is going to print, flag that indecates cursor step
> and common method (similar to one that used in tuning tab) to print tab
> content from BEGIN positiothen to END (BEGIN and END depends on current f=
rame).
I will have to take another look this weekend, but if I remember =

correctly. We create a large pad and then place windows on for viewing. =

If we change the controls a bit, I think we can use the arrow keys to =

scroll the viewable window around the pad for all tab windows.

Refresh or a tab change would reset the viewable window. Then we could =

scroll x y.

I think you may be right about truncating strings, but maybe only if the =

string is bigger then the base pad.

Instead of arrow keys navigating tabs, we could use the "TAB" key.

Just a thought
-Chris


>
> 	-ss


--===============8187650483203928552==--

