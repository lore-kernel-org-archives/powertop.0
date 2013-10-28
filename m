Content-Type: multipart/mixed; boundary="===============4333595621369309901=="
MIME-Version: 1.0
From: =?utf-8?q?Jes=C3=BAs_D=C3=ADaz_Vico_=3Cjesus=2Ediaz=2Evico_at_gmail=2Ecom?=
 =?utf-8?q?=3E?=
Subject: [Powertop] How does powertop deal with multiple executions
Date: Tue, 29 Oct 2013 00:37:39 +0100
Message-ID: <526EF543.3000503@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4333595621369309901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I'm trying to estimate the power consumption (besides some other =

properties) of a custom program. During my tests, I execute my program =

several times (it is not a background process) with powertop running. My =

doubt is: how does powertop deal with these multiple executions?

I'd guess that it averages over the number of executions, because I'm =

obtaining very similar power consumption measurements for both 500 and =

5000 executions of my program (335 mW and 364 mW, respectively). Still, =

there is the possibility that powertop only keeps the estimation =

corresponding to the last execution...

Thanks.

--===============4333595621369309901==--

