Content-Type: multipart/mixed; boundary="===============8404930517041557561=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Add support for device hierarchy. Preserves
 backward compatibility with flat list of devices
Date: Fri, 02 Aug 2013 14:05:53 +0300
Message-ID: <20130802110553.GB2322@XPBYMINW2233.minsk.epam.com>
In-Reply-To: 1375120797-12625-2-git-send-email-christophe.g.zeitouny@intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8404930517041557561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,
some comments are inlined.

On (07/29/13 10:59), Zeitouny, Christophe G wrote:
> ---
>  src/devices/ahci.cpp           |   61 ++--
>  src/devices/ahci.h             |    4 +-
>  src/devices/alsa.cpp           |   30 +-
>  src/devices/alsa.h             |    4 +-
>  src/devices/backlight.cpp      |   29 +-
>  src/devices/backlight.h        |    4 +-
>  src/devices/device.cpp         |  737 ++++++++++++++++++++++++++++++++++=
+++++-
>  src/devices/device.h           |   47 +++
>  src/devices/i915-gpu.cpp       |   28 +-
>  src/devices/i915-gpu.h         |    5 +-
>  src/devices/network.cpp        |   15 +-
>  src/devices/network.h          |    1 +
>  src/devices/rfkill.cpp         |   45 +--
>  src/devices/rfkill.h           |    4 +-
>  src/devices/runtime_pm.cpp     |  106 +++---
>  src/devices/runtime_pm.h       |    9 +-
>  src/devices/thinkpad-fan.cpp   |    8 +-
>  src/devices/thinkpad-fan.h     |    4 +-
>  src/devices/thinkpad-light.cpp |   10 +-
>  src/devices/thinkpad-light.h   |    4 +-
>  src/devices/usb.cpp            |   43 +++
>  src/devices/usb.h              |    4 +-
>  22 files changed, 1005 insertions(+), 197 deletions(-)
> =

> diff --git a/src/devices/ahci.cpp b/src/devices/ahci.cpp
> index 2b8da00..d030712 100644
> --- a/src/devices/ahci.cpp
> +++ b/src/devices/ahci.cpp
> @@ -256,49 +256,38 @@ const char * ahci::device_name(void)
>  	return name;
>  }
>  =

> -void create_all_ahcis(void)
> -{
> -	struct dirent *entry;
> -	DIR *dir;
> +class ahci *create_ahci(char *name, char *host_path) {
> +	char host_name[128];
>  	char filename[4096];
>  =

> -	dir =3D opendir("/sys/class/scsi_host/");
> -	if (!dir)
> -		return;
> -	while (1) {
> -		class ahci *bl;
> -		ofstream file;
> -		ifstream check_file;
> -		entry =3D readdir(dir);
> -		if (!entry)
> -			break;
> -		if (entry->d_name[0] =3D=3D '.')
> -			continue;
> -		sprintf(filename, "/sys/class/scsi_host/%s/ahci_alpm_accounting", entr=
y->d_name);
> +	class ahci *bl;
> +	ofstream file;
>

> +	ifstream check_file;
probably not needed.


>  =

> -		check_file.open(filename, ios::in);
> -		check_file.get();
> -		check_file.close();
> -		if (check_file.bad())
> -			continue;
> -		=

> -		file.open(filename, ios::in);
> -		if (!file)
> -			continue;
> -		file << 1 ;
> -		file.close();
> -		sprintf(filename, "/sys/class/scsi_host/%s", entry->d_name);
> +	sprintf(filename, "%s/scsi_host/%s/ahci_alpm_accounting", host_path, na=
me);
>  =

> -		bl =3D new class ahci(entry->d_name, filename);
> -		all_devices.push_back(bl);
> -		register_parameter("ahci-link-power-active", 0.6);  /* active sata lin=
k takes about 0.6 W */
> -		register_parameter("ahci-link-power-partial");
> -	}
> -	closedir(dir);



> +	check_file.open(filename, ios::in);
> +	check_file.get();
> +	check_file.close();
> +	if (check_file.bad())
> +		return NULL;

access() R_OK ?


> -}
> +	file.open(filename, ios::in);
> +	if (!file)
> +		return NULL;
>  =

> +	file << 1 ;
> +	file.close();
> +	sprintf(filename, "%s", host_path);
> +	sprintf(host_name, "%s", name);
>  =

> +	bl =3D new(std::nothrow) class ahci(host_name, filename);
> +
> +	register_parameter("ahci-link-power-active", 0.6);  /* active sata link=
 takes about 0.6 W */
> +	register_parameter("ahci-link-power-partial");

should we register parameter if allocation failed?


> +	return bl;
> +}
>  =

>  double ahci::power_usage(struct result_bundle *result, struct parameter_=
bundle *bundle)
>  {
> diff --git a/src/devices/ahci.h b/src/devices/ahci.h
> index 2adb87b..00ace2a 100644
> --- a/src/devices/ahci.h
> +++ b/src/devices/ahci.h
> @@ -61,7 +61,7 @@ public:
>  	virtual int grouping_prio(void) { return 1; };
>  };
>  =

> -extern void create_all_ahcis(void);
> +extern class ahci* create_ahci(char *name, char *host_path);
>  =

>  =

> -#endif
> \ No newline at end of file
> +#endif
> diff --git a/src/devices/alsa.cpp b/src/devices/alsa.cpp
> index 33a52f5..9f8a7d0 100644
> --- a/src/devices/alsa.cpp
> +++ b/src/devices/alsa.cpp
> @@ -152,36 +152,48 @@ const char * alsa::device_name(void)
>  	return name;
>  }
>  =

> -void create_all_alsa(void)
> -{
> +std::vector<class alsa*> create_alsa_interface(const char *name, const c=
har *path) {
>  	struct dirent *entry;
>  	DIR *dir;
>  	char filename[4096];
> +	char full_path[512];
> +	vector<class alsa*> result;

I would prefer to return a pointer to allocated vector or pass vector as a =
function
parameter. otherwise we copy existing one upon the return (yes, it's
just N * sizeof(pointer), but still).

> +	snprintf(full_path, sizeof(full_path), "%s/%s", path, name);
> +
> +	dir =3D opendir(full_path);
>  =

> -	dir =3D opendir("/sys/class/sound/card0/");
>  	if (!dir)
> -		return;
> +		return result;
> +
>  	while (1) {
>  		class alsa *bl;
>  		ofstream file;

as far as I see, ostream can be dropped.

>  		entry =3D readdir(dir);
> +
>  		if (!entry)
>  			break;
> +
>  		if (strncmp(entry->d_name, "hwC", 3) !=3D 0)
>  			continue;
> -		sprintf(filename, "/sys/class/sound/card0/%s/power_on_acct", entry->d_=
name);
> +
> +		snprintf(filename, sizeof(filename), "%s/%s/power_on_acct", full_path,=
 entry->d_name);
>  =

>  		if (access(filename, R_OK) !=3D 0)
>  			continue;
>  =

> -		sprintf(filename, "/sys/class/sound/card0/%s", entry->d_name);
> +		snprintf(filename, sizeof(filename), "%s/%s", full_path, entry->d_name=
);
>  =

> -		bl =3D new class alsa(entry->d_name, filename);
> -		all_devices.push_back(bl);
> -		register_parameter("alsa-codec-power", 0.5);
> +		bl =3D new(std::nothrow) class alsa(entry->d_name, filename);
> +
> +		if (bl) {
> +			result.push_back(bl);
> +			register_parameter("alsa-codec-power", 0.5);
> +		}
>  	}
>  	closedir(dir);
>  =

> +	return result;
>  }
>  =

>  =

> diff --git a/src/devices/alsa.h b/src/devices/alsa.h
> index 5aebfd7..dcf0d6f 100644
> --- a/src/devices/alsa.h
> +++ b/src/devices/alsa.h
> @@ -60,7 +60,7 @@ public:
>  =

>  };
>  =

