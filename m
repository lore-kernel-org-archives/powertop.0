Content-Type: multipart/mixed; boundary="===============1071388973231748583=="
MIME-Version: 1.0
From: Colin King <colin.king at canonical.com>
Subject: [Powertop] [PATCH 4/4] tuning/nl80211.h: Fix a few minor typos in
 comments.
Date: Sat, 22 Sep 2012 19:33:09 +0100
Message-ID: <1348338789-16252-5-git-send-email-colin.king@canonical.com>
In-Reply-To: 1348338789-16252-1-git-send-email-colin.king@canonical.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1071388973231748583==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Colin Ian King <colin.king(a)canonical.com>

descripton =3D=3D> description
pased =3D=3D> passed
inital =3D=3D> initial

Signed-off-by: Colin Ian King <colin.king(a)canonical.com>
---
 src/tuning/nl80211.h |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/tuning/nl80211.h b/src/tuning/nl80211.h
index b37148a..e4a8839 100644
--- a/src/tuning/nl80211.h
+++ b/src/tuning/nl80211.h
@@ -839,7 +839,7 @@ enum nl80211_commands {
  *	This can be used to mask out antennas which are not attached or should
  *	not be used for receiving. If an antenna is not selected in this bitmap
  *	the hardware should not be configured to receive on this antenna.
- *	For a more detailed descripton see @NL80211_ATTR_WIPHY_ANTENNA_TX.
+ *	For a more detailed description see @NL80211_ATTR_WIPHY_ANTENNA_TX.
  *
  * @NL80211_ATTR_MCAST_RATE: Multicast tx rate (in 100 kbps) for IBSS
  *
@@ -1367,7 +1367,7 @@ enum nl80211_bitrate_attr {
  *	802.11 country information element with regulatory information it
  *	thinks we should consider. cfg80211 only processes the country
  *	code from the IE, and relies on the regulatory domain information
- *	structure pased by userspace (CRDA) from our wireless-regdb.
+ *	structure passed by userspace (CRDA) from our wireless-regdb.
  *	If a channel is enabled but the country code indicates it should
  *	be disabled we disable the channel and re-enable it upon disassociation.
  */
@@ -1545,7 +1545,7 @@ enum nl80211_mntr_flags {
  * @NL80211_MESHCONF_RETRY_TIMEOUT: specifies the initial retry timeout in
  * millisecond units, used by the Peer Link Open message
  *
- * @NL80211_MESHCONF_CONFIRM_TIMEOUT: specifies the inital confirm timeout=
, in
+ * @NL80211_MESHCONF_CONFIRM_TIMEOUT: specifies the initial confirm timeou=
t, in
  * millisecond units, used by the peer link management to close a peer link
  *
  * @NL80211_MESHCONF_HOLDING_TIMEOUT: specifies the holding timeout, in
-- =

1.7.10.4


--===============1071388973231748583==--

