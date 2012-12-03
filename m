Content-Type: multipart/mixed; boundary="===============3650718942915995350=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH 1/3] Suppress compiler warnings on write()
Date: Mon, 03 Dec 2012 08:14:46 -0800
Message-ID: <50BCCFF6.8070608@linux.intel.com>
In-Reply-To: 1354547600-1743-1-git-send-email-namhyung@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3650718942915995350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/3/2012 7:13 AM, Namhyung Kim wrote:
> -		write(fd, buffer, 64*1024);
> +		if (write(fd, buffer, 64*1024))
> +			/* make gcc silent */;
>   		fdatasync(fd);

I'm sorry, but no.
This is waaaaaaaaaaay worse than leaving the compiler warning.
The compiler warning is real, and is a reminder that we need to improve the=
 code
"just make it shut up" patches are a really bad idea, and this is the perfe=
ct example of that.


--===============3650718942915995350==--