> -extern void create_all_alsa(void);
> +std::vector<class alsa*> create_alsa_interface(const char *name, const c=
har *path);
>  =

>  =

> -#endif
> \ No newline at end of file
> +#endif
> diff --git a/src/devices/backlight.cpp b/src/devices/backlight.cpp
> index 03aa5bc..70f1624 100644
> --- a/src/devices/backlight.cpp
> +++ b/src/devices/backlight.cpp
> @@ -156,37 +156,26 @@ const char * backlight::device_name(void)
>  	return name;
>  }
>  =

> -void create_all_backlights(void)
> -{
> -	struct dirent *entry;
> -	DIR *dir;
> +class backlight *create_backlight_interface(char* name, char* path) {
>  	char filename[4096];
>  =

> -	dir =3D opendir("/sys/class/backlight/");
> -	if (!dir)
> -		return;
> -	while (1) {
> -		class backlight *bl;
> -		entry =3D readdir(dir);
> -		if (!entry)
> -			break;
> -		if (entry->d_name[0] =3D=3D '.')
> -			continue;
> -		sprintf(filename, "/sys/class/backlight/%s", entry->d_name);
> -		bl =3D new class backlight(entry->d_name, filename);
> -		all_devices.push_back(bl);
> +	class backlight *bl;
> +
> +	sprintf(filename, "%s/%s", path, name);
> +
> +	bl =3D new(std::nothrow) class backlight(name, filename);
> +
> +	if (bl) {
>  		register_parameter("backlight");
>  		register_parameter("backlight-power");
>  		register_parameter("backlight-boost-40", 0, 0.5);
>  		register_parameter("backlight-boost-80", 0, 0.5);
>  		register_parameter("backlight-boost-100", 0, 0.5);
>  	}
> -	closedir(dir);
>  =

> +	return bl;
>  }
>  =

> -
> -
>  double backlight::power_usage(struct result_bundle *result, struct param=
eter_bundle *bundle)
>  {
>  	double power;
> diff --git a/src/devices/backlight.h b/src/devices/backlight.h
> index 549654e..9f02de6 100644
> --- a/src/devices/backlight.h
> +++ b/src/devices/backlight.h
> @@ -52,7 +52,7 @@ public:
>  	virtual int grouping_prio(void) { return 10; };
>  };
>  =

> -extern void create_all_backlights(void);
> +extern class backlight *create_backlight_interface(char* name, char* pat=
h);
>  =

>  =

> -#endif
> \ No newline at end of file
> +#endif
> diff --git a/src/devices/device.cpp b/src/devices/device.cpp
> index 00ec5e6..bfe076d 100644
> --- a/src/devices/device.cpp
> +++ b/src/devices/device.cpp
> @@ -30,6 +30,11 @@
>  #include <limits.h>
>  #include <stdlib.h>
>  #include <unistd.h>
> +#include <dirent.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <fcntl.h>
> +
>  =

>  using namespace std;
>  =

> @@ -97,7 +102,7 @@ double	device::utilization(void)
>  }
>  =

>  =

> -
> +vector<class device *> device_roots;
>  vector<class device *> all_devices;
>  =

>  =

> @@ -291,21 +296,727 @@ void show_report_devices(void)
>  	}
>  }
>  =

