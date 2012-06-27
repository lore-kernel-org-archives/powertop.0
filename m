Content-Type: multipart/mixed; boundary="===============4169763364506432357=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [bugreport] crash on powertop --debug --html=file.html
Date: Wed, 27 Jun 2012 06:57:49 -0700
Message-ID: <4FEB115D.30105@linux.intel.com>
In-Reply-To: 20120627080628.GB2996@swordfish.datadirect.datadirectnet.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4169763364506432357==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 6/27/2012 1:06 AM, Sergey Senozhatsky wrote:
>> (i=3D0x875720, j=3D0x211)
> =

> Hm, it seems pretty unlikely that std::allocator would allocate anything
> on such a low address. It rather expected i and j to be somewhere in
> 	-/+ N * sizeof(struct)
> range.
> =

> So, there is something we don't known about your system, or we have
> memory corruption which I can't find at the moment.

maybe Jan Simon can run powertop in valgrind to check ?

> =

> =

> 	-ss
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
> =




--===============4169763364506432357==--

