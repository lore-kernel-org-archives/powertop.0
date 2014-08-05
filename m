Content-Type: multipart/mixed; boundary="===============1558235108545027690=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: Re: [Powertop] [PATCH 07/12] move options structure to function scope
Date: Tue, 05 Aug 2014 22:30:47 +0100
Message-ID: <CAG27Bk15huJVa+5Tw-psCiF2wsyfw4fnn__-jwdh05MThAY4ig@mail.gmail.com>
In-Reply-To: 61169.10.24.6.146.1407195678.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1558235108545027690==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5 August 2014 00:41, Alexandra Yates <alexandra.yates(a)linux.intel.com>=
 wrote:

Hi Alexandra,

> Welcome Sami to PowerTOP, and thank you very much for submitting your
> patches, and everyone else for reviewing them.

Thank you indeed. It's always nice feedback, and critical eyes looking
my changes
that I've found to be way too often to be less than perfect.

> Sami, I would appreciate you make the changes people requested on the
> list, and be prepared for further rounds of reviews/changes of your
> patches.  This is the current process PowerTOP developers do code reviews.

AFAIK all changes that were proposed, and work, are done. The backslash
removal for instance did not happen, primarily because it would break build=
s.

> Here are few other things to consider before sending your patches for
> PowerTOP:
>
> As I mentioned on a previous thread PowerTOp uses the linux kernel coding
> style, please change all your code to follow this guidelines.
> https://www.kernel.org/doc/Documentation/CodingStyle.

Ok.

> Before creating a set of patches please check the code using
> https://github.com/torvalds/linux/blob/master/scripts/checkpatch.pl

Done. In total 0 errors, 0 warnings.

> Lastly, when creating your new set of patches use the flag
> --subject-prefix=3D"PATCH Vx" x being the revision version.  That will ma=
ke
> things easy on the mailing list.

Are you sure? That makes the subject lines to look following.

Subject: [PATCH Vx 01/14] configure: use vertical lists

I think I need to break the rules and drop the ' Vx' when resubmitting
the change set.

> After your code gets an ok from the community I will go ahead and add it
> to mainline.

Ack.

> Thank you very much again for sending all your changes,

NP. All I initially wanted to do was to get rid of the ncurses
blinking when --auto-tuning, but somehow the other changes just
started to happen. Hopefully that was good thing.

-- =

Sami Kerola
http://www.iki.fi/kerolasa/

--===============1558235108545027690==--

