# Constraints of input ports
set_property -dict { PACKAGE_PIN B9 IOSTANDARD LVCMOS33 } [get_ports { referee[0] }];
set_property -dict { PACKAGE_PIN D11 IOSTANDARD LVCMOS33 } [get_ports { referee[1] }];
set_property -dict { PACKAGE_PIN B11 IOSTANDARD LVCMOS33 } [get_ports { referee[2] }];
set_property -dict { PACKAGE_PIN B12 IOSTANDARD LVCMOS33 } [get_ports { referee[3] }];
set_property -dict { PACKAGE_PIN A10 IOSTANDARD LVCMOS33 } [get_ports { referee[4] }];

# Constraints of ouput ports
set_property -dict { PACKAGE_PIN L14 IOSTANDARD LVCMOS33 } [get_ports { led }];

set_property BITSTREAM. GENERAL. COMPRESS TRUE [current_design]