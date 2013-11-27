Content-Type: multipart/mixed; boundary="===============8893994536296477296=="
MIME-Version: 1.0
From: =?utf-8?q?Ot=C3=A1vio_Cipriani_=3Cotavio=2En=2Ecipriani_at_gmail=2Ecom=3E?=
Subject: [Powertop] Fwd: [BUG] powertop does not correctly checks for audio
 codec power management
Date: Wed, 27 Nov 2013 11:41:23 -0200
Message-ID: <CAFJOydwZoTv_DcD5z7BzroAP5EY9+bA8TpVH9dxpepL4ZZv4Ew@mail.gmail.com>
In-Reply-To: CAFJOydwX2z_Ubamj5F9+pY06KWHh9opPsWJ325ndZVng904-cg@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8893994536296477296==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi.

I noticed that powertop 2.4 does not correctly checks if the audio
codec power management is already enabled.

The module responsible for audio in my sistem is "snd_hda_intel", and
powertop requires that
"/sys/module/snd_hda_intel/parameters/power_save" is set to 1 to
consider that power save is enabled.

Since that parameter is the power save timeout in seconds (0 disables
power save), it should check if it is greater than 0.

In my setup, "power_save" is set to 10 seconds and
"power_save_controller" is set to "Y", but powertop still thinks that
power save is not enabled for my audio codec.

Thank you.

--===============8893994536296477296==--

