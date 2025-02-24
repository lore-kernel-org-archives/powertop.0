Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F492AF07
	for <powertop@lists.linux.dev>; Mon, 24 Feb 2025 01:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740360369; cv=none; b=VUP/F/V0dGzKEDQrsWeSipd19McCxF7YWKotXCbrxyuphbSNaU3N1iC4vZW84EsBgLYVC1NJVcz7BhUYbLAUl58fYwmveHCnxZ/QpoaOOJcXzYxTgM+G/nMdChLvhtCvpU9hDv2kSPVfEBx2PJ9eJjY4obgBwDtOaUcLs9GD6u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740360369; c=relaxed/simple;
	bh=Nx/yxHKICY+wr4ojakWfuqlTG9m0d6+RxWg1NIDtUYE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mNSXoRrzDANiewi+Lh9JhPF/scW+cLHbm4FzreXvgmIwi4yS8/BS8zK1rRF8yeq9/y1FsFRjyGUZGRCXJiAFGtZ4ZD4mOl41rSofsrZyyOO2v8zyTvgKgWxIXam92USRVzjdExM5ROFt+/Xe9FX3yoThkyxRqHHIz0yT94iXe8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VVhQY2Yo; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wrdBscQB; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VVhQY2Yo";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wrdBscQB"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Z1NNP5GySz9svH
	for <powertop@lists.linux.dev>; Mon, 24 Feb 2025 02:25:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1740360357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xLRmOrHKspEFaKYEi0o5POhbzz5dG50/otcF9AUxZls=;
	b=VVhQY2YoirgCqRElbaEn9o062S4AzfwZwo3iLgkOS3/Jcujqk62WZVjgRRyEUHcTVGdV2p
	Mc75YxSt6ZxNoQuPKGa1Rusq46IBtzxbmjxuSzisJjTHtoFZwu7p6p1naiGBneUJPCt3DH
	9bBub3jWkNCvCnSIfaFv7+OqY2A/8Vf0U809drEeZIW5D/D7QA6LKlXHU4ogTG2PMSTehy
	iFffwmADAfS4LDU45VgwhSVa2744xFFouES3D8BLwbwSm2yIHBBPI3LgAaHKNOQRhVK/zl
	A4SuU/QlM1z/bfe9Er78EptchVCBsgzqC1RKdYET9wVvscCEYbN8QmjNoGZ3DA==
Date: Mon, 24 Feb 2025 02:25:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1740360355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xLRmOrHKspEFaKYEi0o5POhbzz5dG50/otcF9AUxZls=;
	b=wrdBscQBhgFwFFlkcmYE1YOiP5hi2W5LIQ210MHR4vBrqDBKYdlDC21zGISwdtOXNaYFDu
	KJPljj4sjsiQiwk/SlreV+85j6XnH5Mha3eOgI9omgiEsYsNEOicZYVKRvRhfS/E5SebCy
	HYI96DI7hbKNRSSxtfka5dl7lu9HjOiDybmrqJeFrOi0ugjQM3ndXClXYcFo4dfzh61b0a
	gLiSV50GtuTZVTlTsbmnDaoIYZt8m7GWi3VEoG5F2r19QD1GKKTCLemy+d51uMFWqi4uLl
	/gb7pfM6YN//yrnPFeVHZnLY7TGiY+hUWKesy/ShsviFIRTDl0t/eNUgbR8l6w==
From: Anthony Ruhier <aruhier@mailbox.org>
To: powertop@lists.linux.dev
Cc: Anthony Ruhier <aruhier@mailbox.org>
Subject: [PATCH] Fix battery runtime estimation with negative sysfs values
Message-ID: <20250224-patch-sysfs-v1-1-bdb49d266f85@mailbox.org>
X-B4-Tracking: v=1; b=H4sIANLJu2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMT3YLEkuQM3eLK4rRiXXMTC8u0lMQkA8PERCWgjoKi1LTMCrBp0bG
 1tQBQzszaXQAAAA==
X-Change-ID: 20250224-patch-sysfs-7489fdab01aa
X-Developer-Signature: v=1; a=openpgp-sha256; l=1759; i=aruhier@mailbox.org;
 h=from:subject:message-id; bh=c4jMwdo3ltGG2UPyPKgs1KWGRHt+KB8j0tak4+8+84c=;
 b=owGbwMvMwCVW2Nrw47jsO3/G02pJDOm7T176uEta4uFT0XspM6Zv3fxik8qXKfuPJhjPbFsW8
 Evk2AfR3o5SFgYxLgZZMUWWkv1RwrdVOu47rF3OAjOHlQlkCAMXpwBMRG01w//keflzb9it3uXp
 FH361BHxRXJX95yYWDzj66o5ehXvHXY3MfxPtVup8uGAv03aXr1ICTb+95INjo/qQ0K3rq+QuqC
 dYcUFAA==
X-Developer-Key: i=aruhier@mailbox.org; a=openpgp;
 fpr=F4A378DD8D494AE48EBA554CB00FBC7D08D231D9
Precedence: bulk
X-Mailing-List: powertop@lists.linux.dev
List-Id: <powertop.lists.linux.dev>
List-Subscribe: <mailto:powertop+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:powertop+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: stdmkubxuuetkt79t1sy4hgzws15bprc
X-MBO-RS-ID: 321f491dc90184712ca

Some drivers (example: qualcomm-battmgr, present on Snapdragon X1
laptops) expose the current_now and power_now values in sysfs as
negative int when the device is discharging, positive when charging.

This breaks the battery runtime estimation in Powertop, as it expects a
uint for power_now.

Change the battery module to use the absolute values of current_now and
power_now.

---
Signed-off-by: Anthony Ruhier <aruhier@mailbox.org>
---
 src/measurement/sysfs.cpp | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/src/measurement/sysfs.cpp b/src/measurement/sysfs.cpp
index c5a7a12d08db2f3cea10746d16591e28465c610c..6cc7f433910d35edf7e9f2c2d04c107c27ec797a 100644
--- a/src/measurement/sysfs.cpp
+++ b/src/measurement/sysfs.cpp
@@ -75,8 +75,10 @@ bool sysfs_power_meter::set_rate_from_power()
 	if (!get_sysfs_attr("power_now", &power))
 		return false;

-	/* µW to W */
-	rate = power / 1000000.0;
+	/* µW to W
+	 * Some drivers (example: Qualcomm) exposes use a negative value when
+	 * discharging, positive value when charging, so use the absolute value. */
+	rate = std::abs(power) / 1000000.0;
 	return true;
 }

@@ -89,8 +91,10 @@ bool sysfs_power_meter::set_rate_from_current(double voltage)

 	/* current: µA
 	 * voltage: V
-	 * rate: W */
-	rate = (current / 1000000.0) * voltage;
+	 * rate: W
+	 * Documentation ABI allows a negative value when discharging, positive
+	 * value when charging, so use the absolute value. */
+	rate = (std::abs(current) / 1000000.0) * voltage;
 	return true;
 }


---
base-commit: 9beafe3bd5e9d4c6cf2596dacdf6ab9c9be0c85e
change-id: 20250224-patch-sysfs-7489fdab01aa

Best regards,
--
Anthony Ruhier <aruhier@mailbox.org>
