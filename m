Content-Type: multipart/mixed; boundary="===============6639872730400521121=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [pull] pending patches
Date: Sun, 13 Jan 2013 23:10:36 +0300
Message-ID: <20130113201036.GA2715@swordfish>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6639872730400521121==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello, Chris
Hope you're fine.

Did you have any chance to take a look at pending patches?
A short list is below (hope, I didn't miss anything):

Ivan Shapovalov (10):
   Fix includes: do not include intel_cpus.h inside cpu.h
   Deduplication: move is_turbo() function to lib
   Deduplication: move all instances of account_freq() to abstract_cpu::acc=
ount_freq()
   Deduplication: remove nhm_cpu::account_freq() almost identical to abstra=
ct_cpu::account_freq()
   Deduplication: remove nhm_{cpu,core,package}::change_effective_frequency=
() identical to cpu_{linux,core,package}::change_effective_frequency()
   Deduplication: merge cpu_{core,linux,package}::change_effective_frequenc=
y() into abstract_cpu::change_effective_frequency()
   Deduplication: remove {cpu,nhm}_core::calculate_freq() identical to abst=
ract_cpu::calculate_freq()
   Deduplication: remove nhm_package::calculate_freq() identical to cpu_pac=
kage::calculate_freq()
   Deduplication: properly merge cpu_package::calculate_freq() into abstrac=
t_cpu::calculate_freq()
   Deduplication: merge go_idle()/go_unidle()/change_freq() overrides into =
abstract_cpu() class


Sergey Senozhatsky (3):
   tab_window: null members on construction
   runtime_pm: register parameters
   parameters: fix uninitialized values in param/result getters


Thomas Waldecker/Igor Zhbanov (1):
   csstoh.sh shell script fixes cross compiling issues


	-ss

--===============6639872730400521121==--

