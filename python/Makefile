PYTHON_VERSION ?= 2.7.11

build: /opt/python-$(PYTHON_VERSION)/bin/python2.7

/opt/python-$(PYTHON_VERSION)/bin/python: verify_tarball
	tar zxf Python-$(PYTHON_VERSION).tgz
	cd Python-$(PYTHON_VERSION) && ./configure --prefix /opt/python-$(PYTHON_VERSION) --enable-ipv6
	$(MAKE) -C Python-$(PYTHON_VERSION)
	sudo $(MAKE) -C Python-$(PYTHON_VERSION) install

verify_tarball: Python-$(PYTHON_VERSION).tgz Python-$(PYTHON_VERSION).tgz.asc
	gpg --verify Python-$(PYTHON_VERSION).tgz.asc Python-$(PYTHON_VERSION).tgz

Python-$(PYTHON_VERSION).tgz Python-$(PYTHON_VERSION).tgz.asc:
	curl --progress-bar -O 'https://www.python.org/ftp/python/$(PYTHON_VERSION)/Python-$(PYTHON_VERSION).tgz{,.asc}'
