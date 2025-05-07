include common.mk
srcdirs := cmd internal
sources := $(call rwildcard,$(srcdirs),*.go)
cmds := $(subst cmd/,,$(wildcard cmd/*))

all: $(addprefix bin/,$(cmds))

bin/%: $(sources)
	go build -o $@ cmd/$(subst bin/,,$@)/*.go

.PHONY: clean
clean:
	rm -fv bin/*
