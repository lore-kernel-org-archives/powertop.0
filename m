Content-Type: multipart/mixed; boundary="===============2049469434091920582=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] Package C states over Haswell platform
Date: Tue, 28 Oct 2014 20:57:48 -0700
Message-ID: <58642.10.255.85.192.1414555068.squirrel@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2049469434091920582==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


>
>> Hi,
>>
>> I'm working on DELL E7440 platform (Haswell based) with dual OS: Windows
>> 8.1
>> and Ubuntu 14.04.1 (based on 3.13).
>> When I use Win 8.1, using BLA I get ~90% PC7 when idle. However, when I
>> use
>> the Ubuntu, using powertop I get only as high as PC3.
>> Since it's the same platform, it seems to rule out a HW issue. Any idea
>> what
>> can be the problem? Is Haswell fully supported by powertop?
>>
>>           Package   |             Core    |            CPU 0       CPU 2
>>                     |                     | C0 active   0.2%        0.1%
>>                     |                     | POLL        0.0%    0.0 ms
>> 0.0%
>> 0.0 ms
>>                     |                     | C1E-HSW     0.0%    0.1 ms
>> 0.0%
>> 0.0 ms
>> C2 (pc2)    0.1%    |                     |
>> C3 (pc3)    3.7%    | C3 (cc3)    0.0%    | C3-HSW      0.0%    0.4 ms
>> 0.0%
>> 0.4 ms
>> C6 (pc6)    0.0%    | C6 (cc6)    0.0%    | C6-HSW      0.0%    0.0 ms
>> 0.0%
>> 0.2 ms
>> C7 (pc7)    0.0%    | C7 (cc7)   99.0%    | C7s-HSW     0.1%    0.9 ms
>> 0.1%
>> 1.8 ms
>> C8 (pc8)    0.0%    |                     | C8-HSW      0.1%    1.4 ms
>> 0.2%
>> 2.5 ms
>> C9 (pc9)    0.0%    |                     | C9-HSW      0.4%    4.0 ms
>> 2.3%
>> 8.0 ms
>> C10 (pc10)  0.0%    |                     | C10-HSW    98.9%   44.5 ms
>> 97.0%
>> 36.5 ms
>>
>>                     |             Core    |            CPU 1       CPU 3
>>                     |                     | C0 active   0.2%        0.1%
>>                     |                     | POLL        0.0%    0.0 ms
>> 0.0%
>> 0.0 ms
>>                     |                     | C1E-HSW     0.0%    0.0 ms
>> 1.0%
>> 50.1 ms
>>                     |                     |
>>                     | C3 (cc3)    0.0%    | C3-HSW      0.0%    0.7 ms
>> 0.0%
>> 0.6 ms
>>                     | C6 (cc6)    0.0%    | C6-HSW      0.0%    0.5 ms
>> 0.0%
>> 0.0 ms
>>                     | C7 (cc7)   98.0%    | C7s-HSW     0.1%    0.7 ms
>> 0.4%
>> 25.7 ms
>>                     |                     | C8-HSW      0.0%    4.9 ms
>> 0.0%
>> 1.5 ms
>>                     |                     | C9-HSW      0.6%    4.7 ms
>> 0.7%
>> 19.5 ms
>>                     |                     | C10-HSW    98.5%   93.5 ms
>> 97.8%
>> 78.0 ms
>>
>>                     |             GPU     |
>>                     |                     |
>>                     | Powered On 12.1%    |
>>                     | RC6        87.9%    |
>>                     | RC6p        0.0%    |
>>                     | RC6pp       0.0%    |
>>
>> Thanks
>>
>>
>>
>> Rony
>>
>> _______________________________________________
>> PowerTop mailing list
>> PowerTop(a)lists.01.org
>> https://lists.01.org/mailman/listinfo/powertop
>>

Hi Rony,

Interesting you ask this since I presented at the Open source bridge =

conference a case study on how to optimize your computer in terms of power
using PowerTOP, as an example I used a Haswell box with Ubuntu.  I also
presented on the Debian conference a similar talk using Debian distro.
Both talks happened this year.


There are few things that may be happening.

 1- Update to the latest kernel 3.17.  From 3.13 to 3.17
there have been few bug fixes that help linux in terms of power
 management.

 2-At the boot command line of your kernel add the following settings:
       i915.enable_psr=3D1
       i915.enable_fbc=3D1
       pcie_aspm=3Dforce

The first command enables the graphics card use panel self refresh, the
second  enables frame buffer compression. The third command helps the
network card enter D3 state.
http://wireless.kernel.org/en/users/Documentation/ASPM#Enabling_ASPM_with_s=
etpci

 3- Use PowerTOP/tunables to tune power management for all your devices. =

If none of the settings disrupt the proper usability of the computer add =

then to a script file and run this each time you restart your computer. =

Alternatively you can use powertop --auto_tune


Run PowerTOP at this point you should see your system reaching a deep
power state.

Thank you,
Alexandra.

--===============2049469434091920582==--