> +uint32_t get_config(char *device_name, unsigned int offset,
> +			unsigned int length, bool *ok)
> +{
> +	char path[128];

why 128?

> +	int fd;
> +	uint32_t result =3D 0;
> +	uint8_t ret;
> +
> +	if (length > 4)
> +		return -1;
> +
> +	sprintf(path, "%s", SYSFS_DIR);
> +	strncat(path, device_name, 13);
> +	strcat(path, "/config");

this part requires some comments. why do we copy 13 chars of device
name?

> +	fd =3D open(path, O_RDONLY);
> +	if (fd < 0) {
> +		*ok =3D false;
> +		return 0;
> +	}
>  =

> -void create_all_devices(void)
> +	for (unsigned int i =3D 0; i < length; i++) {
> +		if (pread(fd, &ret, 1, offset + i) !=3D 1) {
> +			close(fd);
> +			*ok =3D false;
> +			return 0;
> +		}
> +
> +		result |=3D ret << (i * 8);
> +	}
> +
> +	close(fd);
> +
> +	*ok =3D true;
> +
> +	return result;
> +}
> +
> +uint32_t get_device_class(char *device_name, bool *ok)
> +{
> +	return get_config(device_name, CLASS_OFFSET, 2, ok);
> +}
> +
> +uint32_t get_secondary_bus(char *device_name, bool *ok)
> +{
> +	return get_config(device_name, SECONDARY_BUS_OFFSET, 1, ok);
> +}
> +
> +uint32_t get_subordinate_bus(char *device_name, bool *ok)
> +{
> +	return get_config(device_name, SUBORDINATE_BUS_OFFSET, 1, ok);
> +}
> +
> +void add_pci_device(char *name)
> +{
> +	device *new_device;
> +	char domain[4];
> +	uint32_t device_class;
> +	bool ok =3D true;
> +	unsigned int pci_domain;
> +
> +	strncpy(domain, name, 4);
> +	device_class =3D get_device_class(name, &ok);
> +
> +	if (!ok) {
> +		printf("Error reading device configuration space for device %s\n", nam=
e);
> +		return;
> +	}
> +
> +	pci_domain =3D strtoul(domain, NULL, 16);
> +
> +	if (device_class =3D=3D CLASS_ROOT_BRIDGE) {
> +		/* This is a root hub */
> +		new_device =3D create_root_bridge(name, SYSFS_DIR, pci_domain);
> +		if (new_device) {
> +			new_device->parent_device =3D NULL;
> +			new_device->device_function =3D ROOT_BRIDGE;
> +
> +			device_roots.push_back(new_device);
> +		}
> +	} else {
> +		/* This is a regular PCI device
> +		 * More analysis to be done later
> +		 */
> +		device *parent =3D NULL;
> +
> +		for (size_t i =3D 0; i < device_roots.size(); i++) {
> +			if (device_roots[i]->device_function =3D=3D ROOT_BRIDGE) {
> +				if (((runtime_pmdevice *)device_roots[i])->pci_domain =3D=3D pci_dom=
ain)
> +					parent =3D device_roots[i];
> +			}
> +		}
> +
> +		if (parent !=3D NULL) {
> +
> +			new_device =3D create_pci_device(name, SYSFS_DIR, pci_domain);
> +			if (new_device) {
> +				new_device->parent_device =3D parent;
> +
> +				if ((device_class >> 8) =3D=3D CLASS_NETWORK)
> +					new_device->device_function =3D NETWORK_DEVICE;
> +				else if ((device_class =3D=3D CLASS_PCI_BRIDGE) || (device_class =3D=
=3D CLASS_CARDBUS_BRIDGE))
> +					new_device->device_function =3D PCI_BRIDGE;
> +				else
> +					new_device->device_function =3D PCI_DEVICE;
> +
> +				parent->children.push_back(new_device);
> +			}
> +		}
> +	}
> +
> +	if (new_device) {
> +		new_device->device_class =3D device_class;
> +		strncpy(new_device->name, name, 13);
> +		sprintf(new_device->device_path, "%s%s", SYSFS_DIR, name);
> +
> +		all_devices.push_back(new_device);
> +	}
> +}
> +
> +void populate_devices()
> +{
> +	DIR *dir;
> +	struct dirent *entry;
> +
> +	dir =3D opendir(SYSFS_DIR);
> +
> +	if (!dir)
> +		return;
> +
> +	while ((entry =3D readdir(dir)) !=3D NULL) {
> +
> +		if (entry->d_name[0] =3D=3D '.')
> +			continue;
> +
> +		add_pci_device(entry->d_name);
> +	}
> +
> +	closedir(dir);
> +}
> +
> +void determine_hierarchy(device *root)
> +{
> +	device *temp;
> +	device *bridge;
> +
> +	for (size_t j =3D 0; j < root->children.size(); j++) {
> +		temp =3D root->children[j];
> +		if (temp->device_function !=3D PCI_BRIDGE)
> +			continue;
> +
> +		bridge =3D temp;
> +		bool ok_sec;
> +		bool ok_sub;
> +		uint32_t bus_secondary =3D get_secondary_bus(bridge->name, &ok_sec);
> +		uint32_t bus_subordinate =3D get_subordinate_bus(bridge->name, &ok_sub=
);
> +		char bus_number[5];
> +
> +		if (!ok_sec || !ok_sub )
> +			continue;
> +
> +		for (uint32_t bus =3D bus_secondary; bus <=3D bus_subordinate; bus++) {
> +			sprintf(bus_number, ":%02x:", bus);
> +
> +			/* Now look for all the devices that have this
> +			 * bus number and set them as children of this bridge
> +			 */
> +			device *temp2;
> +			for (vector<device*>::iterator it =3D root->children.begin(); it !=3D=
 root->children.end();) {
> +				temp2 =3D *it;
> +				if (strstr(temp2->name, bus_number) !=3D NULL) {
> +					bridge->children.push_back(temp2);
> +					temp2->parent_device =3D bridge;
> +					it =3D root->children.erase(it);
> +				} else {
> +					++it;
> +				}
> +			}
> +
> +		}
> +
> +		determine_hierarchy(bridge);
> +	}
> +}
> +
> +void recurse_usb(device *root)
> +{
> +	DIR *dir;
> +	struct dirent *entry;
> +	device *new_device;
> +
> +	dir =3D opendir(root->device_path);
> +
> +	if (!dir)
> +		return;
> +
> +	while ((entry =3D readdir(dir)) !=3D NULL) {
> +
> +		if (isdigit(entry->d_name[0]) && !strchr(entry->d_name, ':')) {
> +			root->device_function =3D USB_HUB;
> +
> +			new_device =3D create_usb_device(entry->d_name, root->device_path);
> +
> +			if (!new_device)
> +				continue;
> +
> +			new_device->parent_device =3D root;
> +			new_device->device_function =3D USB_DEVICE;
> +			strncpy(new_device->name, entry->d_name, 13);
> +
> +			snprintf(new_device->device_path,
> +				sizeof(new_device->device_path),
> +				"%s/%s", root->device_path, entry->d_name);

as far as I can see, device creation usually requires some work afterwards:
1) set parent_device (known)
2) set device_function (known at device creation time), besides device
   cration function generally knows which device_function it creates:
   USB, NET, etc.
3) copy 13 chars of device name
4) copy device path

can we move this work to device creation code or factor out as a
separate function?


