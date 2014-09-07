Content-Type: multipart/mixed; boundary="===============4292118274162377570=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH v3 11/15] fix couple typos
Date: Sun, 07 Sep 2014 22:27:14 +0100
Message-ID: <1410125238-29600-12-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1410125238-29600-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4292118274162377570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Found with misspell-check.

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 src/tuning/nl80211.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/tuning/nl80211.h b/src/tuning/nl80211.h
index e4a8839..83b0514 100644
--- a/src/tuning/nl80211.h
+++ b/src/tuning/nl80211.h
@@ -828,7 +828,7 @@ enum nl80211_commands {
  *	bit. Depending on which antennas are selected in the bitmap, 802.11n
  *	drivers can derive which chainmasks to use (if all antennas belonging to
  *	a particular chain are disabled this chain should be disabled) and if
- *	a chain has diversity antennas wether diversity should be used or not.
+ *	a chain has diversity antennas whether diversity should be used or not.
  *	HT capabilities (STBC, TX Beamforming, Antenna selection) can be
  *	derived from the available chains after applying the antenna mask.
  *	Non-802.11n drivers can derive wether to use diversity or not.
@@ -855,7 +855,7 @@ enum nl80211_commands {
  * @__NL80211_ATTR_AFTER_LAST: internal use
  */
 enum nl80211_attrs {
-/* don't change the order or add anything inbetween, this is ABI! */
+/* don't change the order or add anything between, this is ABI! */
 	NL80211_ATTR_UNSPEC,
 =

 	NL80211_ATTR_WIPHY,
-- =

2.1.0


--===============4292118274162377570==--

