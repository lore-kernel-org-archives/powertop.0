Content-Type: multipart/mixed; boundary="===============1881642083746996153=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] PowerTOP: _("Cannot load from file")
Date: Thu, 31 May 2012 08:42:40 -0700
Message-ID: <4FC79170.9060804@linux.intel.com>
In-Reply-To: 4FC6F94B.4060401@freemail.hu
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1881642083746996153==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 05/30/2012 09:53 PM, N=C3=A9meth M=C3=A1rton wrote:
> Hi Chris,
>
> I have seen in commit 0e9374d27bfa51b885ee3fe69fbb3b12bdae3600 that
> the last space of the "Cannot load from file " was removed. This results
> even in English the following output:
>
> Cannot load from file/var/cache/powertop/saved_parameters.powertop
>
> One solution would be something like this:
>
>    cout<<  _("Cannot load from file")<<  " "<<  pathname<<  "\n";
Good input thank you. I am still learning about the difficulty's in =

translation on internationalization.
I will make some adjustments from your input.
Thanks
-Chris

> However, in Hungarian this sentence is difficult to translate because of
> the word order. For example the natural translation of the following
> English sentence would be:
>
>    English: Cannot load from file foo.bar
>    Hungarian: Nem lehetett a foo.bar f=C3=A1jlb=C3=B3l bet=C3=B6lteni
>
> As you can see in this case it would be better to use the %s format string
> for printing pathname because this gives better flexibility for the trans=
lator
> to place the pathname string in natural place in a translated sentence.
>
> Regards,
>
> 	M=C3=A1rton N=C3=A9meth
>


--===============1881642083746996153==--

