Content-Type: multipart/mixed; boundary="===============3955439484728372558=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] Package C states over Haswell platform
Date: Tue, 28 Oct 2014 09:45:42 -0700
Message-ID: <544FC836.6030506@linux.intel.com>
In-Reply-To: 002401cff2cb$1aeaebc0$50c0c340$@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3955439484728372558==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/28/2014 9:20 AM, Rony Ross wrote:
> I'm working on DELL E7440 platform (Haswell based) with dual OS: Windows =
8.1 and Ubuntu 14.04.1 (based on 3.13).
> When I use Win 8.1, using BLA I get ~90% PC7 when idle. However, when I u=
se the Ubuntu, using powertop I get only as high as PC3.
> Since it's the same platform, it seems to rule out a HW issue. Any idea w=
hat can be the problem? Is Haswell fully supported by powertop?
>

likely some device is not going to a low power state, which then blocks PC7.
Powertop should be able to tell you which device that is


--===============3955439484728372558==--

