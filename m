Content-Type: multipart/mixed; boundary="===============0500430795972552429=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] Package C states over Haswell platform
Date: Tue, 28 Oct 2014 20:37:34 -0700
Message-ID: <58472.10.255.85.192.1414553854.squirrel@linux.intel.com>
In-Reply-To: 002401cff2cb$1aeaebc0$50c0c340$@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0500430795972552429==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> Hi,
>
> I'm working on DELL E7440 platform (Haswell based) with dual OS: Windows
> 8.1
> and Ubuntu 14.04.1 (based on 3.13).
> When I use Win 8.1, using BLA I get ~90% PC7 when idle. However, when I
> use
> the Ubuntu, using powertop I get only as high as PC3.
> Since it's the same platform, it seems to rule out a HW issue. Any idea
> what
> can be the problem? Is Haswell fully supported by powertop?
>
>           Package   |             Core    |            CPU 0       CPU 2
>                     |                     | C0 active   0.2%        0.1%
>                     |                     | POLL        0.0%    0.0 ms
> 0.0%
> 0.0 ms
>                     |                     | C1E-HSW     0.0%    0.1 ms
> 0.0%
> 0.0 ms
> C2 (pc2)    0.1%    |                     |
> C3 (pc3)    3.7%    | C3 (cc3)    0.0%    | C3-HSW      0.0%    0.4 ms
> 0.0%
> 0.4 ms
> C6 (pc6)    0.0%    | C6 (cc6)    0.0%    | C6-HSW      0.0%    0.0 ms
> 0.0%
> 0.2 ms
> C7 (pc7)    0.0%    | C7 (cc7)   99.0%    | C7s-HSW     0.1%    0.9 ms
> 0.1%
> 1.8 ms
> C8 (pc8)    0.0%    |                     | C8-HSW      0.1%    1.4 ms
> 0.2%
> 2.5 ms
> C9 (pc9)    0.0%    |                     | C9-HSW      0.4%    4.0 ms
> 2.3%
> 8.0 ms
> C10 (pc10)  0.0%    |                     | C10-HSW    98.9%   44.5 ms
> 97.0%
> 36.5 ms
>
>                     |             Core    |            CPU 1       CPU 3
>                     |                     | C0 active   0.2%        0.1%
>                     |                     | POLL        0.0%    0.0 ms
> 0.0%
> 0.0 ms
>                     |                     | C1E-HSW     0.0%    0.0 ms
> 1.0%
> 50.1 ms
>                     |                     |
>                     | C3 (cc3)    0.0%    | C3-HSW      0.0%    0.7 ms
> 0.0%
> 0.6 ms
>                     | C6 (cc6)    0.0%    | C6-HSW      0.0%    0.5 ms
> 0.0%
> 0.0 ms
>                     | C7 (cc7)   98.0%    | C7s-HSW     0.1%    0.7 ms
> 0.4%
> 25.7 ms
>                     |                     | C8-HSW      0.0%    4.9 ms
> 0.0%
> 1.5 ms
>                     |                     | C9-HSW      0.6%    4.7 ms
> 0.7%
> 19.5 ms
>                     |                     | C10-HSW    98.5%   93.5 ms
> 97.8%
> 78.0 ms
>
>                     |             GPU     |
>                     |                     |
>                     | Powered On 12.1%    |
>                     | RC6        87.9%    |
>                     | RC6p        0.0%    |
>                     | RC6pp       0.0%    |
>
> Thanks
>
>
>
> Rony
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>

Hi Rony,

Interesting you ask this since I presented at the Open source bridge
conference how to optimize your computer in terms of power using power
top, as an example I used a Haswell box with Ubuntu.  I also presented on
the Debian conference a similar talk using Debian distro.


There are few things that may be happening.

1- I would suggest to update to the latest kernel 3.17.  From 3.13 to 3.17
there have been few bug fixes that help linux in terms of power
management.

2-At the boot command line of your kernel add the following settings:



Thank you,
Alexandra.

--===============0500430795972552429==--