> +			all_devices.push_back(new_device);
> +			root->children.push_back(new_device);
> +
> +			recurse_usb(new_device);
> +		}
> +	}
> +	closedir(dir);
> +}
> +
> +void discover_usb(device *root)
> +{
> +	if (root->children.size() > 0) {
> +		for (size_t i =3D 0; i < root->children.size(); i++) {
> +			discover_usb(root->children[i]);
> +		}
> +	}
> +
> +	if (root->device_class =3D=3D CLASS_USB) {
> +		DIR *dir;
> +		struct dirent *entry;
> +		device *new_device;
> +
> +		dir =3D opendir(root->device_path);
> +
> +		if (!dir)
> +			return;
> +
> +		while ((entry =3D readdir(dir)) !=3D NULL) {
> +
> +			if (entry->d_name[0] =3D=3D '.')
> +				continue;
> +
> +			if ((strstr(entry->d_name, "usb") !=3D NULL) && (strstr(entry->d_name=
, "usbmon") =3D=3D NULL)) {
> +				root->device_function =3D USB_CONTROLLER;
> +
> +				new_device =3D create_usb_device(entry->d_name, root->device_path);
> +
> +				if (!new_device)
> +					continue;
> +
> +				new_device->parent_device =3D root;
> +				new_device->device_function =3D USB_DEVICE;
> +				strncpy(new_device->name, entry->d_name, 13);
> +
> +				snprintf(new_device->device_path,
> +					sizeof(new_device->device_path),
> +					"%s/%s", root->device_path, entry->d_name);
> +
> +				all_devices.push_back(new_device);
> +				root->children.push_back(new_device);
> +
> +				recurse_usb(new_device);
> +			}
> +		}
> +		closedir(dir);
> +	}
> +}
> +
> +void discover_scsi(device *root)
> +{
> +	if (root->children.size() > 0) {
> +		for (size_t i =3D 0; i < root->children.size(); i++) {
> +			discover_scsi(root->children[i]);
> +		}
> +	}
> +
> +	char path[256];
> +
> +	DIR *dir;
> +	struct dirent *entry;
> +	device *new_device;
> +
> +	strncpy(path, root->device_path, sizeof(path));
> +
> +	if (root->device_function =3D=3D USB_DEVICE) {
> +		dir =3D opendir(root->device_path);
> +		if (!dir)
> +			return;
> +
> +		while ((entry =3D readdir(dir)) !=3D NULL) {
> +			if (isdigit(entry->d_name[0])) {
> +				snprintf(path, sizeof(path), "%s/%s",
> +					root->device_path, entry->d_name);
> +				break;
> +			}
> +		}
> +
> +		closedir(dir);
> +	}
> +
> +	dir =3D opendir(path);
> +
> +	if (!dir)
> +		return;
> +
> +	while ((entry =3D readdir(dir)) !=3D NULL) {
> +
> +		if (strstr(entry->d_name, "host") !=3D NULL) {
> +			new_device =3D create_ahci(entry->d_name, path);
> +
> +			if (new_device) {
> +				new_device->parent_device =3D root;
> +				new_device->device_function =3D SCSI_HOST;
> +				strncpy(new_device->name, entry->d_name, 13);
> +
> +				snprintf(new_device->device_path,
> +					sizeof(new_device->device_path),
> +					"%s/%s", path, entry->d_name);
> +
> +				all_devices.push_back(new_device);
> +				root->children.push_back(new_device);
> +			}
> +		}
> +	}
> +	closedir(dir);
> +}
> +
> +void discover_net_interfaces(class device* parent, char *path)
> +{
> +	DIR *dir;
> +	struct dirent *entry;
> +	device *new_device;
> +
> +	dir =3D opendir(path);
> +	if (!dir)
> +		return;
> +
> +	while ((entry =3D readdir(dir)) !=3D NULL) {
> +		if (strstr(entry->d_name, "lo") !=3D NULL)
> +			continue;
> +
> +		if (entry->d_name[0] =3D=3D '.')
> +			continue;
> +
> +		new_device =3D create_net_interface(entry->d_name, path);
> +		if (new_device) {
> +			new_device->parent_device =3D parent;
> +			new_device->device_function =3D NETWORK_INTERFACE;
> +			strncpy(new_device->name, entry->d_name, 13);
> +			snprintf(new_device->device_path,
> +				sizeof(new_device->device_path), "%s/%s",
> +				path, entry->d_name);
> +
> +			all_devices.push_back(new_device);
> +			parent->children.push_back(new_device);
> +		}
> +	}
> +
> +	closedir(dir);
> +}
> +
> +void discover_alsa_interfaces(class device* parent, char *path)
> +{
> +	DIR *dir;
> +	struct dirent *entry;
> +	vector<class alsa*> new_devices;
> +
> +	dir =3D opendir(path);
> +	if (!dir)
> +		return;
> +
> +	while ((entry =3D readdir(dir)) !=3D NULL) {
> +
> +		if (entry->d_name[0] =3D=3D '.')
> +			continue;
> +
> +		new_devices =3D create_alsa_interface(entry->d_name, path);
> +		for (size_t i =3D 0; i < new_devices.size(); i++) {
> +			class device *new_device =3D new_devices[i];
> +
> +			new_device->parent_device =3D parent;
> +			new_device->device_function =3D AUDIO_INTERFACE;
> +			strncpy(new_device->name, entry->d_name, 13);
> +
> +			snprintf(new_device->device_path,
> +				sizeof(new_device->device_path),
> +				"%s/%s", path, entry->d_name);
> +
> +			all_devices.push_back(new_device);
> +			parent->children.push_back(new_device);
> +		}
> +	}
> +
> +	closedir(dir);
> +}
> +
> +void create_interface(class device* parent, char *path, DeviceFunction f=
unction)
> +{
> +	char *name;
> +	device *new_device;
> +
> +	name =3D strrchr(path, '/');
> +	if (name =3D=3D NULL)
> +		return;
> +
> +	name =3D name + 1;
> +
> +	new_device =3D create_bus_interface(name, path);
> +	if (new_device) {
> +		new_device->parent_device =3D parent;
> +		new_device->device_function =3D function;
> +		strncpy(new_device->name, name, 13);
> +		snprintf(new_device->device_path, sizeof(new_device->device_path), "%s=
", path);
> +		all_devices.push_back(new_device);
> +		parent->children.push_back(new_device);
> +	}
> +}
> +
> +void create_i2c_interface(class device* parent, char *path)
> +{
> +	create_interface(parent, path, I2C_DEVICE);
> +}
> +
> +void create_spi_interface(class device* parent, char *path)
> +{
> +	create_interface(parent, path, SPI_DEVICE);
> +}
> +
> +void discover_backlight_interfaces(class device* parent, char *path)
> +{
> +	DIR *dir;
> +	struct dirent *entry;
> +	device *new_device;
> +
> +	dir =3D opendir(path);
> +	if (!dir)
> +		return;
> +
> +	while ((entry =3D readdir(dir)) !=3D NULL) {
> +		if (entry->d_name[0] =3D=3D '.')
> +			continue;
> +
> +		new_device =3D create_backlight_interface(entry->d_name, path);
> +		if (new_device) {
> +			new_device->parent_device =3D parent;
> +			new_device->device_function =3D BACKLIGHT_DEVICE;
> +			strncpy(new_device->name, entry->d_name, 13);
> +			snprintf(new_device->device_path,
> +				sizeof(new_device->device_path),
> +				"%s/%s", path, entry->d_name);
> +
> +			all_devices.push_back(new_device);
> +			parent->children.push_back(new_device);
> +		}
> +	}
> +
> +	closedir(dir);
> +}
> +
> +void create_rfkill_interfaces(class device* parent, char *path)
> +{
> +	DIR *dir;
> +	struct dirent *entry;
> +	device *new_device;
> +
> +	dir =3D opendir(path);
> +	if (!dir)
> +		return;
> +
> +	while ((entry =3D readdir(dir)) !=3D NULL) {
> +		if (strstr(entry->d_name, "rfkill") =3D=3D NULL)
> +			continue;
> +
> +		new_device =3D create_rfkill_interface(entry->d_name, path);
> +		if (new_device) {
> +			new_device->parent_device =3D parent;
> +			new_device->device_function =3D RFKILL;
> +			strncpy(new_device->name, entry->d_name, 13);
> +			snprintf(new_device->device_path,
> +				sizeof(new_device->device_path),
> +				"%s/%s", path, entry->d_name);
> +
> +			all_devices.push_back(new_device);
> +			parent->children.push_back(new_device);
> +		}
> +	}
> +
> +	closedir(dir);
> +}
> +
> +void discover_ieee80211_interfaces(class device* parent, char *path)
> +{
> +	DIR *dir;
> +	struct dirent *entry;
> +	char new_path[512];
> +
> +	dir =3D opendir(path);
> +	if (!dir)
> +		return;
> +
> +	while ((entry =3D readdir(dir)) !=3D NULL) {
> +		if (entry->d_name[0] =3D=3D '.')
> +			continue;
> +
> +		snprintf(new_path, sizeof(new_path), "%s/%s", path, entry->d_name);
> +		create_rfkill_interfaces(parent, new_path);
> +	}
> +
> +	closedir(dir);
> +}
> +
> +void discover_devices(class device* root, const char *name, void cb(clas=
s device*, char*))
> +{
> +	if (root->children.size() > 0) {
> +		for (size_t i =3D 0; i < root->children.size(); i++) {
> +			discover_devices(root->children[i], name, cb);
> +		}
> +	}
> +
> +	char path[256];
> +
> +	DIR *dir;
> +	struct dirent *entry;
> +
> +	strncpy(path, root->device_path, sizeof(path));
> +
> +	if (root->device_function =3D=3D USB_DEVICE) {
> +		dir =3D opendir(root->device_path);
> +		if (!dir)
> +			return;
> +
> +		while ((entry =3D readdir(dir)) !=3D NULL) {
> +			if (isdigit(entry->d_name[0])) {
> +				snprintf(path, sizeof(path), "%s/%s",
> +					root->device_path, entry->d_name);
> +				break;
> +			}
> +		}
> +		closedir(dir);
> +	}
> +
> +	dir =3D opendir(path);
> +
> +	if (!dir)
> +		return;
> +
> +	while ((entry =3D readdir(dir)) !=3D NULL) {
> +
> +		if (strstr(entry->d_name, name) !=3D NULL) {
> +			char new_path[512];
> +			snprintf(new_path, sizeof(new_path), "%s/%s",
> +				path, entry->d_name);
> +			cb(root, new_path);
> +		}
> +	}
> +	closedir(dir);
> +}
> +
> +void discover_unattached_devices(const char *path, DeviceFunction functi=
on)
> +{
> +	DIR *dir;
> +	struct dirent *entry;
> +	device *new_device;
> +
> +	dir =3D opendir(path);
> +
> +	if (!dir)
> +		return;
> +
> +	while ((entry =3D readdir(dir)) !=3D NULL) {
> +
> +		if (entry->d_name[0] =3D=3D '.')
> +			continue;
> +
> +		bool found =3D false;
> +
> +		for (size_t i =3D 0; i < all_devices.size(); i++) {
> +			if (strstr(entry->d_name, all_devices[i]->device_name()) !=3D NULL)
> +				found =3D true;
> +		}
> +
> +		if (!found) {
> +			new_device =3D create_bus_interface(entry->d_name, path);
> +			if (new_device) {
> +				new_device->parent_device =3D NULL;
> +				new_device->device_function =3D function;
> +				strncpy(new_device->name, entry->d_name, 13);
> +				snprintf(new_device->device_path,
> +					sizeof(new_device->device_path),
> +					"%s/%s", path, entry->d_name);
> +
> +				all_devices.push_back(new_device);
> +				device_roots.push_back(new_device);
> +			}
> +		}
> +	}
> +	closedir(dir);
> +}
> +
> +void discover_i915_gpu(class device* root)
>  {
> -	create_all_backlights();
> -	create_all_usb_devices();
> -	create_all_ahcis();
> -	create_all_alsa();
> -	create_all_rfkills();
> -	create_i915_gpu();
> -	create_thinkpad_fan();
> -	create_thinkpad_light();
> -	create_all_nics();
> -	create_all_runtime_pm_devices();
> +	if (root->children.size() > 0) {
> +		for (size_t i =3D 0; i < root->children.size(); i++) {
> +			discover_i915_gpu(root->children[i]);
> +		}
> +	}
> +
> +	char path[256];
> +	char driver_path[512];
> +	char buffer[1024] =3D {0};
> +	bool found =3D false;
> +	class device *new_device =3D NULL;
> +	class device *rapl_device =3D NULL;
> +
> +	DIR *dir;
> +	struct dirent *entry;
> +
> +	strncpy(path, root->device_path, sizeof(path));
> +
> +	if (root->device_function =3D=3D USB_DEVICE) {
> +		dir =3D opendir(root->device_path);
> +		if (!dir)
> +			return;
> +
> +		while ((entry =3D readdir(dir)) !=3D NULL) {
> +			if (isdigit(entry->d_name[0])) {
> +				snprintf(path, sizeof(path), "%s/%s",
> +					root->device_path, entry->d_name);
> +				break;
> +			}
> +		}
> +		closedir(dir);
> +	}
> +
> +	snprintf(driver_path, sizeof(driver_path), "%s/driver", path);
> +	if (readlink(driver_path, buffer, sizeof(buffer)) > 0) {
> +		char *temp =3D strrchr(buffer, '/');
> +		if (temp) {
> +			/* Advance to next character */
> +			temp =3D temp + 1;
> +			if (strcmp(temp, "i915") =3D=3D 0)
> +				found =3D true;
> +		}
> +	}
> +
> +	if (found) {
> +		new_device =3D create_i915_gpu();
> +		rapl_device =3D (class device *) create_gpu_rapl((class i915gpu *) new=
_device);
> +	}
> +
> +	if (new_device) {
> +		new_device->parent_device =3D root;
> +		new_device->device_function =3D I915_DEVICE;
> +		sprintf(new_device->name, "i915 GPU");
> +		strncpy(new_device->device_path, driver_path, sizeof(new_device->devic=
e_path));
> +		all_devices.push_back(new_device);
> +		root->children.push_back(new_device);
> +	}
> +
> +	if (rapl_device) {
> +		rapl_device->parent_device =3D root;
> +		rapl_device->device_function =3D I915_DEVICE;
> +		sprintf(rapl_device->name, "i915 GPU");
> +		strncpy(rapl_device->device_path, driver_path, sizeof(rapl_device->dev=
ice_path));
> +		all_devices.push_back(rapl_device);
> +		root->children.push_back(rapl_device);
> +	}
>  }
>  =

> +void create_all_devices(void)
> +{
> +	class device *temp;
> +	vector<device*>::iterator it;
> +
> +	populate_devices();
> +
> +	/* First discover everything that could potentially hold a hub or bridg=
e */
> +
> +	for (it =3D device_roots.begin(); it !=3D device_roots.end(); it++) {
> +		determine_hierarchy(*it);
> +	}
> +
> +	for (it =3D device_roots.begin(); it !=3D device_roots.end(); it++) {
> +		discover_usb(*it);
> +	}
> +
> +	/* Then discover the devices that can only be endpoints */
> +
> +	for (it =3D device_roots.begin(); it !=3D device_roots.end(); it++) {
> +		discover_scsi(*it);
> +		discover_devices(*it, "net", discover_net_interfaces);
> +		discover_devices(*it, "sound", discover_alsa_interfaces);
> +		discover_devices(*it, "i2c-", create_i2c_interface);
> +		discover_devices(*it, "spi", create_spi_interface);
> +		discover_devices(*it, "backlight", discover_backlight_interfaces);
> +		discover_devices(*it, "ieee80211", discover_ieee80211_interfaces);
> +		discover_i915_gpu(*it);
> +	}
> +
> +	discover_unattached_devices("/sys/bus/i2c/devices", I2C_DEVICE);
> +	discover_unattached_devices("/sys/bus/spi/devices", SPI_DEVICE);
> +	discover_unattached_devices("/sys/bus/platform/devices", PLATFORM_DEVIC=
E);
> +
> +	temp =3D create_thinkpad_fan();
> +	if (temp) {
> +		temp->device_function =3D THINKPAD_FAN;
> +		device_roots.push_back(temp);
> +		all_devices.push_back(temp);
> +	}
> +
> +	temp =3D create_thinkpad_light();
> +	if (temp) {
> +		temp->device_function =3D THINKPAD_LIGHT;
> +		device_roots.push_back(temp);
> +		all_devices.push_back(temp);
> +	}
> +}
>  =

>  void clear_all_devices(void)
>  {
> @@ -313,5 +1024,7 @@ void clear_all_devices(void)
>  	for (i =3D 0; i < all_devices.size(); i++) {
>  		delete all_devices[i];
>  	}
> +
> +	device_roots.clear();
>  	all_devices.clear();
>  }
> diff --git a/src/devices/device.h b/src/devices/device.h
> index a373875..88e3298 100644
> --- a/src/devices/device.h
> +++ b/src/devices/device.h
> @@ -28,6 +28,40 @@
>  =

>  #include <vector>
>  #include <limits.h>
> +#include <stdint.h>
> +
> +#define SYSFS_DIR	"/sys/bus/pci/devices/"
> +
> +#define CLASS_OFFSET		0x0a
> +#define SECONDARY_BUS_OFFSET	0x19
> +#define SUBORDINATE_BUS_OFFSET	0x1A
> +
> +#define CLASS_ROOT_BRIDGE	0x0600
> +#define CLASS_PCI_BRIDGE	0x0604
> +#define CLASS_CARDBUS_BRIDGE	0x0607
> +#define CLASS_USB		0x0C03
> +#define CLASS_NETWORK		0x02
> +
> +typedef enum {
> +	ROOT_BRIDGE =3D 0,
> +	PCI_BRIDGE,
> +	PCI_DEVICE,
> +	USB_CONTROLLER,
> +	USB_HUB,
> +	USB_DEVICE,
> +	SCSI_HOST,
> +	NETWORK_DEVICE,
> +	NETWORK_INTERFACE,
> +	AUDIO_INTERFACE,
> +	I2C_DEVICE,
> +	SPI_DEVICE,
> +	PLATFORM_DEVICE,
> +	BACKLIGHT_DEVICE,
> +	I915_DEVICE,
> +	RFKILL,
> +	THINKPAD_FAN,
> +	THINKPAD_LIGHT,
> +} DeviceFunction;
>  =

>  struct parameter_bundle;
>  struct result_bundle;
> @@ -40,6 +74,15 @@ public:
>  	char guilty[4096];
>  	char real_path[PATH_MAX+1];
>  =

> +	char name[13];
> +	char device_path[256];
> +
> +	unsigned int device_class;
> +	DeviceFunction device_function;
> +
> +	device *parent_device;
> +	std::vector<class device*> children;
> +
>  	virtual void start_measurement(void);
>  	virtual void end_measurement(void);
>  =

> @@ -71,6 +114,10 @@ public:
>  =

>  using namespace std;
>  =

> +/* This only houses the roots of the device trees. This means that we ca=
n easily go down a tree */
> +extern vector<class device *> device_roots;
> +
> +/* This houses all devices. Keep this since it offers much more efficien=
t access when we need to loop over all devices */
>  extern vector<class device *> all_devices;
>  =

>  extern void devices_start_measurement(void);
> diff --git a/src/devices/i915-gpu.cpp b/src/devices/i915-gpu.cpp
> index a2cfaa5..b2de97a 100644
> --- a/src/devices/i915-gpu.cpp
> +++ b/src/devices/i915-gpu.cpp
> @@ -71,11 +71,10 @@ double i915gpu::utilization(void)
>  =

>  }
>  =

