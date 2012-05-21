Content-Type: multipart/mixed; boundary="===============2332262166945864606=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Fixed HTML output to make W3C validator happy
Date: Mon, 21 May 2012 10:50:00 -0700
Message-ID: <4FBA8048.8040306@linux.intel.com>
In-Reply-To: 1337179642-25604-1-git-send-email-jskarvad@redhat.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2332262166945864606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Complacency patches always appreciated.
Thanks, patch accepted.
-Chris

On 05/16/2012 07:47 AM, Jaroslav =C5=A0karvada wrote:
> Various fixes to pass W3C HTML validation. Also unified
> whitespaces - preferred tabs over multiple spaces to save
> some space.
> ---
>   src/powertop.css           |  481 ++++++++++++++++++++++---------------=
-------
>   src/process/do_process.cpp |    2 +-
>   src/report.cpp             |    2 +-
>   3 files changed, 243 insertions(+), 242 deletions(-)
>
> diff --git a/src/powertop.css b/src/powertop.css
> index 4a67c7f..087e384 100644
> --- a/src/powertop.css
> +++ b/src/powertop.css
> @@ -1,52 +1,55 @@
> -<!DOCTYPE html PUBLIC \"-//W3C/DTD HTML 4.01//EN\">
> +<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http:=
//www.w3.org/TR/html4/loose.dtd\">
>   <html>
> +<head>
> +<title>PowerTOP report</title>
> +<meta http-equiv=3D\"content-type\" content=3D\"text/html;charset=3Dutf-=
8\">
>   <script type=3D\"text/javascript\" src=3D\"http://ajax.googleapis.com/a=
jax/libs/jquery/1.7.2/jquery.min.js\"></script>
> -<script>
> -$(document).ready(function(){
> -
> -        $('#system h2').addClass('hide');
> +<script type=3D\"text/javascript\">
> +$(document).ready(function(){
> +
> +	$('#system h2').addClass('hide');
>   	$('#system table').addClass('hide');
> -        $('#cpuidle h2').addClass('hide');
> -	$('#cpuidle table').addClass('hide');
> -        $('#cpufreq h2').addClass('hide');
> -	$('#cpufreq table').addClass('hide');
> -        $('#software h2').addClass('hide');
> -	$('#software table').addClass('hide');
> -        $('#device h2').addClass('hide');
> -	$('#device table').addClass('hide');
> -	$('#device p').addClass('hide');		=

> -        $('#tuning h2').addClass('hide');
> -	$('#tuning table').addClass('hide');
> -		=

> -        $('#top').append('<div class=3D\"SystemButton\"   onclick=3D\"to=
ggleSystem()\">System Info</div>');
> -        $('#top').append('<div class=3D\"SummaryButton\"  onclick=3D\"to=
ggleSummary()\">Summary</div>');
> -        $('#top').append('<div class=3D\"CpuidleButton\"  onclick=3D\"to=
ggleCpuidle()\">CPU Idle</div>');
> -        $('#top').append('<div class=3D\"CpufreqButton\"  onclick=3D\"to=
ggleCpufreq()\">CPU Frequency</div>');
> -        $('#top').append('<div class=3D\"SoftwareButton\" onclick=3D\"to=
ggleSoftware()\">Software info</div>');
> -        $('#top').append('<div class=3D\"DeviceButton\"   onclick=3D\"to=
ggleDevice()\">Device Info</div>');
> -        $('#top').append('<div class=3D\"TuningButton\"   onclick=3D\"to=
ggleTuning()\">Tuning</div>');
> -	$('#top').append('<div class=3D\"AllButton\"      onclick=3D\"toggleAll=
()\">All</div>');
> +	$('#cpuidle h2').addClass('hide');
> +	$('#cpuidle table').addClass('hide');
> +	$('#cpufreq h2').addClass('hide');
> +	$('#cpufreq table').addClass('hide');
> +	$('#software h2').addClass('hide');
> +	$('#software table').addClass('hide');
> +	$('#device h2').addClass('hide');
> +	$('#device table').addClass('hide');
> +	$('#device p').addClass('hide');
> +	$('#tuning h2').addClass('hide');
> +	$('#tuning table').addClass('hide');
> +
> +	$('#top').append('<div class=3D\"SystemButton\"   onclick=3D\"toggleSys=
tem()\">System Info<\\/div>');
> +	$('#top').append('<div class=3D\"SummaryButton\"  onclick=3D\"toggleSum=
mary()\">Summary<\\/div>');
> +	$('#top').append('<div class=3D\"CpuidleButton\"  onclick=3D\"toggleCpu=
idle()\">CPU Idle<\\/div>');
> +	$('#top').append('<div class=3D\"CpufreqButton\"  onclick=3D\"toggleCpu=
freq()\">CPU Frequency<\\/div>');
> +	$('#top').append('<div class=3D\"SoftwareButton\" onclick=3D\"toggleSof=
tware()\">Software info<\\/div>');
> +	$('#top').append('<div class=3D\"DeviceButton\"   onclick=3D\"toggleDev=
ice()\">Device Info<\\/div>');
> +	$('#top').append('<div class=3D\"TuningButton\"   onclick=3D\"toggleTun=
ing()\">Tuning<\\/div>');
> +	$('#top').append('<div class=3D\"AllButton\"      onclick=3D\"toggleAll=
()\">All<\\/div>');
>   	$('#top .SummaryButton').toggleClass('pressed');
>
>       }
>   	);
> -function toggleDummy() {
> -	        $('#system table').toggleClass('hide', true);
> -		$('#system h2').toggleClass('hide', true);
> -	        $('#summary table').toggleClass('hide', true);
> -		$('#summary h2').toggleClass('hide', true);
> -		$('#summary p').toggleClass('hide', true);
> -	        $('#cpuidle table').toggleClass('hide', true);
> -		$('#cpuidle h2').toggleClass('hide', true);
> -	        $('#cpufreq table').toggleClass('hide', true);
> -		$('#cpufreq h2').toggleClass('hide', true);
> -	        $('#software table').toggleClass('hide', true);
> -		$('#software h2').toggleClass('hide', true);
> -	        $('#device table').toggleClass('hide', true);
> -		$('#device h2').toggleClass('hide', true);
> -		$('#device p').toggleClass('hide', true);
> -		$('#tuning table').toggleClass('hide', true);
> -		$('#tuning h2').toggleClass('hide', true);
> +function toggleDummy() {
> +		$('#system table').toggleClass('hide', true);
> +		$('#system h2').toggleClass('hide', true);
> +		$('#summary table').toggleClass('hide', true);
> +		$('#summary h2').toggleClass('hide', true);
> +		$('#summary p').toggleClass('hide', true);
> +		$('#cpuidle table').toggleClass('hide', true);
> +		$('#cpuidle h2').toggleClass('hide', true);
> +		$('#cpufreq table').toggleClass('hide', true);
> +		$('#cpufreq h2').toggleClass('hide', true);
> +		$('#software table').toggleClass('hide', true);
> +		$('#software h2').toggleClass('hide', true);
> +		$('#device table').toggleClass('hide', true);
> +		$('#device h2').toggleClass('hide', true);
> +		$('#device p').toggleClass('hide', true);
> +		$('#tuning table').toggleClass('hide', true);
> +		$('#tuning h2').toggleClass('hide', true);
>   		$('#top .SystemButton').toggleClass('pressed', false);
>   		$('#top .SummaryButton').toggleClass('pressed', false);
>   		$('#top .CpuidleButton').toggleClass('pressed', false);
> @@ -56,23 +59,23 @@ function toggleDummy() {
>   		$('#top .TuningButton').toggleClass('pressed', false);
>   		$('#top .AllButton').toggleClass('pressed', false);
>   }
> -function toggleSystem() {
> -	        $('#system table').toggleClass('hide', false);
> -		$('#system h2').toggleClass('hide', false);
> -	        $('#summary table').toggleClass('hide', true);
> -		$('#summary h2').toggleClass('hide', true);
> -		$('#summary p').toggleClass('hide', true); 		=

> -	        $('#cpuidle table').toggleClass('hide', true);
> -		$('#cpuidle h2').toggleClass('hide', true);
> -	        $('#cpufreq table').toggleClass('hide', true);
> -		$('#cpufreq h2').toggleClass('hide', true);
> -        	$('#software table').toggleClass('hide', true);
> -		$('#software h2').toggleClass('hide', true);
> -	        $('#device table').toggleClass('hide', true);
> -		$('#device h2').toggleClass('hide', true);
> -		$('#device p').toggleClass('hide', true);
> -		$('#tuning table').toggleClass('hide', true);
> -		$('#tuning h2').toggleClass('hide', true);
> +function toggleSystem() {
> +		$('#system table').toggleClass('hide', false);
> +		$('#system h2').toggleClass('hide', false);
> +		$('#summary table').toggleClass('hide', true);
> +		$('#summary h2').toggleClass('hide', true);
> +		$('#summary p').toggleClass('hide', true);
> +		$('#cpuidle table').toggleClass('hide', true);
> +		$('#cpuidle h2').toggleClass('hide', true);
> +		$('#cpufreq table').toggleClass('hide', true);
> +		$('#cpufreq h2').toggleClass('hide', true);
> +		$('#software table').toggleClass('hide', true);
> +		$('#software h2').toggleClass('hide', true);
> +		$('#device table').toggleClass('hide', true);
> +		$('#device h2').toggleClass('hide', true);
> +		$('#device p').toggleClass('hide', true);
> +		$('#tuning table').toggleClass('hide', true);
> +		$('#tuning h2').toggleClass('hide', true);
>   		$('#top .SystemButton').toggleClass('pressed', true);
>   		$('#top .SummaryButton').toggleClass('pressed', false);
>   		$('#top .CpuidleButton').toggleClass('pressed', false);
> @@ -82,23 +85,23 @@ function toggleSystem() {
>   		$('#top .TuningButton').toggleClass('pressed', false);
>   		$('#top .AllButton').toggleClass('pressed', false);
>   }
> -function toggleSummary() {
> -	        $('#system table').toggleClass('hide', true);
> -		$('#system h2').toggleClass('hide', true);
> -	        $('#summary table').toggleClass('hide', false);
> -		$('#summary h2').toggleClass('hide', false);
> -		$('#summary p').toggleClass('hide', false); 				=

> -		$('#cpuidle table').toggleClass('hide', true);
> -		$('#cpuidle h2').toggleClass('hide', true);
> -	        $('#cpufreq table').toggleClass('hide', true);
> -		$('#cpufreq h2').toggleClass('hide', true);
> -	        $('#software table').toggleClass('hide', true);
> -		$('#software h2').toggleClass('hide', true);
> -	        $('#device table').toggleClass('hide', true);
> -		$('#device h2').toggleClass('hide', true);
> -		$('#device p').toggleClass('hide', true);
> -		$('#tuning table').toggleClass('hide', true);
> -		$('#tuning h2').toggleClass('hide', true);
> +function toggleSummary() {
> +		$('#system table').toggleClass('hide', true);
> +		$('#system h2').toggleClass('hide', true);
> +		$('#summary table').toggleClass('hide', false);
> +		$('#summary h2').toggleClass('hide', false);
> +		$('#summary p').toggleClass('hide', false);
> +		$('#cpuidle table').toggleClass('hide', true);
> +		$('#cpuidle h2').toggleClass('hide', true);
> +		$('#cpufreq table').toggleClass('hide', true);
> +		$('#cpufreq h2').toggleClass('hide', true);
> +		$('#software table').toggleClass('hide', true);
> +		$('#software h2').toggleClass('hide', true);
> +		$('#device table').toggleClass('hide', true);
> +		$('#device h2').toggleClass('hide', true);
> +		$('#device p').toggleClass('hide', true);
> +		$('#tuning table').toggleClass('hide', true);
> +		$('#tuning h2').toggleClass('hide', true);
>   		$('#top .SystemButton').toggleClass('pressed', false);
>   		$('#top .SummaryButton').toggleClass('pressed', true);
>   		$('#top .CpuidleButton').toggleClass('pressed', false);
> @@ -108,23 +111,23 @@ function toggleSummary() {
>   		$('#top .TuningButton').toggleClass('pressed', false);
>   		$('#top .AllButton').toggleClass('pressed', false);
>   }
> -function toggleCpuidle() {
> -	        $('#system table').toggleClass('hide', true);
> -		$('#system h2').toggleClass('hide', true);
> -	        $('#summary table').toggleClass('hide', true);
> -		$('#summary h2').toggleClass('hide', true);
> -	        $('#summary p').toggleClass('hide', true); 		=

> -		$('#cpuidle table').toggleClass('hide', false);
> -		$('#cpuidle h2').toggleClass('hide', false);
> -	        $('#cpufreq table').toggleClass('hide', true);
> -		$('#cpufreq h2').toggleClass('hide', true);
> -	        $('#software table').toggleClass('hide', true);
> -		$('#software h2').toggleClass('hide', true);
> -	        $('#device table').toggleClass('hide', true);
> -		$('#device h2').toggleClass('hide', true);
> -		$('#device p').toggleClass('hide', true);
> -		$('#tuning table').toggleClass('hide', true);
> -		$('#tuning h2').toggleClass('hide', true);
> +function toggleCpuidle() {
> +		$('#system table').toggleClass('hide', true);
> +		$('#system h2').toggleClass('hide', true);
> +		$('#summary table').toggleClass('hide', true);
> +		$('#summary h2').toggleClass('hide', true);
> +		$('#summary p').toggleClass('hide', true);
> +		$('#cpuidle table').toggleClass('hide', false);
> +		$('#cpuidle h2').toggleClass('hide', false);
> +		$('#cpufreq table').toggleClass('hide', true);
> +		$('#cpufreq h2').toggleClass('hide', true);
> +		$('#software table').toggleClass('hide', true);
> +		$('#software h2').toggleClass('hide', true);
> +		$('#device table').toggleClass('hide', true);
> +		$('#device h2').toggleClass('hide', true);
> +		$('#device p').toggleClass('hide', true);
> +		$('#tuning table').toggleClass('hide', true);
> +		$('#tuning h2').toggleClass('hide', true);
>   		$('#top .SystemButton').toggleClass('pressed', false);
>   		$('#top .SummaryButton').toggleClass('pressed', false);
>   		$('#top .CpuidleButton').toggleClass('pressed', true);
> @@ -133,25 +136,25 @@ function toggleCpuidle() {
>   		$('#top .DeviceButton').toggleClass('pressed', false);
>   		$('#top .TuningButton').toggleClass('pressed', false);
>   		$('#top .AllButton').toggleClass('pressed', false);
> -
> -}
> -function toggleCpufreq() {
> -	        $('#system table').toggleClass('hide', true);
> -		$('#system h2').toggleClass('hide', true);
> -	        $('#summary table').toggleClass('hide', true);
> -		$('#summary h2').toggleClass('hide', true);
> -		$('#summary p').toggleClass('hide', true); 		=

> -	        $('#cpuidle table').toggleClass('hide', true);
> -		$('#cpuidle h2').toggleClass('hide', true);
> -	        $('#cpufreq table').toggleClass('hide', false);
> -		$('#cpufreq h2').toggleClass('hide', false);
> -	        $('#software table').toggleClass('hide', true);
> -		$('#software h2').toggleClass('hide', true);
> -	        $('#device table').toggleClass('hide', true);
> -		$('#device h2').toggleClass('hide', true);
> -		$('#device p').toggleClass('hide', true);
> -		$('#tuning table').toggleClass('hide', true);
> -		$('#tuning h2').toggleClass('hide', true);
> +
> +}
> +function toggleCpufreq() {
> +		$('#system table').toggleClass('hide', true);
> +		$('#system h2').toggleClass('hide', true);
> +		$('#summary table').toggleClass('hide', true);
> +		$('#summary h2').toggleClass('hide', true);
> +		$('#summary p').toggleClass('hide', true);
> +		$('#cpuidle table').toggleClass('hide', true);
> +		$('#cpuidle h2').toggleClass('hide', true);
> +		$('#cpufreq table').toggleClass('hide', false);
> +		$('#cpufreq h2').toggleClass('hide', false);
> +		$('#software table').toggleClass('hide', true);
> +		$('#software h2').toggleClass('hide', true);
> +		$('#device table').toggleClass('hide', true);
> +		$('#device h2').toggleClass('hide', true);
> +		$('#device p').toggleClass('hide', true);
> +		$('#tuning table').toggleClass('hide', true);
> +		$('#tuning h2').toggleClass('hide', true);
>   		$('#top .SystemButton').toggleClass('pressed', false);
>   		$('#top .SummaryButton').toggleClass('pressed', false);
>   		$('#top .CpuidleButton').toggleClass('pressed', false);
> @@ -162,23 +165,23 @@ function toggleCpufreq() {
>   		$('#top .AllButton').toggleClass('pressed', false);
>   }
>
> -function toggleSoftware() {
> -	        $('#system table').toggleClass('hide', true);
> -		$('#system h2').toggleClass('hide', true);
> -	        $('#summary table').toggleClass('hide', true);
> -		$('#summary h2').toggleClass('hide', true);
> -		$('#summary p').toggleClass('hide', true); 				=

> -	        $('#cpuidle table').toggleClass('hide', true);
> -		$('#cpuidle h2').toggleClass('hide', true);
> -	        $('#cpufreq table').toggleClass('hide', true);
> -		$('#cpufreq h2').toggleClass('hide', true);
> -	        $('#software table').toggleClass('hide', false);
> -		$('#software h2').toggleClass('hide', false);
> -	        $('#device table').toggleClass('hide', true);
> -		$('#device h2').toggleClass('hide', true);
> -		$('#device p').toggleClass('hide', true);
> -		$('#tuning table').toggleClass('hide', true);
> -		$('#tuning h2').toggleClass('hide', true);
> +function toggleSoftware() {
> +		$('#system table').toggleClass('hide', true);
> +		$('#system h2').toggleClass('hide', true);
> +		$('#summary table').toggleClass('hide', true);
> +		$('#summary h2').toggleClass('hide', true);
> +		$('#summary p').toggleClass('hide', true);
> +		$('#cpuidle table').toggleClass('hide', true);
> +		$('#cpuidle h2').toggleClass('hide', true);
> +		$('#cpufreq table').toggleClass('hide', true);
> +		$('#cpufreq h2').toggleClass('hide', true);
> +		$('#software table').toggleClass('hide', false);
> +		$('#software h2').toggleClass('hide', false);
> +		$('#device table').toggleClass('hide', true);
> +		$('#device h2').toggleClass('hide', true);
> +		$('#device p').toggleClass('hide', true);
> +		$('#tuning table').toggleClass('hide', true);
> +		$('#tuning h2').toggleClass('hide', true);
>   		$('#top .SystemButton').toggleClass('pressed', false);
>   		$('#top .SummaryButton').toggleClass('pressed', false);
>   		$('#top .CpuidleButton').toggleClass('pressed', false);
> @@ -189,23 +192,23 @@ function toggleSoftware() {
>   		$('#top .AllButton').toggleClass('pressed', false);
>   }
>
> -function toggleDevice() {
> -	        $('#system table').toggleClass('hide', true);
> -		$('#system h2').toggleClass('hide', true);
> -	        $('#summary table').toggleClass('hide', true);
> -		$('#summary h2').toggleClass('hide', true);
> -		$('#summary p').toggleClass('hide', true); 				=

> -	        $('#cpuidle table').toggleClass('hide', true);
> -		$('#cpuidle h2').toggleClass('hide', true);
> -	        $('#cpufreq table').toggleClass('hide', true);
> -		$('#cpufreq h2').toggleClass('hide', true);
> -	        $('#software table').toggleClass('hide', true);
> -		$('#software h2').toggleClass('hide', true);
> -	        $('#device table').toggleClass('hide', false);
> -		$('#device h2').toggleClass('hide', false);
> -		$('#device p').toggleClass('hide', false);
> -		$('#tuning table').toggleClass('hide', true);
> -		$('#tuning h2').toggleClass('hide', true);
> +function toggleDevice() {
> +		$('#system table').toggleClass('hide', true);
> +		$('#system h2').toggleClass('hide', true);
> +		$('#summary table').toggleClass('hide', true);
> +		$('#summary h2').toggleClass('hide', true);
> +		$('#summary p').toggleClass('hide', true);
> +		$('#cpuidle table').toggleClass('hide', true);
> +		$('#cpuidle h2').toggleClass('hide', true);
> +		$('#cpufreq table').toggleClass('hide', true);
> +		$('#cpufreq h2').toggleClass('hide', true);
> +		$('#software table').toggleClass('hide', true);
> +		$('#software h2').toggleClass('hide', true);
> +		$('#device table').toggleClass('hide', false);
> +		$('#device h2').toggleClass('hide', false);
> +		$('#device p').toggleClass('hide', false);
> +		$('#tuning table').toggleClass('hide', true);
> +		$('#tuning h2').toggleClass('hide', true);
>   		$('#top .SystemButton').toggleClass('pressed', false);
>   		$('#top .SummaryButton').toggleClass('pressed', false);
>   		$('#top .CpuidleButton').toggleClass('pressed', false);
> @@ -216,23 +219,23 @@ function toggleDevice() {
>   		$('#top .AllButton').toggleClass('pressed', false);
>   }
>
> -function toggleTuning() {
> -        	$('#system table').toggleClass('hide', true);
> -		$('#system h2').toggleClass('hide', true);
> -	        $('#summary table').toggleClass('hide', true);
> -		$('#summary h2').toggleClass('hide', true);
> -		$('#summary p').toggleClass('hide', true); 				=

> -	        $('#cpuidle table').toggleClass('hide', true);
> -		$('#cpuidle h2').toggleClass('hide', true);
> -	        $('#cpufreq table').toggleClass('hide', true);
> -		$('#cpufreq h2').toggleClass('hide', true);
> -	        $('#software table').toggleClass('hide', true);
> -		$('#software h2').toggleClass('hide', true);
> -	        $('#device table').toggleClass('hide', true);
> -		$('#device h2').toggleClass('hide', true);
> -		$('#device p').toggleClass('hide', true);
> -		$('#tuning table').toggleClass('hide', false);
> -		$('#tuning h2').toggleClass('hide', false);
> +function toggleTuning() {
> +		$('#system table').toggleClass('hide', true);
> +		$('#system h2').toggleClass('hide', true);
> +		$('#summary table').toggleClass('hide', true);
> +		$('#summary h2').toggleClass('hide', true);
> +		$('#summary p').toggleClass('hide', true);
> +		$('#cpuidle table').toggleClass('hide', true);
> +		$('#cpuidle h2').toggleClass('hide', true);
> +		$('#cpufreq table').toggleClass('hide', true);
> +		$('#cpufreq h2').toggleClass('hide', true);
> +		$('#software table').toggleClass('hide', true);
> +		$('#software h2').toggleClass('hide', true);
> +		$('#device table').toggleClass('hide', true);
> +		$('#device h2').toggleClass('hide', true);
> +		$('#device p').toggleClass('hide', true);
> +		$('#tuning table').toggleClass('hide', false);
> +		$('#tuning h2').toggleClass('hide', false);
>   		$('#top .SystemButton').toggleClass('pressed', false);
>   		$('#top .SummaryButton').toggleClass('pressed', false);
>   		$('#top .CpuidleButton').toggleClass('pressed', false);
> @@ -242,23 +245,23 @@ function toggleTuning() {
>   		$('#top .TuningButton').toggleClass('pressed', true);
>   		$('#top .AllButton').toggleClass('pressed', false);
>   }
> -function toggleAll() {
> -	        $('#system table').toggleClass('hide', false);
> -		$('#system h2').toggleClass('hide', false);
> -	        $('#summary table').toggleClass('hide', false);
> -		$('#summary h2').toggleClass('hide', false);
> -		$('#summary p').toggleClass('hide', false);
> -	        $('#cpuidle table').toggleClass('hide', false);
> -		$('#cpuidle h2').toggleClass('hide', false);
> -	        $('#cpufreq table').toggleClass('hide', false);
> -		$('#cpufreq h2').toggleClass('hide', false);
> -	        $('#software table').toggleClass('hide', false);
> -		$('#software h2').toggleClass('hide', false);
> -	        $('#device table').toggleClass('hide', false);
> -		$('#device h2').toggleClass('hide', false);
> -		$('#device p').toggleClass('hide', false);
> -		$('#tuning table').toggleClass('hide', false);
> -		$('#tuning h2').toggleClass('hide', false);
> +function toggleAll() {
> +		$('#system table').toggleClass('hide', false);
> +		$('#system h2').toggleClass('hide', false);
> +		$('#summary table').toggleClass('hide', false);
> +		$('#summary h2').toggleClass('hide', false);
> +		$('#summary p').toggleClass('hide', false);
> +		$('#cpuidle table').toggleClass('hide', false);
> +		$('#cpuidle h2').toggleClass('hide', false);
> +		$('#cpufreq table').toggleClass('hide', false);
> +		$('#cpufreq h2').toggleClass('hide', false);
> +		$('#software table').toggleClass('hide', false);
> +		$('#software h2').toggleClass('hide', false);
> +		$('#device table').toggleClass('hide', false);
> +		$('#device h2').toggleClass('hide', false);
> +		$('#device p').toggleClass('hide', false);
> +		$('#tuning table').toggleClass('hide', false);
> +		$('#tuning h2').toggleClass('hide', false);
>   		$('#top .SystemButton').toggleClass('pressed', false);
>   		$('#top .SummaryButton').toggleClass('pressed', false);
>   		$('#top .CpuidleButton').toggleClass('pressed', false);
> @@ -269,9 +272,7 @@ function toggleAll() {
>   		$('#top .AllButton').toggleClass('pressed', true);
>   }
>   </script>
> -<head>
>   <style type=3D\"text/css\">
> -
>   table
>   {
>   	background-color: #F8F8F8;
> @@ -439,94 +440,94 @@ tr.device_even
>   }
>
>   body {
> -    background-color: #eee; /* Background color */
> -    color: #222;            /* Foreground color used for text */
> -    font-family: Helvetica;
> -    font-size: 14px;
> -    margin: 0;              /* Amount of negative space around the
> -                               outside of the body */
> -    padding: 0;             /* Amount of negative space around the
> -                               inside of the body */
> +	background-color: #eee; /* Background color */
> +	color: #222;            /* Foreground color used for text */
> +	font-family: Helvetica;
> +	font-size: 14px;
> +	margin: 0;              /* Amount of negative space around the
> +                                   outside of the body */
> +	padding: 0;             /* Amount of negative space around the
> +                                   inside of the body */
>   }
>   #top h1 {
> -    margin: 0;
> -    padding: 0;
> +	margin: 0;
> +	padding: 0;
>   }
>   #top h1 a {
> -    background-color: #ccc;
> -    border-bottom: 1px solid #666;
> -    color: #222;
> -    display: block;
> -    font-size: 20px;
> -    font-weight: bold;
> -    padding: 10px 0;
> -    text-align: center;
> -    text-decoration: none;
> +	background-color: #ccc;
> +	border-bottom: 1px solid #666;
> +	color: #222;
> +	display: block;
> +	font-size: 20px;
> +	font-weight: bold;
> +	padding: 10px 0;
> +	text-align: center;
> +	text-decoration: none;
>   	text-shadow: 0px 1px 1px #fff;
> -    background-image: -webkit-gradient(linear, left top, left bottom,
> -                                       from(#ccc), to(#999));
> +	background-image: -webkit-gradient(linear, left top, left bottom,
> +						from(#ccc), to(#999));
>   }
>
>
>   #top div {
> -    height: 30px;
> -    font-weight: bold;
> -    text-align: center;
> -    color: white;
> -    text-shadow: rgba(0,0,0,0.6) 0px -1px 1px;
> -    line-height: 28px;
> -    border-width:0px 8px 0px 8px;
> +	height: 30px;
> +	font-weight: bold;
> +	text-align: center;
> +	color: white;
> +	text-shadow: rgba(0,0,0,0.6) 0px -1px 1px;
> +	line-height: 28px;
> +	border-width:0px 8px 0px 8px;
>   }
>   #top div.SystemButton {
> -    position: absolute;
> -    top: 7px;
> -    left: 6px;
> +	position: absolute;
> +	top: 7px;
> +	left: 6px;
>   }
>   #top div.SummaryButton {
> -    position: absolute;
> -    top: 7px;
> -    left: 160px;
> +	position: absolute;
> +	top: 7px;
> +	left: 160px;
>   }
>   #top div.CpuidleButton {
> -    position: absolute;
> -    top: 7px;
> -    left: 320px;
> +	position: absolute;
> +	top: 7px;
> +	left: 320px;
>   }
>   #top div.CpufreqButton {
> -    position: absolute;
> -    top: 7px;
> -    left: 480px;
> +	position: absolute;
> +	top: 7px;
> +	left: 480px;
>   }
>   #top div.SoftwareButton {
> -    position: absolute;
> -    top: 7px;
> -    left: 640px;
> +	position: absolute;
> +	top: 7px;
> +	left: 640px;
>   }
>   #top div.DeviceButton {
> -    position: absolute;
> -    top: 7px;
> -    left: 800px;
> +	position: absolute;
> +	top: 7px;
> +	left: 800px;
>   }
>   #top div.TuningButton {
> -    position: absolute;
> -    top: 7px;
> -    left: 960px;
> +	position: absolute;
> +	top: 7px;
> +	left: 960px;
>   }
>   #top div.AllButton {
> -    position: absolute;
> -    top: 7px;
> -    left: 1120px;
> +	position: absolute;
> +	top: 7px;
> +	left: 1120px;
>   }
>   div.pressed {
>   	background-color: #000000;
> -    border: 1px solid #000000;
> -    color: #000000;
> -    display: block;
> +	border: 1px solid #000000;
> +	color: #000000;
> +	display: block;
>   	border-width:0px 8px 0px 8px;
> -    -webkit-border-top-left-radius: 8px;
> -    -webkit-border-top-right-radius: 8px;
> +	-webkit-border-top-left-radius: 8px;
> +	-webkit-border-top-right-radius: 8px;
>   	-webkit-border-bottom-left-radius: 8px;
> -    -webkit-border-bottom-right-radius: 8px;
> +	-webkit-border-bottom-right-radius: 8px;
>   }
>   table.hide {
>   	display: none;
> diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
> index ef2d1d2..7366454 100644
> --- a/src/process/do_process.cpp
> +++ b/src/process/do_process.cpp
> @@ -985,7 +985,7 @@ void report_process_update_display(void)
>
>   		if (show_power) {
>   			if (reporttype)
> -				fprintf(reportout.http_report,"<tr class=3D\"%s\"><td class=3D\"proc=
ess_power\">%s</td><td class=3D\"process_power\">%s</td><td class=3D\"proce=
ss_power\">%s</td><td class=3D\"process_power\">%s</td><td class=3D\"proces=
s_power\">%s</td></td><td class=3D\"process_power\">%s</td><td>%s</td><td>%=
s</td></tr>\n",
> +				fprintf(reportout.http_report,"<tr class=3D\"%s\"><td class=3D\"proc=
ess_power\">%s</td><td class=3D\"process_power\">%s</td><td class=3D\"proce=
ss_power\">%s</td><td class=3D\"process_power\">%s</td><td class=3D\"proces=
s_power\">%s</td><td class=3D\"process_power\">%s</td><td>%s</td><td>%s</td=
></tr>\n",
>   					process_class(lines), power, usage, wakes, gpus, disks, xwakes, na=
me, pretty_print(all_power[i]->description(), descr, 128));
>   			else
>   				fprintf(reportout.csv_report,"%s, %s, %s, %s, %s, %s, %s, %s,\n",
> diff --git a/src/report.cpp b/src/report.cpp
> index d4f032d..82599e3 100644
> --- a/src/report.cpp
> +++ b/src/report.cpp
> @@ -120,7 +120,7 @@ static void system_info(void)
>
>   	if (reporttype) {
>   		fprintf(reportout.http_report, "<div id=3D\"top\">\n<h1><a href=3D\"#=
top\">&nbsp;</a></h1>\n</div>\n<div id=3D\"system\">\n<table>");
> -		fprintf(reportout.http_report, "<tr class=3D\"system_even\"><td width=
=3D20%%>PowerTOP Version</td><td>%s</td></tr>\n", POWERTOP_VERSION);
> +		fprintf(reportout.http_report, "<tr class=3D\"system_even\"><td width=
=3D\"20%%\">PowerTOP Version</td><td>%s</td></tr>\n", POWERTOP_VERSION);
>   	} else {
>   		fprintf(reportout.csv_report, "***PowerTOP Report***, \n");
>   		fprintf(reportout.csv_report, "**System Information**, \n");


--===============2332262166945864606==--

