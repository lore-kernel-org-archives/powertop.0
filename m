Content-Type: multipart/mixed; boundary="===============1612922706607110588=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH 2/4] Make the "which C state line" logic better
Date: Mon, 06 Aug 2012 06:22:18 -0700
Message-ID: <501FC50A.2060503@linux.intel.com>
In-Reply-To: CA+Z25wXQKuTpwh-0Y2VFqZW2+zDiAveXhrqwvQrztXN=Kb+hZg@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1612922706607110588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 8/6/2012 12:19 AM, Rajagopal Venkat wrote:
> =

> On 5 August 2012 22:43, Arjan van de Ven <arjan(a)linux.intel.com <mailto=
:arjan(a)linux.intel.com>> wrote:
> =

>     From 2e88a61859db0592707d1a0a35e33408a0327951 Mon Sep 17 00:00:00 2001
>     From: Arjan van de Ven <arjan(a)linux.intel.com <mailto:arjan(a)linux=
.intel.com>>
>     Date: Sun, 5 Aug 2012 09:57:49 -0700
>     Subject: [PATCH 2/4] Make the "which C state line" logic better
> =

>     the ARM guys complained that their human-readable C state names didn'=
t have
>     numbers in them, and that as a result, the output is all messed up.
>     Using the "linux_name" instead is only a partial solution; it messes =
up the x86
>     side of the logic.
> =

>  =

> I fail to understand how using "linux_name" for parsing C states would me=
ss up
> x86 logic. Each supported C state will have corresponding 'stateX' direct=
ory
> (linux_name) which contain numbers in them. Also there are few hard coded
> states in intel_cpus.cpp file, in which linux_name contains numbers in th=
em
> as well. In both the cases linux_name contains numbers and hence safe to
> parse. Please let me know if I am missing something here.

it contains numbers, but not the right ones
so on x86, the package, core and cpu states do not line up properly if I on=
ly use linux_name.
(e.g. package C6 and core C6 are on a different line than CPU C6)
with this patch that is kept correctly, while hopefully also fixing your is=
sue.



--===============1612922706607110588==--