> -void create_i915_gpu(void)
> +class i915gpu *create_i915_gpu(void)
>  {
>  	char filename[4096];
>  	class i915gpu *gpu;
> -	gpu_rapl_device *rapl_dev;
>  =

>  	strcpy(filename, "/sys/kernel/debug/tracing/events/i915/i915_gem_ring_d=
ispatch/format");
>  =

> @@ -83,20 +82,31 @@ void create_i915_gpu(void)
>  		/* try an older tracepoint */
>  		strcpy(filename, "/sys/kernel/debug/tracing/events/i915/i915_gem_reque=
st_submit/format");
>  		if (access(filename, R_OK) !=3D 0)
> -			return;
> +			return NULL;
>  	}
>  =

> -	register_parameter("gpu-operations");
> +	gpu =3D new(std::nothrow) class i915gpu();
>  =

> -	gpu =3D new class i915gpu();
> -	all_devices.push_back(gpu);
> +	if (gpu)
> +		register_parameter("gpu-operations");
>  =

> -	rapl_dev =3D new class gpu_rapl_device(gpu);
> -	if (rapl_dev->device_present())
> -		all_devices.push_back(rapl_dev);
> +	return gpu;
>  }
>  =

> +class gpu_rapl_device *create_gpu_rapl(class i915gpu* gpu)
> +{
> +	gpu_rapl_device *rapl_dev;
> +
> +	if (!gpu)
> +		return NULL;
>  =

> +	rapl_dev =3D new(std::nothrow) class gpu_rapl_device(gpu);
> +
> +	if (rapl_dev && rapl_dev->device_present())
> +		return rapl_dev;
> +
> +	return NULL;
> +}
>  =

>  double i915gpu::power_usage(struct result_bundle *result, struct paramet=
er_bundle *bundle)
>  {
> diff --git a/src/devices/i915-gpu.h b/src/devices/i915-gpu.h
> index 7653b94..881e8a4 100644
> --- a/src/devices/i915-gpu.h
> +++ b/src/devices/i915-gpu.h
> @@ -52,7 +52,8 @@ public:
>  	virtual void add_child(device *dev_ptr) { child_devices.push_back(dev_p=
tr);}
>  };
>  =

> -extern void create_i915_gpu(void);
> +extern class i915gpu *create_i915_gpu(void);
> +extern class gpu_rapl_device *create_gpu_rapl(class i915gpu* gpu);
>  =

>  =

> -#endif
> \ No newline at end of file
> +#endif
> diff --git a/src/devices/network.cpp b/src/devices/network.cpp
> index 3b67610..6670236 100644
> --- a/src/devices/network.cpp
> +++ b/src/devices/network.cpp
> @@ -356,7 +356,6 @@ void netdev_callback(const char *d_name)
>  	}
>  }
>  =

