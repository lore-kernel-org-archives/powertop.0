Content-Type: multipart/mixed; boundary="===============0551524139191221026=="
MIME-Version: 1.0
From: Ferron, Chris E <chris.e.ferron at intel.com>
Subject: Re: [Powertop] PowerTOP UI navigation enhancement.
Date: Tue, 11 Sep 2012 10:16:47 -0700
Message-ID: <CAMFVxVhQ8tLmYiBbx423Ubr7LJFOT4bfOkBhtBxNa0WxKJbw4Q@mail.gmail.com>
In-Reply-To: 20120911170829.GC2955@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0551524139191221026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 11, 2012 at 10:08 AM, Sergey Senozhatsky
<sergey.senozhatsky(a)gmail.com> wrote:
> On (09/11/12 10:07), Chris Ferron wrote:
>> On 09/11/2012 09:55 AM, Sergey Senozhatsky wrote:
>> >On (09/11/12 09:39), Chris Ferron wrote:
>> >>This patch add more ui navigation features allowing for the scrolling
>> >>of PowerTop content for each tab. This is done by controlling the
>> >>location of the winpad, and refreshing the terminal window when
>> >>needed. To do this, the navigation keys have been updated as follows.
>> >>
>> >>"Arrow Keys" now scroll the tab windows
>> >>"Page up/down" scroll tab windows up and down
>> >>"TAB" cycles the next window tab
>> >>"SHIFT+TAB" cycles the previous window tab
>> >>"ENTER" toggles tunables
>> >>"SPACE BAR" toggles tunables
>> >>"r KEY" refresh results and resets view of tab window.
>> >>
>> >>Known issues:
>> >>There is no handler for terminal re-sizing. The workaround is to use
>> >>"r KEY" to refresh if terminal windows size is changed mid session.
>> >>---
>> >>  src/cpu/abstract_cpu.cpp |  1 -
>> >>  src/display.cpp          | 98
>> >>++++++++++++++++++++++++++++++++++--------------
>> >>  src/display.h            | 13 ++++++-
>> >>  src/main.cpp             | 17 ++++++---
>> >>  4 files changed, 93 insertions(+), 36 deletions(-)
>> >>
>> >>
>> >>diff --git a/src/cpu/abstract_cpu.cpp b/src/cpu/abstract_cpu.cpp
>> >>index 8b4c650..ca6901c 100644
>> >>--- a/src/cpu/abstract_cpu.cpp
>> >>+++ b/src/cpu/abstract_cpu.cpp
>> >>@@ -422,7 +422,6 @@ void abstract_cpu::validate(void)
>> >>            if (children[i]) {
>> >>                    if (my_time !=3D children[i]->total_pstate_time())
>> >>-                           printf("My (%i) time %llu is not the same =
as child (%i) time %llu\n",
>> >>                                    first_cpu,
>> >>                                    (unsigned long long)my_time,
>> >>                                    children[i]->number,
>> >
>> >not sure this will compile.
>> >
>> >
>> >     -ss
>> Crap thanks, v2 on the way.
>> -C
>
> no problem
>
>
>>
>> >
>> >>diff --git a/src/display.cpp b/src/display.cpp
>> >>index f48b53f..6a119bc 100644
>> >>--- a/src/display.cpp
>> >>+++ b/src/display.cpp
>> >>@@ -95,7 +95,7 @@ static int current_tab;
>> >>  void show_tab(unsigned int tab)
>> >>  {
>> >>-   WINDOW *win;
>> >>+   class tab_window *win;
>> >>    unsigned int i;
>> >>    int tab_pos =3D 17;
>> >>    const char *c;
>> >>@@ -145,11 +145,11 @@ void show_tab(unsigned int tab)
>> >>    wrefresh(tab_bar);
>> >>    wrefresh(bottom_line);
>> >>-   win =3D get_ncurses_win(tab_names[tab]);
>> >>+   win =3D tab_windows[tab_names[tab]];
>> >>    if (!win)
>> >>            return;
>> >>-   prefresh(win, 0, 0, 1, 0, LINES - 3, COLS - 1);
>> >>+   prefresh(win->win, win->ypad_pos, win->xpad_pos, 1, 0, LINES - 3, =
COLS - 1);
>> >>  }
>> >>  WINDOW *get_ncurses_win(const char *name)
>> >>@@ -185,42 +185,41 @@ WINDOW *get_ncurses_win(const string &name)
>> >>    return get_ncurses_win(name.c_str());
>> >>  }
>> >>-
>> >>-void show_next_tab(void)
>> >>+void show_prev_tab(void)
>> >>  {
>> >>-   class tab_window *w;
>> >>+       class tab_window *w;
>> >>-   if (!display)
>> >>-           return;
>> >>+       if (!display)
>> >>+               return;
>> >>+       w =3D tab_windows[tab_names[current_tab]];
>> >>+       if (w)
>> >>+               w->hide();
>> >>-   w =3D tab_windows[tab_names[current_tab]];
>> >>-   if (w)
>> >>-           w->hide();
>> >>+       current_tab --;
>> >>+       if (current_tab < 0)
>> >>+               current_tab =3D tab_names.size() - 1;
>> >>-   current_tab ++;
>> >>-   if (current_tab >=3D (int)tab_names.size())
>> >>-           current_tab =3D 0;
>> >>-
>> >>-   w =3D tab_windows[tab_names[current_tab]];
>> >>-   if (w)
>> >>-           w->expose();
>> >>+       w =3D tab_windows[tab_names[current_tab]];
>> >>+       if (w)
>> >>+               w->expose();
>> >>-   show_tab(current_tab);
>> >>+       show_tab(current_tab);
>> >>  }
>> >>-void show_prev_tab(void)
>> >>+void show_next_tab(void)
>> >>  {
>> >>    class tab_window *w;
>> >>    if (!display)
>> >>            return;
>> >>+
>> >>    w =3D tab_windows[tab_names[current_tab]];
>> >>    if (w)
>> >>            w->hide();
>> >>-   current_tab --;
>> >>-   if (current_tab < 0)
>> >>-           current_tab =3D tab_names.size() - 1;
>> >>+   current_tab ++;
>> >>+   if (current_tab >=3D (int)tab_names.size())
>> >>+           current_tab =3D 0;
>> >>    w =3D tab_windows[tab_names[current_tab]];
>> >>    if (w)
>> >>@@ -241,8 +240,16 @@ void cursor_down(void)
>> >>    class tab_window *w;
>> >>    w =3D tab_windows[tab_names[current_tab]];
>> >>-   if (w)
>> >>-           w->cursor_down();
>> >>+   if (w) {
>> >>+           if (tab_names[current_tab] =3D=3D "Tunables") {
>> >>+                   if ((w->cursor_pos + 7) >=3D LINES) {
>> >>+                           prefresh(w->win, ++w->ypad_pos, w->xpad_po=
s, 1, 0, LINES - 3, COLS - 1);
>> >>+                   }
>> >>+                           w->cursor_down();
>> >>+           } else {
>> >>+                   prefresh(w->win, ++w->ypad_pos, w->xpad_pos, 1, 0,=
 LINES - 3, COLS - 1);
>> >>+           }
>> >>+   }
>> >>    show_cur_tab();
>> >>  }
>> >>@@ -253,12 +260,45 @@ void cursor_up(void)
>> >>    w =3D tab_windows[tab_names[current_tab]];
>> >>-   if (w)
>> >>-           w->cursor_up();
>> >>-
>> >>+   if (w) {
>> >>+           w->cursor_up();
>> >>+           if(w->ypad_pos > 0) {
>> >>+                   if (tab_names[current_tab] =3D=3D "Tunables") {
>> >>+                          prefresh(w->win, --w->ypad_pos, w->xpad_pos=
, 1, 0, LINES - 3, COLS - 1);
>> >>+                   } else {
>> >>+                          prefresh(w->win, --w->ypad_pos, w->xpad_pos=
, 1, 0, LINES - 3, COLS - 1);
>> >>+                   }
>> >>+           }
>> >>+   }
>> >>+
>> >>    show_cur_tab();
>> >>  }
>> >>+void cursor_left(void)
>> >>+{
>> >>+        class tab_window *w;
>> >>+
>> >>+   w =3D tab_windows[tab_names[current_tab]];
>> >>+
>> >>+   if (w) {
>> >>+           if (w->xpad_pos > 0) {
>> >>+                   prefresh(w->win, w->ypad_pos,--w->xpad_pos, 1, 0, =
LINES - 3, COLS - 1);
>> >>+           }
>> >>+   }
>> >>+}
>> >>+
>> >>+void cursor_right(void)
>> >>+{
>> >>+        class tab_window *w;
>> >>+
>> >>+   w =3D tab_windows[tab_names[current_tab]];
>> >>+
>> >>+   if (w) {
>> >>+           prefresh(w->win, w->ypad_pos, ++w->xpad_pos, 1, 0, LINES -=
 3, COLS - 1);
>> >>+   }
>> >>+
>> >>+}
>> >>+
>> >>  void cursor_enter(void)
>> >>  {
>> >>    class tab_window *w;
>> >>@@ -279,6 +319,8 @@ void window_refresh()
>> >>    w =3D tab_windows[tab_names[current_tab]];
>> >>    if (w) {
>> >>+           w->ypad_pos =3D 0;
>> >>+           w->xpad_pos =3D 0;
>> >>            w->window_refresh();
>> >>            w->repaint();
>> >>    }
>> >>diff --git a/src/display.h b/src/display.h
>> >>index 33aaae1..00887aa 100644
>> >>--- a/src/display.h
>> >>+++ b/src/display.h
>> >>@@ -41,6 +41,8 @@ extern void show_prev_tab(void);
>> >>  extern void show_cur_tab(void);
>> >>  extern void cursor_up(void);
>> >>  extern void cursor_down(void);
>> >>+extern void cursor_right(void);
>> >>+extern void cursor_left(void);
>> >>  extern void cursor_enter(void);
>> >>  extern void window_refresh(void);
>> >>@@ -48,10 +50,17 @@ class tab_window {
>> >>  public:
>> >>    int cursor_pos;
>> >>    int cursor_max;
>> >>+   int xpad_pos, ypad_pos;
>> >>    WINDOW *win;
>> >>-   virtual void cursor_down(void) { if (cursor_pos < cursor_max ) cur=
sor_pos++; repaint(); } ;
>> >>-   virtual void cursor_up(void) { if (cursor_pos > 0) cursor_pos--; r=
epaint(); };
>> >>+   virtual void cursor_down(void) {
>> >>+           if (cursor_pos < cursor_max ) cursor_pos++; repaint();
>> >>+   } ;
>> >>+   virtual void cursor_up(void) {
>> >>+           if (cursor_pos > 0) cursor_pos--; repaint();
>> >>+   };
>> >>+   virtual void cursor_left(void) { };
>> >>+   virtual void cursor_right(void) { };
>> >>    virtual void cursor_enter(void) { };
>> >>    virtual void window_refresh() { };
>> >>diff --git a/src/main.cpp b/src/main.cpp
>> >>index cf47b4e..edc4147 100644
>> >>--- a/src/main.cpp
>> >>+++ b/src/main.cpp
>> >>@@ -135,22 +135,29 @@ static void do_sleep(int seconds)
>> >>            halfdelay(delta * 10);
>> >>            c =3D getch();
>> >>-
>> >>+           printf("c (%i)", c);
>
>
> could we please push debug output to stderr, for example, and run 'powert=
op 2 > cursor_pos_log'.
> printf() just messes with ncurses output.
>
>
>         -ss
Yes absolutely.
-C

>
>
>> >>            switch (c) {
>> >>-           case KEY_NPAGE:
>> >>+           case 353:
>> >>+                   show_prev_tab();
>> >>+                   break;
>> >>+           case 9:
>> >>+                   show_next_tab();
>> >>+                   break;
>> >>            case KEY_RIGHT:
>> >>-                   show_next_tab();
>> >>+                   cursor_right();
>> >>                    break;
>> >>-           case KEY_PPAGE:
>> >>            case KEY_LEFT:
>> >>-                   show_prev_tab();
>> >>+                   cursor_left();
>> >>                    break;
>> >>+           case KEY_NPAGE:
>> >>            case KEY_DOWN:
>> >>                    cursor_down();
>> >>                    break;
>> >>+           case KEY_PPAGE:
>> >>            case KEY_UP:
>> >>                    cursor_up();
>> >>                    break;
>> >>+           case 32:
>> >>            case 10:
>> >>                    cursor_enter();
>> >>                    break;
>> >>
>>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop

--===============0551524139191221026==--

