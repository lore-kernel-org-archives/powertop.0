Content-Type: multipart/mixed; boundary="===============2730274221779561591=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] Internationalization problem with abstract field "type"
Date: Fri, 26 Oct 2012 12:03:55 +0400
Message-ID: <508A43EB.6070501@samsung.com>
In-Reply-To: CAMFVxViWfRC9LxWom-73f=Yw22WJveq-X98YLfOGaXTNPA6uqw@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2730274221779561591==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Chris,

In the version before:
	report.addf(__("Package %i"), _package->get_number());
I have used the conditional gettext() macro which generates localized table=
 column names
for HTML-reports and generate original column names for CSV-reports:
	/* Conditional gettext. We need original strings for CSV. */
	#define __(STRING) \
	        ((report.get_type() =3D=3D REPORT_CSV) ? (STRING) : gettext(STRING=
))

And in your version we have lost the translation for HTML-reports.
I don't know whether we need to translate words "CPU", "Core" and "Package"=
 to different
languages in column names in HTML report.

It should be your decision. ;-)

Ferron, Chris E wrote:
> Igor, Here is what I am thinking ?
> ---
> diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
> index 18cbffc..9767d52 100644
> --- a/src/cpu/cpu.cpp
> +++ b/src/cpu/cpu.cpp
> @@ -39,6 +39,13 @@
>   #include "../report/report.h"
>   #include "../report/report-maker.h"
>
> +#define gettext_noop(String) String
> +#define N_(String) gettext_noop(String)
> +/*TRANSLATORS: This is "package" as in a  processor Package */
> +#define PACKAGE_TYPE N_("Package")
> +/*TRANSLATORS: This is "Core" as in a  processor Core  */
> +#define CORE_TYPE N_("Core")
> +
>   static class abstract_cpu system_level;
>
>   vector<class abstract_cpu *> all_cpus;
> @@ -87,7 +94,7 @@ static class abstract_cpu * new_package(int package,
> int cpu, char * vendor, int
>                  ret =3D new class cpu_package;
>
>          ret->set_number(package, cpu);
> -       ret->set_type("Package");
> +       ret->set_type(PACKAGE_TYPE);
>          ret->childcount =3D 0;
>
>          sprintf(packagename, _("cpu package %i"), cpu);
> @@ -123,7 +130,7 @@ static class abstract_cpu * new_core(int core, int
> cpu, char * vendor, int famil
>                  ret =3D new class cpu_core;
>          ret->set_number(core, cpu);
>          ret->childcount =3D 0;
> -       ret->set_type("Core");
> +       ret->set_type(CORE_TYPE);
>
>          return ret;
>   }
> diff --git a/src/cpu/cpu.h b/src/cpu/cpu.h
> index 4480b11..d16303f 100644
> --- a/src/cpu/cpu.h
> +++ b/src/cpu/cpu.h
> @@ -88,7 +88,7 @@ public:
>          uint64_t        total_stamp;
>          int     number;
>          int     childcount;
> -       const char*    name;
> +       const char*    type;
>          bool    idle, old_idle;
>          uint64_t        current_frequency;
>          uint64_t        effective_frequency;
> @@ -103,9 +103,9 @@ public:
>
>
>          void    set_number(int _number, int cpu) {this->number =3D
> _number; this->first_cpu =3D cpu;};
> -       void    set_type(const char* _name) {this->name =3D _name;};
> +       void    set_type(const char* _type) {this->type =3D _type;};
>          int     get_number(void) { return number; };
> -       const char* get_type(void) { return name; };
> +       const char* get_type(void) { return type; };
>
>          virtual void    measurement_start(void);
>          virtual void    measurement_end(void);
>
>
> On Thu, Oct 25, 2012 at 10:39 AM, Ferron, Chris E
> <chris.e.ferron(a)intel.com> wrote:
>> On Thu, Oct 25, 2012 at 1:55 AM, Igor Zhbanov <i.zhbanov(a)samsung.com> =
wrote:
>>> Hi Chris,
>>>
>>> It seems that there is a problem with internationalization with the last
>>> commit.
>>> Please look here:
>>> - report.addf(__("Package %i"), _package->get_number());
>>> + report.addf(__("%s %i"), _package->get_type(), _package->get_number()=
);
>>>
>>> I have introduced the macro __() /* Double underscore */ to be a condit=
ional
>>> variant
>>> of classical _() /* Single underscore */ in the report refactoring comm=
it.
>>>
>>> Usual underscore macro calls the gettext() function. And we need some s=
ort
>>> of conditional
>>> gettext() -- we want to print untranslated strings to CSV-report. (Of
>>> course, we could simply
>>> set English locale for CSV-reports. But this will look strange.)
>>>
>>> So I have introduced the double underscore macro which calls gettext() =
for
>>> HTML-reports and
>>> return original strings for CSV.
>>>
>>> After your patch the gettext will try to translate the string "%s %i" a=
nd
>>> not the "Package %i",
>>> so we have lost the internationalization here.
>> You are correct, an oversight on my part by including the macro
>> without consideration.
>>> We could fix it by internationalizing the "type" field in the class:
>>>    ret->set_type(__("Package"));
>> Yes you are right this is bad. I think the best solution for this is
>> to define them as and use  gettext noop. I will add a translation
>> comment to them so translators have context.
>> #define gettext_noop(String) String
>> #define N_(String) gettext_noop(String)
>> #define PACKAGE_TYPE N_("Package")
>> #define CORE_TYPE N_("Core")
>>
>>> But I'm not sure that it is good to have the type depending on current
>>> locale (especially
>>> if in some future there will be need to compare the value of this field=
 by
>>> strcmp()).
>> My personal opinion is to remove all localization from reports, but
>> enough people have voiced that they find it valuable to be able to
>> generate reported in the language of there local.
>>
>> As such I find there are several issues with internationalization when
>> it comes to reports. When we did internationalization it was supposed
>> to be for the UI. We then started thinking and planning to include in
>> the HTML report the ability to switch from local to engineering
>> (engineering being English) to solve most of the issues. Also it been
>> considered that CSV not be localized, as it should be considered
>> machine language and not meant to be necessarily human readable(which
>> is a good feature to the reporting work already done). Thus why as for
>> CSV standard discussions I only asked that "Office" type products be
>> able to parse them.
>>
>>> What you think?
>>>
>>> P.S. Why you not sending patches to mailing list for discussion? ;-)
>> I do for large changes, but usually do not for quick fixes.
>>
>> Thank you for pointing this out, I will fix this.

-- =

Best regards,
Igor Zhbanov,
Technical Leader,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

Mobile group, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============2730274221779561591==--

