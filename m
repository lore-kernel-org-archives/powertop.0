Content-Type: multipart/mixed; boundary="===============8811810509793105628=="
MIME-Version: 1.0
From: Justin Brown <justin.brown at fandingo.org>
Subject: Re: [Powertop] Multiple Batteries
Date: Tue, 27 Nov 2012 00:09:09 -0600
Message-ID: <CAKZK7ux7BrjOBTjczoWLA2yL13BUA3cKaOLeKy0JGh2p=rR7VQ@mail.gmail.com>
In-Reply-To: 20121124144120.GC7100@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8811810509793105628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 24, 2012 at 8:41 AM, Sergey Senozhatsky <
sergey.senozhatsky(a)gmail.com> wrote:

> On (11/23/12 22:55), Justin Brown wrote:
> >    Hello,
> >    I'm using Powertop 2.1, and I've noticed a somewhat minor bug. (I
> couldn't
> >    find a public bug tracker, but would be more than happy to move this
> >    discussion to one if someone could send me a URL.)
> >    I have two batteries in my laptop, but Powertop does not recognize
> both
> >    when calculating battery life remaining. For example Gnome-Shell
> reports
> >    that my batteries are at 66% and 100% (85% combined) giving me 10
> hours
> >    and 11 minutes of estimated time remaining. On the other hand,
> Powertop
> >    reports just 3 hours 17 =EF=BF=BDminutes of time. Both programs are =
reporting
> the
> >    proper discharge rate. It just seems like Powertop is only using my
> >    smaller battery (the currently active one).
> >    I'm not sure if this issue has been reported, or if the developers
> even
> >    have equipment with which to test. I'm more than willing to provide
> any
> >    sort of debugging output or testing as needed. I could also probably
> >    create a patch, but that's likely to take a lot longer for me to get
> setup
> >    with development on this project.=EF=BF=BD
> >    It may be as simple as iterating over a directory in /sys/ or /proc =
to
> >    gather stats on multiple batteries. An experienced dev might be able
> to
> >    fix it quickly.
> >    Cheers,
> >    Justin
>
>
> after a cup of coffee,
> please ignore previous patch. let's start with this one.
>
>
> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
>
> ---
>
>  src/measurement/measurement.cpp | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/src/measurement/measurement.cpp
> b/src/measurement/measurement.cpp
> index 4a33db9..dcb9b65 100644
> --- a/src/measurement/measurement.cpp
> +++ b/src/measurement/measurement.cpp
> @@ -65,12 +65,13 @@ double power_meter::time_left(void)
>         if (cap < 0.001)
>                 return 0.0;
>
> -       left =3D cap / rate;
> +       if (rate < 0.001)
> +               rate =3D 1.0;
>
> +       left =3D cap / rate;
>         return left;
>  }
>
> -
>  vector<class power_meter *> power_meters;
>
>  void start_power_measurement(void)
> @@ -101,12 +102,18 @@ double global_joules_consumed(void)
>
>  double global_time_left(void)
>  {
> -       double total =3D 0.0;
> +       double total_capacity =3D 0.0;
> +       double total_rate =3D 0.0;
>         unsigned int i;
> -       for (i =3D 0; i < power_meters.size(); i++)
> -               total +=3D power_meters[i]->time_left();
> +       for (i =3D 0; i < power_meters.size(); i++) {
> +               total_capacity +=3D power_meters[i]->dev_capacity();
> +               total_rate +=3D power_meters[i]->joules_consumed();
> +       }
>
> -       return total;
> +       if (total_rate < 0.001)
> +               total_rate =3D 1.0;
> +
> +       return total_capacity/total_rate;
>  }
>
>  void sysfs_power_meters_callback(const char *d_name)
>
>

Sergey,

Thanks for the quick reply and patch.

I'm wondering if you can walk me through building PowerTop from source.
I've spent way too much time with Python and Ruby, and I don't know how to
build this project.

