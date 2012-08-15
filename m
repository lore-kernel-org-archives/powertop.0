Content-Type: multipart/mixed; boundary="===============0205100694332413948=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: [Powertop] [Announcement] Release of PowerTOP v2.1
Date: Wed, 15 Aug 2012 14:26:14 -0700
Message-ID: <502C13F6.3070305@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0205100694332413948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

We are pleased to announce the release of PowerTOP v2.1 which concludes =

a minor release.

About PowerTOP:
PowerTOP is a Linux tool to diagnose issues with power consumption and =

power management. In addition to being a diagnostic tool, PowerTOP also =

has an interactive mode where you can experiment with various power =

management settings for cases where the Linux distribution has not =

enabled those settings.

PowerTOP reports which components in the system are most likely to blame =

for a higher-than-needed power consumption, ranging from software =

applications to active components in the system. Detailed screens are =

available for CPU C and P states, device activity, and software activity.

For many years, PowerTOP has been used heavily by Intel, Linux =

distributors, and various parts of the open source community. We're =

hoping that our users find the second generation even more useful for =

their needs.

Highlights:
--Added Transifex project integration
--Added localization of the UI with 9 languages in progress and active
--Support for cores without P-states
--Support for Intel GPU statistics
--PowerTOP manual page added
--Added an option to specify workload to run during measurement
--Add an option to suppress output to the terminal
--Added more ARM support assets
--Synced Traceevent library from the kernel tree for better event parsing
--Bug fixes and clean ups

Project Details:
--URL: https://01.org/powertop
--Download: https://01.org/powertop/downloads/2012/PowerTOP-v2.1

Mailing list:
Discussions about PowerTOP occur on the PowerTOP(a)lists.01.org mailing list
--Subscribe to the list at https://lists.01.org/mailman/listinfo/powertop
--Archives are found at http://lists.01.org/pipermail/powertop

The development PowerTOP git repositories are hosted at GitHub.
--URL: https://github.com/fenrus75/powertop
--HTTP: https://github.com/fenrus75/powertop.git
--GIT-readonly: git://github.com/fenrus75/powertop.git

Note: We will not use any of the integrate, merge, or tracking functions =

of GitHub, so please continue to use the provided lists.


For localization support and contributions we are using Transifex.
--Transifex URL: https://www.transifex.com/projects/p/PowerTOP/

Our Thanks:
For this release, we would like to give a special thanks to the =

following contributors, and all contributors to PowerTOP. Not in any =

particular order:

Benedikt Morbach, Colin Ian King, Dirk Brandewie, Igor Zhbanov, Ivan =

Shapovalov, Jaroslav =C5=A0karvada, Magnus Fromreide, Mike Frysinger, N=C3=
=A9meth =

M=C3=A1rton, Patrick McCarty, Rajagopal Venkat, Sergey Senozhatsky, Stefan =

Weil, Steven Rostedt, Vinicius Costa Gomes, Jason, Margie Foster

Current v2.2 goals under consideration are:
--Continued improvements to the UI, including resolution scaling
--Continued support of emerging Intel Architecture
--Continued support of emerging Kernel development


--===============0205100694332413948==--

