#!/bin/sh

# 
# v++(TM)
# runme.sh: a v++-generated Runs Script for UNIX
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/opt/Xilinx/Vitis_HLS/2024.1/bin:/opt/Xilinx/Vitis/2024.1/bin:/opt/Xilinx/Vitis/2024.1/bin
else
  PATH=/opt/Xilinx/Vitis_HLS/2024.1/bin:/opt/Xilinx/Vitis/2024.1/bin:/opt/Xilinx/Vitis/2024.1/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/data-ssd/home/cong/MICS-6001C-Labs/Lab1/PartA/_x.sw_emu.xilinx_u250_gen3x16_xdma_4_1_202210_1/real_matmul/real_matmul'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vitis_hls -f real_matmul.tcl -messageDb vitis_hls.pb
