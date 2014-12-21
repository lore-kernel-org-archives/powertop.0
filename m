Content-Type: multipart/mixed; boundary="===============6828649681972102252=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: Re: [Powertop] Powertop crashes with 'powertop --auto-tune'
Date: Sun, 21 Dec 2014 21:25:40 +0000
Message-ID: <CAG27Bk1Y+S=yakWkiResNsrSeJf=g9HfsqEP5E---tamhnqH-A@mail.gmail.com>
In-Reply-To: 54971B20.6020708@gmx.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6828649681972102252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 21 December 2014 at 19:10, Harvey <harv(a)gmx.de> wrote:
> Hope I am right here:
>
> On Archlinux 64bit as well as 32bit systems powertop 2.7 crashes
> reproducible like this when called with the parameter --auto-tune:

Hi Harvey,

Rather strange. I have up to date archlinux and the same does not
happen when I run --auto-tune.

I'm just a hobbyist contributor and I haven't cracked out how to know
where in code 'double free or corruption (!prev): 0x0975bc20' issue
happen. Could you compile the tool with debugging symbols, and
recreate issue the way we could see backtrace? That would make fixing
a lot easier.

cd /tmp
wget https://01.org/sites/default/files/downloads/powertop/powertop-2.7.tar=
.gz
tar xzf powertop-2.7.tar.gz
cd powertop-2.7
CXXLAGS=3D"-O0 -g -ggdb -fno-omit-frame-pointer" ./configure
make -j3
sudo -i
cd /tmp/powertop-2.7
./src/powertop --auto-tune
[crash]
coredumpctl gdb
(gdb) bt full
<copy paste this output to reply>

-- =

Sami Kerola
http://www.iki.fi/kerolasa/

--===============6828649681972102252==--

