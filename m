Content-Type: multipart/mixed; boundary="===============6337127573922503670=="
MIME-Version: 1.0
From: Kok, Auke-jan H <auke-jan.h.kok at intel.com>
Subject: Re: [Powertop] Powertop --claibrate doesn't run
Date: Wed, 13 Feb 2013 10:59:01 -0800
Message-ID: <CABsxX9JpmnG57_fphmNviAyY4mq9k_z7wfbbA_1gYTrxrwyXYw@mail.gmail.com>
In-Reply-To: 1360781220.12424.YahooMailNeo@web122502.mail.ne1.yahoo.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6337127573922503670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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

--===============6337127573922503670==--

