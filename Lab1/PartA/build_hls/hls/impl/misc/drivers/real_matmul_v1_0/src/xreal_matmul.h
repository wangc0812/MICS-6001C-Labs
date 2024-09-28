// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XREAL_MATMUL_H
#define XREAL_MATMUL_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xreal_matmul_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_BaseAddress;
} XReal_matmul_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XReal_matmul;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XReal_matmul_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XReal_matmul_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XReal_matmul_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XReal_matmul_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XReal_matmul_Initialize(XReal_matmul *InstancePtr, UINTPTR BaseAddress);
XReal_matmul_Config* XReal_matmul_LookupConfig(UINTPTR BaseAddress);
#else
int XReal_matmul_Initialize(XReal_matmul *InstancePtr, u16 DeviceId);
XReal_matmul_Config* XReal_matmul_LookupConfig(u16 DeviceId);
#endif
int XReal_matmul_CfgInitialize(XReal_matmul *InstancePtr, XReal_matmul_Config *ConfigPtr);
#else
int XReal_matmul_Initialize(XReal_matmul *InstancePtr, const char* InstanceName);
int XReal_matmul_Release(XReal_matmul *InstancePtr);
#endif

void XReal_matmul_Start(XReal_matmul *InstancePtr);
u32 XReal_matmul_IsDone(XReal_matmul *InstancePtr);
u32 XReal_matmul_IsIdle(XReal_matmul *InstancePtr);
u32 XReal_matmul_IsReady(XReal_matmul *InstancePtr);
void XReal_matmul_Continue(XReal_matmul *InstancePtr);
void XReal_matmul_EnableAutoRestart(XReal_matmul *InstancePtr);
void XReal_matmul_DisableAutoRestart(XReal_matmul *InstancePtr);

void XReal_matmul_Set_MatA_DRAM(XReal_matmul *InstancePtr, u64 Data);
u64 XReal_matmul_Get_MatA_DRAM(XReal_matmul *InstancePtr);
void XReal_matmul_Set_MatB_DRAM(XReal_matmul *InstancePtr, u64 Data);
u64 XReal_matmul_Get_MatB_DRAM(XReal_matmul *InstancePtr);
void XReal_matmul_Set_MatC_DRAM(XReal_matmul *InstancePtr, u64 Data);
u64 XReal_matmul_Get_MatC_DRAM(XReal_matmul *InstancePtr);

void XReal_matmul_InterruptGlobalEnable(XReal_matmul *InstancePtr);
void XReal_matmul_InterruptGlobalDisable(XReal_matmul *InstancePtr);
void XReal_matmul_InterruptEnable(XReal_matmul *InstancePtr, u32 Mask);
void XReal_matmul_InterruptDisable(XReal_matmul *InstancePtr, u32 Mask);
void XReal_matmul_InterruptClear(XReal_matmul *InstancePtr, u32 Mask);
u32 XReal_matmul_InterruptGetEnabled(XReal_matmul *InstancePtr);
u32 XReal_matmul_InterruptGetStatus(XReal_matmul *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
