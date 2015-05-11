Content-Type: multipart/mixed; boundary="===============8332822483370847718=="
MIME-Version: 1.0
From: Jaroslav Skarvada <jskarvad at redhat.com>
Subject: Re: [Powertop] PowerTop pread cpu0 0xe8 : Input/output error
Date: Mon, 11 May 2015 10:40:59 -0400
Message-ID: <224014853.15553752.1431355259007.JavaMail.zimbra@redhat.com>
In-Reply-To: CAEBRvAfTcVahmVk_GcfEPWw-Jw4cOGh6gFUd_xHyvyT3YBGibg@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8332822483370847718==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

----- Original Message -----
> Hello,
> =

> I am trying to execute power top on my Virtual Machine with specification=
 OS
> 6.5 Scientific Linux and I get the following message : pread cpu0 0xe8 :
> input/output error. The powertop version i am using is 2.3. I have tried
> running older versions like 1.11 which was running properly but as I red
> 1.11 measures cpu wake ups and not energy consumption as the 2.3. Any idea
> what the problem may be and how can I solve it ?
> =

> =

> Best Regards,
> =

> Stefanos Georgiou
> =

> BSc in Network and System Programming
> Computer Science Department
> University of Cyprus
> =

> MSc in Pervasive Computing and Communications
> for Sustainable Development (PERCCOM)
> Joint Master Degree
> University of Lorraine, Lappeenranta, Lulea, ITMO Saint-Petersburg
> =

> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
> =


Hi,

AFAIK the problem is that virtual machines don't correctly implement
Machine State Registers (MSRs) or don't implement them at all.
I tried to address the problem by patch sent earlier allowing PowerTOP
to continue running in virtualized environments.

It will probably not resolve your problem with energy consumption
measurement, because there is usually no usable ACPI battery in the
virtual environments

thanks & regards

Jaroslav

--===============8332822483370847718==--

