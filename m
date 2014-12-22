Content-Type: multipart/mixed; boundary="===============5367098565687611049=="
MIME-Version: 1.0
From: Joerg Mayer <jmpt at loplof.de>
Subject: Re: [Powertop] Powertop crashes with 'powertop --auto-tune'
Date: Mon, 22 Dec 2014 02:27:26 +0100
Message-ID: <20141222012726.GB42181@rhrk.uni-kl.de>
In-Reply-To: 549762B4.3090108@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5367098565687611049==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 21, 2014 at 04:15:48PM -0800, Arjan van de Ven wrote:
> >I'm just a hobbyist contributor and I haven't cracked out how to know
> >where in code 'double free or corruption (!prev): 0x0975bc20' issue
> >happen. Could you compile the tool with debugging symbols, and
> >recreate issue the way we could see backtrace? That would make fixing
> >a lot easier.
> >
> >cd /tmp
> >wget https://01.org/sites/default/files/downloads/powertop/powertop-2.7.=
tar.gz
> >tar xzf powertop-2.7.tar.gz
> >cd powertop-2.7
> >CXXLAGS=3D"-O0 -g -ggdb -fno-omit-frame-pointer" ./configure
> >make -j3
> >sudo -i
> >cd /tmp/powertop-2.7
> >./src/powertop --auto-tune
> >[crash]
> >coredumpctl gdb
> >(gdb) bt full
> ><copy paste this output to reply>
> =

> this would indeed be very helpful
> =

> another helpful thing could be to run "strace" on powertop, and c-n-p the=
 last 20 lines or so

The fun with global variables. The following patch fixed this form me.

diff --git a/src/devices/devfreq.cpp b/src/devices/devfreq.cpp
index d2e56e3..4de5c9b 100644
--- a/src/devices/devfreq.cpp
+++ b/src/devices/devfreq.cpp
@@ -247,6 +247,7 @@ void create_all_devfreq_devices(void)
                fprintf(stderr, "Devfreq not enabled\n");
                is_enabled =3D false;
                closedir(dir);
+               dir =3D NULL;
                return;
        }

Ciao
   J=C3=B6rg
-- =

Joerg Mayer                                           <jmayer(a)loplof.de>
We are stuck with technology when what we really want is just stuff that
works. Some say that should read Microsoft instead of technology.

--===============5367098565687611049==--

