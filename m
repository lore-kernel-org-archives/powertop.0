Content-Type: multipart/mixed; boundary="===============5552784857158488958=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [RFC] [PATCHv2 03/10] Deduplication: move all
 instances of account_freq() to abstract_cpu::account_freq()
Date: Mon, 24 Dec 2012 13:30:52 +0300
Message-ID: <20121224103052.GA3307@swordfish>
In-Reply-To: 1356304132-3889-4-git-send-email-intelfx100@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5552784857158488958==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hello,

On (12/24/12 03:08), Ivan Shapovalov wrote:
> Trivial: unify identical in-class private definitions in the common base =
class.
> =

> The only override left is nhm_cpu::account_freq() which is almost identic=
al but
> ignores the "Turbo Mode" state.
> Seems like a hidden bug to me, but will remove it in a separate commit so=
 one can revert
> it easily in case something goes wrong.
> =

> Signed-off-by: Ivan Shapovalov <intelfx100(a)gmail.com>
> ---
>  src/cpu/abstract_cpu.cpp | 39 +++++++++++++++++++++++++
>  src/cpu/cpu.h            | 11 ++-----
>  src/cpu/cpu_core.cpp     | 39 -------------------------
>  src/cpu/cpu_linux.cpp    | 39 -------------------------
>  src/cpu/cpu_package.cpp  | 40 --------------------------
>  src/cpu/intel_cpus.cpp   | 74 ------------------------------------------=
------
>  src/cpu/intel_cpus.h     |  5 ----
>  7 files changed, 41 insertions(+), 206 deletions(-)
> =

> diff --git a/src/cpu/abstract_cpu.cpp b/src/cpu/abstract_cpu.cpp
> index 537f3cb..5618761 100644
> --- a/src/cpu/abstract_cpu.cpp
> +++ b/src/cpu/abstract_cpu.cpp
> @@ -28,7 +28,46 @@
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include "cpu.h"
> +#include "../lib.h"
>  =

> +void abstract_cpu::account_freq(uint64_t freq, uint64_t duration)
> +{
> +	struct frequency *state =3D NULL;
> +	unsigned int i;
> +
> +	for (i =3D 0; i < pstates.size(); i++) {
> +		if (freq =3D=3D pstates[i]->freq) {
> +			state =3D pstates[i];
> +			break;
> +		}
> +	}
> +
> +
> +	if (!state) {
> +		state =3D new(std::nothrow) struct frequency;
> +
> +		if (!state)
> +			return;
> +
> +		memset(state, 0, sizeof(*state));
> +
> +		pstates.push_back(state);
> +
> +		state->freq =3D freq;
> +		hz_to_human(freq, state->human_name);
> +		if (freq =3D=3D 0)
> +			strcpy(state->human_name, _("Idle"));
> +		if (is_turbo(freq, max_frequency, max_minus_one_frequency))
> +			sprintf(state->human_name, _("Turbo Mode"));
> +
> +		state->after_count =3D 1;
> +	}
> +
> +
> +	state->time_after +=3D duration;
> +
> +
> +}
>  =

