########################################################################
# add platform-specific options here

CONTIKI_WITH_RPL=0

# usually, you should not need changing anything beyond this line
########################################################################

CONTIKI?=../..

ifneq ($(ROLE),client)
	CFLAGS+= -DHARD_CODED_ADDRESS=\"aaaa::02:232\"
else
	CFLAGS+= -DUDP_CONNECTION_ADDR="fe80::ff:fe02:232" \
		 -DHARD_CODED_ADDRESS=\"aaaa::02:230\"
endif

all: dtls-server dtls-client
	$(MAKE) $(MAKEFLAGS) ROLE=server dtls-server
	$(MAKE) $(MAKEFLAGS) clean
	$(MAKE) $(MAKEFLAGS) ROLE=client dtls-client

APPS += tinydtls/aes tinydtls/sha2 tinydtls/ecc tinydtls

include $(CONTIKI)/Makefile.include
