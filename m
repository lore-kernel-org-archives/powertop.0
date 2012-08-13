Content-Type: multipart/mixed; boundary="===============4688512387048778098=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Fix screen DPMS support detection
Date: Mon, 13 Aug 2012 09:43:11 -0700
Message-ID: <50292E9F.40009@linux.intel.com>
In-Reply-To: 1344876092-13807-1-git-send-email-i.zhbanov@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4688512387048778098==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 8/13/2012 9:41 AM, Igor Zhbanov wrote:
> Consider DPMS disabled when we can't open /sys/class/drm/card0 directory.

if you don't have a graphics card with proper driver...
there's nothing we can do and pretending that DPMS is disabled sounds like =
a mostly bad idea
on first sight

what is behind the idea of assuming it disabled ???



--===============4688512387048778098==--

