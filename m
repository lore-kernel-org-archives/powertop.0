Content-Type: multipart/mixed; boundary="===============0763366828859236588=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] Complete build options for Pthread API
Date: Thu, 30 Oct 2014 19:34:56 -0700
Message-ID: <63912.10.255.85.192.1414722896.squirrel@linux.intel.com>
In-Reply-To: CAG27Bk2jDUn-1SoWqFQhb2ac22vdrpTBax8VU_Gv+e02Dw2_rw@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0763366828859236588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


All,

> On 22 October 2014 13:41, Sergey Senozhatsky
> <sergey.senozhatsky(a)gmail.com> wrote:
>> m4/* files are host-specific. they should never be part
>> of the source code or a package.
>
> I would not say it so strongly. There are plenty of projects that have
> files in m4 directory. Here's couple.
>
> http://git.savannah.gnu.org/gitweb/?p=3Dcoreutils.git;a=3Dtree;f=3Dm4
> https://github.com/karelzak/util-linux/tree/master/m4
>
> But if powertop does not want to mix files autotools generate with own
> files then an alternative path is needed. Perhaps powertop/m4/ could
> be used. That would leave door open to various other project local
> purposes as well files. What ever is done a maintainer decision is
> needed. In best case the decision should be documented to
> powertop/readmes/project_files.txt or something like that.
>
> --
> Sami Kerola
> http://www.iki.fi/kerolasa/
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>

I agree with Sergei, we use m4/* for generating our configuration files onl=
y.

Thank you,
Alexandra.

--===============0763366828859236588==--

