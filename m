Content-Type: multipart/mixed; boundary="===============2631868563144448247=="
MIME-Version: 1.0
From: Kristen Carlson Accardi <kristen at linux.intel.com>
Subject: Re: [Powertop] [PATCH 0/8] Power Top RAPL interface v04
Date: Fri, 19 Apr 2013 13:11:47 -0700
Message-ID: <20130419131147.6f8e7aba@bluebird.jf.intel.com>
In-Reply-To: 20130415203543.GE2301@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2631868563144448247==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Apr 2013 23:35:43 +0300
Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com> wrote:

> On (04/15/13 09:09), Srinivas Pandruvada wrote:
> > This patch adds RAPL interface to powertop. RAPL can give energy consum=
ed for a domain. For
> > client platform, domain are "PKG", "PP0" and "PP1". For servers "PKG", =
"DRAM" and "PP0".
> > PP0 refers to CPU energy comsumtion and PP1 refers to GPUs. DRAM is for=
 DRAM in servers only.
> > =

> > Powertop estimates how much power CPU and GPU is consuming based on the=
 measured power and
> > load. This patch splits this into the following:
> > - Actual CPU/GPU power reported by RAPL
> > - DRAM power for servers
> > - Remaining as "misc" usage for CPU/GPU
> > =

> > As more domain are getting added, this patch creates a parent/child rel=
ationship for CPU/GPU.
> > This way when new domains are added these files don't need change. Only=
 inherit CPU/GPU class,
> > and implement virtual method for consumed power.
> >
> =

> Hello,
> looks good to me. thanks.
> =

> =

> any objections/inputs/etc. from list members are welcomed.
> =

> 	-ss
> =


Applied.

Thanks!

--===============2631868563144448247==--

