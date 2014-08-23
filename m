Content-Type: multipart/mixed; boundary="===============0378061613130234979=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH 14/14] add --auto-tune and --workload to manual
 page
Date: Sat, 23 Aug 2014 20:55:03 +0900
Message-ID: <20140823115503.GA1018@swordfish>
In-Reply-To: 63896.10.7.198.163.1408765006.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0378061613130234979==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On (08/22/14 20:36), Alexandra Yates wrote:
> Thank you for your contributions, they nicely clean up PowerTOP.  I agree
> with you,  I want to get you patches to our mainline tree as soon as
> possible.
> =

> For the next submission I need your help with:
> =

> 0- When creating your patches modify the patch set subject using:
>    git format-patch --cover-letter --subject-prefix=3D"PATCH Vx"...  Wher=
e x
> is the next version for your patches. For your next version use v3.
> This very useful for sorting purposes on my inbox.
> =

> 1- Every time you make changes to your patches you would need to send the
> entire set of patches with an updated version.  This link explains patch
> best practices that we follow on PowerTOP and across the Linux kernel
> community:
> http://kernelnewbies.org/OPWfirstpatch#head-067c0e555973ae364180b2e3fbe90=
544e6aa378e
> =

> 3- It is a good practice to add the names of the people who reviewed your
> patches, at the commit paragraph Reviewed_by:[the name of the person].
> =

> =

> Here is my review to the 14 patches you sent on v2 of your code:
> =

> P1, P2, P4, P5, P6, P10, P11, P12, P13, and P14:
> -Look good.
> =

> P3:
> - Change the subject line to something more descriptive.  Add a
> description of why are you making this change, and how it benefits
> PowerTOP.  The subject lines and descriptions are very useful when
> bisecting the tree for debugging purposes.
> =

> P7:
> - Please add a description to this patch. (Same reasoning as on P3)
> =

> P8:
> - I have a problem naming -h --html and -u --help.  Please change -h to
> --help, and use another letter for --html for instance: r as of report
> would be more fitting.  New users will want to do powertop -h and see the
> help not the html report and get totally lost. It is just matter of
> reusing the already established usability metaphors.
> =

> P9:
> - Please abbreviate the subject and add a description to this patch.
> - To make this a feature-complete Sergey's feedback should be implemented:
>  "...to extend ui_notify_user() so it can cover both cases: initialised
> ncurses -- calling mvprintw(), and uninitialised ncurses -- printf (to
> stdout).  this will change a bit 'powertop --auto-tune' behaviour, since
> by default user will now see a 'list' of commands executed by powertop,
> but it's really easy to silent powertop via stdout redirection".

well, ui_notify_user() can wait. I didn't recall correctly and thought
that ui_notify_user() is getting called from --auto-tune mode, which is
not true. sorry for confusion.

we can have that unified ui_notify_user(), in general, and start using it
for error/info reporting/notification, though. sometime in the future.

	-ss

> However, since this patch set is already long and this is the third spin
> on the list,  I prefer you subtract P9 from this set of patches, make your
> work, and then send that as a separate set.
> =

> P9 is a very important patch because saves lots of run-time, hence power
> to the user.
> =

> Thank you,
> Alexandra.
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============0378061613130234979==--

