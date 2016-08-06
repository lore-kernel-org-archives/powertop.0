Content-Type: multipart/mixed; boundary="===============0548870132712501944=="
MIME-Version: 1.0
From: =?utf-8?q?=D0=95=D0=B2=D0=B3=D0=B5=D0=BD=D0=B8=D0=B9_=D0=A1=D1=8B=D1=80?=
 =?utf-8?q?=D0=BE=D0=BC=D1=8F=D1=82=D0=BD=D0=B8=D0=BA=D0=BE=D0=B2_=3Cevgsy?=
 =?utf-8?q?r_at_gmail=2Ecom=3E?=
Subject: Re: [Powertop] [PATCH v1 2/3] configure.ac: version strings from git
 describe
Date: Sat, 06 Aug 2016 15:14:18 +0300
Message-ID: <20160806121418.GA13520@obsidian>
In-Reply-To: 20160806015336.GA11403@noemi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0548870132712501944==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On Sat, Aug 6, 2016 at 4:53 AM, Magnus Fromreide <magfr(a)lysator.liu.se> w=
rote:
> On Fri, Aug 05, 2016 at 12:27:20PM -0700, Joe Konno wrote:
>> From: Joe Konno <joe.konno(a)intel.com>
>>
>> There are two version strings we need during runtime: a long version
>> (for reports and --version), and a short version for the ncurses UI. Use
>> a utility script to generate those strings (version-long and
>> version-short) which will be cat'ed by configure and bundled when 'make
>> dist' is run.
>>
>> Signed-off-by: Joe Konno <joe.konno(a)intel.com>
>
> What happens if I build this from a distributed package, i.e.
>
> ./configure
> make dist
> ta xzf powertop-version.tar.gz
> cd powertop-version
> ./configure
> make
>
> This would normally create a package with no git version info so the vers=
ion
> scripts couldn't work.
>
> This could obviously be regarded as an unsupported case but if so then I =
think
> it should be said so explicitly.
Version script is called from autogen, configure just uses already generate=
d files (which are in dist tarball), so there is no problem (since it is ex=
pected that autogen is called within git repo). If one wants to support cas=
e of autogen-out-of-git-repo, he should add version script to dist and modi=
fy it like this:

---8<---
#!/bin/sh

: "${LONG_VERSION_PATH=3Dversion-long}"
: "${SHORT_VERSION_PATH=3Dversion-short}"
: "${DIST_SUFFIX=3D-dist}"

LONG=3D$(cat "${LONG_VERSION_PATH}" 2>/dev/null)
SHORT=3D$(cat "${SHORT_VERSION_PATH}" 2>/dev/null)

git branch > /dev/null 2>&1
if [ "$?" =3D "0" ]; then
	LONG=3D$(git describe --abbrev=3D7 --tags --always --dirty 2> /dev/null)
	SHORT=3D\"$(git describe --tags --abbrev=3D0 2> /dev/null)\"
else
	[ -z "$LONG" -a -n "$SHORT" ] && LONG=3D"${SHORT}"
	[ -z "$SHORT" -a -n "$LONG" ] && SHORT=3D"${LONG}"

	if [ -z "$SHORT" -a -z "$LONG" ]
	then
		SHORT=3D"${SHORT_VERSION-unknown}"
		LONG=3D"${LONG_VERSION-unknown}"
	fi

	LONG=3D"${LONG%${DIST_SUFFIX}}${DIST_SUFFIX}"
	SHORT=3D"${SHORT%${DIST_SUFFIX}}${DIST_SUFFIX}"
fi

echo $LONG  > "${LONG_VERSION_PATH}"
echo $SHORT > "${SHORT_VERSION_PATH}"
--->8---

Two main points here =E2=80=94 reading cached values at the start of the sc=
ript and adding a dist prefix in order to signalize that this is out-of-rep=
o configuration.

-- =

Eugene "eSyr" Syromyatnikov
mailto:evgSyr(a)gmail.com
xmpp:eSyr(a)jabber.{ru|org}

--===============0548870132712501944==--

