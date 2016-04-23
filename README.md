# Build alternate pythons for Ubuntu Trusty

Will create a package that installs a specified Python version—2.7.11 by default—into `/opt/python-VERSION`. 
You can then manipulate your `PATH`, or use `virtualenv --python=/opt/python-VERSION/bin/python`
or set `ansible_python_interpreter` as needed.

## Rationale

Canonical has not patched [CVE-2014-9365](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-9365) since
verifying TLS certificates "[most certainly will break certain setups](https://people.canonical.com/~ubuntu-security/cve/2014/CVE-2014-9365.html)".
While pyenv is nice, building from source is not suitable for hundreds of production systems. And I don't trust people
who write Dockerfiles to verify anything.

## Usage

Import the gpg key for the Ubuntu Vagrant cloud images, then
```
make build [PYTHON_VERSION=x.y.z]
```
Will download the cloud image checksums, verify them, start a vagrant box with the verified image, and finally 
download, verify, and build python in that box. The resultant package will be placed in the synced folder `python/build`.

You can upload the resultant package to packagecloud if you already have that set up:
```
make upload PACKAGECLOUD_REPO=myusername/myrepo [PYTHON_VERSION=2.7.x]
```