I've cloned the Git repository and applied your patch.
I'm having trouble generating "configure" from configure.ac.

$ autoconf configure.ac  > configure
configure.ac:13: error: possibly undefined macro: AC_LTDL_DLLIB
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
configure.ac:16: error: possibly undefined macro: AM_GNU_GETTEXT
configure.ac:17: error: possibly undefined macro: AM_GNU_GETTEXT_VERSION

I'm using Fedora 17.

I did install libtool-ltdl-devel, but that didn't have any effect. Sorry
for the newbie problem

Here is the battery information that you originally requested.

POWER_SUPPLY_NAME=3DBAT0
POWER_SUPPLY_STATUS=3DFull
POWER_SUPPLY_PRESENT=3D1
POWER_SUPPLY_TECHNOLOGY=3DLi-ion
POWER_SUPPLY_CYCLE_COUNT=3D0
POWER_SUPPLY_VOLTAGE_MIN_DESIGN=3D11100000
POWER_SUPPLY_VOLTAGE_NOW=3D12465000
POWER_SUPPLY_POWER_NOW=3D0
POWER_SUPPLY_ENERGY_FULL_DESIGN=3D43290000
POWER_SUPPLY_ENERGY_FULL=3D45240000
POWER_SUPPLY_ENERGY_NOW=3D45240000
POWER_SUPPLY_CAPACITY=3D100
POWER_SUPPLY_MODEL_NAME=3D45N1039
POWER_SUPPLY_MANUFACTURER=3DPanasonic
POWER_SUPPLY_SERIAL_NUMBER=3D 2913

POWER_SUPPLY_NAME=3DBAT1
POWER_SUPPLY_STATUS=3DDischarging
POWER_SUPPLY_PRESENT=3D1
POWER_SUPPLY_TECHNOLOGY=3DLi-poly
POWER_SUPPLY_CYCLE_COUNT=3D0
POWER_SUPPLY_VOLTAGE_MIN_DESIGN=3D10800000
POWER_SUPPLY_VOLTAGE_NOW=3D11772000
POWER_SUPPLY_POWER_NOW=3D10971000
POWER_SUPPLY_ENERGY_FULL_DESIGN=3D31320000
POWER_SUPPLY_ENERGY_FULL=3D33700000
POWER_SUPPLY_ENERGY_NOW=3D27000000
POWER_SUPPLY_CAPACITY=3D80
POWER_SUPPLY_MODEL_NAME=3D45N1041
POWER_SUPPLY_MANUFACTURER=3DSONY
POWER_SUPPLY_SERIAL_NUMBER=3D 2106

Thanks,

Justin

