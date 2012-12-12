Content-Type: multipart/mixed; boundary="===============7987650662766528475=="
MIME-Version: 1.0
From: Jaroslav Skarvada <jskarvad at redhat.com>
Subject: Re: [Powertop] [PATCH] cpufreq: only try to open files under cpuX
Date: Wed, 12 Dec 2012 13:05:23 -0500
Message-ID: <1308422363.328395.1355335523877.JavaMail.root@redhat.com>
In-Reply-To: 20121212175657.GA5332@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7987650662766528475==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

-
> Hello,
> thanks for your patch. however, I'm afraid it does not fix all the
> cases. looking at src/tuning/cpufreq.cpp we
> have several more places with exactly the same cpuX detection --
> ::toggle*().
> =

NP, I will try to fix them all, I will post new version of the patch soon.

> could you also please remove 'strlen(dirent->d_name) < 4', looks loke
> a small overhead there.
> =

Right :)

Jaroslav

--===============7987650662766528475==--

