Content-Type: multipart/mixed; boundary="===============6745558104055438262=="
MIME-Version: 1.0
From: Thomas Spura <thomas.spura at gmail.com>
Subject: Re: [Powertop] [PATCH] src/cpu/cpu.cpp: Fix typo in error message:
 freque*nc*y
Date: Tue, 05 Feb 2013 10:18:37 +0100
Message-ID: <CAE4GLsvkgQe7nCwq7SF+jX8ifys4xg7zSdDPm6AxMbLGjWovtg@mail.gmail.com>
In-Reply-To: 20130204110258.1b7a9dc8@bluebird.jf.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6745558104055438262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Byt then all translations will be marked as fuzzy and won't work
anymore. When also updating the typo in the translations, this won't
be needed.


Greetings,
   Tom

On Mon, Feb 4, 2013 at 8:02 PM, Kristen Carlson Accardi
<kristen(a)linux.intel.com> wrote:
> On Sun, 03 Feb 2013 23:36:24 +0100
> Paul Menzel <paulepanter(a)users.sourceforge.net> wrote:
>
>> Date: Sun, 3 Feb 2013 23:31:22 +0100
>>
>> The following command was used to fix this typo.
>>
>>     $ git grep -l frequecny | xargs sed -i 's,frequecny,frequency,'
>> ---
>> Please note, that I also changed the translations files. As Transifex is
>> used, that might be not the correct way to fix such a typo. So please
>> only apply this patch after a knowledgeable Transifex person commented
>> it.
>>
>>  po/bn_IN.po     |    4 ++--
>>  po/ca.po        |    4 ++--
>>  po/cs_CZ.po     |    4 ++--
>>  po/de_DE.po     |    2 +-
>>  po/en_GB.po     |    2 +-
>>  po/en_US.po     |    2 +-
>>  po/es_ES.po     |    2 +-
>>  po/hi.po        |    2 +-
>>  po/hu_HU.po     |    2 +-
>>  po/id_ID.po     |    2 +-
>>  po/lt.po        |    2 +-
>>  po/nl_NL.po     |    2 +-
>>  po/pl_PL.po     |    2 +-
>>  po/powertop.pot |    2 +-
>>  po/zh_CN.po     |    2 +-
>>  po/zh_TW.po     |    4 ++--
>>  src/cpu/cpu.cpp |    2 +-
>>  17 files changed, 21 insertions(+), 21 deletions(-)
>>
>> diff --git a/po/bn_IN.po b/po/bn_IN.po
>> index 6bd0b34..b47682a 100644
>> --- a/po/bn_IN.po
>> +++ b/po/bn_IN.po
>> @@ -100,8 +100,8 @@ msgstr "cpu_idle =E0=A6=87=E0=A6=AD=E0=A7=87=E0=A6=
=A8=E0=A7=8D=E0=A6=9F  =E0=A6=95=E0=A7=8B=E0=A6=A8=E0=A6=93 =E0=A6=85=E0=A6=
=AC=E0=A6=B8=E0=A7=8D=E0=A6=A5=E0=A6=BE=E0=A6=B7=E0=A6=BC =E0=A6=AB
>>
>>  #: src/cpu/cpu.cpp:787
>>  #, c-format
>> -msgid "power or cpu_frequecny event returned no state?\n"
>> -msgstr "=E0=A6=95=E0=A7=8D=E0=A6=B7=E0=A6=AE=E0=A6=A4=E0=A6=BE =E0=A6=
=AC=E0=A6=BE cpu_frequecny =E0=A6=87=E0=A6=AD=E0=A7=87=E0=A6=A8=E0=A7=8D=E0=
=A6=9F =E0=A6=95=E0=A7=8B=E0=A6=A8=E0=A6=93 =E0=A6=85=E0=A6=AC=E0=A6=B8=E0=
=A7=8D=E0=A6=A5=E0=A6=BE=E0=A6=B7=E0=A6=BC =E0=A6=AB=E0=A6=BF=E0=A6=B0=E0=
=A7=87 =E0=A6=86=E0=A6=B8=E0=A7=87=E0=A6=A8=E0=A6=BF?\n"
>> +msgid "power or cpu_frequency event returned no state?\n"
>> +msgstr "=E0=A6=95=E0=A7=8D=E0=A6=B7=E0=A6=AE=E0=A6=A4=E0=A6=BE =E0=A6=
=AC=E0=A6=BE cpu_frequency =E0=A6=87=E0=A6=AD=E0=A7=87=E0=A6=A8=E0=A7=8D=E0=
=A6=9F =E0=A6=95=E0=A7=8B=E0=A6=A8=E0=A6=93 =E0=A6=85=E0=A6=AC=E0=A6=B8=E0=
=A7=8D=E0=A6=A5=E0=A6=BE=E0=A6=B7=E0=A6=BC =E0=A6=AB=E0=A6=BF=E0=A6=B0=E0=
=A7=87 =E0=A6=86=E0=A6=B8=E0=A7=87=E0=A6=A8=E0=A6=BF?\n"
>>
>>  #: src/cpu/cpu_linux.cpp:92
>>  msgid "C0 polling"
>> diff --git a/po/ca.po b/po/ca.po
>> index b9088e1..cbd4dda 100644
>> --- a/po/ca.po
>> +++ b/po/ca.po
>> @@ -88,8 +88,8 @@ msgstr "l'event cpu_idle no ha retornat cap estat?\n"
>>
>>  #: src/cpu/cpu.cpp:940
>>  #, c-format
>> -msgid "power or cpu_frequecny event returned no state?\n"
>> -msgstr "els events power o cpu_frequecny no han retornat cap estat?\n"
>> +msgid "power or cpu_frequency event returned no state?\n"
>> +msgstr "els events power o cpu_frequency no han retornat cap estat?\n"
>>
>>  #: src/cpu/cpu_linux.cpp:92
>>  msgid "C0 polling"
>> diff --git a/po/cs_CZ.po b/po/cs_CZ.po
>> index f27b538..7a0f28a 100644
>> --- a/po/cs_CZ.po
>> +++ b/po/cs_CZ.po
>> @@ -86,9 +86,9 @@ msgstr "cpu_idle ud=C3=A1lost nevr=C3=A1tila stav?\n"
>>
>>  #: src/cpu/cpu.cpp:940
>>  #, c-format
>> -msgid "power or cpu_frequecny event returned no state?\n"
>> +msgid "power or cpu_frequency event returned no state?\n"
>>  msgstr ""
>> -"power nebo cpu_frequecny ud=C3=A1lost nevr=C3=A1tila stav?\n"
>> +"power nebo cpu_frequency ud=C3=A1lost nevr=C3=A1tila stav?\n"
>>  "\n"
>>
>>  #: src/cpu/cpu_linux.cpp:92
>> diff --git a/po/de_DE.po b/po/de_DE.po
>> index 1b95e96..3e3951f 100644
>> --- a/po/de_DE.po
>> +++ b/po/de_DE.po
>> @@ -87,7 +87,7 @@ msgstr ""
>>
>>  #: src/cpu/cpu.cpp:940
>>  #, c-format
>> -msgid "power or cpu_frequecny event returned no state?\n"
>> +msgid "power or cpu_frequency event returned no state?\n"
>>  msgstr ""
>>
>>  #: src/cpu/cpu_linux.cpp:92
>> diff --git a/po/en_GB.po b/po/en_GB.po
>> index 37659a2..9b76958 100644
>> --- a/po/en_GB.po
>> +++ b/po/en_GB.po
>> @@ -86,7 +86,7 @@ msgstr ""
>>
>>  #: src/cpu/cpu.cpp:940
>>  #, c-format
>> -msgid "power or cpu_frequecny event returned no state?\n"
>> +msgid "power or cpu_frequency event returned no state?\n"
>>  msgstr ""
>>
>>  #: src/cpu/cpu_linux.cpp:92
>> diff --git a/po/en_US.po b/po/en_US.po
>> index 812a78f..8e74ed8 100644
>> --- a/po/en_US.po
>> +++ b/po/en_US.po
>> @@ -86,7 +86,7 @@ msgstr ""
>>
>>  #: src/cpu/cpu.cpp:940
>>  #, c-format
>> -msgid "power or cpu_frequecny event returned no state?\n"
>> +msgid "power or cpu_frequency event returned no state?\n"
>>  msgstr ""
>>
>>  #: src/cpu/cpu_linux.cpp:92
>> diff --git a/po/es_ES.po b/po/es_ES.po
>> index 49edcb1..f406e1d 100644
>> --- a/po/es_ES.po
>> +++ b/po/es_ES.po
>> @@ -85,7 +85,7 @@ msgstr ""
>>
>>  #: src/cpu/cpu.cpp:940
>>  #, c-format
>> -msgid "power or cpu_frequecny event returned no state?\n"
>> +msgid "power or cpu_frequency event returned no state?\n"
>>  msgstr ""
>>
>>  #: src/cpu/cpu_linux.cpp:92
>> diff --git a/po/hi.po b/po/hi.po
>> index 9fa4b4a..39c7cb6 100644
>> --- a/po/hi.po
>> +++ b/po/hi.po
>> @@ -100,7 +100,7 @@ msgstr "cpu_idle =E0=A4=95=E0=A5=80 =E0=A4=98=E0=A4=
=9F=E0=A4=A8=E0=A4=BE =E0=A4=A8=E0=A5=87 =E0=A4=95=E0=A4=BF=E0=A4=B8=E0=A5=
=80 =E0=A4=AD=E0=A5=80 =E0=A4=A4=E0=A4=B0=E0=A5=80=E0=A4=95=E0=A5=87
>>
>>  #: src/cpu/cpu.cpp:787
>>  #, c-format
>> -msgid "power or cpu_frequecny event returned no state?\n"
>> +msgid "power or cpu_frequency event returned no state?\n"
>>  msgstr "=E0=A4=B6=E0=A4=95=E0=A5=8D=E0=A4=A4=E0=A4=BF =E0=A4=AF=E0=A4=
=BE =E0=A4=B8=E0=A5=80=E0=A4=AA=E0=A5=80=E0=A4=AF=E0=A5=82_=E0=A4=86=E0=A4=
=B5=E0=A5=83=E0=A4=A4=E0=A4=BF =E0=A4=95=E0=A5=80 =E0=A4=98=E0=A4=9F=E0=A4=
=A8=E0=A4=BE =E0=A4=A8=E0=A5=87 =E0=A4=95=E0=A4=BF=E0=A4=B8=E0=A5=80 =E0=A4=
=AD=E0=A5=80 =E0=A4=A4=E0=A4=B0=E0=A5=80=E0=A4=95=E0=A5=87 =E0=A4=95=E0=A5=
=80 =E0=A4=B8=E0=A5=8D=E0=A4=A5=E0=A4=BF=E0=A4=A4=E0=A4=BF =E0=A4=A8=E0=A4=
=B9=E0=A5=80=E0=A4=82 =E0=A4=B2=E0=A5=8B=E0=A4=9F=E0=A4=BE=E0=A4=AF=E0=A5=
=80 =E0=A4=B9=E0=A5=88?\n"
>>
>>  #: src/cpu/cpu_linux.cpp:92
>> diff --git a/po/hu_HU.po b/po/hu_HU.po
>> index 031cdf6..c0800d0 100644
>> --- a/po/hu_HU.po
>> +++ b/po/hu_HU.po
>> @@ -87,7 +87,7 @@ msgstr "a CPU =C3=BCresj=C3=A1ratesem=C3=A9ny nem adot=
t vissza =C3=A1llapotot?\n"
>>
>>  #: src/cpu/cpu.cpp:940
>>  #, c-format
>> -msgid "power or cpu_frequecny event returned no state?\n"
>> +msgid "power or cpu_frequency event returned no state?\n"
>>  msgstr ""
>>  "a teljes=C3=ADtm=C3=A9ny vagy CPU frekvencia esem=C3=A9ny nem adott vi=
ssza =C3=A1llapotot?\n"
>>
>> diff --git a/po/id_ID.po b/po/id_ID.po
>> index 13b1c63..cb5b9e9 100644
>> --- a/po/id_ID.po
>> +++ b/po/id_ID.po
>> @@ -85,7 +85,7 @@ msgstr "kejadian cpu_idle tak mengembalikan keadaan?\n"
>>
>>  #: src/cpu/cpu.cpp:940
>>  #, c-format
>> -msgid "power or cpu_frequecny event returned no state?\n"
>> +msgid "power or cpu_frequency event returned no state?\n"
>>  msgstr "kejadian power atau cpu_frequency tak mengembalikan keadaan?\n"
>>
>>  #: src/cpu/cpu_linux.cpp:92
>> diff --git a/po/lt.po b/po/lt.po
>> index e4f37be..86af0b8 100644
>> --- a/po/lt.po
>> +++ b/po/lt.po
>> @@ -100,7 +100,7 @@ msgstr "cpu_idle =C4=AFvykis negr=C4=85=C5=BEino b=
=C5=ABsenos?\\n"
>>
>>  #: src/cpu/cpu.cpp:787
>>  #, c-format
>> -msgid "power or cpu_frequecny event returned no state?\n"
>> +msgid "power or cpu_frequency event returned no state?\n"
>>  msgstr "power arba cpu_frequency =C4=AFvykis negr=C4=85=C5=BEino b=C5=
=ABsenos?\\n"
>>
>>  #: src/cpu/cpu_linux.cpp:92
>> diff --git a/po/nl_NL.po b/po/nl_NL.po
>> index 59cbab8..16d48c8 100644
>> --- a/po/nl_NL.po
>> +++ b/po/nl_NL.po
>> @@ -86,7 +86,7 @@ msgstr ""
>>
>>  #: src/cpu/cpu.cpp:940
>>  #, c-format
>> -msgid "power or cpu_frequecny event returned no state?\n"
>> +msgid "power or cpu_frequency event returned no state?\n"
>>  msgstr ""
>>
>>  #: src/cpu/cpu_linux.cpp:92
>> diff --git a/po/pl_PL.po b/po/pl_PL.po
>> index 8667a63..0b3cd71 100644
>> --- a/po/pl_PL.po
>> +++ b/po/pl_PL.po
>> @@ -101,7 +101,7 @@ msgstr ""
>>
>>  #: src/cpu/cpu.cpp:787
>>  #, c-format
>> -msgid "power or cpu_frequecny event returned no state?\n"
>> +msgid "power or cpu_frequency event returned no state?\n"
>>  msgstr "zdarzenie power lub cpu_frequency zwr=C3=B3ci=C5=82o no state?\=
\n"
>>
>>  #: src/cpu/cpu_linux.cpp:92
>> diff --git a/po/powertop.pot b/po/powertop.pot
>> index d541baa..d668255 100644
>> --- a/po/powertop.pot
>> +++ b/po/powertop.pot
>> @@ -99,7 +99,7 @@ msgstr ""
>>
>>  #: src/cpu/cpu.cpp:787
>>  #, c-format
>> -msgid "power or cpu_frequecny event returned no state?\n"
>> +msgid "power or cpu_frequency event returned no state?\n"
>>  msgstr ""
>>
>>  #: src/cpu/cpu_linux.cpp:92
>> diff --git a/po/zh_CN.po b/po/zh_CN.po
>> index 1deae42..07787f6 100644
>> --- a/po/zh_CN.po
>> +++ b/po/zh_CN.po
>> @@ -100,7 +100,7 @@ msgstr "CPU =E7=A9=BA=E9=97=B2=E4=BA=8B=E4=BB=B6=E6=
=B2=A1=E6=9C=89=E8=BF=94=E5=9B=9E=E7=8A=B6=E6=80=81=EF=BC=9F\n"
>>
>>  #: src/cpu/cpu.cpp:787
>>  #, c-format
>> -msgid "power or cpu_frequecny event returned no state?\n"
>> +msgid "power or cpu_frequency event returned no state?\n"
>>  msgstr "=E7=94=B5=E9=87=8F=E6=88=96=E8=80=85 CPU =E9=A2=91=E7=8E=87=E4=
=BA=8B=E4=BB=B6=E6=B2=A1=E6=9C=89=E8=BF=94=E5=9B=9E=E7=8A=B6=E6=80=81=EF=BC=
=9F\n"
>>
>>  #: src/cpu/cpu_linux.cpp:92
>> diff --git a/po/zh_TW.po b/po/zh_TW.po
>> index c93ff67..cd4dd9f 100644
>> --- a/po/zh_TW.po
>> +++ b/po/zh_TW.po
>> @@ -85,8 +85,8 @@ msgstr "cpu_idle =E4=BA=8B=E4=BB=B6=E6=B2=92=E6=9C=89=
=E5=82=B3=E5=9B=9E=E7=8B=80=E6=85=8B=EF=BC=9F\n"
>>
>>  #: src/cpu/cpu.cpp:940
>>  #, c-format
>> -msgid "power or cpu_frequecny event returned no state?\n"
>> -msgstr "power =E6=88=96 cpu_frequecny =E4=BA=8B=E4=BB=B6=E6=B2=92=E6=9C=
=89=E5=82=B3=E5=9B=9E=E7=8B=80=E6=85=8B=EF=BC=9F\n"
>> +msgid "power or cpu_frequency event returned no state?\n"
>> +msgstr "power =E6=88=96 cpu_frequency =E4=BA=8B=E4=BB=B6=E6=B2=92=E6=9C=
=89=E5=82=B3=E5=9B=9E=E7=8B=80=E6=85=8B=EF=BC=9F\n"
>>
>>  #: src/cpu/cpu_linux.cpp:92
>>  msgid "C0 polling"
>> diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
>> index 401bade..6df6d1c 100644
>> --- a/src/cpu/cpu.cpp
>> +++ b/src/cpu/cpu.cpp
>> @@ -808,7 +808,7 @@ void perf_power_bundle::handle_trace_point(void *tra=
ce, int cpunr, uint64_t time
>>
>>               ret =3D pevent_get_field_val(NULL, event, "state", &rec, &=
val, 0);
>>               if (ret < 0) {
>> -                     fprintf(stderr, _("power or cpu_frequecny event re=
turned no state?\n"));
>> +                     fprintf(stderr, _("power or cpu_frequency event re=
turned no state?\n"));
>>                       exit(-1);
>>               }
>>
>
> Paul - the only thing you need to change is the .cpp file.
>
> Kristen
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop

--===============6745558104055438262==--

