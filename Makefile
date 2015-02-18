REBAR = rebar
LASTVERSION = $(shell git rev-parse HEAD )

all: compile

compile:
	@$(REBAR) compile

clean:
	@$(REBAR) clean

.PHONY: all compile 