>  void abstract_cpu::measurement_start(void)
>  {
> diff --git a/src/cpu/cpu.h b/src/cpu/cpu.h
> index 2304cd5..8b9c9f9 100644
> --- a/src/cpu/cpu.h
> +++ b/src/cpu/cpu.h
> @@ -83,6 +83,8 @@ protected:
>  	double  time_factor;
>  	uint64_t max_frequency;
>  	uint64_t max_minus_one_frequency;
> +
> +	virtual void	account_freq(uint64_t frequency, uint64_t duration);
>  public:
>  	uint64_t	last_stamp;
>  	uint64_t	total_stamp;
> @@ -158,13 +160,6 @@ extern vector<class abstract_cpu *> all_cpus;
>  =

>  class cpu_linux: public abstract_cpu
>  {
> -
> -	void	account_freq(uint64_t frequency, uint64_t duration);
> -	void 	parse_pstates_start(void);
> -	void 	parse_cstates_start(void);
> -	void 	parse_pstates_end(void);
> -	void 	parse_cstates_end(void);
> -

I see that you've dropped states start/end parsing, but I can't see where d=
id you land them

	-ss


>  public:
>  	virtual void	measurement_start(void);
>  	virtual void	measurement_end(void);
> @@ -186,7 +181,6 @@ public:
>  =

>  class cpu_core: public abstract_cpu
>  {
> -	void		account_freq(uint64_t frequency, uint64_t duration);
>  public:
>  	virtual char *  fill_cstate_line(int line_nr, char *buffer, const char =
*separator=3D"");
>  	virtual char *  fill_cstate_name(int line_nr, char *buffer);
> @@ -201,7 +195,6 @@ public:
>  =

>  class cpu_package: public abstract_cpu
>  {
> -	void		account_freq(uint64_t frequency, uint64_t duration);
>  public:
>  	virtual char *  fill_cstate_line(int line_nr, char *buffer, const char =
*separator=3D"");
>  	virtual char *  fill_cstate_name(int line_nr, char *buffer);
> diff --git a/src/cpu/cpu_core.cpp b/src/cpu/cpu_core.cpp
> index 8aba60b..8249d83 100644
> --- a/src/cpu/cpu_core.cpp
> +++ b/src/cpu/cpu_core.cpp
> @@ -77,45 +77,6 @@ char * cpu_core::fill_pstate_name(int line_nr, char *b=
uffer)
>  	return buffer;
>  }
>  =

> -
> -void cpu_core::account_freq(uint64_t freq, uint64_t duration)
> -{
> -	struct frequency *state =3D NULL;
> -	unsigned int i;
> -
> -	for (i =3D 0; i < pstates.size(); i++) {
> -		if (freq =3D=3D pstates[i]->freq) {
> -			state =3D pstates[i];
> -			break;
> -		}
> -	}
> -
> -
> -	if (!state) {
> -		state =3D new(std::nothrow) struct frequency;
> -
> -		if (!state)
> -			return;
> -
> -		memset(state, 0, sizeof(*state));
> -
> -		pstates.push_back(state);
> -
> -		state->freq =3D freq;
> -		hz_to_human(freq, state->human_name);
> -		if (freq =3D=3D 0)
> -			strcpy(state->human_name, _("Idle"));
> -		if (is_turbo(freq, max_frequency, max_minus_one_frequency))
> -			sprintf(state->human_name, _("Turbo Mode"));
> -
> -		state->after_count =3D 1;
> -	}
> -
> -
> -	state->time_after +=3D duration;
> -}
> -
> -
>  void cpu_core::calculate_freq(uint64_t time)
>  {
>  	uint64_t freq =3D 0;
> diff --git a/src/cpu/cpu_linux.cpp b/src/cpu/cpu_linux.cpp
> index 034263b..41a2238 100644
> --- a/src/cpu/cpu_linux.cpp
> +++ b/src/cpu/cpu_linux.cpp
> @@ -350,45 +350,6 @@ char * cpu_linux::fill_pstate_line(int line_nr, char=
 *buffer)
>  =

>  =

>  =

> -void cpu_linux::account_freq(uint64_t freq, uint64_t duration)
> -{
> -	struct frequency *state =3D NULL;
> -	unsigned int i;
> -
> -
> -	for (i =3D 0; i < pstates.size(); i++) {
> -		if (freq =3D=3D pstates[i]->freq) {
> -			state =3D pstates[i];
> -			break;
> -		}
> -	}
> -
> -	if (!state) {
> -		state =3D new(std::nothrow) struct frequency;
> -
> -		if (!state)
> -			return;
> -
> -		memset(state, 0, sizeof(*state));
> -
> -		pstates.push_back(state);
> -
> -		state->freq =3D freq;
> -		hz_to_human(freq, state->human_name);
> -		if (freq =3D=3D 0)
> -			strcpy(state->human_name, _("Idle"));
> -		if (is_turbo(freq, max_frequency, max_minus_one_frequency))
> -			sprintf(state->human_name, _("Turbo Mode"));
> -
> -		state->after_count =3D 1;
> -	}
> -
> -
> -	state->time_after +=3D duration;
> -
> -
> -}
> -
>  void cpu_linux::change_freq(uint64_t time, int frequency)
>  {
>  	current_frequency =3D frequency;
> diff --git a/src/cpu/cpu_package.cpp b/src/cpu/cpu_package.cpp
> index 61ce050..6794a38 100644
> --- a/src/cpu/cpu_package.cpp
> +++ b/src/cpu/cpu_package.cpp
> @@ -102,46 +102,6 @@ char * cpu_package::fill_pstate_line(int line_nr, ch=
ar *buffer)
>  	return buffer;
>  }
>  =

> -
> -
> -
> -void cpu_package::account_freq(uint64_t freq, uint64_t duration)
> -{
> -	struct frequency *state =3D NULL;
> -	unsigned int i;
> -
> -	for (i =3D 0; i < pstates.size(); i++) {
> -		if (freq =3D=3D pstates[i]->freq) {
> -			state =3D pstates[i];
> -			break;
> -		}
> -	}
> -
> -
> -	if (!state) {
> -		state =3D new(std::nothrow) struct frequency;
> -
> -		if (!state)
> -			return;
> -
> -		memset(state, 0, sizeof(*state));
> -
> -		pstates.push_back(state);
> -
> -		state->freq =3D freq;
> -		hz_to_human(freq, state->human_name);
> -		if (freq =3D=3D 0)
> -			strcpy(state->human_name, _("Idle"));
> -		if (is_turbo(freq, max_frequency, max_minus_one_frequency))
> -			sprintf(state->human_name, _("Turbo Mode"));
> -		state->after_count =3D 1;
> -	}
> -
> -	state->time_after +=3D duration;
> -
> -}
> -
> -
>  void cpu_package::calculate_freq(uint64_t time)
>  {
>  	uint64_t freq =3D 0;
> diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
> index 640a0d5..4d52206 100644
> --- a/src/cpu/intel_cpus.cpp
> +++ b/src/cpu/intel_cpus.cpp
> @@ -185,44 +185,6 @@ void nhm_core::measurement_end(void)
>  	total_stamp =3D 0;
>  }
>  =

> -void nhm_core::account_freq(uint64_t freq, uint64_t duration)
> -{
> -	struct frequency *state =3D NULL;
> -	unsigned int i;
> -
> -	for (i =3D 0; i < pstates.size(); i++) {
> -		if (freq =3D=3D pstates[i]->freq) {
> -			state =3D pstates[i];
> -			break;
> -		}
> -	}
> -
> -
> -	if (!state) {
> -		state =3D new(std::nothrow) struct frequency;
> -
> -		if (!state)
> -			return;
> -
> -		memset(state, 0, sizeof(*state));
> -
> -		pstates.push_back(state);
> -
> -		state->freq =3D freq;
> -		hz_to_human(freq, state->human_name);
> -		if (freq =3D=3D 0)
> -			strcpy(state->human_name, _("Idle"));
> -		if (is_turbo(freq, max_frequency, max_minus_one_frequency))
> -			sprintf(state->human_name, _("Turbo Mode"));
> -
> -		state->after_count =3D 1;
> -	}
> -
> -
> -	state->time_after +=3D duration;
> -}
> -
> -
>  void nhm_core::calculate_freq(uint64_t time)
>  {
>  	uint64_t freq =3D 0;
> @@ -418,42 +380,6 @@ void nhm_package::measurement_end(void)
>  =

>  }
>  =

> -void nhm_package::account_freq(uint64_t freq, uint64_t duration)
> -{
> -	struct frequency *state =3D NULL;
> -	unsigned int i;
> -
> -	for (i =3D 0; i < pstates.size(); i++) {
> -		if (freq =3D=3D pstates[i]->freq) {
> -			state =3D pstates[i];
> -			break;
> -		}
> -	}
> -
> -
> -	if (!state) {
> -		state =3D new(std::nothrow) struct frequency;
> -
> -		if (!state)
> -			return;
> -
> -		memset(state, 0, sizeof(*state));
> -
> -		pstates.push_back(state);
> -
> -		state->freq =3D freq;
> -		hz_to_human(freq, state->human_name);
> -		if (freq =3D=3D 0)
> -			strcpy(state->human_name, _("Idle"));
> -		if (is_turbo(freq, max_frequency, max_minus_one_frequency))
> -			sprintf(state->human_name, _("Turbo Mode"));
> -		state->after_count =3D 1;
> -	}
> -
> -	state->time_after +=3D duration;
> -
> -}
> -
>  =

>  void nhm_package::calculate_freq(uint64_t time)
>  {
> diff --git a/src/cpu/intel_cpus.h b/src/cpu/intel_cpus.h
> index a8bb892..181ffc4 100644
> --- a/src/cpu/intel_cpus.h
> +++ b/src/cpu/intel_cpus.h
> @@ -53,9 +53,6 @@ private:
>  =

>  	uint64_t	last_stamp;
>  	uint64_t	total_stamp;
> -
> -	void		account_freq(uint64_t frequency, uint64_t duration);
> -
>  public:
>  	virtual void	measurement_start(void);
>  	virtual void	measurement_end(void);
> @@ -78,8 +75,6 @@ private:
>  =

>  	uint64_t	last_stamp;
>  	uint64_t	total_stamp;
> -
> -	void		account_freq(uint64_t frequency, uint64_t duration);
>  public:
>  	virtual void	measurement_start(void);
>  	virtual void	measurement_end(void);
> -- =

> 1.8.0.2
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============5552784857158488958==--

