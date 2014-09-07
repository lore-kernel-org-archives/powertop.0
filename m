Content-Type: multipart/mixed; boundary="===============4360095414782660627=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH v3 00/15] pull: third time lucky
Date: Sun, 07 Sep 2014 22:27:03 +0100
Message-ID: <1410125238-29600-1-git-send-email-kerolasa@iki.fi>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4360095414782660627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

The following 15 patches are re-submission.  Reply indicators are related
to feedback from:

https://lists.01.org/pipermail/powertop/2014-August/001495.html

> 0- When creating your patches modify the patch set subject using: git
>    format-patch --cover-letter --subject-prefix=3D"PATCH Vx"...  Where x =
is
>    the next version for your patches.  For your next version use v3. =

>    This very useful for sorting purposes on my inbox.

That makes sense.  Done.

> 1- Every time you make changes to your patches you would need to send
>    the entire set of patches with an updated version.  This link
>    explains patch best practices that we follow on PowerTOP and across
>    the Linux kernel community:
> http://kernelnewbies.org/OPWfirstpatch#head-067c0e555973ae364180b2e3fbe90=
544e6aa378e

Are you sure kernel newbies page is telling to resubmit long patch sets
when there is only modest change is some in middle?  IMHO resubmitting
individual patches that has changed when combined with a git remote
repository containing the full patch set is good way to do keep noise
level low.

But then again all projects has some habits that I don't understand/agree
with which shouldn't really be a problem.  I will keep on resubmitting
patch sets when requested to do so (and protest a bit by having the git
remote available ;-)

> 3- It is a good practice to add the names of the people who reviewed
>    your patches, at the commit paragraph Reviewed_by:[the name of the
>    person].

Done.

> Here is my review to the 14 patches you sent on v2 of your code:
>
> P1, P2, P4, P5, P6, P10, P11, P12, P13, and P14:
> -Look good.

Great.

> P3:
> - Change the subject line to something more descriptive.  Add a
>   description of why are you making this change, and how it benefits
>   PowerTOP.  The subject lines and descriptions are very useful when
>   bisecting the tree for debugging purposes.

Done: add src/cpu/rapl/.deps to .gitignore

> P7:
> - Please add a description to this patch. (Same reasoning as on P3)

See the patch 0007.

> P8:

> - I have a problem naming -h --html and -u --help.  Please change -h to
>   --help, and use another letter for --html for instance: r as of
>   report would be more fitting.  New users will want to do powertop -h
>   and see the help not the html report and get totally lost.  It is
>   just matter of reusing the already established usability metaphors.

I did change -h to --help, which is ABI change to undocumented interface,
which may or may not better than having unconventional short option
assignment.  BTW I think it would be good to add this change to release
notes, just that no-one can later tell breaking changes happen without
noise.

> P9:
> - Please abbreviate the subject and add a description to this patch.

Done.

> - To make this a feature-complete Sergey's feedback should be
>   implemented: "...to extend ui_notify_user() so it can cover both
>   cases: initialised ncurses -- calling mvprintw(), and uninitialised
>   ncurses -- printf (to stdout).  this will change a bit 'powertop
>   --auto-tune' behaviour, since by default user will now see a 'list'
>   of commands executed by powertop, but it's really easy to silent
>   powertop via stdout redirection".

As Sergey mentioned the mvprintw() avoidance is not needed.  But since I
figured out how to make both cases, ncurses and console, work without
pain a patch 0014 was added to the change set.  At the moment one can say
usefulness of the change is close to zero, as the ui_notify_user() is not
reached in case of --auto-tune, but perhaps that changes in future.  And
then it's nice to have a facility in place that just works.


The following changes since commit cdff23d6e40e31a68286a51e3c94c8a901a74091:

  powertop: remove temporary file (2014-08-22 09:18:34 -0700)

are available in the git repository at:

  git://github.com/kerolasa/powertop.git sami

for you to fetch changes up to 295c86c4f5fa22024792e8e850f303eec7f4b6a3:

  allow none-ncurses messaging with ui_notify_user() (2014-09-07 21:52:48 +=
0100)

----------------------------------------------------------------
Sami Kerola (15):
      configure: use vertical lists
      configure: prefer AS_IF macro rather than shell if statement
      add src/cpu/rapl/.deps to .gitignore
      clean up Makefile.am files
      fix clang++ compilation errors
      remove unnecessary assignments
      remove unnecessary code reported by cppcheck
      add short options to usage, and reorder options in code
      do not use ncurses with --auto-tune
      improve manual groff syntax
      fix couple typos
      wrap lines in README.traceevent
      clean up .gitignore file
      add --auto-tune and --workload to manual page
      allow none-ncurses messaging with ui_notify_user()

 .gitignore                      | 110 ++++++++++-------------
 Makefile.am                     |  14 ++-
 README.traceevent               |  21 +++--
 configure.ac                    | 102 ++++++++++++++++-----
 doc/powertop.8                  | 149 ++++++++++++++++---------------
 src/Makefile.am                 | 193 +++++++++++++++++++++++++++++++-----=
----
 src/cpu/cpu.cpp                 |  18 ++--
 src/cpu/rapl/rapl_interface.cpp |   4 +-
 src/devices/ahci.cpp            |   3 +-
 src/devices/alsa.cpp            |   1 -
 src/devices/device.cpp          |   6 +-
 src/devlist.cpp                 |   3 +-
 src/display.cpp                 |   9 +-
 src/lib.cpp                     |  19 ++--
 src/lib.h                       |   4 +-
 src/main.cpp                    | 181 +++++++++++++++++++------------------
 src/process/do_process.cpp      |  11 ++-
 src/report/report.cpp           |   3 +-
 src/tuning/nl80211.h            |   4 +-
 src/tuning/runtime.cpp          |   4 -
 src/tuning/tuning.cpp           |  11 +--
 21 files changed, 533 insertions(+), 337 deletions(-)

-- =

2.1.0


--===============4360095414782660627==--

