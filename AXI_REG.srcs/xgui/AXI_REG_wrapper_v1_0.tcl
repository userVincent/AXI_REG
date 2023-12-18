# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "AMOUNT_OF_READ_REGISTERS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "AMOUNT_OF_READ_WRITE_REGISTERS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S00_AXI_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S00_AXI_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DEFAULT_AMOUNT_OF_READ_REGISTERS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DEFAULT_AMOUNT_OF_READ_WRITE_REGISTERS" -parent ${Page_0}


}

proc update_PARAM_VALUE.AMOUNT_OF_READ_REGISTERS { PARAM_VALUE.AMOUNT_OF_READ_REGISTERS } {
	# Procedure called to update AMOUNT_OF_READ_REGISTERS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AMOUNT_OF_READ_REGISTERS { PARAM_VALUE.AMOUNT_OF_READ_REGISTERS } {
	# Procedure called to validate AMOUNT_OF_READ_REGISTERS
	return true
}

proc update_PARAM_VALUE.AMOUNT_OF_READ_WRITE_REGISTERS { PARAM_VALUE.AMOUNT_OF_READ_WRITE_REGISTERS } {
	# Procedure called to update AMOUNT_OF_READ_WRITE_REGISTERS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AMOUNT_OF_READ_WRITE_REGISTERS { PARAM_VALUE.AMOUNT_OF_READ_WRITE_REGISTERS } {
	# Procedure called to validate AMOUNT_OF_READ_WRITE_REGISTERS
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S00_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S00_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to update C_S00_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S00_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.DEFAULT_AMOUNT_OF_READ_REGISTERS { PARAM_VALUE.DEFAULT_AMOUNT_OF_READ_REGISTERS } {
	# Procedure called to update DEFAULT_AMOUNT_OF_READ_REGISTERS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEFAULT_AMOUNT_OF_READ_REGISTERS { PARAM_VALUE.DEFAULT_AMOUNT_OF_READ_REGISTERS } {
	# Procedure called to validate DEFAULT_AMOUNT_OF_READ_REGISTERS
	return true
}

proc update_PARAM_VALUE.DEFAULT_AMOUNT_OF_READ_WRITE_REGISTERS { PARAM_VALUE.DEFAULT_AMOUNT_OF_READ_WRITE_REGISTERS } {
	# Procedure called to update DEFAULT_AMOUNT_OF_READ_WRITE_REGISTERS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEFAULT_AMOUNT_OF_READ_WRITE_REGISTERS { PARAM_VALUE.DEFAULT_AMOUNT_OF_READ_WRITE_REGISTERS } {
	# Procedure called to validate DEFAULT_AMOUNT_OF_READ_WRITE_REGISTERS
	return true
}


proc update_MODELPARAM_VALUE.AMOUNT_OF_READ_WRITE_REGISTERS { MODELPARAM_VALUE.AMOUNT_OF_READ_WRITE_REGISTERS PARAM_VALUE.AMOUNT_OF_READ_WRITE_REGISTERS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AMOUNT_OF_READ_WRITE_REGISTERS}] ${MODELPARAM_VALUE.AMOUNT_OF_READ_WRITE_REGISTERS}
}

proc update_MODELPARAM_VALUE.AMOUNT_OF_READ_REGISTERS { MODELPARAM_VALUE.AMOUNT_OF_READ_REGISTERS PARAM_VALUE.AMOUNT_OF_READ_REGISTERS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AMOUNT_OF_READ_REGISTERS}] ${MODELPARAM_VALUE.AMOUNT_OF_READ_REGISTERS}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.DEFAULT_AMOUNT_OF_READ_REGISTERS { MODELPARAM_VALUE.DEFAULT_AMOUNT_OF_READ_REGISTERS PARAM_VALUE.DEFAULT_AMOUNT_OF_READ_REGISTERS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEFAULT_AMOUNT_OF_READ_REGISTERS}] ${MODELPARAM_VALUE.DEFAULT_AMOUNT_OF_READ_REGISTERS}
}

proc update_MODELPARAM_VALUE.DEFAULT_AMOUNT_OF_READ_WRITE_REGISTERS { MODELPARAM_VALUE.DEFAULT_AMOUNT_OF_READ_WRITE_REGISTERS PARAM_VALUE.DEFAULT_AMOUNT_OF_READ_WRITE_REGISTERS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEFAULT_AMOUNT_OF_READ_WRITE_REGISTERS}] ${MODELPARAM_VALUE.DEFAULT_AMOUNT_OF_READ_WRITE_REGISTERS}
}

