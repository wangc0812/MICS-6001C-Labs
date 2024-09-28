; ModuleID = '/data-ssd/home/cong/MICS-6001C-Labs/Lab1/PartA/build_hls/hls/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_int<16>" = type { %"struct.ap_int_base<16, true>" }
%"struct.ap_int_base<16, true>" = type { %"struct.ssdm_int<16, true>" }
%"struct.ssdm_int<16, true>" = type { i16 }

; Function Attrs: noinline
define void @apatb_real_matmul_ir([150 x %"struct.ap_int<16>"]* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="100" "maxi" %MatA_DRAM, [200 x %"struct.ap_int<16>"]* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="150" "maxi" %MatB_DRAM, [200 x %"struct.ap_int<16>"]* noalias nocapture nonnull "fpga.decayed.dim.hint"="100" "maxi" %MatC_DRAM) local_unnamed_addr #0 {
entry:
  %malloccall = call i8* @malloc(i64 30000)
  %MatA_DRAM_copy = bitcast i8* %malloccall to [100 x [150 x i16]]*
  %malloccall1 = call i8* @malloc(i64 60000)
  %MatB_DRAM_copy = bitcast i8* %malloccall1 to [150 x [200 x i16]]*
  %malloccall2 = call i8* @malloc(i64 40000)
  %MatC_DRAM_copy = bitcast i8* %malloccall2 to [100 x [200 x i16]]*
  %0 = bitcast [150 x %"struct.ap_int<16>"]* %MatA_DRAM to [100 x [150 x %"struct.ap_int<16>"]]*
  %1 = bitcast [200 x %"struct.ap_int<16>"]* %MatB_DRAM to [150 x [200 x %"struct.ap_int<16>"]]*
  %2 = bitcast [200 x %"struct.ap_int<16>"]* %MatC_DRAM to [100 x [200 x %"struct.ap_int<16>"]]*
  call fastcc void @copy_in([100 x [150 x %"struct.ap_int<16>"]]* nonnull %0, [100 x [150 x i16]]* %MatA_DRAM_copy, [150 x [200 x %"struct.ap_int<16>"]]* nonnull %1, [150 x [200 x i16]]* %MatB_DRAM_copy, [100 x [200 x %"struct.ap_int<16>"]]* nonnull %2, [100 x [200 x i16]]* %MatC_DRAM_copy)
  call void @apatb_real_matmul_hw([100 x [150 x i16]]* %MatA_DRAM_copy, [150 x [200 x i16]]* %MatB_DRAM_copy, [100 x [200 x i16]]* %MatC_DRAM_copy)
  call void @copy_back([100 x [150 x %"struct.ap_int<16>"]]* %0, [100 x [150 x i16]]* %MatA_DRAM_copy, [150 x [200 x %"struct.ap_int<16>"]]* %1, [150 x [200 x i16]]* %MatB_DRAM_copy, [100 x [200 x %"struct.ap_int<16>"]]* %2, [100 x [200 x i16]]* %MatC_DRAM_copy)
  call void @free(i8* %malloccall)
  call void @free(i8* %malloccall1)
  call void @free(i8* %malloccall2)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([100 x [150 x %"struct.ap_int<16>"]]* noalias readonly, [100 x [150 x i16]]* noalias, [150 x [200 x %"struct.ap_int<16>"]]* noalias readonly, [150 x [200 x i16]]* noalias, [100 x [200 x %"struct.ap_int<16>"]]* noalias readonly, [100 x [200 x i16]]* noalias) unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a100a150struct.ap_int<16>"([100 x [150 x i16]]* %1, [100 x [150 x %"struct.ap_int<16>"]]* %0)
  call fastcc void @"onebyonecpy_hls.p0a150a200struct.ap_int<16>.22"([150 x [200 x i16]]* %3, [150 x [200 x %"struct.ap_int<16>"]]* %2)
  call fastcc void @"onebyonecpy_hls.p0a100a200struct.ap_int<16>"([100 x [200 x i16]]* %5, [100 x [200 x %"struct.ap_int<16>"]]* %4)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a100a150struct.ap_int<16>"([100 x [150 x i16]]* noalias %dst, [100 x [150 x %"struct.ap_int<16>"]]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [100 x [150 x i16]]* %dst, null
  %1 = icmp eq [100 x [150 x %"struct.ap_int<16>"]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a100a150struct.ap_int<16>"([100 x [150 x i16]]* nonnull %dst, [100 x [150 x %"struct.ap_int<16>"]]* nonnull %src, i64 100)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a100a150struct.ap_int<16>"([100 x [150 x i16]]* %dst, [100 x [150 x %"struct.ap_int<16>"]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [100 x [150 x %"struct.ap_int<16>"]]* %src, null
  %1 = icmp eq [100 x [150 x i16]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [100 x [150 x i16]], [100 x [150 x i16]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [100 x [150 x %"struct.ap_int<16>"]], [100 x [150 x %"struct.ap_int<16>"]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a150struct.ap_int<16>"([150 x i16]* %3, [150 x %"struct.ap_int<16>"]* %src.addr, i64 150)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a150struct.ap_int<16>"([150 x i16]* %dst, [150 x %"struct.ap_int<16>"]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [150 x %"struct.ap_int<16>"]* %src, null
  %1 = icmp eq [150 x i16]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [150 x %"struct.ap_int<16>"], [150 x %"struct.ap_int<16>"]* %src, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %3 = getelementptr [150 x i16], [150 x i16]* %dst, i64 0, i64 %for.loop.idx8
  %4 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %4, i16* %3, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a150a200struct.ap_int<16>"([150 x [200 x %"struct.ap_int<16>"]]* noalias %dst, [150 x [200 x i16]]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [150 x [200 x %"struct.ap_int<16>"]]* %dst, null
  %1 = icmp eq [150 x [200 x i16]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a150a200struct.ap_int<16>"([150 x [200 x %"struct.ap_int<16>"]]* nonnull %dst, [150 x [200 x i16]]* nonnull %src, i64 150)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a150a200struct.ap_int<16>"([150 x [200 x %"struct.ap_int<16>"]]* %dst, [150 x [200 x i16]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [150 x [200 x i16]]* %src, null
  %1 = icmp eq [150 x [200 x %"struct.ap_int<16>"]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [150 x [200 x %"struct.ap_int<16>"]], [150 x [200 x %"struct.ap_int<16>"]]* %dst, i64 0, i64 %for.loop.idx2
  %3 = getelementptr [150 x [200 x i16]], [150 x [200 x i16]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a200struct.ap_int<16>"([200 x %"struct.ap_int<16>"]* %dst.addr, [200 x i16]* %3, i64 200)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a100a200struct.ap_int<16>"([100 x [200 x i16]]* noalias %dst, [100 x [200 x %"struct.ap_int<16>"]]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [100 x [200 x i16]]* %dst, null
  %1 = icmp eq [100 x [200 x %"struct.ap_int<16>"]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a100a200struct.ap_int<16>"([100 x [200 x i16]]* nonnull %dst, [100 x [200 x %"struct.ap_int<16>"]]* nonnull %src, i64 100)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a100a200struct.ap_int<16>"([100 x [200 x i16]]* %dst, [100 x [200 x %"struct.ap_int<16>"]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [100 x [200 x %"struct.ap_int<16>"]]* %src, null
  %1 = icmp eq [100 x [200 x i16]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [100 x [200 x i16]], [100 x [200 x i16]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [100 x [200 x %"struct.ap_int<16>"]], [100 x [200 x %"struct.ap_int<16>"]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a200struct.ap_int<16>.18"([200 x i16]* %3, [200 x %"struct.ap_int<16>"]* %src.addr, i64 200)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_out([100 x [150 x %"struct.ap_int<16>"]]* noalias, [100 x [150 x i16]]* noalias readonly, [150 x [200 x %"struct.ap_int<16>"]]* noalias, [150 x [200 x i16]]* noalias readonly, [100 x [200 x %"struct.ap_int<16>"]]* noalias, [100 x [200 x i16]]* noalias readonly) unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a100a150struct.ap_int<16>.35"([100 x [150 x %"struct.ap_int<16>"]]* %0, [100 x [150 x i16]]* %1)
  call fastcc void @"onebyonecpy_hls.p0a150a200struct.ap_int<16>"([150 x [200 x %"struct.ap_int<16>"]]* %2, [150 x [200 x i16]]* %3)
  call fastcc void @"onebyonecpy_hls.p0a100a200struct.ap_int<16>.6"([100 x [200 x %"struct.ap_int<16>"]]* %4, [100 x [200 x i16]]* %5)
  ret void
}

declare void @free(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a100a200struct.ap_int<16>.6"([100 x [200 x %"struct.ap_int<16>"]]* noalias %dst, [100 x [200 x i16]]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [100 x [200 x %"struct.ap_int<16>"]]* %dst, null
  %1 = icmp eq [100 x [200 x i16]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a100a200struct.ap_int<16>.9"([100 x [200 x %"struct.ap_int<16>"]]* nonnull %dst, [100 x [200 x i16]]* nonnull %src, i64 100)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a100a200struct.ap_int<16>.9"([100 x [200 x %"struct.ap_int<16>"]]* %dst, [100 x [200 x i16]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [100 x [200 x i16]]* %src, null
  %1 = icmp eq [100 x [200 x %"struct.ap_int<16>"]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [100 x [200 x %"struct.ap_int<16>"]], [100 x [200 x %"struct.ap_int<16>"]]* %dst, i64 0, i64 %for.loop.idx2
  %3 = getelementptr [100 x [200 x i16]], [100 x [200 x i16]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a200struct.ap_int<16>"([200 x %"struct.ap_int<16>"]* %dst.addr, [200 x i16]* %3, i64 200)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a200struct.ap_int<16>"([200 x %"struct.ap_int<16>"]* %dst, [200 x i16]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [200 x i16]* %src, null
  %1 = icmp eq [200 x %"struct.ap_int<16>"]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [200 x i16], [200 x i16]* %src, i64 0, i64 %for.loop.idx8
  %dst.addr.0.0.06 = getelementptr [200 x %"struct.ap_int<16>"], [200 x %"struct.ap_int<16>"]* %dst, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %4 = load i16, i16* %3, align 2
  store i16 %4, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a200struct.ap_int<16>.18"([200 x i16]* %dst, [200 x %"struct.ap_int<16>"]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [200 x %"struct.ap_int<16>"]* %src, null
  %1 = icmp eq [200 x i16]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [200 x %"struct.ap_int<16>"], [200 x %"struct.ap_int<16>"]* %src, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %3 = getelementptr [200 x i16], [200 x i16]* %dst, i64 0, i64 %for.loop.idx8
  %4 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %4, i16* %3, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a150a200struct.ap_int<16>.22"([150 x [200 x i16]]* noalias %dst, [150 x [200 x %"struct.ap_int<16>"]]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [150 x [200 x i16]]* %dst, null
  %1 = icmp eq [150 x [200 x %"struct.ap_int<16>"]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a150a200struct.ap_int<16>.25"([150 x [200 x i16]]* nonnull %dst, [150 x [200 x %"struct.ap_int<16>"]]* nonnull %src, i64 150)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a150a200struct.ap_int<16>.25"([150 x [200 x i16]]* %dst, [150 x [200 x %"struct.ap_int<16>"]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [150 x [200 x %"struct.ap_int<16>"]]* %src, null
  %1 = icmp eq [150 x [200 x i16]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [150 x [200 x i16]], [150 x [200 x i16]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [150 x [200 x %"struct.ap_int<16>"]], [150 x [200 x %"struct.ap_int<16>"]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a200struct.ap_int<16>.18"([200 x i16]* %3, [200 x %"struct.ap_int<16>"]* %src.addr, i64 200)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a100a150struct.ap_int<16>.35"([100 x [150 x %"struct.ap_int<16>"]]* noalias %dst, [100 x [150 x i16]]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [100 x [150 x %"struct.ap_int<16>"]]* %dst, null
  %1 = icmp eq [100 x [150 x i16]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a100a150struct.ap_int<16>.38"([100 x [150 x %"struct.ap_int<16>"]]* nonnull %dst, [100 x [150 x i16]]* nonnull %src, i64 100)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a100a150struct.ap_int<16>.38"([100 x [150 x %"struct.ap_int<16>"]]* %dst, [100 x [150 x i16]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [100 x [150 x i16]]* %src, null
  %1 = icmp eq [100 x [150 x %"struct.ap_int<16>"]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [100 x [150 x %"struct.ap_int<16>"]], [100 x [150 x %"struct.ap_int<16>"]]* %dst, i64 0, i64 %for.loop.idx2
  %3 = getelementptr [100 x [150 x i16]], [100 x [150 x i16]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a150struct.ap_int<16>.41"([150 x %"struct.ap_int<16>"]* %dst.addr, [150 x i16]* %3, i64 150)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a150struct.ap_int<16>.41"([150 x %"struct.ap_int<16>"]* %dst, [150 x i16]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [150 x i16]* %src, null
  %1 = icmp eq [150 x %"struct.ap_int<16>"]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [150 x i16], [150 x i16]* %src, i64 0, i64 %for.loop.idx8
  %dst.addr.0.0.06 = getelementptr [150 x %"struct.ap_int<16>"], [150 x %"struct.ap_int<16>"]* %dst, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %4 = load i16, i16* %3, align 2
  store i16 %4, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

declare void @apatb_real_matmul_hw([100 x [150 x i16]]*, [150 x [200 x i16]]*, [100 x [200 x i16]]*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([100 x [150 x %"struct.ap_int<16>"]]* noalias, [100 x [150 x i16]]* noalias readonly, [150 x [200 x %"struct.ap_int<16>"]]* noalias, [150 x [200 x i16]]* noalias readonly, [100 x [200 x %"struct.ap_int<16>"]]* noalias, [100 x [200 x i16]]* noalias readonly) unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a100a200struct.ap_int<16>.6"([100 x [200 x %"struct.ap_int<16>"]]* %4, [100 x [200 x i16]]* %5)
  ret void
}

define void @real_matmul_hw_stub_wrapper([100 x [150 x i16]]*, [150 x [200 x i16]]*, [100 x [200 x i16]]*) #5 {
entry:
  %malloccall = tail call i8* @malloc(i64 30000)
  %3 = bitcast i8* %malloccall to [100 x [150 x %"struct.ap_int<16>"]]*
  %malloccall1 = tail call i8* @malloc(i64 60000)
  %4 = bitcast i8* %malloccall1 to [150 x [200 x %"struct.ap_int<16>"]]*
  %malloccall2 = tail call i8* @malloc(i64 40000)
  %5 = bitcast i8* %malloccall2 to [100 x [200 x %"struct.ap_int<16>"]]*
  call void @copy_out([100 x [150 x %"struct.ap_int<16>"]]* %3, [100 x [150 x i16]]* %0, [150 x [200 x %"struct.ap_int<16>"]]* %4, [150 x [200 x i16]]* %1, [100 x [200 x %"struct.ap_int<16>"]]* %5, [100 x [200 x i16]]* %2)
  %6 = bitcast [100 x [150 x %"struct.ap_int<16>"]]* %3 to [150 x %"struct.ap_int<16>"]*
  %7 = bitcast [150 x [200 x %"struct.ap_int<16>"]]* %4 to [200 x %"struct.ap_int<16>"]*
  %8 = bitcast [100 x [200 x %"struct.ap_int<16>"]]* %5 to [200 x %"struct.ap_int<16>"]*
  call void @real_matmul_hw_stub([150 x %"struct.ap_int<16>"]* %6, [200 x %"struct.ap_int<16>"]* %7, [200 x %"struct.ap_int<16>"]* %8)
  call void @copy_in([100 x [150 x %"struct.ap_int<16>"]]* %3, [100 x [150 x i16]]* %0, [150 x [200 x %"struct.ap_int<16>"]]* %4, [150 x [200 x i16]]* %1, [100 x [200 x %"struct.ap_int<16>"]]* %5, [100 x [200 x i16]]* %2)
  ret void
}

declare void @real_matmul_hw_stub([150 x %"struct.ap_int<16>"]* noalias nocapture nonnull readonly, [200 x %"struct.ap_int<16>"]* noalias nocapture nonnull readonly, [200 x %"struct.ap_int<16>"]* noalias nocapture nonnull)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #4 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
