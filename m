Content-Type: multipart/mixed; boundary="===============0344251048877256245=="
MIME-Version: 1.0
From: Kristen Carlson Accardi <kristen at linux.intel.com>
Subject: Re: [Powertop] [PATCH -next] intel cpus: add proper C-states init
Date: Fri, 18 Oct 2013 11:07:25 -0700
Message-ID: <20131018110725.7a2b1459@bluebird.jf.intel.com>
In-Reply-To: 20131017203751.GA2280@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0344251048877256245==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Oct 2013 23:37:51 +0300
Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com> wrote:

> add missing has_c2c7_res init to nhm_core() .ctor and
> has_c8c9c10_res/has_c2c7_res init to nhm_package() .ctor.
> =

> uninitialised has_c2c7_res/has_c8c9c10_res/has_c2c7_res
> may be used in core/package measurement_start()/measurement_end().
> =

> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

Applied, thanks.

--===============0344251048877256245==--

