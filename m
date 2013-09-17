Content-Type: multipart/mixed; boundary="===============2779163281515026603=="
MIME-Version: 1.0
From: Jose Luis Rivas <ghostbar at debian.org>
Subject: Re: [Powertop] [PATCH] embed self-contained javascript
Date: Tue, 17 Sep 2013 16:44:01 -0430
Message-ID: <5238C619.6020404@debian.org>
In-Reply-To: 20130917194129.GD2289@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2779163281515026603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/17/2013 03:11 PM, Sergey Senozhatsky wrote:



BTW, trying to apply this patch I saw the src/Makefile.am makes a call
to `src/csstoh.sh` which does not exists in the codebase. So it throws
errors applying this patch to Debian.

```
make[3]: Entering directory `/tmp/buildd/powertop-2.4/src'
/bin/bash ./csstoh.sh powertop.css css.h
/bin/bash: ./csstoh.sh: No such file or directory
make[3]: *** [css.h] Error 127
make[3]: Leaving directory `/tmp/buildd/powertop-2.4/src'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/tmp/buildd/powertop-2.4'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/tmp/buildd/powertop-2.4'
dh_auto_build: make -j1 returned exit code 2
make: *** [build] Error 2
dpkg-buildpackage: error: debian/rules build gave error exit status 2
```

I guess it comes because of the change in the CSS so it needs to
update the `src/css.h`.


-- =

The Debian Project - http://debian.org/
Jose Luis Rivas - http://joseluisrivas.net/#ghostbar

--===============2779163281515026603==--

