Content-Type: multipart/mixed; boundary="===============6463776287799519672=="
MIME-Version: 1.0
From: Stefan Weil <sw at weilnetz.de>
Subject: Re: [Powertop] [PATCH] Fix crash on Linux ARM hosts
Date: Thu, 12 Jul 2012 22:05:01 +0200
Message-ID: <4FFF2DED.3020604@weilnetz.de>
In-Reply-To: 20120712194545.GA2981@swordfish.datadirect.datadirectnet.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6463776287799519672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Am 12.07.2012 21:45, schrieb Sergey Senozhatsky:
> On (07/12/12 20:41), Stefan Weil wrote:
>> /proc/cpuinfo on ARM hosts is different and resulted
>> in a call of handle_one_cpu() with number =3D=3D -1
>> which finally raised a SIGSEGV crash (noticed on
>> Debian Wheezy for ARM).
>>
>> Fix this by testing the value of "number".
>>
>> After number was used, it is now reset to -1 just to make
>> sure that the new test also works for a potential 2nd cpu
>> with unexpected information in /proc/cpuinfo.
>>
>> Signed-off-by: Stefan Weil <sw(a)weilnetz.de>
>> ---
>>
>
>
> Hello,
>
> We had this before. I would rather prefer default CPU number
> to be 1, instead of -1.
>
> Discussion:
> http://lists.01.org/pipermail/powertop/2012-May/000055.html
> http://lists.01.org/pipermail/powertop/2012-May/000073.html
>
>
> And the patch is:
> http://lists.01.org/pipermail/powertop/2012-May/000052.html
>   =

>
> Chris, did you have a chance to take a look on this one?
>
>
> 	-ss
>

Thanks for the pointers to the previous mails - I had searched
the archive and bug trackers but did not notice them.

The default CPU number should be 0, not 1, because
that seems to be a common value for other architectures
with only one CPU.

My patch only sets it to -1 to avoid any use of it (it could
also be set to any negative value).

I'm just preparing a 2nd patch on top of this one which
adds ARM support. It should also fix any other architecture
which does not use "processor\t:" (there are several of them
according to the Linux source code). It takes a while until
it is built, because my new Raspberry PI is so terribly slow.

         -sw

--===============6463776287799519672==--

