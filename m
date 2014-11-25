Content-Type: multipart/mixed; boundary="===============7739468437420159655=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] [PATCH v2 00/14] pull: various changes,
 mostly build system related
Date: Tue, 25 Nov 2014 11:22:50 -0800
Message-ID: <50846.10.24.1.128.1416943370.squirrel@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7739468437420159655==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> On 18 November 2014 at 18:08, Alexandra Yates
> <alexandra.yates(a)linux.intel.com> wrote:
>>> <alexandra.yates(a)linux.intel.com> wrote:
>>>> When I run checkpatch.pl I get white spaces and over 80 char line
>>>> errors
>>>> on your patches.
>>>
>>> Hi Alexandra,
>>>
>>> You are right, I missed in the change 0004 'csstoh.sh: check every
>>> single return value' a white space error. That is now fixed in:
>>>
>>> https://github.com/kerolasa/powertop/commit/6d7e331488db1e1428925579431=
242b8fb1c6007
>>>
>>> 80 char line errors are strange. I do not see them. Are we using the
>>> same version of the checkpatch.pl?
>>>
>>> $ git describe
>>> v3.18-rc5
>>> $ shasum scripts/checkpatch.pl
>>> a13cad76323e71c97ba279838feef9730509fc59  scripts/checkpatch.pl
>>
>> I'm using the tip of the branch from
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>
> Hii Alexandra,
>
> Congratulations on the new release.
>
> I suppose now after the release my patch set can be put back on track.
> Since I do not see the same errors as you could you run the
> checkpatch.pl against the 14 changes and send me the output. That
> would help me a lot.
>
> --
> Sami Kerola
> http://www.iki.fi/kerolasa/
>

 Hi Sami,

Here is the output from checkpatch.pl

   ERROR: trailing whitespace
   14 #139: FILE: src/csstoh.sh:37:
   15 +const char css[] =3D $

And The other error is that I can't get patch 0002 to commit.

I will be out of the office from tomorrow until Dec 10th visiting family =

in Ireland.

If we don't get these patches today we will as soon as I get back to work.

Thank you,
Alexandra.

--===============7739468437420159655==--

