Content-Type: multipart/mixed; boundary="===============8615727072809756356=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: Re: [Powertop] [PATCH v2 00/14] pull: various changes,
 mostly build system related
Date: Mon, 17 Nov 2014 20:24:08 +0000
Message-ID: <CAG27Bk06CL1bLu+gze-t96xRTq3ZE+Hdguc7i3ZO3PeDZfc8mQ@mail.gmail.com>
In-Reply-To: 56432.10.252.139.164.1416199502.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8615727072809756356==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 17 November 2014 04:45, Alexandra Yates
<alexandra.yates(a)linux.intel.com> wrote:
> When I run checkpatch.pl I get white spaces and over 80 char line errors
> on your patches.

Hi Alexandra,

You are right, I missed in the change 0004 'csstoh.sh: check every
single return value' a white space error. That is now fixed in:

https://github.com/kerolasa/powertop/commit/6d7e331488db1e1428925579431242b=
8fb1c6007

80 char line errors are strange. I do not see them. Are we using the
same version of the checkpatch.pl?

$ git describe
v3.18-rc5
$ shasum scripts/checkpatch.pl
a13cad76323e71c97ba279838feef9730509fc59  scripts/checkpatch.pl

-- =

Sami Kerola
http://www.iki.fi/kerolasa/

--===============8615727072809756356==--

