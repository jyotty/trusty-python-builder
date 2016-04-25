python_binpath := /opt/python-$(PYTHON_VERSION)/bin/python$(firstword $(subst ., ,$(PYTHON_VERSION)))

build: $(python_binpath)
	fpm -t deb -s dir -a amd64 -p build -v $(PYTHON_VERSION) --iteration 1 -n trusty-python /opt/python-$(PYTHON_VERSION)

$(python_binpath): Python-$(PYTHON_VERSION)
	cd Python-$(PYTHON_VERSION) && ./configure --prefix /opt/python-$(PYTHON_VERSION) --enable-ipv6
	$(MAKE) -C Python-$(PYTHON_VERSION)
	sudo $(MAKE) -C Python-$(PYTHON_VERSION) install

Python-$(PYTHON_VERSION): Python-$(PYTHON_VERSION).tgz
	gpg --verify Python-$(PYTHON_VERSION).tgz.asc Python-$(PYTHON_VERSION).tgz
	tar zxf Python-$(PYTHON_VERSION).tgz

Python-$(PYTHON_VERSION).tgz Python-$(PYTHON_VERSION).tgz.asc:
	curl --progress-bar -O 'https://www.python.org/ftp/python/$(PYTHON_VERSION)/Python-$(PYTHON_VERSION).tgz{,.asc}'
