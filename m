Content-Type: multipart/mixed; boundary="===============2249525248691294003=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Assign line level based on linux name
Date: Mon, 21 Sep 2015 12:49:26 -0700
Message-ID: <56005F46.5050703@linux.intel.com>
In-Reply-To: 1442860459-10138-1-git-send-email-radhakrishna.sripada@intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2249525248691294003==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/21/2015 11:34 AM, Radhakrishna Sripada wrote:
> C-states having the same number in their human names have the same line
> levels. Switching to linux names assigns seperate levels to each C-state.
>
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada(a)intel.com>

hmm do you have a before/after kind of thing?
(your description is a bit cryptic in that sense)

also of course this code isn't used for Intel cpus normally...



--===============2249525248691294003==--

