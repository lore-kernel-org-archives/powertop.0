Content-Type: multipart/mixed; boundary="===============2060177315571486752=="
MIME-Version: 1.0
From: Chris Samuel <chris at csamuel.org>
Subject: Re: [Powertop] [Announcement] Updated Users Guide Released
Date: Thu, 18 Dec 2014 19:53:16 +1100
Message-ID: <16895790.u6kEdQy9oK@quad>
In-Reply-To: 1418748976.740.223.camel@spandruv-desktop.jf.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2060177315571486752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hiya,

On Tue, 16 Dec 2014 04:56:42 PM Pandruvada, Srinivas wrote:

> Check your kernel command line. It may be disabling there
> "intel_pstate=3Ddisable".

Thanks for the idea, but it doesn't look like it..

$ cat /proc/cmdline
BOOT_IMAGE=3D/@/boot/vmlinuz-3.13.0-43-generic root=3DUUID=3D3b13f4db-6ba3-=
47c9-aa78-2b52ae5c4807 ro rootflags=3Dsubvol=3D@ quiet splash nomdmonddf no=
mdmonisw nomdmonddf nomdmonisw vt.handoff=3D7

I don't see any mention of pstate in dmesg. :-(

All the best,
Chris
-- =

 Chris Samuel  :  http://www.csamuel.org/  :  Melbourne, VIC



--===============2060177315571486752==--

