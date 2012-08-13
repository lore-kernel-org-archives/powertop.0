Content-Type: multipart/mixed; boundary="===============4628530338699206718=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Fix screen DPMS support detection
Date: Mon, 13 Aug 2012 10:35:15 -0700
Message-ID: <50293AD3.6020900@linux.intel.com>
In-Reply-To: 502930CC.5070204@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4628530338699206718==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 8/13/2012 9:52 AM, Igor Zhbanov wr
> The problem is that on some architectures max_brightness is 0. =



oooof that's bad
yes we shouldn't do divide by zero

but what kind of platform has a max brightness of 0 ?????


--===============4628530338699206718==--

