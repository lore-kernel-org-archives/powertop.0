Content-Type: multipart/mixed; boundary="===============0354131085050810566=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] 'PowerTOP --calibrate' output
Date: Sun, 21 May 2017 14:02:43 -0700
Message-ID: <2a2afafd-650e-f011-0fc8-ee35454afe0a@linux.intel.com>
In-Reply-To: CAOZcyfbJ3R+qP+0DgVjrT8f8+p+_nYssky_EkmfwjnXP9_Jp9A@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0354131085050810566==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/21/2017 11:36 AM, Amit Singh wrote:
> Hi.
> After exiting 'sudo powertop --calibrate', there are some statistics prin=
ted like "Score =3D 1.7 (18069.1) Guess =3D 12.1 Actual =3D 12.3" (These nu=
mbers are made up, I do not
> remember the actual values I got). I tried looking up what these values m=
ean but could not find it mentioned anywhere in the User's guide. Can someo=
ne point me to a
> resource that has this information? Or if you know what these mean then k=
indly explain it to me as well.
> Thanks!

so powertop tries to do a least squares fit of the calibration measurements=
 to a model it builds of your PC,
and this is basically diagnotics output that tries to print how well the le=
ast squares worked



--===============0354131085050810566==--

