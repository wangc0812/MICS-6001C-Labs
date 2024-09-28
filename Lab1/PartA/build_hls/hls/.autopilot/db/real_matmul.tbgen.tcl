set moduleName real_matmul
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_chain
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {real_matmul}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ mem int 128 regular {axi_master 2}  }
	{ MatA_DRAM int 64 regular {axi_slave 0}  }
	{ MatB_DRAM int 64 regular {axi_slave 0}  }
	{ MatC_DRAM int 64 regular {axi_slave 0}  }
}
set hasAXIMCache 0
set hasAXIML2Cache 0
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "mem", "interface" : "axi_master", "bitwidth" : 128, "direction" : "READWRITE", "bitSlice":[ {"cElement": [{"cName": "MatA_DRAM","offset": { "type": "dynamic","port_name": "MatA_DRAM","bundle": "control"},"direction": "READONLY"},{"cName": "MatB_DRAM","offset": { "type": "dynamic","port_name": "MatB_DRAM","bundle": "control"},"direction": "READONLY"},{"cName": "MatC_DRAM","offset": { "type": "dynamic","port_name": "MatC_DRAM","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "MatA_DRAM", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "MatB_DRAM", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":39}} , 
 	{ "Name" : "MatC_DRAM", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":51}} ]}
# RTL Port declarations: 
set portNum 65
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ m_axi_mem_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_mem_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_mem_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_mem_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_mem_AWLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_mem_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_mem_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_mem_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_mem_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_mem_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_mem_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_mem_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_mem_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_mem_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_mem_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_mem_WDATA sc_out sc_lv 128 signal 0 } 
	{ m_axi_mem_WSTRB sc_out sc_lv 16 signal 0 } 
	{ m_axi_mem_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_mem_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_mem_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_mem_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_mem_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_mem_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_mem_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_mem_ARLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_mem_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_mem_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_mem_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_mem_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_mem_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_mem_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_mem_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_mem_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_mem_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_mem_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_mem_RDATA sc_in sc_lv 128 signal 0 } 
	{ m_axi_mem_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_mem_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_mem_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_mem_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_mem_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_mem_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_mem_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_mem_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_mem_BUSER sc_in sc_lv 1 signal 0 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"real_matmul","role":"start","value":"0","valid_bit":"0"},{"name":"real_matmul","role":"continue","value":"0","valid_bit":"4"},{"name":"real_matmul","role":"auto_start","value":"0","valid_bit":"7"},{"name":"MatA_DRAM","role":"data","value":"16"},{"name":"MatB_DRAM","role":"data","value":"28"},{"name":"MatC_DRAM","role":"data","value":"40"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"real_matmul","role":"start","value":"0","valid_bit":"0"},{"name":"real_matmul","role":"done","value":"0","valid_bit":"1"},{"name":"real_matmul","role":"idle","value":"0","valid_bit":"2"},{"name":"real_matmul","role":"ready","value":"0","valid_bit":"3"},{"name":"real_matmul","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_mem_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem", "role": "AWVALID" }} , 
 	{ "name": "m_axi_mem_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem", "role": "AWREADY" }} , 
 	{ "name": "m_axi_mem_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "mem", "role": "AWADDR" }} , 
 	{ "name": "m_axi_mem_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem", "role": "AWID" }} , 
 	{ "name": "m_axi_mem_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "mem", "role": "AWLEN" }} , 
 	{ "name": "m_axi_mem_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mem", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_mem_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mem", "role": "AWBURST" }} , 
 	{ "name": "m_axi_mem_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mem", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_mem_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mem", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_mem_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mem", "role": "AWPROT" }} , 
 	{ "name": "m_axi_mem_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mem", "role": "AWQOS" }} , 
 	{ "name": "m_axi_mem_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mem", "role": "AWREGION" }} , 
 	{ "name": "m_axi_mem_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem", "role": "AWUSER" }} , 
 	{ "name": "m_axi_mem_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem", "role": "WVALID" }} , 
 	{ "name": "m_axi_mem_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem", "role": "WREADY" }} , 
 	{ "name": "m_axi_mem_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "mem", "role": "WDATA" }} , 
 	{ "name": "m_axi_mem_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "mem", "role": "WSTRB" }} , 
 	{ "name": "m_axi_mem_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem", "role": "WLAST" }} , 
 	{ "name": "m_axi_mem_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem", "role": "WID" }} , 
 	{ "name": "m_axi_mem_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem", "role": "WUSER" }} , 
 	{ "name": "m_axi_mem_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem", "role": "ARVALID" }} , 
 	{ "name": "m_axi_mem_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem", "role": "ARREADY" }} , 
 	{ "name": "m_axi_mem_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "mem", "role": "ARADDR" }} , 
 	{ "name": "m_axi_mem_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem", "role": "ARID" }} , 
 	{ "name": "m_axi_mem_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "mem", "role": "ARLEN" }} , 
 	{ "name": "m_axi_mem_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mem", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_mem_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mem", "role": "ARBURST" }} , 
 	{ "name": "m_axi_mem_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mem", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_mem_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mem", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_mem_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mem", "role": "ARPROT" }} , 
 	{ "name": "m_axi_mem_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mem", "role": "ARQOS" }} , 
 	{ "name": "m_axi_mem_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mem", "role": "ARREGION" }} , 
 	{ "name": "m_axi_mem_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem", "role": "ARUSER" }} , 
 	{ "name": "m_axi_mem_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem", "role": "RVALID" }} , 
 	{ "name": "m_axi_mem_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem", "role": "RREADY" }} , 
 	{ "name": "m_axi_mem_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "mem", "role": "RDATA" }} , 
 	{ "name": "m_axi_mem_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem", "role": "RLAST" }} , 
 	{ "name": "m_axi_mem_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem", "role": "RID" }} , 
 	{ "name": "m_axi_mem_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem", "role": "RUSER" }} , 
 	{ "name": "m_axi_mem_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mem", "role": "RRESP" }} , 
 	{ "name": "m_axi_mem_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem", "role": "BVALID" }} , 
 	{ "name": "m_axi_mem_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem", "role": "BREADY" }} , 
 	{ "name": "m_axi_mem_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mem", "role": "BRESP" }} , 
 	{ "name": "m_axi_mem_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem", "role": "BID" }} , 
 	{ "name": "m_axi_mem_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem", "role": "BUSER" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "7", "10", "12", "165", "168", "169"],
		"CDFG" : "real_matmul",
		"Protocol" : "ap_ctrl_chain",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90165", "EstimateLatencyMax" : "90165",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mem", "Type" : "MAXI", "Direction" : "IO",
				"BlockSignal" : [
					{"Name" : "mem_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "mem_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "mem_blk_n_B", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_real_matmul_Pipeline_MAT_A_ROWS_MAT_A_COLS_fu_127", "Port" : "mem", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "10", "SubInstance" : "grp_real_matmul_Pipeline_MAT_B_ROWS_MAT_B_COLS_fu_143", "Port" : "mem", "Inst_start_state" : "74", "Inst_end_state" : "75"},
					{"ID" : "165", "SubInstance" : "grp_real_matmul_Pipeline_MAT_C_ROWS_MAT_C_COLS_fu_158", "Port" : "mem", "Inst_start_state" : "78", "Inst_end_state" : "79"}]},
			{"Name" : "MatA_DRAM", "Type" : "None", "Direction" : "I"},
			{"Name" : "MatB_DRAM", "Type" : "None", "Direction" : "I"},
			{"Name" : "MatC_DRAM", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.MatA_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.MatB_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.MatC_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_MAT_A_ROWS_MAT_A_COLS_fu_127", "Parent" : "0", "Child" : ["5", "6"],
		"CDFG" : "real_matmul_Pipeline_MAT_A_ROWS_MAT_A_COLS",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "15078", "EstimateLatencyMax" : "15078",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mem", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "mem_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "mem_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "MatA", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "MatA_DRAM", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "MAT_A_ROWS_MAT_A_COLS", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter76", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter76", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_MAT_A_ROWS_MAT_A_COLS_fu_127.mac_muladd_8ns_7ns_8ns_14_4_1_U1", "Parent" : "4"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_MAT_A_ROWS_MAT_A_COLS_fu_127.flow_control_loop_pipe_sequential_init_U", "Parent" : "4"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_MAT_C_ROWS_INIT_MAT_C_COLS_INIT_fu_137", "Parent" : "0", "Child" : ["8", "9"],
		"CDFG" : "real_matmul_Pipeline_MAT_C_ROWS_INIT_MAT_C_COLS_INIT",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "20004", "EstimateLatencyMax" : "20004",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "MatC", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "MAT_C_ROWS_INIT_MAT_C_COLS_INIT", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_MAT_C_ROWS_INIT_MAT_C_COLS_INIT_fu_137.mac_muladd_8ns_7ns_8ns_15_4_1_U9", "Parent" : "7"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_MAT_C_ROWS_INIT_MAT_C_COLS_INIT_fu_137.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_MAT_B_ROWS_MAT_B_COLS_fu_143", "Parent" : "0", "Child" : ["11"],
		"CDFG" : "real_matmul_Pipeline_MAT_B_ROWS_MAT_B_COLS",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "30003", "EstimateLatencyMax" : "30003",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mem", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "mem_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "MatB", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "sext_ln36", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "MAT_B_ROWS_MAT_B_COLS", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_MAT_B_ROWS_MAT_B_COLS_fu_143.flow_control_loop_pipe_sequential_init_U", "Parent" : "10"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151", "Parent" : "0", "Child" : ["13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "140", "141", "142", "143", "144", "145", "146", "147", "148", "149", "150", "151", "152", "153", "154", "155", "156", "157", "158", "159", "160", "161", "162", "163", "164"],
		"CDFG" : "real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "20006", "EstimateLatencyMax" : "20006",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "MatA", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "MatC", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "MatB", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "OUTER_ROWS_OUTER_COLS", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U12", "Parent" : "12"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U13", "Parent" : "12"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U14", "Parent" : "12"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U15", "Parent" : "12"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U16", "Parent" : "12"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U17", "Parent" : "12"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U18", "Parent" : "12"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U19", "Parent" : "12"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U20", "Parent" : "12"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U21", "Parent" : "12"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U22", "Parent" : "12"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U23", "Parent" : "12"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U24", "Parent" : "12"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U25", "Parent" : "12"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U26", "Parent" : "12"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U27", "Parent" : "12"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U28", "Parent" : "12"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U29", "Parent" : "12"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U30", "Parent" : "12"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U31", "Parent" : "12"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U32", "Parent" : "12"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U33", "Parent" : "12"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U34", "Parent" : "12"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U35", "Parent" : "12"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U36", "Parent" : "12"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U37", "Parent" : "12"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U38", "Parent" : "12"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U39", "Parent" : "12"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U40", "Parent" : "12"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U41", "Parent" : "12"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U42", "Parent" : "12"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U43", "Parent" : "12"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U44", "Parent" : "12"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U45", "Parent" : "12"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U46", "Parent" : "12"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U47", "Parent" : "12"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U48", "Parent" : "12"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U49", "Parent" : "12"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U50", "Parent" : "12"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U51", "Parent" : "12"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U52", "Parent" : "12"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U53", "Parent" : "12"},
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U54", "Parent" : "12"},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U55", "Parent" : "12"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U56", "Parent" : "12"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U57", "Parent" : "12"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U58", "Parent" : "12"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U59", "Parent" : "12"},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U60", "Parent" : "12"},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U61", "Parent" : "12"},
	{"ID" : "63", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U62", "Parent" : "12"},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U63", "Parent" : "12"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U64", "Parent" : "12"},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U65", "Parent" : "12"},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U66", "Parent" : "12"},
	{"ID" : "68", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U67", "Parent" : "12"},
	{"ID" : "69", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U68", "Parent" : "12"},
	{"ID" : "70", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U69", "Parent" : "12"},
	{"ID" : "71", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U70", "Parent" : "12"},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U71", "Parent" : "12"},
	{"ID" : "73", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U72", "Parent" : "12"},
	{"ID" : "74", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U73", "Parent" : "12"},
	{"ID" : "75", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mul_16s_16s_16_1_1_U74", "Parent" : "12"},
	{"ID" : "76", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_8ns_7ns_8ns_15_4_1_U75", "Parent" : "12"},
	{"ID" : "77", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U76", "Parent" : "12"},
	{"ID" : "78", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U77", "Parent" : "12"},
	{"ID" : "79", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U78", "Parent" : "12"},
	{"ID" : "80", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U79", "Parent" : "12"},
	{"ID" : "81", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U80", "Parent" : "12"},
	{"ID" : "82", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U81", "Parent" : "12"},
	{"ID" : "83", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U82", "Parent" : "12"},
	{"ID" : "84", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U83", "Parent" : "12"},
	{"ID" : "85", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U84", "Parent" : "12"},
	{"ID" : "86", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U85", "Parent" : "12"},
	{"ID" : "87", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U86", "Parent" : "12"},
	{"ID" : "88", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U87", "Parent" : "12"},
	{"ID" : "89", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U88", "Parent" : "12"},
	{"ID" : "90", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U89", "Parent" : "12"},
	{"ID" : "91", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U90", "Parent" : "12"},
	{"ID" : "92", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U91", "Parent" : "12"},
	{"ID" : "93", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U92", "Parent" : "12"},
	{"ID" : "94", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U93", "Parent" : "12"},
	{"ID" : "95", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U94", "Parent" : "12"},
	{"ID" : "96", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U95", "Parent" : "12"},
	{"ID" : "97", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U96", "Parent" : "12"},
	{"ID" : "98", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U97", "Parent" : "12"},
	{"ID" : "99", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U98", "Parent" : "12"},
	{"ID" : "100", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U99", "Parent" : "12"},
	{"ID" : "101", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U100", "Parent" : "12"},
	{"ID" : "102", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U101", "Parent" : "12"},
	{"ID" : "103", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U102", "Parent" : "12"},
	{"ID" : "104", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U103", "Parent" : "12"},
	{"ID" : "105", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U104", "Parent" : "12"},
	{"ID" : "106", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U105", "Parent" : "12"},
	{"ID" : "107", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U106", "Parent" : "12"},
	{"ID" : "108", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U107", "Parent" : "12"},
	{"ID" : "109", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U108", "Parent" : "12"},
	{"ID" : "110", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U109", "Parent" : "12"},
	{"ID" : "111", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U110", "Parent" : "12"},
	{"ID" : "112", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U111", "Parent" : "12"},
	{"ID" : "113", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U112", "Parent" : "12"},
	{"ID" : "114", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U113", "Parent" : "12"},
	{"ID" : "115", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U114", "Parent" : "12"},
	{"ID" : "116", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U115", "Parent" : "12"},
	{"ID" : "117", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U116", "Parent" : "12"},
	{"ID" : "118", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U117", "Parent" : "12"},
	{"ID" : "119", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U118", "Parent" : "12"},
	{"ID" : "120", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U119", "Parent" : "12"},
	{"ID" : "121", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U120", "Parent" : "12"},
	{"ID" : "122", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U121", "Parent" : "12"},
	{"ID" : "123", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U122", "Parent" : "12"},
	{"ID" : "124", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U123", "Parent" : "12"},
	{"ID" : "125", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U124", "Parent" : "12"},
	{"ID" : "126", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U125", "Parent" : "12"},
	{"ID" : "127", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U126", "Parent" : "12"},
	{"ID" : "128", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U127", "Parent" : "12"},
	{"ID" : "129", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U128", "Parent" : "12"},
	{"ID" : "130", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U129", "Parent" : "12"},
	{"ID" : "131", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U130", "Parent" : "12"},
	{"ID" : "132", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U131", "Parent" : "12"},
	{"ID" : "133", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U132", "Parent" : "12"},
	{"ID" : "134", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U133", "Parent" : "12"},
	{"ID" : "135", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U134", "Parent" : "12"},
	{"ID" : "136", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U135", "Parent" : "12"},
	{"ID" : "137", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U136", "Parent" : "12"},
	{"ID" : "138", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U137", "Parent" : "12"},
	{"ID" : "139", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U138", "Parent" : "12"},
	{"ID" : "140", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U139", "Parent" : "12"},
	{"ID" : "141", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U140", "Parent" : "12"},
	{"ID" : "142", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U141", "Parent" : "12"},
	{"ID" : "143", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U142", "Parent" : "12"},
	{"ID" : "144", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U143", "Parent" : "12"},
	{"ID" : "145", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U144", "Parent" : "12"},
	{"ID" : "146", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U145", "Parent" : "12"},
	{"ID" : "147", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U146", "Parent" : "12"},
	{"ID" : "148", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U147", "Parent" : "12"},
	{"ID" : "149", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U148", "Parent" : "12"},
	{"ID" : "150", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U149", "Parent" : "12"},
	{"ID" : "151", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U150", "Parent" : "12"},
	{"ID" : "152", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U151", "Parent" : "12"},
	{"ID" : "153", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U152", "Parent" : "12"},
	{"ID" : "154", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U153", "Parent" : "12"},
	{"ID" : "155", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U154", "Parent" : "12"},
	{"ID" : "156", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U155", "Parent" : "12"},
	{"ID" : "157", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U156", "Parent" : "12"},
	{"ID" : "158", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U157", "Parent" : "12"},
	{"ID" : "159", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U158", "Parent" : "12"},
	{"ID" : "160", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U159", "Parent" : "12"},
	{"ID" : "161", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U160", "Parent" : "12"},
	{"ID" : "162", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U161", "Parent" : "12"},
	{"ID" : "163", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.mac_muladd_16s_16s_16ns_16_4_1_U162", "Parent" : "12"},
	{"ID" : "164", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151.flow_control_loop_pipe_sequential_init_U", "Parent" : "12"},
	{"ID" : "165", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_MAT_C_ROWS_MAT_C_COLS_fu_158", "Parent" : "0", "Child" : ["166", "167"],
		"CDFG" : "real_matmul_Pipeline_MAT_C_ROWS_MAT_C_COLS",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "20006", "EstimateLatencyMax" : "20006",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mem", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "mem_blk_n_W", "Type" : "RtlSignal"}]},
			{"Name" : "sext_ln71", "Type" : "None", "Direction" : "I"},
			{"Name" : "MatC", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "MAT_C_ROWS_MAT_C_COLS", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "166", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_MAT_C_ROWS_MAT_C_COLS_fu_158.mac_muladd_8ns_7ns_8ns_15_4_1_U168", "Parent" : "165"},
	{"ID" : "167", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_real_matmul_Pipeline_MAT_C_ROWS_MAT_C_COLS_fu_158.flow_control_loop_pipe_sequential_init_U", "Parent" : "165"},
	{"ID" : "168", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "169", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mem_m_axi_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	real_matmul {
		mem {Type IO LastRead 79 FirstWrite -1}
		MatA_DRAM {Type I LastRead 0 FirstWrite -1}
		MatB_DRAM {Type I LastRead 0 FirstWrite -1}
		MatC_DRAM {Type I LastRead 0 FirstWrite -1}}
	real_matmul_Pipeline_MAT_A_ROWS_MAT_A_COLS {
		mem {Type I LastRead 75 FirstWrite -1}
		MatA {Type IO LastRead 75 FirstWrite 76}
		MatA_DRAM {Type I LastRead 0 FirstWrite -1}}
	real_matmul_Pipeline_MAT_C_ROWS_INIT_MAT_C_COLS_INIT {
		MatC {Type O LastRead -1 FirstWrite 3}}
	real_matmul_Pipeline_MAT_B_ROWS_MAT_B_COLS {
		mem {Type I LastRead 1 FirstWrite -1}
		MatB {Type O LastRead -1 FirstWrite 2}
		sext_ln36 {Type I LastRead 0 FirstWrite -1}}
	real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS {
		MatA {Type I LastRead 0 FirstWrite -1}
		MatC {Type IO LastRead 3 FirstWrite 5}
		MatB {Type I LastRead 0 FirstWrite -1}}
	real_matmul_Pipeline_MAT_C_ROWS_MAT_C_COLS {
		mem {Type O LastRead -1 FirstWrite 5}
		sext_ln71 {Type I LastRead 0 FirstWrite -1}
		MatC {Type I LastRead 3 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "90165", "Max" : "90165"}
	, {"Name" : "Interval", "Min" : "90166", "Max" : "90166"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	mem { m_axi {  { m_axi_mem_AWVALID VALID 1 1 }  { m_axi_mem_AWREADY READY 0 1 }  { m_axi_mem_AWADDR ADDR 1 64 }  { m_axi_mem_AWID ID 1 1 }  { m_axi_mem_AWLEN SIZE 1 8 }  { m_axi_mem_AWSIZE BURST 1 3 }  { m_axi_mem_AWBURST LOCK 1 2 }  { m_axi_mem_AWLOCK CACHE 1 2 }  { m_axi_mem_AWCACHE PROT 1 4 }  { m_axi_mem_AWPROT QOS 1 3 }  { m_axi_mem_AWQOS REGION 1 4 }  { m_axi_mem_AWREGION USER 1 4 }  { m_axi_mem_AWUSER DATA 1 1 }  { m_axi_mem_WVALID VALID 1 1 }  { m_axi_mem_WREADY READY 0 1 }  { m_axi_mem_WDATA FIFONUM 1 128 }  { m_axi_mem_WSTRB STRB 1 16 }  { m_axi_mem_WLAST LAST 1 1 }  { m_axi_mem_WID ID 1 1 }  { m_axi_mem_WUSER DATA 1 1 }  { m_axi_mem_ARVALID VALID 1 1 }  { m_axi_mem_ARREADY READY 0 1 }  { m_axi_mem_ARADDR ADDR 1 64 }  { m_axi_mem_ARID ID 1 1 }  { m_axi_mem_ARLEN SIZE 1 8 }  { m_axi_mem_ARSIZE BURST 1 3 }  { m_axi_mem_ARBURST LOCK 1 2 }  { m_axi_mem_ARLOCK CACHE 1 2 }  { m_axi_mem_ARCACHE PROT 1 4 }  { m_axi_mem_ARPROT QOS 1 3 }  { m_axi_mem_ARQOS REGION 1 4 }  { m_axi_mem_ARREGION USER 1 4 }  { m_axi_mem_ARUSER DATA 1 1 }  { m_axi_mem_RVALID VALID 0 1 }  { m_axi_mem_RREADY READY 1 1 }  { m_axi_mem_RDATA FIFONUM 0 128 }  { m_axi_mem_RLAST LAST 0 1 }  { m_axi_mem_RID ID 0 1 }  { m_axi_mem_RUSER DATA 0 1 }  { m_axi_mem_RRESP RESP 0 2 }  { m_axi_mem_BVALID VALID 0 1 }  { m_axi_mem_BREADY READY 1 1 }  { m_axi_mem_BRESP RESP 0 2 }  { m_axi_mem_BID ID 0 1 }  { m_axi_mem_BUSER DATA 0 1 } } }
}

set maxi_interface_dict [dict create]
dict set maxi_interface_dict mem { CHANNEL_NUM 0 BUNDLE mem NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_WRITE}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ mem 64 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ mem 64 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
