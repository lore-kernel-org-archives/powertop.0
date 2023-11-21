Return-Path: <konstantin@linuxfoundation.org>
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23198C0039
 for <powertop@lists.linuxfoundation.org>; Tue, 21 Nov 2023 21:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F391281372
 for <powertop@lists.linuxfoundation.org>; Tue, 21 Nov 2023 21:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F391281372
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=ZROwER2L
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level: 
X-Spam-Status: No, score=-4.401 tagged_above=-999 required=5
 tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
 autolearn=ham autolearn_force=no
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nqC8TFhEFyLO for <powertop@lists.linuxfoundation.org>;
 Tue, 21 Nov 2023 21:15:36 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1344D81373
 for <powertop@lists.linuxfoundation.org>; Tue, 21 Nov 2023 21:15:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1344D81373
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C6522B82446;
 Tue, 21 Nov 2023 21:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F68C433C7;
 Tue, 21 Nov 2023 21:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1700601332;
 bh=9iavgxBAo1E+Ld9MV6Du2w7BorzaliOZTenlLM0V314=;
 h=Date:From:To:Subject:From;
 b=ZROwER2LKTZvv67K+Km1KIS3zQVB7HoXQ6VxICL4ibiIuIRpD34PYYXgdJt1MPSKF
 ikkWDdaBITArIj49CC4hBjD2Pb5VSUUc9Qs/bIAyvZAwI85E1Lv/Wwa83Ai5EJqXaz
 Fz6PPbLhmiZAGjQQrpUs0oRO6h/BymH6QlK1rlmo=
Date: Tue, 21 Nov 2023 16:15:30 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: powertop@lists.linuxfoundation.org
Message-ID: <20231121-porcupine-of-demonic-popularity-53dded@meerkat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Subject: [Powertop] Is the powertop list still active?
X-BeenThere: powertop@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Power analysis tool for Linux. PowerTOP is a Linux tool that helps
 you find those programs that are misbehaving while your computer is idle."
 <powertop.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/powertop>, 
 <mailto:powertop-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/powertop/>
List-Post: <mailto:powertop@lists.linuxfoundation.org>
List-Help: <mailto:powertop-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/powertop>, 
 <mailto:powertop-request@lists.linuxfoundation.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Nov 2023 21:15:37 -0000

Hello, all:

We are currently in the process of decommissioning the mailman-2 system
running on lists.linuxfoundation.org, and we need to either shut down or find
new homes for all lists managed there.

I reviewed the powertop list archives and it looks like there haven't been
many active discussions since 2019. It looks like the development has moved
over to GitHub at https://github.com/fenrus75/powertop

Should we sunset this list, or does it need to be moved and kept alive?

-K
