Content-Type: multipart/mixed; boundary="===============7282346258627568150=="
MIME-Version: 1.0
From: Ferron, Chris E <chris.e.ferron at intel.com>
Subject: Re: [Powertop] Internationalization problem with abstract field "type"
Date: Thu, 25 Oct 2012 10:39:38 -0700
Message-ID: <CAMFVxVhO7G-Y72D+F3d9dES7g82osm0ho6RbwJ4Fgpg86YZPog@mail.gmail.com>
In-Reply-To: 5088FE96.20602@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7282346258627568150==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 25, 2012 at 1:55 AM, Igor Zhbanov <i.zhbanov(a)samsung.com> wro=
te:
> Hi Chris,
>
> It seems that there is a problem with internationalization with the last
> commit.
> Please look here:
> - report.addf(__("Package %i"), _package->get_number());
> + report.addf(__("%s %i"), _package->get_type(), _package->get_number());
>
> I have introduced the macro __() /* Double underscore */ to be a conditio=
nal
> variant
> of classical _() /* Single underscore */ in the report refactoring commit.
>
> Usual underscore macro calls the gettext() function. And we need some sort
> of conditional
> gettext() -- we want to print untranslated strings to CSV-report. (Of
> course, we could simply
> set English locale for CSV-reports. But this will look strange.)
>
> So I have introduced the double underscore macro which calls gettext() for
> HTML-reports and
> return original strings for CSV.
>
> After your patch the gettext will try to translate the string "%s %i" and
> not the "Package %i",
> so we have lost the internationalization here.
You are correct, an oversight on my part by including the macro
without consideration.
>
> We could fix it by internationalizing the "type" field in the class:
>   ret->set_type(__("Package"));
Yes you are right this is bad. I think the best solution for this is
to define them as and use  gettext noop. I will add a translation
comment to them so translators have context.
#define gettext_noop(String) String
#define N_(String) gettext_noop(String)
#define PACKAGE_TYPE N_("Package")
#define CORE_TYPE N_("Core")

> But I'm not sure that it is good to have the type depending on current
> locale (especially
> if in some future there will be need to compare the value of this field by
> strcmp()).
My personal opinion is to remove all localization from reports, but
enough people have voiced that they find it valuable to be able to
generate reported in the language of there local.

As such I find there are several issues with internationalization when
it comes to reports. When we did internationalization it was supposed
to be for the UI. We then started thinking and planning to include in
the HTML report the ability to switch from local to engineering
(engineering being English) to solve most of the issues. Also it been
considered that CSV not be localized, as it should be considered
machine language and not meant to be necessarily human readable(which
is a good feature to the reporting work already done). Thus why as for
CSV standard discussions I only asked that "Office" type products be
able to parse them.

>
> What you think?
>
> P.S. Why you not sending patches to mailing list for discussion? ;-)
I do for large changes, but usually do not for quick fixes.

Thank you for pointing this out, I will fix this.
>
> --
> Best regards,
> Igor Zhbanov,
> Technical Leader,
> phone: +7 (495) 797 25 00 ext 3806
> e-mail: i.zhbanov(a)samsung.com
>
> Mobile group, Moscow R&D center, Samsung Electronics
> 12 Dvintsev street, building 1
> 127018, Moscow, Russian Federation
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop

--===============7282346258627568150==--

