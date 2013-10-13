Content-Type: multipart/mixed; boundary="===============5888397763421893981=="
MIME-Version: 1.0
From: Maksim Melnikau <maxposedon at gmail.com>
Subject: Re: [Powertop] [BUG] powertop shows estimates only for 1st battery
 from 2
Date: Sun, 13 Oct 2013 11:10:19 +0300
Message-ID: <CAGbmdnXRo_wG1myJC27DJDPD4000SSAtfoewu2vQY+s0YMjzsQ@mail.gmail.com>
In-Reply-To: 20131012175312.GC2248@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5888397763421893981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 12, 2013 at 8:53 PM, Sergey Senozhatsky
<sergey.senozhatsky(a)gmail.com> wrote:
> could you please post:
# ls /sys/class/backlight
acpi_video0  intel_backlight
# cat /sys/class/backlight/acpi_video0/device/enable
1
# cat /sys/class/backlight/acpi_video0/type
firmware
# cat /sys/class/backlight/intel_backlight/device/enabled
enabled
# cat /sys/class/backlight/intel_backlight/type
raw

--===============5888397763421893981==--

