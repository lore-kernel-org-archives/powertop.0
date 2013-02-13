Content-Type: multipart/mixed; boundary="===============0986144987177856007=="
MIME-Version: 1.0
From: don rhummy <donrhummy at yahoo.com>
Subject: Re: [Powertop] Powertop --claibrate doesn't run
Date: Wed, 13 Feb 2013 11:30:48 -0800
Message-ID: <1360783848.47238.YahooMailNeo@web142605.mail.bf1.yahoo.com>
In-Reply-To: CABsxX9JpmnG57_fphmNviAyY4mq9k_z7wfbbA_1gYTrxrwyXYw@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0986144987177856007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



Thanks!

That's helpful for a lot of things!

I believe I have figured otu the issue:

It appears there was a bug in powertop 2.0:

https://lists.01.org/pipermail/power...ay/000035.html

Upgrading to 2.2 appears to fix the problem (uninstall powertop 2.0 first):

Code:
myuser:~>wget download.opensuse.org/factory/repo/oss/suse/x86_64/powertop-2=
.2-1.1.x86_64.rpm
myuser:~>sudo rpm -i powertop*




________________________________
From: "Kok, Auke-jan H" <auke-jan.h.kok(a)intel.com>
To: Don Rhummy <d6tr6tr(a)yahoo.com> =

Cc: "powertop(a)lists.01.org" <powertop(a)lists.01.org> =

Sent: Wednesday, February 13, 2013 1:59 PM
Subject: Re: [Powertop] Powertop --claibrate doesn't run

On Wed, Feb 13, 2013 at 10:47 AM, Don Rhummy <d6tr6tr(a)yahoo.com> wrote:
> When I run the command "powertop
> --calibrate --debug" it turns my screen black but then does nothing
> (even if I leave it for 30 minutes) and when I touch the mousepad, it
> shows the command simply returned with no output like this:
>
>
> myuser:~>kdesu /usr/sbin/powertop --calibrate --debug
> myuser:~>

things you can try to see if stuff happens:

0) echo $? -> inspect the return value
1) run `time powertop --calibrate --debug` to see if it just doesn't
return really fast
2) run it under strace...
3) inspect if it writes the powertop data to /var/cache...

Cheers,

Auke
_______________________________________________
PowerTop mailing list
PowerTop(a)lists.01.org
https://lists.01.org/mailman/listinfo/powertop

--===============0986144987177856007==--

