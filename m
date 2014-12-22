Content-Type: multipart/mixed; boundary="===============8989372329308572069=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] Powertop crashes with 'powertop --auto-tune'
Date: Sun, 21 Dec 2014 16:15:48 -0800
Message-ID: <549762B4.3090108@linux.intel.com>
In-Reply-To: CAG27Bk1Y+S=yakWkiResNsrSeJf=g9HfsqEP5E---tamhnqH-A@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8989372329308572069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> I'm just a hobbyist contributor and I haven't cracked out how to know
> where in code 'double free or corruption (!prev): 0x0975bc20' issue
> happen. Could you compile the tool with debugging symbols, and
> recreate issue the way we could see backtrace? That would make fixing
> a lot easier.
>
> cd /tmp
> wget https://01.org/sites/default/files/downloads/powertop/powertop-2.7.t=
ar.gz
> tar xzf powertop-2.7.tar.gz
> cd powertop-2.7
> CXXLAGS=3D"-O0 -g -ggdb -fno-omit-frame-pointer" ./configure
> make -j3
> sudo -i
> cd /tmp/powertop-2.7
> ./src/powertop --auto-tune
> [crash]
> coredumpctl gdb
> (gdb) bt full
> <copy paste this output to reply>

this would indeed be very helpful

another helpful thing could be to run "strace" on powertop, and c-n-p the l=
ast 20 lines or so



--===============8989372329308572069==--

