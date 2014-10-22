Content-Type: multipart/mixed; boundary="===============2378646600337553992=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: Re: [Powertop] Complete build options for Pthread API
Date: Wed, 22 Oct 2014 15:33:32 +0100
Message-ID: <CAG27Bk2jDUn-1SoWqFQhb2ac22vdrpTBax8VU_Gv+e02Dw2_rw@mail.gmail.com>
In-Reply-To: 20141022124108.GC950@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2378646600337553992==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 22 October 2014 13:41, Sergey Senozhatsky
<sergey.senozhatsky(a)gmail.com> wrote:
> m4/* files are host-specific. they should never be part
> of the source code or a package.

I would not say it so strongly. There are plenty of projects that have
files in m4 directory. Here's couple.

http://git.savannah.gnu.org/gitweb/?p=3Dcoreutils.git;a=3Dtree;f=3Dm4
https://github.com/karelzak/util-linux/tree/master/m4

But if powertop does not want to mix files autotools generate with own
files then an alternative path is needed. Perhaps powertop/m4/ could
be used. That would leave door open to various other project local
purposes as well files. What ever is done a maintainer decision is
needed. In best case the decision should be documented to
powertop/readmes/project_files.txt or something like that.

-- =

Sami Kerola
http://www.iki.fi/kerolasa/

--===============2378646600337553992==--