> -
>  void create_all_nics(callback fn)
>  {
>  	if (!fn)
> @@ -364,6 +363,20 @@ void create_all_nics(callback fn)
>  	process_directory("/sys/class/net/", fn);
>  }
>  =

> +network *create_net_interface(char *name, char *path) {
> +	char full_path[512];
> +
> +	snprintf(full_path, sizeof(full_path), "%s/%s", path, name);
> +
> +	network *bl =3D new(std::nothrow) class network(name, full_path);
> +	if (bl) {
> +		nics[name] =3D bl;
> +		return bl;
> +	}
> +
> +	return NULL;
> +}
> +
>  double network::power_usage(struct result_bundle *result, struct paramet=
er_bundle *bundle)
>  {
>  	double power;
> diff --git a/src/devices/network.h b/src/devices/network.h
> index 45dc130..a606377 100644
> --- a/src/devices/network.h
> +++ b/src/devices/network.h
> @@ -80,5 +80,6 @@ public:
>  };
>  =

>  extern void create_all_nics(callback fn =3D NULL);
> +extern network *create_net_interface(char *name, char *path);
>  =

>  #endif
> diff --git a/src/devices/rfkill.cpp b/src/devices/rfkill.cpp
> index 2404432..ec0506a 100644
> --- a/src/devices/rfkill.cpp
> +++ b/src/devices/rfkill.cpp
> @@ -136,41 +136,24 @@ const char * rfkill::device_name(void)
>  	return name;
>  }
>  =

