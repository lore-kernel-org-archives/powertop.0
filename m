Content-Type: multipart/mixed; boundary="===============4981973111752637373=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: Re: [Powertop] [PATCH 2/2] tuning: print executed toggle script
Date: Wed, 09 Oct 2013 15:54:35 +0200
Message-ID: <1381326875.9101.52.camel@sara>
In-Reply-To: 20131009131734.GB2305@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4981973111752637373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2013-10-09 at 16:17 +0300, Sergey Senozhatsky wrote:
> report executed toggle_script back to user via ui_notify_user().
> =

> Example:
>  Execute: echo 'auto' > '/sys/bus/pci/devices/0000:00:1c.1/power/control';
>  Execute: echo 'on' > '/sys/bus/pci/devices/0000:00:1c.1/power/control';
> =

> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
> =

> ---
>  src/tuning/tuning.cpp | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> =

> diff --git a/src/tuning/tuning.cpp b/src/tuning/tuning.cpp
> index ff3d715..5adcbfe 100644
> --- a/src/tuning/tuning.cpp
> +++ b/src/tuning/tuning.cpp
> @@ -141,11 +141,15 @@ void tuning_window::repaint(void)
>  void tuning_window::cursor_enter(void)
>  {
>  	class tunable *tun;
> -
> +	const char *toggle_script;
>  	tun =3D all_tunables[cursor_pos];
>  	if (!tun)
>  		return;
> +	/** device will change its state so need to store toggle script before
> +	 * we toggle()*/
> +	toggle_script =3D tun->toggle_script();
>  	tun->toggle();
> +	ui_notify_user("Execute: %s\n", toggle_script);
>  }
>  =

>  static bool tunables_sort(class tunable * i, class tunable * j)

This only shows the toggle script when you run it, right?

What about the following:

diff --git a/src/tuning/tuning.cpp b/src/tuning/tuning.cpp
index ff3d715..505274c 100644
--- a/src/tuning/tuning.cpp
+++ b/src/tuning/tuning.cpp
@@ -119,7 +119,11 @@ static void __tuning_update_display(int cursor_pos)
 			wattrset(win, A_REVERSE);
 			wprintw(win, ">> ");
 		}
-		wprintw(win, "%s  %s\n", _(res), _(desc));
+                if (all_tunables[i]->good_bad() !=3D TUNE_BAD)
+                        wprintw(win, "%s  %s\n", _(res), _(desc));
+                else
+                        wprintw(win, "%s  %s  %s\n", _(res), _(desc),
+                                all_tunables[i]->toggle_script());
 	}
 }
 =

which shows it in the list of bad tunables.

Maybe both are useful as my version have the disadvantage of not showing
anything after the script is executed.

/MF

(attached a copy of the patch for easier applying)

--===============4981973111752637373==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="show-toggle-script.diff"

ZGlmZiAtLWdpdCBhL3NyYy90dW5pbmcvdHVuaW5nLmNwcCBiL3NyYy90dW5pbmcvdHVuaW5nLmNw
cAppbmRleCBmZjNkNzE1Li41MDUyNzRjIDEwMDY0NAotLS0gYS9zcmMvdHVuaW5nL3R1bmluZy5j
cHAKKysrIGIvc3JjL3R1bmluZy90dW5pbmcuY3BwCkBAIC0xMTksNyArMTE5LDExIEBAIHN0YXRp
YyB2b2lkIF9fdHVuaW5nX3VwZGF0ZV9kaXNwbGF5KGludCBjdXJzb3JfcG9zKQogCQkJd2F0dHJz
ZXQod2luLCBBX1JFVkVSU0UpOwogCQkJd3ByaW50dyh3aW4sICI+PiAiKTsKIAkJfQotCQl3cHJp
bnR3KHdpbiwgIiVzICAlc1xuIiwgXyhyZXMpLCBfKGRlc2MpKTsKKyAgICAgICAgICAgICAgICBp
ZiAoYWxsX3R1bmFibGVzW2ldLT5nb29kX2JhZCgpICE9IFRVTkVfQkFEKQorICAgICAgICAgICAg
ICAgICAgICAgICAgd3ByaW50dyh3aW4sICIlcyAgJXNcbiIsIF8ocmVzKSwgXyhkZXNjKSk7Cisg
ICAgICAgICAgICAgICAgZWxzZQorICAgICAgICAgICAgICAgICAgICAgICAgd3ByaW50dyh3aW4s
ICIlcyAgJXMgICVzXG4iLCBfKHJlcyksIF8oZGVzYyksCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGFsbF90dW5hYmxlc1tpXS0+dG9nZ2xlX3NjcmlwdCgpKTsKIAl9CiB9CiAK

--===============4981973111752637373==--

