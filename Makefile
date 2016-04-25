TRUSTY_BASE_URL := https://cloud-images.ubuntu.com/vagrant/trusty/current
TRUSTY_PATH     := vagrant/
PYTHON_VERSION  ?= 2.7.11

DEB := python/build/trusty-python_$(PYTHON_VERSION)-1_amd64.deb

.PHONY: verify_box vagrant_up
all: verify_sums vagrant_up

build: $(DEB)

$(DEB): | vagrant_up
	vagrant ssh -c 'cd /srv/python && make PYTHON_VERSION=$(PYTHON_VERSION)'

vagrant_up:
	vagrant up

# It's up to you to gpg --recv-keys D2EB44626FDDC30B513D5BB71A5D6C4C7DB87C81
verify_sums: $(TRUSTY_PATH)/SHA256SUMS $(TRUSTY_PATH)/SHA256SUMS.gpg
	gpg --verify $(TRUSTY_PATH)/SHA256SUMS.gpg $(TRUSTY_PATH)/SHA256SUMS

$(TRUSTY_PATH)/SHA256SUMS $(TRUSTY_PATH)/SHA256SUMS.gpg :
	cd $(TRUSTY_PATH) && curl --progress-bar -O '$(TRUSTY_BASE_URL)/SHA256SUMS{,.gpg}'

upload: repo_env all
	package_cloud push $(PACKAGECLOUD_REPO)/ubuntu/trusty $(DEB)

repo_env:
ifndef PACKAGECLOUD_REPO
	$(error PACKAGECLOUD_REPO not set in your environment)
endif