> -void create_all_rfkills(void)
> +class rfkill *create_rfkill_interface(char* name, char* path)
>  {
> -	struct dirent *entry;
> -	DIR *dir;
>  	char filename[4096];
> -	char name[4096];
> -
> -	dir =3D opendir("/sys/class/rfkill/");
> -	if (!dir)
> -		return;
> -	while (1) {
> -		class rfkill *bl;
> -		ifstream file;
> -		entry =3D readdir(dir);
> -		if (!entry)
> -			break;
> -		if (entry->d_name[0] =3D=3D '.')
> -			continue;
> -		sprintf(filename, "/sys/class/rfkill/%s/name", entry->d_name);
> -		strcpy(name, entry->d_name);
> -		file.open(filename, ios::in);
> -		if (file) {
> -			file.getline(name, 100);
> -			file.close();
> -		}
> -
> -		sprintf(filename, "/sys/class/rfkill/%s", entry->d_name);
> -		bl =3D new class rfkill(name, filename);
> -		all_devices.push_back(bl);
> -	}
> -	closedir(dir);
> +	char phy_name[4096];
> +	ifstream file;
>  =

> -}
> +	snprintf(filename, sizeof(filename), "/sys/class/rfkill/%s/name", name);
>  =

> +	file.open(filename, ios::in);
> +	if (file) {
> +		file.getline(phy_name, 100);
> +		file.close();
> +	}
> +
> +	snprintf(filename, sizeof(filename), "/sys/class/rfkill/%s", name);
>  =

> +	return new(std::nothrow) class rfkill(phy_name, filename);
> +}
>  =

>  double rfkill::power_usage(struct result_bundle *result, struct paramete=
r_bundle *bundle)
>  {
> @@ -185,4 +168,4 @@ double rfkill::power_usage(struct result_bundle *resu=
lt, struct parameter_bundle
>  	power +=3D util * factor / 100.0;
>  =

>  	return power;
> -}
> \ No newline at end of file
> +}
> diff --git a/src/devices/rfkill.h b/src/devices/rfkill.h
> index c24e03b..145340e 100644
> --- a/src/devices/rfkill.h
> +++ b/src/devices/rfkill.h
> @@ -55,7 +55,7 @@ public:
>  	virtual int grouping_prio(void) { return 5; };
>  };
>  =

> -extern void create_all_rfkills(void);
> +extern class rfkill *create_rfkill_interface(char* name, char* path);
>  =

>  =

> -#endif
> \ No newline at end of file
> +#endif
> diff --git a/src/devices/runtime_pm.cpp b/src/devices/runtime_pm.cpp
> index bbc3bf0..b7aa863 100644
> --- a/src/devices/runtime_pm.cpp
> +++ b/src/devices/runtime_pm.cpp
> @@ -171,70 +171,74 @@ int device_has_runtime_pm(const char *sysfs_path)
>  	return 0;
>  }
>  =

> +static class runtime_pmdevice *create_pci(const char *name, const char *=
path, unsigned int pci_domain, bool is_root_bridge) {
>  =

> -static void do_bus(const char *bus)
> -{
> -	/* /sys/bus/pci/devices/0000\:00\:1f.0/power/runtime_suspended_time */
> -
> -	struct dirent *entry;
> -	DIR *dir;
>  	char filename[4096];
> +	char device_name[128];
>  =

> -	sprintf(filename, "/sys/bus/%s/devices/", bus);
> -	dir =3D opendir(filename);
> -	if (!dir)
> -		return;
> -	while (1) {
> -		ifstream file;
> -		class runtime_pmdevice *dev;
> -		entry =3D readdir(dir);
> +	ifstream file;
> +	class runtime_pmdevice *dev;
>  =

> -		if (!entry)
> -			break;
> -		if (entry->d_name[0] =3D=3D '.')
> -			continue;
> +	snprintf(filename, sizeof(filename), "%s/%s", path, name);
> +	snprintf(device_name, sizeof(device_name), "%s", name);
>  =

> -		sprintf(filename, "/sys/bus/%s/devices/%s", bus, entry->d_name);
> +	if (!device_has_runtime_pm(filename) && !is_root_bridge) {
> +		return NULL;
> +	}
>  =

> -		if (!device_has_runtime_pm(filename))
> -			continue;
> +	dev =3D new class runtime_pmdevice(name, filename);
>  =

> -		dev =3D new class runtime_pmdevice(entry->d_name, filename);
> +	uint16_t vendor =3D 0, device =3D 0;
>  =

> -		if (strcmp(bus, "pci") =3D=3D 0) {
> -			uint16_t vendor =3D 0, device =3D 0;
> +	snprintf(filename, sizeof(filename), "%s/%s/vendor", path, name);
> +	file.open(filename, ios::in);
> +	if (file) {
> +		file >> hex >> vendor;
> +		file.close();
> +	}
>  =

> -			sprintf(filename, "/sys/bus/%s/devices/%s/vendor", bus, entry->d_name=
);
> +	snprintf(filename, sizeof(filename), "%s/%s/device", path, name);
> +	file.open(filename, ios::in);
> +	if (file) {
> +		file >> hex >> device;
> +		file.close();
> +	}
>  =

> -			file.open(filename, ios::in);
> -			if (file) {
> -				file >> hex >> vendor;
> -				file.close();
> -			}
> +	if (vendor && device) {
> +		char devname[4096];
> +		if (is_root_bridge) {
> +			snprintf(devname, sizeof(devname), _("PCI Root Bridge: %s"), pci_id_t=
o_name(vendor, device, filename, 4095));
> +			dev->set_human_name(devname);
> +		} else {
> +			snprintf(devname, sizeof(devname), _("PCI Device: %s"), pci_id_to_nam=
e(vendor, device, filename, 4095));
> +			dev->set_human_name(devname);
> +		}
> +	}
>  =

> +	dev->pci_domain =3D pci_domain;
>  =

> -			sprintf(filename, "/sys/bus/%s/devices/%s/device", bus, entry->d_name=
);
> -			file.open(filename, ios::in);
> -			if (file) {
> -				file >> hex >> device;
> -				file.close();
> -			}
> +	return dev;
> +}
>  =

> -			if (vendor && device) {
> -				char devname[4096];
> -				sprintf(devname, _("PCI Device: %s"), pci_id_to_name(vendor, device,=
 filename, 4095));
> -				dev->set_human_name(devname);
> -			}
> -		}
> -		all_devices.push_back(dev);
> -	}
> -	closedir(dir);
> +class runtime_pmdevice *create_root_bridge(const char *name, const char =
*path, unsigned int pci_domain) {
> +	return create_pci(name, path, pci_domain, true);
>  }
>  =

> -void create_all_runtime_pm_devices(void)
> -{
> -	do_bus("pci");
> -	do_bus("spi");
> -	do_bus("platform");
> -	do_bus("i2c");
> +class runtime_pmdevice *create_pci_device(const char *name, const char *=
path, unsigned int pci_domain) {
> +	return create_pci(name, path, pci_domain, false);
> +}
> +
> +class runtime_pmdevice *create_bus_interface(const char *name, const cha=
r *path) {
> +	char filename[4096];
> +
> +	class runtime_pmdevice *dev;
> +
> +	sprintf(filename, "%s/%s", path, name);
> +
> +	if (!device_has_runtime_pm(filename))
> +		return NULL;
> +
> +	dev =3D new(std::nothrow) class runtime_pmdevice(name, filename);
> +
> +	return dev;
>  }
> diff --git a/src/devices/runtime_pm.h b/src/devices/runtime_pm.h
> index ea09dac..6a1afc8 100644
> --- a/src/devices/runtime_pm.h
> +++ b/src/devices/runtime_pm.h
> @@ -55,11 +55,16 @@ public:
>  =

>  	void set_human_name(char *name);
>  	virtual int grouping_prio(void) { return 1; };
> +
> +public:
> +	unsigned int pci_domain;
>  };
>  =

> -extern void create_all_runtime_pm_devices(void);
> +extern class runtime_pmdevice *create_root_bridge(const char *name, cons=
t char *path, unsigned int pci_domain);
> +extern class runtime_pmdevice *create_pci_device(const char *name, const=
 char *path, unsigned int pci_domain);
> +extern class runtime_pmdevice *create_bus_interface(const char *name, co=
nst char *path);
>  =

>  extern int device_has_runtime_pm(const char *sysfs_path);
>  =

>  =

> -#endif
> \ No newline at end of file
> +#endif
> diff --git a/src/devices/thinkpad-fan.cpp b/src/devices/thinkpad-fan.cpp
> index 9f470e4..2bc6914 100644
> --- a/src/devices/thinkpad-fan.cpp
> +++ b/src/devices/thinkpad-fan.cpp
> @@ -72,7 +72,7 @@ double thinkpad_fan::utilization(void)
>  	return (start_rate+end_rate) / 2;
>  }
>  =