--===============8811810509793105628==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdj5PbiBTYXQsIE5vdiAyNCwgMjAxMiBhdCA4OjQxIEFNLCBTZXJnZXkgU2Vub3poYXRza3kg
PHNwYW4gZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWlsdG86c2VyZ2V5LnNlbm96aGF0c2t5QGdt
YWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnNlcmdleS5zZW5vemhhdHNreUBnbWFpbC5jb208L2E+
Jmd0Ozwvc3Bhbj4gd3JvdGU6PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj4KPGJsb2NrcXVv
dGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxl
ZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+PGRpdj5PbiAoMTEvMjMvMTIgMjI6
NTUpLCBKdXN0aW4gQnJvd24gd3JvdGU6PGJyPgo8L2Rpdj48ZGl2PjxkaXY+Jmd0OyDCoCDCoEhl
bGxvLDxicj4KJmd0OyDCoCDCoEkmIzM5O20gdXNpbmcgUG93ZXJ0b3AgMi4xLCBhbmQgSSYjMzk7
dmUgbm90aWNlZCBhIHNvbWV3aGF0IG1pbm9yIGJ1Zy4gKEkgY291bGRuJiMzOTt0PGJyPgomZ3Q7
IMKgIMKgZmluZCBhIHB1YmxpYyBidWcgdHJhY2tlciwgYnV0IHdvdWxkIGJlIG1vcmUgdGhhbiBo
YXBweSB0byBtb3ZlIHRoaXM8YnI+CiZndDsgwqAgwqBkaXNjdXNzaW9uIHRvIG9uZSBpZiBzb21l
b25lIGNvdWxkIHNlbmQgbWUgYSBVUkwuKTxicj4KJmd0OyDCoCDCoEkgaGF2ZSB0d28gYmF0dGVy
aWVzIGluIG15IGxhcHRvcCwgYnV0IFBvd2VydG9wIGRvZXMgbm90IHJlY29nbml6ZSBib3RoPGJy
PgomZ3Q7IMKgIMKgd2hlbiBjYWxjdWxhdGluZyBiYXR0ZXJ5IGxpZmUgcmVtYWluaW5nLiBGb3Ig
ZXhhbXBsZSBHbm9tZS1TaGVsbCByZXBvcnRzPGJyPgomZ3Q7IMKgIMKgdGhhdCBteSBiYXR0ZXJp
ZXMgYXJlIGF0IDY2JSBhbmQgMTAwJSAoODUlIGNvbWJpbmVkKSBnaXZpbmcgbWUgMTAgaG91cnM8
YnI+CiZndDsgwqAgwqBhbmQgMTEgbWludXRlcyBvZiBlc3RpbWF0ZWQgdGltZSByZW1haW5pbmcu
IE9uIHRoZSBvdGhlciBoYW5kLCBQb3dlcnRvcDxicj4KJmd0OyDCoCDCoHJlcG9ydHMganVzdCAz
IGhvdXJzIDE3IO+/vW1pbnV0ZXMgb2YgdGltZS4gQm90aCBwcm9ncmFtcyBhcmUgcmVwb3J0aW5n
IHRoZTxicj4KJmd0OyDCoCDCoHByb3BlciBkaXNjaGFyZ2UgcmF0ZS4gSXQganVzdCBzZWVtcyBs
aWtlIFBvd2VydG9wIGlzIG9ubHkgdXNpbmcgbXk8YnI+CiZndDsgwqAgwqBzbWFsbGVyIGJhdHRl
cnkgKHRoZSBjdXJyZW50bHkgYWN0aXZlIG9uZSkuPGJyPgomZ3Q7IMKgIMKgSSYjMzk7bSBub3Qg
c3VyZSBpZiB0aGlzIGlzc3VlIGhhcyBiZWVuIHJlcG9ydGVkLCBvciBpZiB0aGUgZGV2ZWxvcGVy
cyBldmVuPGJyPgomZ3Q7IMKgIMKgaGF2ZSBlcXVpcG1lbnQgd2l0aCB3aGljaCB0byB0ZXN0LiBJ
JiMzOTttIG1vcmUgdGhhbiB3aWxsaW5nIHRvIHByb3ZpZGUgYW55PGJyPgomZ3Q7IMKgIMKgc29y
dCBvZiBkZWJ1Z2dpbmcgb3V0cHV0IG9yIHRlc3RpbmcgYXMgbmVlZGVkLiBJIGNvdWxkIGFsc28g
cHJvYmFibHk8YnI+CiZndDsgwqAgwqBjcmVhdGUgYSBwYXRjaCwgYnV0IHRoYXQmIzM5O3MgbGlr
ZWx5IHRvIHRha2UgYSBsb3QgbG9uZ2VyIGZvciBtZSB0byBnZXQgc2V0dXA8YnI+CiZndDsgwqAg
wqB3aXRoIGRldmVsb3BtZW50IG9uIHRoaXMgcHJvamVjdC7vv708YnI+CiZndDsgwqAgwqBJdCBt
YXkgYmUgYXMgc2ltcGxlIGFzIGl0ZXJhdGluZyBvdmVyIGEgZGlyZWN0b3J5IGluIC9zeXMvIG9y
IC9wcm9jIHRvPGJyPgomZ3Q7IMKgIMKgZ2F0aGVyIHN0YXRzIG9uIG11bHRpcGxlIGJhdHRlcmll
cy4gQW4gZXhwZXJpZW5jZWQgZGV2IG1pZ2h0IGJlIGFibGUgdG88YnI+CiZndDsgwqAgwqBmaXgg
aXQgcXVpY2tseS48YnI+CiZndDsgwqAgwqBDaGVlcnMsPGJyPgomZ3Q7IMKgIMKgSnVzdGluPGJy
Pgo8YnI+Cjxicj4KPC9kaXY+PC9kaXY+YWZ0ZXIgYSBjdXAgb2YgY29mZmVlLDxicj4KcGxlYXNl
IGlnbm9yZSBwcmV2aW91cyBwYXRjaC4gbGV0JiMzOTtzIHN0YXJ0IHdpdGggdGhpcyBvbmUuPGJy
Pgo8ZGl2Pjxicj4KPGJyPgpTaWduZWQtb2ZmLWJ5OiBTZXJnZXkgU2Vub3poYXRza3kgJmx0Ozxh
IGhyZWY9Im1haWx0bzpzZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFu
ayI+c2VyZ2V5LnNlbm96aGF0c2t5QGdtYWlsLmNvbTwvYT4mZ3Q7PGJyPgo8YnI+Ci0tLTxicj4K
PGJyPgo8L2Rpdj7CoHNyYy9tZWFzdXJlbWVudC9tZWFzdXJlbWVudC5jcHAgfCAxOSArKysrKysr
KysrKysrLS0tLS0tPGJyPgrCoDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA2IGRl
bGV0aW9ucygtKTxicj4KPGJyPgpkaWZmIC0tZ2l0IGEvc3JjL21lYXN1cmVtZW50L21lYXN1cmVt
ZW50LmNwcCBiL3NyYy9tZWFzdXJlbWVudC9tZWFzdXJlbWVudC5jcHA8YnI+CmluZGV4IDRhMzNk
YjkuLmRjYjliNjUgMTAwNjQ0PGJyPgo8ZGl2Pi0tLSBhL3NyYy9tZWFzdXJlbWVudC9tZWFzdXJl
bWVudC5jcHA8YnI+CisrKyBiL3NyYy9tZWFzdXJlbWVudC9tZWFzdXJlbWVudC5jcHA8YnI+CkBA
IC02NSwxMiArNjUsMTMgQEAgZG91YmxlIHBvd2VyX21ldGVyOjp0aW1lX2xlZnQodm9pZCk8YnI+
CsKgIMKgIMKgIMKgIGlmIChjYXAgJmx0OyAwLjAwMSk8YnI+CsKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIHJldHVybiAwLjA7PGJyPgo8YnI+Ci0gwqAgwqAgwqAgbGVmdCA9IGNhcCAvIHJhdGU7PGJy
PgorIMKgIMKgIMKgIGlmIChyYXRlICZsdDsgMC4wMDEpPGJyPgorIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIHJhdGUgPSAxLjA7PGJyPgo8YnI+CisgwqAgwqAgwqAgbGVmdCA9IGNhcCAvIHJhdGU7PGJy
PgrCoCDCoCDCoCDCoCByZXR1cm4gbGVmdDs8YnI+CsKgfTxicj4KPGJyPgotPGJyPgrCoHZlY3Rv
ciZsdDtjbGFzcyBwb3dlcl9tZXRlciAqJmd0OyBwb3dlcl9tZXRlcnM7PGJyPgo8YnI+CsKgdm9p
ZCBzdGFydF9wb3dlcl9tZWFzdXJlbWVudCh2b2lkKTxicj4KPC9kaXY+QEAgLTEwMSwxMiArMTAy
LDE4IEBAIGRvdWJsZSBnbG9iYWxfam91bGVzX2NvbnN1bWVkKHZvaWQpPGJyPgo8YnI+CsKgZG91
YmxlIGdsb2JhbF90aW1lX2xlZnQodm9pZCk8YnI+CsKgezxicj4KLSDCoCDCoCDCoCBkb3VibGUg
dG90YWwgPSAwLjA7PGJyPgorIMKgIMKgIMKgIGRvdWJsZSB0b3RhbF9jYXBhY2l0eSA9IDAuMDs8
YnI+CisgwqAgwqAgwqAgZG91YmxlIHRvdGFsX3JhdGUgPSAwLjA7PGJyPgrCoCDCoCDCoCDCoCB1
bnNpZ25lZCBpbnQgaTs8YnI+Ci0gwqAgwqAgwqAgZm9yIChpID0gMDsgaSAmbHQ7IHBvd2VyX21l
dGVycy5zaXplKCk7IGkrKyk8YnI+Ci0gwqAgwqAgwqAgwqAgwqAgwqAgwqAgdG90YWwgKz0gcG93
ZXJfbWV0ZXJzW2ldLSZndDt0aW1lX2xlZnQoKTs8YnI+CisgwqAgwqAgwqAgZm9yIChpID0gMDsg
aSAmbHQ7IHBvd2VyX21ldGVycy5zaXplKCk7IGkrKykgezxicj4KKyDCoCDCoCDCoCDCoCDCoCDC
oCDCoCB0b3RhbF9jYXBhY2l0eSArPSBwb3dlcl9tZXRlcnNbaV0tJmd0O2Rldl9jYXBhY2l0eSgp
Ozxicj4KKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCB0b3RhbF9yYXRlICs9IHBvd2VyX21ldGVyc1tp
XS0mZ3Q7am91bGVzX2NvbnN1bWVkKCk7PGJyPgorIMKgIMKgIMKgIH08YnI+Cjxicj4KLSDCoCDC
oCDCoCByZXR1cm4gdG90YWw7PGJyPgorIMKgIMKgIMKgIGlmICh0b3RhbF9yYXRlICZsdDsgMC4w
MDEpPGJyPgorIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHRvdGFsX3JhdGUgPSAxLjA7PGJyPgorPGJy
PgorIMKgIMKgIMKgIHJldHVybiB0b3RhbF9jYXBhY2l0eS90b3RhbF9yYXRlOzxicj4KwqB9PGJy
Pgo8YnI+CsKgdm9pZCBzeXNmc19wb3dlcl9tZXRlcnNfY2FsbGJhY2soY29uc3QgY2hhciAqZF9u
YW1lKTxicj4KPGJyPgo8L2Jsb2NrcXVvdGU+PC9kaXY+PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+U2VyZ2V5LDxkaXY+PGJyPjwvZGl2PjxkaXY+VGhhbmtzIGZvciB0aGUgcXVpY2sgcmVw
bHkgYW5kIHBhdGNoLsKgPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JJiMzOTttIHdvbmRlcmlu
ZyBpZiB5b3UgY2FuIHdhbGsgbWUgdGhyb3VnaCBidWlsZGluZyBQb3dlclRvcCBmcm9tIHNvdXJj
ZS4gSSYjMzk7dmUgc3BlbnQgd2F5IHRvbyBtdWNoIHRpbWUgd2l0aCBQeXRob24gYW5kIFJ1Ynks
IGFuZCBJIGRvbiYjMzk7dCBrbm93IGhvdyB0byBidWlsZCB0aGlzIHByb2plY3QuPC9kaXY+Cgo8
ZGl2Pjxicj48L2Rpdj48ZGl2PkkmIzM5O3ZlIGNsb25lZCB0aGUgR2l0IHJlcG9zaXRvcnkgYW5k
IGFwcGxpZWQgeW91ciBwYXRjaC48L2Rpdj48ZGl2PkkmIzM5O20gaGF2aW5nIHRyb3VibGUgZ2Vu
ZXJhdGluZyAmcXVvdDtjb25maWd1cmUmcXVvdDsgZnJvbcKgPGEgaHJlZj0iaHR0cDovL2NvbmZp
Z3VyZS5hYy8iIHRhcmdldD0iX2JsYW5rIj5jb25maWd1cmUuYWM8L2E+LjwvZGl2Pgo8ZGl2Pgo8
YnI+PC9kaXY+PGRpdj48ZGl2PiQgYXV0b2NvbmbCoDxhIGhyZWY9Imh0dHA6Ly9jb25maWd1cmUu
YWMvIiB0YXJnZXQ9Il9ibGFuayI+Y29uZmlndXJlLmFjPC9hPsKgwqAmZ3Q7IGNvbmZpZ3VyZTwv
ZGl2PjxkaXY+PGEgaHJlZj0iaHR0cDovL2NvbmZpZ3VyZS5hYzoxMy8iIHRhcmdldD0iX2JsYW5r
Ij5jb25maWd1cmUuYWM6MTM8L2E+OiBlcnJvcjogcG9zc2libHkgdW5kZWZpbmVkIG1hY3JvOiBB
Q19MVERMX0RMTElCPC9kaXY+Cgo8ZGl2PsKgIMKgIMKgIElmIHRoaXMgdG9rZW4gYW5kIG90aGVy
cyBhcmUgbGVnaXRpbWF0ZSwgcGxlYXNlIHVzZSBtNF9wYXR0ZXJuX2FsbG93LjwvZGl2PjxkaXY+
wqAgwqAgwqAgU2VlIHRoZSBBdXRvY29uZiBkb2N1bWVudGF0aW9uLjwvZGl2PjxkaXY+PGEgaHJl
Zj0iaHR0cDovL2NvbmZpZ3VyZS5hYzoxNi8iIHRhcmdldD0iX2JsYW5rIj5jb25maWd1cmUuYWM6
MTY8L2E+OiBlcnJvcjogcG9zc2libHkgdW5kZWZpbmVkIG1hY3JvOiBBTV9HTlVfR0VUVEVYVDwv
ZGl2PgoKPGRpdj48YSBocmVmPSJodHRwOi8vY29uZmlndXJlLmFjOjE3LyIgdGFyZ2V0PSJfYmxh
bmsiPmNvbmZpZ3VyZS5hYzoxNzwvYT46IGVycm9yOiBwb3NzaWJseSB1bmRlZmluZWQgbWFjcm86
IEFNX0dOVV9HRVRURVhUX1ZFUlNJT048L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkkmIzM5O20g
dXNpbmcgRmVkb3JhIDE3LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSBkaWQgaW5zdGFsbMKg
bGlidG9vbC1sdGRsLWRldmVsLCBidXQgdGhhdCBkaWRuJiMzOTt0IGhhdmUgYW55IGVmZmVjdC4g
U29ycnkgZm9yIHRoZSBuZXdiaWUgcHJvYmxlbTwvZGl2PgoKPGRpdj48YnI+PC9kaXY+PGRpdj5I
ZXJlIGlzIHRoZSBiYXR0ZXJ5IGluZm9ybWF0aW9uIHRoYXQgeW91IG9yaWdpbmFsbHkgcmVxdWVz
dGVkLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGRpdj5QT1dFUl9TVVBQTFlfTkFNRT1CQVQw
PC9kaXY+PGRpdj5QT1dFUl9TVVBQTFlfU1RBVFVTPUZ1bGw8L2Rpdj48ZGl2PlBPV0VSX1NVUFBM
WV9QUkVTRU5UPTE8L2Rpdj48ZGl2PlBPV0VSX1NVUFBMWV9URUNITk9MT0dZPUxpLWlvbjwvZGl2
Pgo8ZGl2PlBPV0VSX1NVUFBMWV9DWUNMRV9DT1VOVD0wPC9kaXY+PGRpdj5QT1dFUl9TVVBQTFlf
Vk9MVEFHRV9NSU5fREVTSUdOPTExMTAwMDAwPC9kaXY+PGRpdj5QT1dFUl9TVVBQTFlfVk9MVEFH
RV9OT1c9MTI0NjUwMDA8L2Rpdj48ZGl2PlBPV0VSX1NVUFBMWV9QT1dFUl9OT1c9MDwvZGl2Pjxk
aXY+UE9XRVJfU1VQUExZX0VORVJHWV9GVUxMX0RFU0lHTj00MzI5MDAwMDwvZGl2PjxkaXY+ClBP
V0VSX1NVUFBMWV9FTkVSR1lfRlVMTD00NTI0MDAwMDwvZGl2PjxkaXY+UE9XRVJfU1VQUExZX0VO
RVJHWV9OT1c9NDUyNDAwMDA8L2Rpdj48ZGl2PlBPV0VSX1NVUFBMWV9DQVBBQ0lUWT0xMDA8L2Rp
dj48ZGl2PlBPV0VSX1NVUFBMWV9NT0RFTF9OQU1FPTQ1TjEwMzk8L2Rpdj48ZGl2PlBPV0VSX1NV
UFBMWV9NQU5VRkFDVFVSRVI9UGFuYXNvbmljPC9kaXY+PGRpdj5QT1dFUl9TVVBQTFlfU0VSSUFM
X05VTUJFUj0gMjkxMzwvZGl2Pgo8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxkaXY+UE9XRVJf
U1VQUExZX05BTUU9QkFUMTwvZGl2PjxkaXY+UE9XRVJfU1VQUExZX1NUQVRVUz1EaXNjaGFyZ2lu
ZzwvZGl2PjxkaXY+UE9XRVJfU1VQUExZX1BSRVNFTlQ9MTwvZGl2PjxkaXY+UE9XRVJfU1VQUExZ
X1RFQ0hOT0xPR1k9TGktcG9seTwvZGl2PjxkaXY+UE9XRVJfU1VQUExZX0NZQ0xFX0NPVU5UPTA8
L2Rpdj48ZGl2PlBPV0VSX1NVUFBMWV9WT0xUQUdFX01JTl9ERVNJR049MTA4MDAwMDA8L2Rpdj4K
PGRpdj5QT1dFUl9TVVBQTFlfVk9MVEFHRV9OT1c9MTE3NzIwMDA8L2Rpdj48ZGl2PlBPV0VSX1NV
UFBMWV9QT1dFUl9OT1c9MTA5NzEwMDA8L2Rpdj48ZGl2PlBPV0VSX1NVUFBMWV9FTkVSR1lfRlVM
TF9ERVNJR049MzEzMjAwMDA8L2Rpdj48ZGl2PlBPV0VSX1NVUFBMWV9FTkVSR1lfRlVMTD0zMzcw
MDAwMDwvZGl2PjxkaXY+UE9XRVJfU1VQUExZX0VORVJHWV9OT1c9MjcwMDAwMDA8L2Rpdj4KPGRp
dj5QT1dFUl9TVVBQTFlfQ0FQQUNJVFk9ODA8L2Rpdj48ZGl2PlBPV0VSX1NVUFBMWV9NT0RFTF9O
QU1FPTQ1TjEwNDE8L2Rpdj48ZGl2PlBPV0VSX1NVUFBMWV9NQU5VRkFDVFVSRVI9U09OWTwvZGl2
PjxkaXY+UE9XRVJfU1VQUExZX1NFUklBTF9OVU1CRVI9IDIxMDY8L2Rpdj48L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2PlRoYW5rcyw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pkp1c3RpbjwvZGl2
Pgo8L2Rpdj48L2Rpdj48ZGl2Pjxicj48L2Rpdj4K

--===============8811810509793105628==--

