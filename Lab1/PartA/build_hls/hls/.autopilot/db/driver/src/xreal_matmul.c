// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xreal_matmul.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XReal_matmul_CfgInitialize(XReal_matmul *InstancePtr, XReal_matmul_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XReal_matmul_Start(XReal_matmul *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XReal_matmul_ReadReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_AP_CTRL) & 0x80;
    XReal_matmul_WriteReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XReal_matmul_IsDone(XReal_matmul *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XReal_matmul_ReadReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XReal_matmul_IsIdle(XReal_matmul *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XReal_matmul_ReadReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XReal_matmul_IsReady(XReal_matmul *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XReal_matmul_ReadReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XReal_matmul_Continue(XReal_matmul *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XReal_matmul_ReadReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_AP_CTRL) & 0x80;
    XReal_matmul_WriteReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_AP_CTRL, Data | 0x10);
}

void XReal_matmul_EnableAutoRestart(XReal_matmul *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XReal_matmul_WriteReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XReal_matmul_DisableAutoRestart(XReal_matmul *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XReal_matmul_WriteReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_AP_CTRL, 0);
}

void XReal_matmul_Set_MatA_DRAM(XReal_matmul *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XReal_matmul_WriteReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_MATA_DRAM_DATA, (u32)(Data));
    XReal_matmul_WriteReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_MATA_DRAM_DATA + 4, (u32)(Data >> 32));
}

u64 XReal_matmul_Get_MatA_DRAM(XReal_matmul *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XReal_matmul_ReadReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_MATA_DRAM_DATA);
    Data += (u64)XReal_matmul_ReadReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_MATA_DRAM_DATA + 4) << 32;
    return Data;
}

void XReal_matmul_Set_MatB_DRAM(XReal_matmul *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XReal_matmul_WriteReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_MATB_DRAM_DATA, (u32)(Data));
    XReal_matmul_WriteReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_MATB_DRAM_DATA + 4, (u32)(Data >> 32));
}

u64 XReal_matmul_Get_MatB_DRAM(XReal_matmul *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XReal_matmul_ReadReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_MATB_DRAM_DATA);
    Data += (u64)XReal_matmul_ReadReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_MATB_DRAM_DATA + 4) << 32;
    return Data;
}

void XReal_matmul_Set_MatC_DRAM(XReal_matmul *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XReal_matmul_WriteReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_MATC_DRAM_DATA, (u32)(Data));
    XReal_matmul_WriteReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_MATC_DRAM_DATA + 4, (u32)(Data >> 32));
}

u64 XReal_matmul_Get_MatC_DRAM(XReal_matmul *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XReal_matmul_ReadReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_MATC_DRAM_DATA);
    Data += (u64)XReal_matmul_ReadReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_MATC_DRAM_DATA + 4) << 32;
    return Data;
}

void XReal_matmul_InterruptGlobalEnable(XReal_matmul *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XReal_matmul_WriteReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_GIE, 1);
}

void XReal_matmul_InterruptGlobalDisable(XReal_matmul *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XReal_matmul_WriteReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_GIE, 0);
}

void XReal_matmul_InterruptEnable(XReal_matmul *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XReal_matmul_ReadReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_IER);
    XReal_matmul_WriteReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_IER, Register | Mask);
}

void XReal_matmul_InterruptDisable(XReal_matmul *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XReal_matmul_ReadReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_IER);
    XReal_matmul_WriteReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_IER, Register & (~Mask));
}

void XReal_matmul_InterruptClear(XReal_matmul *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XReal_matmul_WriteReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_ISR, Mask);
}

u32 XReal_matmul_InterruptGetEnabled(XReal_matmul *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XReal_matmul_ReadReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_IER);
}

u32 XReal_matmul_InterruptGetStatus(XReal_matmul *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XReal_matmul_ReadReg(InstancePtr->Control_BaseAddress, XREAL_MATMUL_CONTROL_ADDR_ISR);
}

