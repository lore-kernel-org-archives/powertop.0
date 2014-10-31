Content-Type: multipart/mixed; boundary="===============2576736885016437817=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] reserved identifier violation
Date: Thu, 30 Oct 2014 18:38:25 -0700
Message-ID: <63301.10.255.85.192.1414719505.squirrel@linux.intel.com>
In-Reply-To: 5442C161.4020107@users.sourceforge.net
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2576736885016437817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> Hello,
>
> I would like to point out that identifiers like
> "__INCLUDE_GUARD_DISPLAY_H_" and
> "_INCLUDE_GUARD_AHCI_H" do not fit to the expected naming convention of
> the C++
> language standard.
> Would you like to adjust your selection for unique names?
> https://www.securecoding.cert.org/confluence/display/cplusplus/DCL32-CPP.=
+Do+not+declare+or+define+a+reserved+identifier#DCL32-CPP.Donotdeclareordef=
ineareservedidentifier-NoncompliantCodeExample%28HeaderGuard%29
>
> https://github.com/fenrus75/powertop/blob/54956f7407c0e369665cd9712a189f6=
01c6ab545/src/display.h#L25
> https://github.com/fenrus75/powertop/blob/d7455ba1d0125efed4780a2114ef661=
65d0cadc1/src/devices/ahci.h#L25
>
> Regards,
> Markus
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>



Hi Markus,

The reference link is not working.  If you feel very strongly about this
please send your patches to the mailing list.

Thank you,
Alexandra.

--===============2576736885016437817==--

