Content-Type: multipart/mixed; boundary="===============5008323309342044866=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Complete build options for Pthread API
Date: Sat, 25 Oct 2014 17:58:40 +0900
Message-ID: <20141025085840.GA1572@swordfish>
In-Reply-To: CAG27Bk2jDUn-1SoWqFQhb2ac22vdrpTBax8VU_Gv+e02Dw2_rw@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5008323309342044866==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/22/14 15:33), Sami Kerola wrote:
> On 22 October 2014 13:41, Sergey Senozhatsky
> <sergey.senozhatsky(a)gmail.com> wrote:
> > m4/* files are host-specific. they should never be part
> > of the source code or a package.
> =

> I would not say it so strongly. There are plenty of projects that have
> files in m4 directory. Here's couple.
> =

> http://git.savannah.gnu.org/gitweb/?p=3Dcoreutils.git;a=3Dtree;f=3Dm4
> https://github.com/karelzak/util-linux/tree/master/m4

yes, but powertop does not use any optional m4 macros/libs that
are not basically available (afaik).

 https://lists.01.org/pipermail/powertop/2013-June/000855.html

	-ss

> But if powertop does not want to mix files autotools generate with own
> files then an alternative path is needed. Perhaps powertop/m4/ could
> be used. That would leave door open to various other project local
> purposes as well files. What ever is done a maintainer decision is
> needed. In best case the decision should be documented to
> powertop/readmes/project_files.txt or something like that.
> =

> -- =

> Sami Kerola
> http://www.iki.fi/kerolasa/
>=20

--===============5008323309342044866==--

