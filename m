Content-Type: multipart/mixed; boundary="===============7445698654427378120=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] [PATCH v2 00/14] pull: various changes,
 mostly build system related
Date: Sun, 16 Nov 2014 20:45:02 -0800
Message-ID: <56432.10.252.139.164.1416199502.squirrel@linux.intel.com>
In-Reply-To: CAG27Bk1cPR7vZYODhUx4K-Q6YinbjxkLSobBR0BK2+SZbn_FOA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7445698654427378120==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> On 14 November 2014 04:30, Alexandra Yates
> <alexandra.yates(a)linux.intel.com> wrote:
>
> Hi Alexandra, and all,
>
>> Patches look good.
>
> Nice to hear.
>
>> Two things:
>>
>> 1- I could not get this patch to apply
>> "configure: require new enough automake version"
>> Patch is empty.  Was it split wrong?
>
> Empty? I don't understand, I can see the change in mail archive.
>
> https://lists.01.org/pipermail/powertop/2014-November/001666.html
>
> Instead of sending the same 14 patches without any changes to them
> could you consider merging from my repo to avoid weird mail content
> issue(s).
>
> cd powertop
> git remote add sami https://github.com/kerolasa/powertop.git
> git fetch sami
> git checkout master
> git merge sami/various
> git remote remove sami
>
> If all OK git push to what ever you call upstream repo, often origin,
> but there is no way I could be sure.
>
>> 2- Please get the latest checkpatch.pl from the linux kernel scripts and
>> run it over your files before creating the patches.
>
> The script reported few of the following, but I don't think they are
> meaningful in this case.
>
> If any of these errors are false positives, please report
> them to the maintainer, see CHECKPATCH in MAINTAINERS.
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
>
> The checkpatch.pl did not report any other errors.
>
> --
> Sami Kerola
> http://www.iki.fi/kerolasa/
>

Sami,

When I run checkpatch.pl I get white spaces and over 80 char line errors
on your patches.

Thank you,
Alexandra.

--===============7445698654427378120==--

