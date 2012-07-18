Content-Type: multipart/mixed; boundary="===============2883774277349515400=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Make libpci dependency optional
Date: Wed, 18 Jul 2012 08:30:33 -0700
Message-ID: <5006D699.5020300@linux.intel.com>
In-Reply-To: 1342623237-30526-1-git-send-email-i.zhbanov@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2883774277349515400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7/18/2012 7:53 AM, Igor Zhbanov wrote:
> +#ifndef DISABLE_PCI
>  	end_pci_access();
> +#endif /* !DISABLE_PCI */

this is the wrong way to do this.
the right way (similar to how the kernel does this, and earlier patches
to this list for this exact same thing did it), is to provide a dummy
end_pci_access().
randomly sprinking #ifdef's all over the code is a really bad idea.


--===============2883774277349515400==--