> -void create_thinkpad_fan(void)
> +class thinkpad_fan *create_thinkpad_fan(void)
>  {
>  	char filename[4096];
>  	class thinkpad_fan *fan;
> @@ -80,14 +80,14 @@ void create_thinkpad_fan(void)
>  	strcpy(filename, "/sys/devices/platform/thinkpad_hwmon/fan1_input");
>  =

>  	if (access(filename, R_OK) !=3D0)
> -		return;
> +		return NULL;
>  =

>  	register_parameter("thinkpad-fan", 10);
>  	register_parameter("thinkpad-fan-sqr", 5);
>  	register_parameter("thinkpad-fan-cub", 10);
>  =

> -	fan =3D new class thinkpad_fan();
> -	all_devices.push_back(fan);
> +	fan =3D new(std::nothrow) class thinkpad_fan();
> +	return fan;
>  }
>  =

>  =

> diff --git a/src/devices/thinkpad-fan.h b/src/devices/thinkpad-fan.h
> index 34c4c43..e5e47c0 100644
> --- a/src/devices/thinkpad-fan.h
> +++ b/src/devices/thinkpad-fan.h
> @@ -52,7 +52,7 @@ public:
>  	virtual int grouping_prio(void) { return 1; };
>  };
>  =

> -extern void create_thinkpad_fan(void);
> +extern class thinkpad_fan *create_thinkpad_fan(void);
>  =

>  =

> -#endif
> \ No newline at end of file
> +#endif
> diff --git a/src/devices/thinkpad-light.cpp b/src/devices/thinkpad-light.=
cpp
> index e5fde10..2b4882c 100644
> --- a/src/devices/thinkpad-light.cpp
> +++ b/src/devices/thinkpad-light.cpp
> @@ -70,7 +70,7 @@ double thinkpad_light::utilization(void)
>  	return (start_rate+end_rate) / 2.55 / 2.0;
>  }
>  =

> -void create_thinkpad_light(void)
> +class thinkpad_light *create_thinkpad_light(void)
>  {
>  	char filename[4096];
>  	class thinkpad_light *light;
> @@ -78,16 +78,14 @@ void create_thinkpad_light(void)
>  	strcpy(filename, "/sys/devices/platform/thinkpad_acpi/leds/tpacpi::thin=
klight/brightness");
>  =

>  	if (access(filename, R_OK) !=3D0)
> -		return;
> +		return NULL;
>  =

>  	register_parameter("thinkpad-light", 10);
>  =

> -	light =3D new class thinkpad_light();
> -	all_devices.push_back(light);
> +	light =3D new(std::nothrow) class thinkpad_light();
> +	return light;
>  }
>  =

> -
> -
>  double thinkpad_light::power_usage(struct result_bundle *result, struct =
parameter_bundle *bundle)
>  {
>  	double power;
> diff --git a/src/devices/thinkpad-light.h b/src/devices/thinkpad-light.h
> index 64a1789..90f9c45 100644
> --- a/src/devices/thinkpad-light.h
> +++ b/src/devices/thinkpad-light.h
> @@ -52,7 +52,7 @@ public:
>  	virtual int grouping_prio(void) { return 1; };
>  };
>  =

> -extern void create_thinkpad_light(void);
> +extern class thinkpad_light *create_thinkpad_light(void);
>  =

>  =

> -#endif
> \ No newline at end of file
> +#endif
> diff --git a/src/devices/usb.cpp b/src/devices/usb.cpp
> index e7542a8..bf13bbc 100644
> --- a/src/devices/usb.cpp
> +++ b/src/devices/usb.cpp
> @@ -186,6 +186,49 @@ double usbdevice::power_usage(struct result_bundle *=
result, struct parameter_bun
>  	return power;
>  }
>  =

> +class usbdevice* create_usb_device(char *name, char *path) {
> +	char filename[4096];
> +
> +	ifstream file;
> +	class usbdevice *usb;
> +	char device_name[4096];
> +	char vendorid[64], devid[64];
> +	char devid_name[4096];
> +
> +	sprintf(filename, "%s/%s", path, name);
> +
> +	sprintf(device_name, "%s/power/active_duration", filename);
> +	if (access(device_name, R_OK)!=3D0)
> +		return NULL;
> +
> +	sprintf(device_name, "%s/idVendor", filename);
> +	file.open(device_name, ios::in);
> +	if (file) {
> +		file.getline(vendorid, 64);
> +	}
> +	file.close();
> +
> +	sprintf(device_name, "%s/idProduct", filename);
> +	file.open(device_name, ios::in);
> +	if (file) {
> +		file.getline(devid, 64);
> +	}
> +	file.close();
> +
> +	sprintf(devid_name, "usb-device-%s-%s", vendorid, devid);
> +
> +	sprintf(device_name, "usb-device-%s-%s-%s", name, vendorid, devid);
> +
> +	if (result_device_exists(device_name)) {
> +		return NULL;
> +	}
> +
> +	usb =3D new class usbdevice(device_name, filename, devid_name);
> +
> +	register_parameter(devid_name, 0.1);
> +
> +	return usb;
> +}
>  =

>  void create_all_usb_devices(void)
>  {
> diff --git a/src/devices/usb.h b/src/devices/usb.h
> index 39a746a..a13cfb6 100644
> --- a/src/devices/usb.h
> +++ b/src/devices/usb.h
> @@ -57,7 +57,7 @@ public:
>  	virtual int grouping_prio(void) { return 4; };
>  };
>  =

> +extern class usbdevice* create_usb_device(char *name, char *path);
>  extern void create_all_usb_devices(void);
>  =

> -
> -#endif
> \ No newline at end of file
> +#endif
> -- =

> 1.7.9.5
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============8404930517041557561==--

