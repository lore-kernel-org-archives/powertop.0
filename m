Content-Type: multipart/mixed; boundary="===============1283014239122090010=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] How does powertop deal with multiple executions
Date: Mon, 28 Oct 2013 19:20:30 -0700
Message-ID: <526F1B6E.4080000@linux.intel.com>
In-Reply-To: 526EF543.3000503@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1283014239122090010==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/28/2013 4:37 PM, Jes=C3=BAs D=C3=ADaz Vico wrote:
> Hello,
>
> I'm trying to estimate the power consumption (besides some other properti=
es) of a custom program. During my tests, I execute my program several time=
s (it is not a
> background process) with powertop running. My doubt is: how does powertop=
 deal with these multiple executions?
>
> I'd guess that it averages over the number of executions, because I'm obt=
aining very similar power consumption measurements for both 500 and 5000 ex=
ecutions of my program
> (335 mW and 364 mW, respectively). Still, there is the possibility that p=
owertop only keeps the estimation corresponding to the last execution...
>
> Thanks.

by default, powertop will group programs with the same name into one bucket=
 for display purposes.



--===============1283014239122090010==--

