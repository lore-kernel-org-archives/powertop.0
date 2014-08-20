Content-Type: multipart/mixed; boundary="===============0736860800396422405=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: Re: [Powertop] [PATCH 09/14] do not use ncurses when --auto-tune is
 specified
Date: Wed, 20 Aug 2014 23:56:33 +0300
Message-ID: <1408568193-31880-1-git-send-email-kerolasa@iki.fi>
In-Reply-To: CAG27Bk3rJCRgpoJu8SYgzrsCWhvvs354mbYHMyVY4q2kd8krow@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0736860800396422405==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 20 August 2014 15:57, Sami Kerola <kerolasa(a)iki.fi> wrote:
> On 20 August 2014 15:28, Sergey Senozhatsky <sergey.senozhatsky(a)gmail.c=
om> wrote:
>> On (08/05/14 22:31), Sami Kerola wrote:
>>> Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
>>> ---
>>>  src/main.cpp | 9 ++++++---
>>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>
>> I think it makes sense to extend ui_notify_user() so it can cover
>> both cases: initialised ncurses -- calling mvprintw(), and
>> uninitialised ncurses -- printf (to stdout).
>>
>> this will change a bit 'powertop --auto-tune' behaviour, since by
>> default user will now see a 'list' of commands executed by powertop,
>> but it's really easy to silent powertop via stdout redirection.
>>
>>
>> what do you think?
>
> I think this patch set will need to get ready eventually.  Would it be
> possible that the upstream maintainer will drop the patch 0007 aka 'do
> not use ncurses' and merge the rest (assuming they are not unmentioned
> way borken).

Hello Sergey and others,

I had a bit of spare time so I started to look what exactly is calling
mvprintw() via ui_notify_user().  My initial reaction was that I must
have made some error in search, because I could not find such call.  So I
added abort() to the code...

index b482296..55c9603 100644
--- a/src/lib.cpp
+++ b/src/lib.cpp
@@ -546,5 +546,6 @@ void ui_notify_user(const char *frmt, ...)
        vsnprintf(notify, UI_NOTIFY_BUFF_SZ - 1, frmt, list);
        va_end(list);
        mvprintw(1, 0, notify);
+       abort();
        attroff(COLOR_PAIR(1));
 }

...and found the --auto-tune does not entering to that function.  When
running in normal mode the call path is from main() -> one_measurement()
-> do_sleep() -> cursor_enter() -> tuning_window::cursor_enter ->
ui_notify_user() -> mvprintw().

I also realized the --auto-tune is setting leave_powertop =3D 1, which
means the patch 0009 can be simplified.  Here is better version of the
change that avoids running unnecessary if().

--->8----
From: Sami Kerola <kerolasa(a)iki.fi>
Date: Wed, 20 Aug 2014 23:31:52 +0300
Subject: [PATCH 09/14] do not use ncurses when --auto-tune is specified

Reviewed-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 src/main.cpp | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/src/main.cpp b/src/main.cpp
index 3b67ef0..bd0fc88 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -460,7 +460,8 @@ int main(int argc, char **argv)
 		end_pci_access();
 		exit(0);
 	}
-	init_display();
+	if (!auto_tune)
+		init_display();
 	initialize_tuning();
 	/* first one is short to not let the user wait too long */
 	one_measurement(1, NULL);
@@ -477,7 +478,8 @@ int main(int argc, char **argv)
 		one_measurement(time_out, NULL);
 		learn_parameters(15, 0);
 	}
-	endwin();
+	if (!auto_tune)
+		endwin();
 	printf("%s\n", _("Leaving PowerTOP"));
 =

 	end_process_data();
-- =

2.1.0


--===============0736860800396422405==--

