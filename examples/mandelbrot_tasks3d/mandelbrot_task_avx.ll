; ModuleID = 'mandelbrot_task_avx.bc'
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.module_str = private constant [21 x i8] c"mandelbrot_task.ispc\00"
@.ptx_str = private constant [6549 x i8] c"//\0A// Generated by LLVM NVPTX Back-End\0A//\0A\0A.version 3.1\0A.target sm_35, texmode_independent\0A.address_size 64\0A\0A\09// .globl\09mandelbrot_scanline\0A                                        // @mandelbrot_scanline\0A.entry mandelbrot_scanline(\0A\09.param .f32 mandelbrot_scanline_param_0,\0A\09.param .f32 mandelbrot_scanline_param_1,\0A\09.param .f32 mandelbrot_scanline_param_2,\0A\09.param .f32 mandelbrot_scanline_param_3,\0A\09.param .u32 mandelbrot_scanline_param_4,\0A\09.param .u32 mandelbrot_scanline_param_5,\0A\09.param .u32 mandelbrot_scanline_param_6,\0A\09.param .u32 mandelbrot_scanline_param_7,\0A\09.param .u32 mandelbrot_scanline_param_8,\0A\09.param .u64 .ptr .align 4 mandelbrot_scanline_param_9\0A)\0A{\0A\09.reg .pred %p<396>;\0A\09.reg .s16 %rc<396>;\0A\09.reg .s16 %rs<396>;\0A\09.reg .s32 %r<396>;\0A\09.reg .s64 %rl<396>;\0A\09.reg .f32 %f<396>;\0A\09.reg .f64 %fl<396>;\0A\0A// BB#0:                                // %allocas\0A\09ld.param.u32 \09%r6, [mandelbrot_scanline_param_5];\0A\09mov.u32 \09%r5, %ctaid.y;\0A\09ld.param.u32 \09%r7, [mandelbrot_scanline_param_7];\0A\09mul.lo.s32 \09%r0, %r5, %r7;\0A\09mad.lo.s32 \09%r1, %r5, %r7, %r7;\0A\09setp.lt.s32 \09%p0, %r1, %r6;\0A\09selp.b32 \09%r1, %r1, %r6, %p0;\0A\09setp.ge.s32 \09%p0, %r0, %r1;\0A\09@%p0 bra \09BB0_13;\0A// BB#1:                                // %for_test28.preheader.lr.ph\0A\09ld.param.f32 \09%f0, [mandelbrot_scanline_param_0];\0A\09mov.u32 \09%r2, %ctaid.x;\0A\09ld.param.u32 \09%r3, [mandelbrot_scanline_param_6];\0A\09mul.lo.s32 \09%r1, %r2, %r3;\0A\09ld.param.f32 \09%f1, [mandelbrot_scanline_param_1];\0A\09mad.lo.s32 \09%r3, %r2, %r3, %r3;\0A\09ld.param.f32 \09%f2, [mandelbrot_scanline_param_2];\0A\09ld.param.u32 \09%r2, [mandelbrot_scanline_param_4];\0A\09setp.lt.s32 \09%p0, %r3, %r2;\0A\09ld.param.f32 \09%f3, [mandelbrot_scanline_param_3];\0A\09selp.b32 \09%r3, %r3, %r2, %p0;\0A\09ld.param.u32 \09%r4, [mandelbrot_scanline_param_8];\0A\09ld.param.u64 \09%rl0, [mandelbrot_scanline_param_9];\0A\09setp.gt.s32 \09%p0, %r4, 0;\0A\09not.b32 \09%r6, %r6;\0A\09add.s32 \09%r5, %r5, 1;\0A\09mul.lo.s32 \09%r5, %r5, %r7;\0A\09not.b32 \09%r5, %r5;\0A\09setp.gt.s32 \09%p1, %r6, %r5;\0A\09selp.b32 \09%r5, %r6, %r5, %p1;\0A\09not.b32 \09%r5, %r5;\0ABB0_2:                                  // %for_test28.preheader\0A                                        // =>This Loop Header: Depth=1\0A                                        //     Child Loop BB0_15 Depth 2\0A                                        //     Child Loop BB0_8 Depth 2\0A                                        //       Child Loop BB0_11 Depth 3\0A\09setp.ge.s32 \09%p1, %r1, %r3;\0A\09@%p1 bra \09BB0_12;\0A// BB#3:                                // %for_loop30.lr.ph\0A                                        //   in Loop: Header=BB0_2 Depth=1\0A\09mul.lo.s32 \09%r6, %r0, %r2;\0A\09mov.u32 \09%r7, %r1;\0A\09@%p0 bra \09BB0_4;\0A\09bra.uni \09BB0_15;\0ABB0_4:                                  //   in Loop: Header=BB0_2 Depth=1\0A\09cvt.rn.f32.s32 \09%f4, %r0;\0A\09fma.rn.f32 \09%f4, %f4, %f3, %f2;\0A\09mov.u32 \09%r7, %r1;\0ABB0_8:                                  // %for_loop.i.lr.ph.us\0A                                        //   Parent Loop BB0_2 Depth=1\0A                                        // =>  This Loop Header: Depth=2\0A                                        //       Child Loop BB0_11 Depth 3\0A\09mov.u32 \09%r9, %tid.x;\0A\09mov.u32 \09%r8, WARP_SZ;\0A\09add.s32 \09%r10, %r8, -1;\0A\09and.b32  \09%r10, %r10, %r9;\0A\09add.s32 \09%r11, %r10, %r7;\0A\09cvt.rn.f32.s32 \09%f5, %r11;\0A\09fma.rn.f32 \09%f5, %f5, %f1, %f0;\0A\09mov.u32 \09%r10, 0;\0A\09mov.pred \09%p1, 0;\0A\09mov.pred \09%p3, -1;\0A\09mov.pred \09%p4, %p0;\0A\09mov.pred \09%p2, %p1;\0A\09mov.f32 \09%f7, %f5;\0A\09mov.f32 \09%f6, %f4;\0ABB0_11:                                 // %for_loop.i.us\0A                                        //   Parent Loop BB0_2 Depth=1\0A                                        //     Parent Loop BB0_8 Depth=2\0A                                        // =>    This Inner Loop Header: Depth=3\0A\09and.pred  \09%p4, %p3, %p4;\0A\09mul.f32 \09%f8, %f7, %f7;\0A\09fma.rn.f32 \09%f9, %f6, %f6, %f8;\0A\09setp.gtu.f32 \09%p3, %f9, 0f40800000;\0A\09and.pred  \09%p3, %p4, %p3;\0A\09or.pred  \09%p2, %p3, %p2;\0A\09xor.pred  \09%p5, %p2, %p4;\0A\09mov.pred \09%p3, %p1;\0A\09@!%p5 bra \09BB0_10;\0A\09bra.uni \09BB0_9;\0ABB0_9:                                  // %not_all_continued_or_breaked.i.us\0A                                        //   in Loop: Header=BB0_11 Depth=3\0A\09mul.f32 \09%f9, %f6, %f6;\0A\09not.pred \09%p3, %p2;\0A\09and.pred  \09%p3, %p4, %p3;\0A\09sub.f32 \09%f8, %f8, %f9;\0A\09add.f32 \09%f8, %f5, %f8;\0A\09add.f32 \09%f7, %f7, %f7;\0A\09fma.rn.f32 \09%f6, %f6, %f7, %f4;\0A\09mov.f32 \09%f7, %f8;\0ABB0_10:                                 // %for_step.i.us\0A                                        //   in Loop: Header=BB0_11 Depth=3\0A\09add.s32 \09%r12, %r10, 1;\0A\09selp.b32 \09%r10, %r12, %r10, %p3;\0A\09setp.lt.s32 \09%p4, %r10, %r4;\0A\09and.pred  \09%p5, %p3, %p4;\0A\09@%p5 bra \09BB0_11;\0A// BB#5:                                // %mandel___vyfvyfvyi.exit.us\0A                                        //   in Loop: Header=BB0_8 Depth=2\0A\09setp.ge.s32 \09%p1, %r11, %r3;\0A\09@%p1 bra \09BB0_7;\0A// BB#6:                                // %if_then.us\0A                                        //   in Loop: Header=BB0_8 Depth=2\0A\09add.s32 \09%r11, %r8, 1073741823;\0A\09and.b32  \09%r9, %r11, %r9;\0A\09add.s32 \09%r11, %r7, %r6;\0A\09add.s32 \09%r9, %r11, %r9;\0A\09shl.b32 \09%r9, %r9, 2;\0A\09cvt.s64.s32 \09%rl1, %r9;\0A\09add.s64 \09%rl1, %rl1, %rl0;\0A\09st.u32 \09[%rl1], %r10;\0ABB0_7:                                  // %if_exit.us\0A                                        //   in Loop: Header=BB0_8 Depth=2\0A\09add.s32 \09%r7, %r8, %r7;\0A\09setp.lt.s32 \09%p1, %r7, %r3;\0A\09@%p1 bra \09BB0_8;\0A\09bra.uni \09BB0_12;\0ABB0_15:                                 // %mandel___vyfvyfvyi.exit\0A                                        //   Parent Loop BB0_2 Depth=1\0A                                        // =>  This Inner Loop Header: Depth=2\0A\09mov.u32 \09%r9, %tid.x;\0A\09mov.u32 \09%r8, WARP_SZ;\0A\09add.s32 \09%r10, %r8, -1;\0A\09and.b32  \09%r10, %r10, %r9;\0A\09add.s32 \09%r10, %r10, %r7;\0A\09setp.lt.s32 \09%p1, %r10, %r3;\0A\09@%p1 bra \09BB0_16;\0A\09bra.uni \09BB0_14;\0ABB0_16:                                 // %if_then\0A                                        //   in Loop: Header=BB0_15 Depth=2\0A\09add.s32 \09%r10, %r8, 1073741823;\0A\09and.b32  \09%r9, %r10, %r9;\0A\09add.s32 \09%r10, %r7, %r6;\0A\09add.s32 \09%r9, %r10, %r9;\0A\09shl.b32 \09%r9, %r9, 2;\0A\09cvt.s64.s32 \09%rl1, %r9;\0A\09add.s64 \09%rl1, %rl1, %rl0;\0A\09mov.u32 \09%r9, 0;\0A\09st.u32 \09[%rl1], %r9;\0ABB0_14:                                 // %if_exit\0A                                        //   in Loop: Header=BB0_15 Depth=2\0A\09add.s32 \09%r7, %r8, %r7;\0A\09setp.lt.s32 \09%p1, %r7, %r3;\0A\09@%p1 bra \09BB0_15;\0ABB0_12:                                 // %for_exit31\0A                                        //   in Loop: Header=BB0_2 Depth=1\0A\09add.s32 \09%r0, %r0, 1;\0A\09setp.eq.s32 \09%p1, %r0, %r5;\0A\09@%p1 bra \09BB0_13;\0A\09bra.uni \09BB0_2;\0ABB0_13:                                 // %for_exit\0A\09ret;\0A}\0A\0A\00"
@.func_str = private constant [20 x i8] c"mandelbrot_scanline\00"

