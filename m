Content-Type: multipart/mixed; boundary="===============3162214895053658161=="
MIME-Version: 1.0
From: Dirk Brandewie <dirk.brandewie at gmail.com>
Subject: Re: [Powertop] Please revert the workload patch
Date: Mon, 18 Jun 2012 08:19:51 -0700
Message-ID: <4FDF4717.8040707@gmail.com>
In-Reply-To: 1339845413.2673.1.camel@sara
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3162214895053658161==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Magnus,

This patch should fix your problem.  I will work with Chris to get it
pushed out.

BTW could not find the commit you quoted

--Dirk

diff --git a/src/main.cpp b/src/main.cpp
index 880d745..c57c984 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -452,7 +452,7 @@ int main(int argc, char **argv)

  	while (!leave_powertop) {
  		show_cur_tab();
-		one_measurement(time_out, workload);
+		one_measurement(time_out, NULL);
  		learn_parameters(15, 0);
  	}
  #ifndef DISABLE_NCURSES
-- =

1.7.7.6


On 06/16/2012 04:16 AM, Magnus Fromreide wrote:
> Hello.
>
> Could you please revert the workload patch
> (b45a38317777678b94cdf4cc81896e3a66db68bd) as it seems to try to
> execute some random memory. When powertop is started as
>
> ./powertop
>
> I see the following stack trace:
>
> Breakpoint 1, system (line=3D0x7fffffffd440 "\020\020i") at pt-system.c:29
> 29      pt-system.c: No such file or directory.
> (gdb) where
> #0  system (line=3D0x7fffffffd440 "\020\020i") at pt-system.c:29
> #1  0x0000000000456933 in one_measurement (seconds=3D20, workload=3D0x7ff=
fffffd440 "\020\020i") at main.cpp:190
> #2  0x00000000004572c2 in main (argc=3D1, argv=3D0x7fffffffe538) at main.=
cpp:455
> (gdb)
>
> This shows up as a powertop beeing nonresponsive, flashing the
> display excessively and warning about not managing to run the program.
>
> /MF
>
>


--===============3162214895053658161==--

