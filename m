Content-Type: multipart/mixed; boundary="===============2162342601568962191=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] Complete build options for Pthread API
Date: Thu, 30 Oct 2014 20:35:27 -0700
Message-ID: <50509.10.252.141.137.1414726527.squirrel@linux.intel.com>
In-Reply-To: CAG27Bk1t+2ZjJbrywNJYN+Hco+W+P-hGRsL9HsLcW7gyNXmVJA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2162342601568962191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> On 25 October 2014 09:58, Sergey Senozhatsky
> <sergey.senozhatsky(a)gmail.com> wrote:
>> On (10/22/14 15:33), Sami Kerola wrote:
>>> On 22 October 2014 13:41, Sergey Senozhatsky
>>> <sergey.senozhatsky(a)gmail.com> wrote:
>>> > m4/* files are host-specific. they should never be part
>>> > of the source code or a package.
>>>
>>> I would not say it so strongly. There are plenty of projects that have
>>> files in m4 directory. Here's couple.
>>>
>>> http://git.savannah.gnu.org/gitweb/?p=3Dcoreutils.git;a=3Dtree;f=3Dm4
>>> https://github.com/karelzak/util-linux/tree/master/m4
>>
>> yes, but powertop does not use any optional m4 macros/libs that
>> are not basically available (afaik).
>
> Proposal to use AX_PTHREAD means that will change.
>
> Looking autoconf release notes
>
> http://lwn.net/Articles/531373/
>
> It might be possible to make m4 copies to go to AC_CONFIG_MACRO_DIR,
> while AC_CONFIG_MACRO_DIRS informs project specific m4 search patch.
> Assuming this sort of thing is tried it also looks like the autoconf
> version requirement will need to be pumped to 1.13 from 1.11.1. Please
> notice that I haven't ever tried to use multiple m4 directories, so
> this is reply is based on tons of assumptions without real experience
> or tests about topic. The minimum I need to make progress with
> separation is a decision what is the path for project local m4 files.
>
> That said autotools documentation
>
> http://www.gnu.org/software/automake/manual/html_node/Local-Macros.html
>
> is telling use of m4 directory is fine, and 'there is no consensus on
> the distribution of third-party macros'.
>
> Considering the above I'm 87.5% sure using m4/ directory initially to
> introduce AX_PTHREAD is OK. If needed/wanted/etc later changes can
> move the data around, set autoconf requirement higher, and so on what
> ever might come as aside effect.
>
>>  https://lists.01.org/pipermail/powertop/2013-June/000855.html
>
> I do not understand how that message relates to m4 directories.
>
> --
> Sami Kerola
> http://www.iki.fi/kerolasa/
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>

What is the the return on investment for this feature in terms of
performance?

At the moment PowerTOP builds with in 40 seconds from source and building
the package takes ~15 seconds.

Thank you,
Alexandra.

--===============2162342601568962191==--