; Function Attrs: nounwind
declare void @ISPCSync(i8*) #0

; Function Attrs: nounwind
declare i8* @CUDAAlloc(i8**, i64, i32) #0

; Function Attrs: nounwind
declare void @CUDALaunch(i8**, i8*, i8*, i8*, i8**, i32, i32, i32) #0

; Function Attrs: nounwind
define void @mandelbrot_ispc(float %x0, float %y0, float %x1, float %y1, i32 %width, i32 %height, i32 %maxIterations, i32* %output) #1 {
allocas:
  %launch_group_handle = alloca i8*, align 8
  %arrayStructPtr = alloca [10 x i8*], align 32
  %argptr = alloca float, align 4
  %argptr17 = alloca float, align 4
  %argptr20 = alloca float, align 4
  %argptr23 = alloca float, align 4
  %argptr26 = alloca i32, align 4
  %argptr29 = alloca i32, align 4
  %argptr32 = alloca i32, align 4
  %argptr35 = alloca i32, align 4
  %argptr38 = alloca i32, align 4
  %argptr41 = alloca i32*, align 8
  store i8* null, i8** %launch_group_handle, align 8
  %args_ptr = call i8* @CUDAAlloc(i8** %launch_group_handle, i64 80, i32 32)
  %height_load_to_float = sitofp i32 %height to float
  %sub_y1_load_y0_load = fsub float %y1, %y0
  %width_load_to_float = sitofp i32 %width to float
  %sub_x1_load_x0_load = fsub float %x1, %x0
  %div_height_load16_yspan_load = sdiv i32 %height, 4
  %div_width_load15_ = sdiv i32 %width, 32
  %div_sub_y1_load_y0_load_height_load_to_float = fdiv float %sub_y1_load_y0_load, %height_load_to_float
  %div_sub_x1_load_x0_load_width_load_to_float = fdiv float %sub_x1_load_x0_load, %width_load_to_float
  store float %x0, float* %argptr, align 4
  %el = getelementptr [10 x i8*]* %arrayStructPtr, i64 0, i64 0
  %voidptr = bitcast float* %argptr to i8*
  store i8* %voidptr, i8** %el, align 32
  store float %div_sub_x1_load_x0_load_width_load_to_float, float* %argptr17, align 4
  %el18 = getelementptr [10 x i8*]* %arrayStructPtr, i64 0, i64 1
  %voidptr19 = bitcast float* %argptr17 to i8*
  store i8* %voidptr19, i8** %el18, align 8
  store float %y0, float* %argptr20, align 4
  %el21 = getelementptr [10 x i8*]* %arrayStructPtr, i64 0, i64 2
  %voidptr22 = bitcast float* %argptr20 to i8*
  store i8* %voidptr22, i8** %el21, align 16
  store float %div_sub_y1_load_y0_load_height_load_to_float, float* %argptr23, align 4
  %el24 = getelementptr [10 x i8*]* %arrayStructPtr, i64 0, i64 3
  %voidptr25 = bitcast float* %argptr23 to i8*
  store i8* %voidptr25, i8** %el24, align 8
  store i32 %width, i32* %argptr26, align 4
  %el27 = getelementptr [10 x i8*]* %arrayStructPtr, i64 0, i64 4
  %voidptr28 = bitcast i32* %argptr26 to i8*
  store i8* %voidptr28, i8** %el27, align 32
  store i32 %height, i32* %argptr29, align 4
  %el30 = getelementptr [10 x i8*]* %arrayStructPtr, i64 0, i64 5
  %voidptr31 = bitcast i32* %argptr29 to i8*
  store i8* %voidptr31, i8** %el30, align 8
  store i32 32, i32* %argptr32, align 4
  %el33 = getelementptr [10 x i8*]* %arrayStructPtr, i64 0, i64 6
  %voidptr34 = bitcast i32* %argptr32 to i8*
  store i8* %voidptr34, i8** %el33, align 16
  store i32 4, i32* %argptr35, align 4
  %el36 = getelementptr [10 x i8*]* %arrayStructPtr, i64 0, i64 7
  %voidptr37 = bitcast i32* %argptr35 to i8*
  store i8* %voidptr37, i8** %el36, align 8
  store i32 %maxIterations, i32* %argptr38, align 4
  %el39 = getelementptr [10 x i8*]* %arrayStructPtr, i64 0, i64 8
  %voidptr40 = bitcast i32* %argptr38 to i8*
  store i8* %voidptr40, i8** %el39, align 32
  store i32* %output, i32** %argptr41, align 8
  %el42 = getelementptr [10 x i8*]* %arrayStructPtr, i64 0, i64 9
  %voidptr43 = bitcast i32** %argptr41 to i8*
  store i8* %voidptr43, i8** %el42, align 8
  call void @CUDALaunch(i8** %launch_group_handle, i8* getelementptr inbounds ([21 x i8]* @.module_str, i64 0, i64 0), i8* getelementptr inbounds ([6549 x i8]* @.ptx_str, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8]* @.func_str, i64 0, i64 0), i8** %el, i32 %div_width_load15_, i32 %div_height_load16_yspan_load, i32 1)
  %launch_group_handle_load = load i8** %launch_group_handle, align 8
  %cmp = icmp eq i8* %launch_group_handle_load, null
  br i1 %cmp, label %post_sync, label %call_sync

call_sync:                                        ; preds = %allocas
  call void @ISPCSync(i8* %launch_group_handle_load)
  store i8* null, i8** %launch_group_handle, align 8
  br label %post_sync

post_sync:                                        ; preds = %call_sync, %allocas
  ret void
}

attributes #0 = { nounwind }
attributes #1 = { nounwind "target-cpu"="corei7-avx" "target-features"="+avx,+popcnt,+cmov" }
