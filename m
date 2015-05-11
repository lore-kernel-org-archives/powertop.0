Content-Type: multipart/mixed; boundary="===============2892314790563262784=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Do not exit on MSR read errors
Date: Mon, 11 May 2015 09:54:23 -0700
Message-ID: <5550DEBF.6000207@linux.intel.com>
In-Reply-To: 1009270194.15661933.1431362984315.JavaMail.zimbra@redhat.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2892314790563262784==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/11/2015 9:49 AM, Jaroslav Skarvada wrote:
> Hi,
>
> it seems there are virtual environments not correctly implementing the MSR
> (e.g. VirtualBox bug: https://www.virtualbox.org/ticket/14099) or not imp=
lementing
> it at all (e.g. KVM). PowerTOP just exits in such environments and cannot=
 run.
>
> The proposed patch makes PowerTOP not to exit on MSR read errors, but sti=
ll
> report them.
>
> Resending as attachment, because the previous e-mail has been probably bl=
ocked
> somewhere
>

Hi,


I have a slightly different patch in a local repo, but it needed a command =
line option
so I didn't sent it upstream yet.

the solution you have makes the app not crash, but it's really not the righ=
t thing.
the reason is that the statistics code still uses the "native intel msr" mo=
del,
so it gets all zeroes... it should use "just trust the kernel" model instea=
d.

-       if (strcmp(vendor, "GenuineIntel") =3D=3D 0)
+       if (strcmp(vendor, "GenuineIntel") =3D=3D 0 && !broken_msrs)


something like that in src/cpu/cpu.cpp (3x) is needed instead....
but today the msr logic runs after this code, not before, so I have not yet=
 found
a good way to set the broken_msrs variable for the case in question



--===============2892314790563262784==--

