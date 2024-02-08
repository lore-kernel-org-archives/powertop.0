Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779E9374F0
	for <powertop@lists.linuxfoundation.org>; Thu,  8 Feb 2024 19:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707420411; cv=none; b=JMqhuva1uHYqLaUELTKGlraje0XZm4P8PwhvNHENCyhALquLYIPrTIs4NlUhPFFwSZwtgPATxYXVqoZ7eA6IrIRteGTIp29yRa7ZMvZaenoR6ovJEsnQXFtg1MQsgqYZaiYR8zF/XwTQV0hku5Vuw3U0j1eoNthh4zq1n6Fs6sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707420411; c=relaxed/simple;
	bh=XAOUUws/NBJ0Z7xyNKEL6kgZpabOcYtC8T0X+p1KSBM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mLRpb1hTebJOk8/uecVju4E7GFb/Q0Dl5sZM6qTt2ocHwDeyl5wMjVa9QbG7Voz7RmQ2/Y+Dyb+4GXWX61Pqy/tp88Ddm9I29HO5lq16OfjyxgoFjLv78DrURK0myI2NYeqy0lkLW7U/uInEFSCp0r51CF5InrWX8G0mY3AQ8Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kMu3NsQf; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kMu3NsQf"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA60F4031C
	for <powertop@lists.linuxfoundation.org>; Thu,  8 Feb 2024 19:26:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -7.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CvbQtSdUj1EZ for <powertop@lists.linuxfoundation.org>;
	Thu,  8 Feb 2024 19:26:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=konstantin@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 292FF40370
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 292FF40370
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=kMu3NsQf
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 292FF40370
	for <powertop@lists.linuxfoundation.org>; Thu,  8 Feb 2024 19:26:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B429261EFC;
	Thu,  8 Feb 2024 19:26:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C42C433F1;
	Thu,  8 Feb 2024 19:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707420406;
	bh=XAOUUws/NBJ0Z7xyNKEL6kgZpabOcYtC8T0X+p1KSBM=;
	h=Date:From:To:Subject:From;
	b=kMu3NsQfFQygxwGRLXGGL0W2mJ4FmYwq2ugicwSzTmF0+Ba4YhA8MvD82MNggCVXj
	 rCH2iyvCvNiyXp5mhn6Y4JyY4jVa1wkxh/ODrOL8TGQwfHVTDBXSkVPCgsNxKNxE5O
	 ojaLKe6+D9NSHgVpYSxLjm7+mKMLqnZ/CRAa3cXQ=
Date: Thu, 8 Feb 2024 14:26:42 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: powertop@lists.linuxfoundation.org
Subject: PSA: this list has been migrated to lists.linux.dev
Message-ID: <20240208-cordial-alluring-perch-a73d53@lemur>
Precedence: bulk
X-Mailing-List: powertop@lists.linux.dev
List-Id: <powertop.lists.linux.dev>
List-Subscribe: <mailto:powertop+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:powertop+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

Per previous discussions, this mailing list has been migrated to live on the
subspace.kernel.org system:

1. The new canonical list address is powertop@lists.linux.dev

2. *The old address will continue to work* for the foreseeable future, so any
   existing conversations can continue and any new messages sent to the old
   list address will be properly delivered to all subscribers.

3. All members have been automatically subscribed to the new list, so no
   action is required on anyone's part to keep receiving list mail.

4. The list archives will be imported and available on
   lore.kernel.org/powertop in the near future.

5. The List-ID header has changed, regardless to which address the message is
   sent:

   before: List-Id: <powertop.lists.linuxfoundation.org>
    after: List-Id: <powertop.lists.linux.dev>

   You will need to update your filtering rules if you filter based on the
   contents of that header.

6. The mailman footer will no longer be added to message bodies and the
   subject will no longer be modified to insert [listname] (because this
   violates DMARC).

7. Subscribing and unsubscribing is now done using mlmmj commands, see
   https://subspace.kernel.org/subscribing.html for more info.

Please let me know if you have any concerns or comments.

Best regards,
-K
