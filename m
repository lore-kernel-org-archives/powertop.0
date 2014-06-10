Content-Type: multipart/mixed; boundary="===============4853354017576961117=="
MIME-Version: 1.0
From: Ivan Shapovalov <intelfx100 at gmail.com>
Subject: Re: [Powertop] [systemd-devel] How to quiet cron sessions logging
 with systemd-212?
Date: Tue, 10 Jun 2014 14:31:20 +0400
Message-ID: <4143356.pkhKZQknPb@intelfx-laptop>
In-Reply-To: CAJ0EP42QVK-MpZdhWUL+cbq5j+NUKYJTAGR5d=nQ9OP9P6T00A@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4853354017576961117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Monday 09 June 2014 at 23:32:28, Mike Gilbert wrote:	=

> On Mon, Jun 9, 2014 at 4:42 PM, Reindl Harald <h.reindl(a)thelounge.net> =
wrote:
> >
> > Am 09.06.2014 22:32, schrieb Leonid Isaev:
> >> On Mon, Jun 09, 2014 at 09:19:20PM +0200, Reindl Harald wrote:
> >>> [...]
> >>>
> >>> on our production infrastrcuture these messages would be
> >>> *a lot* more than all other logs summarized
> >>>
> >>> *and* they are spitted to /var/log/messages to make things worst
> >>>
> >>>> But why can't you write a syslog filter which uses facility as well =
as program
> >>>> name? So if you believe that systemd-generated messages are useless,=
 drop them
> >>>
> >>> because you *can not* distinguish between *that* user messages
> >>> and system message sbecause they have systemd as program name
> >>> common, the PID changes and you don't want to drop *system
> >>> messages* from systemd
> >>
> >> So, systemd starts certain things on _any_ user "login": be it a real =
user, or
> >> a daemon. However
> >
> > * why do it need to do that much stuff
> > * why can't it keep that stuff long-running
> >
> > you have already "/usr/lib/systemd/systemd --user" and "(sd-pam)"
> > processes for every userid ever started a cronjob running all
> > the time - so why flood the logs every minute again?
> >
> =

> Now that you mention it, you can cut down on a lot of the log spam by
> enabling "linger" for root and other users which run cron jobs.
> =

> loginctl enable-linger <user>
> =

> This will keep a systemd user instance running so that a new one is
> not spawned every time cron wakes up.

It's more interesting, why a logind session is ever being created for the c=
ron job...
It shouldn't be that way, or do I misunderstand something?

-- =

Ivan Shapovalov / intelfx /

--===============4853354017576961117==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIKCmlGNEVBQkVJ
QUFZRkFsT1czbndBQ2drUXhVS2xqU0lNQW5EZllRRC9kUmdHd1NIWFNiZGduWWF1RmlTbXNrV2wK
bGVEcmptRGNRN0FEWnYvVEhJSUJBSWI2OTJhNnV1STdHZWVhMXBOTmg1dFNMQWZBaEhCYXl6L3hn
Q3JoYWw0Rwo9cU5JcwotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============4853354017576961117==--

