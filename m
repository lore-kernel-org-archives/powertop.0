Content-Type: multipart/mixed; boundary="===============3644007574912888130=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] Wishlist: print the commands executed by 'toggle
 tunables'
Date: Tue, 17 Jul 2012 12:44:30 -0700
Message-ID: <5005C09E.7030309@linux.intel.com>
In-Reply-To: 5005B95D.90007@richardneill.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3644007574912888130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7/17/2012 12:13 PM, Richard Neill wrote:
> Dear All,
> =

> I wonder if I might make a request for a new feature for powertop.
> =

> When I run it, I can toggle various tunable options from within the
> Powertop interface. As I understand it, the effect of these to invoke an
> underlying system command such as:
>   echo value > /sys/device/power/something
> =

> But powertop never actually tells me what these commands are. This means
> I can't easily append them to my own startup scripts, or make them
> persistent across reboots.
> =

> So my wish is as follows:
> =

> When powertop actually modifies the system, it should print the
> commands, to stderr, when it exits.
> =

> Thanks very much,
> =

Hi,

on the normal screen, there is not really enough real estate to put the
full command there.
however, if you run the --html report, it will give you these commands!

(the html page has a lot more space to put stuff)


--===============3644007574912888130==--

