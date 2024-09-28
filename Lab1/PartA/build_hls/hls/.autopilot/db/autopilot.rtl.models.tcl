set SynModuleInfo {
  {SRCNAME real_matmul_Pipeline_MAT_A_ROWS_MAT_A_COLS MODELNAME real_matmul_Pipeline_MAT_A_ROWS_MAT_A_COLS RTLNAME real_matmul_real_matmul_Pipeline_MAT_A_ROWS_MAT_A_COLS
    SUBMODULES {
      {MODELNAME real_matmul_mac_muladd_8ns_7ns_8ns_14_4_1 RTLNAME real_matmul_mac_muladd_8ns_7ns_8ns_14_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
      {MODELNAME real_matmul_flow_control_loop_pipe_sequential_init RTLNAME real_matmul_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME real_matmul_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME real_matmul_Pipeline_MAT_B_ROWS_MAT_B_COLS MODELNAME real_matmul_Pipeline_MAT_B_ROWS_MAT_B_COLS RTLNAME real_matmul_real_matmul_Pipeline_MAT_B_ROWS_MAT_B_COLS}
  {SRCNAME real_matmul_Pipeline_MAT_C_ROWS_INIT_MAT_C_COLS_INIT MODELNAME real_matmul_Pipeline_MAT_C_ROWS_INIT_MAT_C_COLS_INIT RTLNAME real_matmul_real_matmul_Pipeline_MAT_C_ROWS_INIT_MAT_C_COLS_INIT
    SUBMODULES {
      {MODELNAME real_matmul_mac_muladd_8ns_7ns_8ns_15_4_1 RTLNAME real_matmul_mac_muladd_8ns_7ns_8ns_15_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
    }
  }
  {SRCNAME real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS MODELNAME real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS RTLNAME real_matmul_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS
    SUBMODULES {
      {MODELNAME real_matmul_mul_16s_16s_16_1_1 RTLNAME real_matmul_mul_16s_16s_16_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME real_matmul_mac_muladd_16s_16s_16ns_16_4_1 RTLNAME real_matmul_mac_muladd_16s_16s_16ns_16_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
    }
  }
  {SRCNAME real_matmul_Pipeline_MAT_C_ROWS_MAT_C_COLS MODELNAME real_matmul_Pipeline_MAT_C_ROWS_MAT_C_COLS RTLNAME real_matmul_real_matmul_Pipeline_MAT_C_ROWS_MAT_C_COLS}
  {SRCNAME real_matmul MODELNAME real_matmul RTLNAME real_matmul IS_TOP 1
    SUBMODULES {
      {MODELNAME real_matmul_MatA_RAM_AUTO_1R1W RTLNAME real_matmul_MatA_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME real_matmul_MatB_RAM_AUTO_1R1W RTLNAME real_matmul_MatB_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME real_matmul_MatC_RAM_AUTO_1R1W RTLNAME real_matmul_MatC_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME real_matmul_mem_m_axi RTLNAME real_matmul_mem_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME real_matmul_control_s_axi RTLNAME real_matmul_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
