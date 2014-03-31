Content-Type: multipart/mixed; boundary="===============3822086222573025175=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] Why C++ is the language of implementation?
Date: Mon, 31 Mar 2014 08:55:45 -0700
Message-ID: <53399001.1020307@linux.intel.com>
In-Reply-To: CADy9ZNCDwf9+uNnqKVE1rjEdzJKgTw=VrTPGERggv6rxCfZ7og@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3822086222573025175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 3/31/2014 8:54 AM, Bill Vyzas wrote:
> What the physical things will be in the case of powertop? Are we talking =
about device drivers and cpu measurements?

powertop builds a power model of the devices in your computer, from fans to=
 USB devices to CPU to ...
you name it.
to model those, it uses C++ style objects in a class hierarchy


--===============3822086222573025175==--

