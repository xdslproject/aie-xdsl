// RUN: XDSL_ROUNDTRIP
// RUN: XDSL_GENERIC_ROUNDTRIP
// RUN: AIE_ROUNDTRIP
// RUN: AIE_GENERIC_ROUNDTRIP

aie.device(npu1) {
%1 = aie.tile(0, 1)
%2 = aie.tile(0, 2)
aie.objectfifo @of1 (%1, { %2 }, 4 : i32) : !aie.objectfifo<memref<16xi32>>
}


// CHECK:      module {
// CHECK-NEXT:   aie.device(npu1) {
// CHECK-NEXT:     %{{.*}} = aie.tile(0, 1)
// CHECK-NEXT:     %{{.*}} = aie.tile(0, 2)
// CHECK-NEXT:     aie.objectfifo @of1(%{{.*}}, {%{{.*}}}, 4 : i32) : !aie.objectfifo<memref<16xi32>>
// CHECK-NEXT:   }
// CHECK-NEXT: }

// CHECK-GENERIC:      "builtin.module"() ({
// CHECK-GENERIC-NEXT:   "aie.device"() <{{{["]?}}device{{["]?}} = 4 : i32}> ({
// CHECK-GENERIC-NEXT:     %{{.*}} = "aie.tile"() <{{{["]?}}col{{["]?}} = 0 : i32, {{["]?}}row{{["]?}} = 1 : i32}> : () -> index
// CHECK-GENERIC-NEXT:     %{{.*}} = "aie.tile"() <{{{["]?}}col{{["]?}} = 0 : i32, {{["]?}}row{{["]?}} = 2 : i32}> : () -> index
// CHECK-GENERIC-NEXT:     "aie.objectfifo"(%0, %1) <{{{["]?}}dimensionsFromStreamPerConsumer{{["]?}} = #aie<bd_dim_layout_array_array[[]]>, {{["]?}}dimensionsToStream{{["]?}} = #aie<bd_dim_layout_array[]>, {{["]?}}disable_synchronization{{["]?}} = false, {{["]?}}elemNumber{{["]?}} = 4 : i32, {{["]?}}elemType{{["]?}} = !aie.objectfifo<memref<16xi32>>, {{["]?}}plio{{["]?}} = false, {{["]?}}sym_name{{["]?}} = "of1", {{["]?}}via_DMA{{["]?}} = false}> : (index, index) -> ()
// CHECK-GENERIC-NEXT:     "aie.end"() : () -> ()
// CHECK-GENERIC-NEXT:   }) : () -> ()
// CHECK-GENERIC-NEXT: }) : () -> ()