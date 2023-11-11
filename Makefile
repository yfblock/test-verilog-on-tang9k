VERILOG_FILE := src/*.v
BITSTREAM_FILE := impl/pnr/Testspinal.fs
REPORT_FILE := impl/pnr/Testspinal.rpt.txt

all: $(BITSTREAM_FILE)

$(BITSTREAM_FILE) $(REPORT_FILE): $(VERILOG_FILE) rtl/*.tcl
	gw_sh rtl/synth.tcl
	@cat $(REPORT_FILE) | grep -A32 "Resource Usage Summary"

clean:
	rm -rf impl $(VERILOG_FILE)

flash: $(BITSTREAM_FILE)
	openFPGALoader -b tangnano9k $<

.PHONY: all clean flash
