Content-Type: multipart/mixed; boundary="===============8254782922525646784=="
MIME-Version: 1.0
From: Patrick McCarty <patrick.mccarty at linux.intel.com>
Subject: Re: [Powertop] [PATCH] src/cpu/cpu.cpp: Fix typo in error message:
 freque*nc*y
Date: Wed, 06 Feb 2013 11:49:14 -0800
Message-ID: <20130206194914.GB1738@linux.intel.com>
In-Reply-To: CAE4GLsukpGOJxhPtzea6TCK3fE6H59rAjPAO3FTTayeYi23f8A@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8254782922525646784==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 06, 2013 at 11:50:26AM +0100, Thomas Spura wrote:
> On Tue, Feb 5, 2013 at 5:06 PM, Paul Menzel
> <paulepanter(a)users.sourceforge.net> wrote:
> > Am Dienstag, den 05.02.2013, 10:18 +0100 schrieb Thomas Spura:
> >> By then all translations will be marked as fuzzy and won't work
> >> anymore. When also updating the typo in the translations, this won't
> >> be needed.
> >
> > The question is if Transifex is able to deal with that, that means, it
> > notices the changes of translation files in the repository. Do you know
> > if it does?
> =

> IIUC, you need to send the "what to translate" files manually to
> Transifex so it should be a manually step by the powertop translations
> manager.

At one point, we were pushing powertop.pot to Transifex manually, but
now we have the Transifex project configured to automatically pull
the raw POT file from the github repo. IIRC, it pulls the latest POT
daily.

So, as long as powertop.pot is up-to-date in the github repo, the
maintainer does not need to update it anywhere else.

Integrating the *PO* files from Transifex into PowerTOP is the manual
step, because Transifex no longer supports version-control integration,
i.e. pushing automated commits that update translations.

Regards,
Patrick

--===============8254782922525646784==--

