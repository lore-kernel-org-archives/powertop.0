Content-Type: multipart/mixed; boundary="===============1505913434414870504=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] [PATCH 14/14] add --auto-tune and --workload to manual
 page
Date: Fri, 22 Aug 2014 20:36:46 -0700
Message-ID: <63896.10.7.198.163.1408765006.squirrel@linux.intel.com>
In-Reply-To: 1407274298-16404-14-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1505913434414870504==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Sami,

> Options in manual page are now in same order as in usage output, and they
> include short options when aplicable.
>
> Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
> ---
>  doc/powertop.8 | 30 +++++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 11 deletions(-)
>
> diff --git a/doc/powertop.8 b/doc/powertop.8
> index 31e7e6d..8f93c43 100644
> --- a/doc/powertop.8
> +++ b/doc/powertop.8
> @@ -12,7 +12,10 @@ experiment with various power management settings.
> When invoking
>  powertop without arguments powertop starts in interactive mode.
>  .SH OPTIONS
>  .TP
> -.B \-\-calibrate
> +.B \-\-auto\-tune
> +Set all tunable options to their good setting without interaction.
> +.TP
> +.BR \-c ", " \-\-calibrate
>  Runs powertop in calibration mode.  When running on battery, powertop can
>  track power consumption as well as system activity.  When there are
>  enough measurements, powertop can start to report power estimates.  One
> @@ -20,7 +23,7 @@ can get more accurate estimates by using this option to
> enable a
>  calibration cycle.  This will cycle through various display levels and
>  USB device activities and workloads.
>  .TP
> -\fB\-\-csv\fR[=3D\fIfilename\fR]
> +\fB\-C\fR, \fB\-\-csv\fR[=3D\fIfilename\fR]
>  Generate a CSV report.  If a
>  .I filename
>  is not specified then the default name
> @@ -28,7 +31,7 @@ is not specified then the default name
>  is used.  The CSV report can be used for reporting and data analysis.
>  .TP
>  .B \-\-debug
> -Run in "debug" mode.
> +Run in debug mode.
>  .TP
>  \fB\-\-extech\fR=3D\fIdevnode\fR
>  Use the Extech Power Analyzer for measurements.  This allows one to
> @@ -36,10 +39,7 @@ specify the serial device node of the serial to USB
> adaptor connecting to
>  the Extech Power Analyzer, for example
>  .IR /dev/ttyUSB0 .
>  .TP
> -.B \-\-help
> -Show the help message.
> -.TP
> -\fB\-\-html\fR[=3D\fIfilename\fR]
> +\fB\-h\fR, \fB\-\-html\fR[=3D\fIfilename\fR]
>  Generate an HTML report.  If a
>  .I filename
>  is not specified then the default name
> @@ -47,18 +47,26 @@ is not specified then the default name
>  is used.  The HTML report can be sent to others to help diagnose power
>  issues.
>  .TP
> -\fB\-\-iteration\fR[=3D\fIiterations\fR]
> +\fB\-i\fR, \fB\-\-iteration\fR[=3D\fIiterations\fR]
>  Number of times to run each test.
>  .TP
> -.B \-\-quiet
> +.BR \-q ", " \-\-quiet
>  Suppress stderr output.
>  .TP
> -\fB\-\-time\fR[=3D\fIseconds\fR]
> +\fB\-t\fR, \fB\-\-time\fR[=3D\fIseconds\fR]
>  Generate a report for a specified number of
>  .IR seconds .
>  .TP
> -.B \-\-version
> +\fB\-w\fR, \fB\-\-workload\fR[=3D\fIworkload\fR]
> +Execute
> +.I workload
> +file as a part of calibration before making a report.
> +.TP
> +.BR \-V ", " \-\-version
>  Print version information and exit.
> +.TP
> +.BR \-u ", " \-\-help
> +Show the help message and exit.
>  .SH COMMANDS
>  In interactive mode, the following key bindings are available:
>  .IP
> --
> 2.0.4
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>

Thank you for your contributions, they nicely clean up PowerTOP.  I agree
with you,  I want to get you patches to our mainline tree as soon as
possible.

For the next submission I need your help with:

0- When creating your patches modify the patch set subject using:
   git format-patch --cover-letter --subject-prefix=3D"PATCH Vx"...  Where x
is the next version for your patches. For your next version use v3.
This very useful for sorting purposes on my inbox.

1- Every time you make changes to your patches you would need to send the
entire set of patches with an updated version.  This link explains patch
best practices that we follow on PowerTOP and across the Linux kernel
community:
http://kernelnewbies.org/OPWfirstpatch#head-067c0e555973ae364180b2e3fbe9054=
4e6aa378e

3- It is a good practice to add the names of the people who reviewed your
patches, at the commit paragraph Reviewed_by:[the name of the person].


Here is my review to the 14 patches you sent on v2 of your code:

P1, P2, P4, P5, P6, P10, P11, P12, P13, and P14:
-Look good.

P3:
- Change the subject line to something more descriptive.  Add a
description of why are you making this change, and how it benefits
PowerTOP.  The subject lines and descriptions are very useful when
bisecting the tree for debugging purposes.

P7:
- Please add a description to this patch. (Same reasoning as on P3)

P8:
- I have a problem naming -h --html and -u --help.  Please change -h to
--help, and use another letter for --html for instance: r as of report
would be more fitting.  New users will want to do powertop -h and see the
help not the html report and get totally lost. It is just matter of
reusing the already established usability metaphors.

P9:
- Please abbreviate the subject and add a description to this patch.
- To make this a feature-complete Sergey's feedback should be implemented:
 "...to extend ui_notify_user() so it can cover both cases: initialised
ncurses -- calling mvprintw(), and uninitialised ncurses -- printf (to
stdout).  this will change a bit 'powertop --auto-tune' behaviour, since
by default user will now see a 'list' of commands executed by powertop,
but it's really easy to silent powertop via stdout redirection".

However, since this patch set is already long and this is the third spin
on the list,  I prefer you subtract P9 from this set of patches, make your
work, and then send that as a separate set.

P9 is a very important patch because saves lots of run-time, hence power
to the user.

Thank you,
Alexandra.

--===============1505913434414870504==--

