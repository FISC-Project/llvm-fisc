; RUN: llc -march=amdgcn -mcpu=bonaire -show-mc-encoding < %s | FileCheck -check-prefix=GCN -check-prefix=CI %s
; RUN: llc -march=amdgcn -mcpu=tonga -show-mc-encoding < %s | FileCheck -check-prefix=GCN -check-prefix=VI %s

declare void @llvm.amdgcn.buffer.wbinvl1.vol() #0

; GCN-LABEL: {{^}}test_buffer_wbinvl1_vol:
; GCN-NEXT: ; BB#0:
; CI-NEXT: buffer_wbinvl1_vol ; encoding: [0x00,0x00,0xc0,0xe1,0x00,0x00,0x00,0x00]
; VI-NEXT: buffer_wbinvl1_vol ; encoding: [0x00,0x00,0xfc,0xe0,0x00,0x00,0x00,0x00]
; GCN-NEXT: s_endpgm
define void @test_buffer_wbinvl1_vol() #0 {
  call void @llvm.amdgcn.buffer.wbinvl1.vol()
  ret void
}

attributes #0 = { nounwind }
