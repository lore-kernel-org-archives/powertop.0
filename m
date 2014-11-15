Content-Type: multipart/mixed; boundary="===============8965313173850388221=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: Re: [Powertop] [PATCH v2 00/14] pull: various changes,
 mostly build system related
Date: Sat, 15 Nov 2014 17:54:59 +0000
Message-ID: <CAG27Bk1cPR7vZYODhUx4K-Q6YinbjxkLSobBR0BK2+SZbn_FOA@mail.gmail.com>
In-Reply-To: 62192.10.254.178.169.1415939426.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8965313173850388221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 14 November 2014 04:30, Alexandra Yates
<alexandra.yates(a)linux.intel.com> wrote:

Hi Alexandra, and all,

> Patches look good.

Nice to hear.

> Two things:
>
> 1- I could not get this patch to apply
> "configure: require new enough automake version"
> Patch is empty.  Was it split wrong?

Empty? I don't understand, I can see the change in mail archive.

https://lists.01.org/pipermail/powertop/2014-November/001666.html

Instead of sending the same 14 patches without any changes to them
could you consider merging from my repo to avoid weird mail content
issue(s).

cd powertop
git remote add sami https://github.com/kerolasa/powertop.git
git fetch sami
git checkout master
git merge sami/various
git remote remove sami

If all OK git push to what ever you call upstream repo, often origin,
but there is no way I could be sure.

> 2- Please get the latest checkpatch.pl from the linux kernel scripts and
> run it over your files before creating the patches.

The script reported few of the following, but I don't think they are
meaningful in this case.

If any of these errors are false positives, please report
them to the maintainer, see CHECKPATCH in MAINTAINERS.
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

The checkpatch.pl did not report any other errors.

-- =

Sami Kerola
http://www.iki.fi/kerolasa/

--===============8965313173850388221==--

