Content-Type: multipart/mixed; boundary="===============6540476196653081028=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH] tuninig: resize scaling support (v1)
Date: Thu, 23 Aug 2012 09:57:43 -0700
Message-ID: <50366107.5080509@linux.intel.com>
In-Reply-To: 20120823091245.GA3065@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6540476196653081028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/23/2012 02:12 AM, Sergey Senozhatsky wrote:
> On (08/23/12 01:47), Sergey Senozhatsky wrote:
>> tuninig: resize scaling support v1
>>
>> Initial version of terminal window resize support for tuning tab.
>> Supports both X and Y scalings:
>> -- X scaling: truncation (*)
>> * tunable result and description strings are now stored in dynamic
>> array, limited in size to current window X (mod MAX_LEN).
>>
>> -- Y scaling: paging and scrolling
>>
>>
>> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
>>
>> ---
>>
>>   src/tuning/tuning.cpp | 87 +++++++++++++++++++++++++++++++++++--------=
--------
>>   1 file changed, 60 insertions(+), 27 deletions(-)
>>
>> diff --git a/src/tuning/tuning.cpp b/src/tuning/tuning.cpp
>> index 4893597..541e9e0 100644
>> --- a/src/tuning/tuning.cpp
>> +++ b/src/tuning/tuning.cpp
>> @@ -28,7 +28,7 @@
>>   #include <stdio.h>
>>   #include <string.h>
>>   #include <ncurses.h>
>> -
>> +#include <math.h>
>>   =

>>   #include "tuning.h"
>>   #include "tuningsysfs.h"
>> @@ -79,48 +79,81 @@ void initialize_tuning(void)
>>   	create_tab("Tunables", _("Tunables"), w, _(" <ESC> Exit | <Enter> Tog=
gle tunable | <r> Window refresh"));
>>   =

>>   	init_tuning();
>> -
>>   	w->cursor_max =3D all_tunables.size() - 1;
>>   }
>>   =

>> +#define XINDENT	3
>> +#define YINDENT	4
>> +#define MAX_LEN	4096
>>   =

>> +static void redraw_window(WINDOW *win, int begin, int end, int cursor_p=
os)
>> +{
>> +	int x, y, i;
>> +	getmaxyx(stdscr, y, x);
>> +	=

>> +	wclrtoeol(win);
>> +	wmove(win, 1, 0);
>> +	x %=3D MAX_LEN;
>> +
>> +	for (y =3D 0, i =3D begin; i < end; i++, y++) {
>> +		char truncate =3D 0;
>> +		size_t sz =3D 0;
>> +		char line[x + 1];
>> +		if ((int)(y) !=3D cursor_pos) {
>> +			wattrset(win, A_NORMAL);
>> +			sz =3D snprintf(line, x, "   ");
>> +		} else {
>> +			wattrset(win, A_REVERSE);
>> +			sz =3D snprintf(line, x, ">> ");
>> +		}
>> +		sz +=3D snprintf(line + sz, x, "%s", all_tunables[i]->result_string()=
);
>
> Hm, I guess the correct way is
>
> 	_(all_tunables[i]->result_string())
>
>> +		while (sz < 12)
>> +			sz +=3D snprintf(line + sz, x, " ");
>> +		sz +=3D snprintf(line + sz, x, "%s", all_tunables[i]->description());
> the same
>
> 	_(all_tunables[i]->description())
>
>> +		if ((int)sz > x - XINDENT)
>> +			truncate =3D 1;
>> +		while ((int)sz < x - XINDENT)
>> +			sz +=3D snprintf(line + sz, x, " ");
>> +		if (truncate)
>> +			sz +=3D snprintf(line + x - XINDENT - 1, x, "~\n");
>> +		else
>> +			sz +=3D snprintf(line + sz, x, "\n");
>> +
>> +		waddnstr(win, line, sz);
>> +	}
>> +}
>>   =

>>   static void __tuning_update_display(int cursor_pos)
>>   {
>> +	static int last_frame_nr =3D 0;
>> +	int x, y, begin, end, frame_nr;
>>   	WINDOW *win;
>> -	unsigned int i;
>> -
>> +
>>   	win =3D get_ncurses_win("Tunables");
>> -
>>   	if (!win)
>>   		return;
>> +	getmaxyx(stdscr, y, x);
>> +
>> +	y -=3D YINDENT;
>> +	frame_nr =3D ceil(cursor_pos / y);
>> +	end =3D (frame_nr + 1) * y;
>> +	if (end > (int)all_tunables.size())
>> +		end =3D all_tunables.size();
>> +
>> +	begin =3D frame_nr * y;
>> +	/* actual cursor position is frame-dependent */
>> +	cursor_pos -=3D frame_nr * y;
>> +	if (frame_nr !=3D last_frame_nr)
>> +		should_clear =3D TRUE;
>> +	last_frame_nr =3D frame_nr;
>>   =

>>   	if (should_clear) {
>> -		should_clear =3D false;
>> +		should_clear =3D FALSE;
>>   		wclear(win);
>>   	}
>>   =

>> -	wmove(win, 2,0);
>> -
>> -	for (i =3D 0; i < all_tunables.size(); i++) {
>> -		char res[128];
>> -		char desc[4096];
>> -		strcpy(res, all_tunables[i]->result_string());
>> -		strcpy(desc, all_tunables[i]->description());
>> -		while (strlen(res) < 12)
>> -			strcat(res, " ");
>> -
>> -		while (strlen(desc) < 103)
>> -			strcat(desc, " ");
>> -		if ((int)i !=3D cursor_pos) {
>> -			wattrset(win, A_NORMAL);
>> -			wprintw(win, "   ");
>> -		} else {
>> -			wattrset(win, A_REVERSE);
>> -			wprintw(win, ">> ");
>> -		}
>> -		wprintw(win, "%s  %s\n", _(res), _(desc));
>> -	}
>> +	redraw_window(win, begin, end, cursor_pos);
>> +	wnoutrefresh(win);
>>   }
>>   =

>>   void tuning_update_display(void)
>>
So this may be nice for the tuning tab, but we have an overall issue =

with other tabs as well.
Maybe we should change the controls around, and just move the pad. That =

way we could scroll all tabs and not have to truncate strings.
?
-Chris

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop


--===============6540476196653081028==--

