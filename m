Content-Type: multipart/mixed; boundary="===============8186252102626714819=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] [Announce] v2.5-rc1
Date: Wed, 23 Oct 2013 11:32:12 -0700
Message-ID: <54661.10.24.1.152.1382553132.squirrel@linux.intel.com>
In-Reply-To: 20131023180039.GC2474@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8186252102626714819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> On (10/23/13 09:12), Alexandra Yates wrote:
>> >>
>> >> This change enables the menu links and mouse over, but the font and
>> the
>> >> button background are all black, I don't think the css are working
>> here.
>> >> I will send you the image to your email that way you get to see it.
>> >>
>> >
>> > thanks. well, that's weird. I found rdesktop-ed win box around and
>> tested
>> > generated report on IE (don't know the version - 8 or 9). what IE
>> version
>> > is on the picture?
>> >
>>
>> You are welcome, what version of IE are you running?
>>
>
> ok. this is really the last one :)
>
> I think I found the issue -- textContent support in IE.
>
>
> ---
>  src/powertop.css | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/src/powertop.css b/src/powertop.css
> index 6d43e07..ce7dbb2 100644
> --- a/src/powertop.css
> +++ b/src/powertop.css
> @@ -17,20 +17,29 @@ var powertop =3D {
>   },
>   cadd: function(idx, c){
>     var el =3D document.getElementById(idx);
> -   if (el)
> -     el.classList.add(c);
> -
> +   if (el) {
> +      var cn =3D el.className;
> +      if (cn.indexOf(c) !=3D -1)
> +         return;
> +      cn +=3D ' ' + c;
> +      el.className =3D cn;
> +   }
>   },
>   crm: function(id, c){
>     var el =3D document.getElementById(id);
> -   if (el)
> -     el.classList.remove(c);
> +   if (el) {
> +      var cn =3D el.className
> +      while (cn.indexOf(' ' + c) !=3D -1)
> +         cn =3D cn.replace(' ' + c,'');
> +      el.className =3D cn;
> +   }
>   },
>   newbutton: function(id, txt) {
>    var x =3D document.createElement('div');
>    x.id =3D id + '_button';
>    x.className =3D 'nav_button';
>    x.textContent =3D txt;
> +  x.innerText =3D txt;
>    x.onclick =3D function() { powertop.toggle(id); };
>    return x;
>   },
>
>
YES! that fixes the menu! It works in IE, FF, Chrome :)

Thank you,
Alexandra.

--===============8186252102626714819==--

