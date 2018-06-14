; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -instcombine -S | FileCheck %s

define i23 @test1(i23 %A) {
; CHECK-LABEL: @test1(
; CHECK-NEXT:    ret i23 0
;
  %B = sub i23 %A, %A
  ret i23 %B
}

define i47 @test2(i47 %A) {
; CHECK-LABEL: @test2(
; CHECK-NEXT:    ret i47 %A
;
  %B = sub i47 %A, 0
  ret i47 %B
}

define i97 @test3(i97 %A) {
; CHECK-LABEL: @test3(
; CHECK-NEXT:    ret i97 %A
;
  %B = sub i97 0, %A
  %C = sub i97 0, %B
  ret i97 %C
}

define i108 @test4(i108 %A, i108 %x) {
; CHECK-LABEL: @test4(
; CHECK-NEXT:    [[C:%.*]] = add i108 %x, %A
; CHECK-NEXT:    ret i108 [[C]]
;
  %B = sub i108 0, %A
  %C = sub i108 %x, %B
  ret i108 %C
}

define i19 @test5(i19 %A, i19 %Bok, i19 %Cok) {
; CHECK-LABEL: @test5(
; CHECK-NEXT:    [[D1:%.*]] = sub i19 %Cok, %Bok
; CHECK-NEXT:    [[E:%.*]] = add i19 [[D1]], %A
; CHECK-NEXT:    ret i19 [[E]]
;
  %D = sub i19 %Bok, %Cok
  %E = sub i19 %A, %D
  ret i19 %E
}

define i57 @test6(i57 %A, i57 %B) {
; CHECK-LABEL: @test6(
; CHECK-NEXT:    [[B_NOT:%.*]] = xor i57 %B, -1
; CHECK-NEXT:    [[D:%.*]] = and i57 [[B_NOT]], %A
; CHECK-NEXT:    ret i57 [[D]]
;
  %C = and i57 %A, %B
  %D = sub i57 %A, %C
  ret i57 %D
}

define i77 @test7(i77 %A) {
; CHECK-LABEL: @test7(
; CHECK-NEXT:    [[B:%.*]] = xor i77 %A, -1
; CHECK-NEXT:    ret i77 [[B]]
;
  %B = sub i77 -1, %A
  ret i77 %B
}

define i27 @test8(i27 %A) {
; CHECK-LABEL: @test8(
; CHECK-NEXT:    [[C:%.*]] = shl i27 %A, 3
; CHECK-NEXT:    ret i27 [[C]]
;
  %B = mul i27 9, %A
  %C = sub i27 %B, %A
  ret i27 %C
}

define i42 @test9(i42 %A) {
; CHECK-LABEL: @test9(
; CHECK-NEXT:    [[C:%.*]] = mul i42 %A, -2
; CHECK-NEXT:    ret i42 [[C]]
;
  %B = mul i42 3, %A
  %C = sub i42 %A, %B
  ret i42 %C
}

define i124 @test10(i124 %A, i124 %B) {
; CHECK-LABEL: @test10(
; CHECK-NEXT:    [[E:%.*]] = mul i124 %A, %B
; CHECK-NEXT:    ret i124 [[E]]
;
  %C = sub i124 0, %A
  %D = sub i124 0, %B
  %E = mul i124 %C, %D
  ret i124 %E
}

define i55 @test10a(i55 %A) {
; CHECK-LABEL: @test10a(
; CHECK-NEXT:    [[E:%.*]] = mul i55 %A, -7
; CHECK-NEXT:    ret i55 [[E]]
;
  %C = sub i55 0, %A
  %E = mul i55 %C, 7
  ret i55 %E
}

define i1 @test11(i9 %A, i9 %B) {
; CHECK-LABEL: @test11(
; CHECK-NEXT:    [[CD:%.*]] = icmp ne i9 %A, %B
; CHECK-NEXT:    ret i1 [[CD]]
;
  %C = sub i9 %A, %B
  %cD = icmp ne i9 %C, 0
  ret i1 %cD
}

define i43 @test12(i43 %A) {
; CHECK-LABEL: @test12(
; CHECK-NEXT:    [[C:%.*]] = lshr i43 %A, 42
; CHECK-NEXT:    ret i43 [[C]]
;
  %B = ashr i43 %A, 42
  %C = sub i43 0, %B
  ret i43 %C
}

define i79 @test13(i79 %A) {
; CHECK-LABEL: @test13(
; CHECK-NEXT:    [[C:%.*]] = ashr i79 %A, 78
; CHECK-NEXT:    ret i79 [[C]]
;
  %B = lshr i79 %A, 78
  %C = sub i79 0, %B
  ret i79 %C
}

define i1024 @test14(i1024 %A) {
; CHECK-LABEL: @test14(
; CHECK-NEXT:    [[D:%.*]] = ashr i1024 %A, 1023
; CHECK-NEXT:    ret i1024 [[D]]
;
  %B = lshr i1024 %A, 1023
  %C = bitcast i1024 %B to i1024
  %D = sub i1024 0, %C
  ret i1024 %D
}

define i51 @test16(i51 %A) {
; CHECK-LABEL: @test16(
; CHECK-NEXT:    [[Y:%.*]] = sdiv i51 %A, -1123
; CHECK-NEXT:    ret i51 [[Y]]
;
  %X = sdiv i51 %A, 1123
  %Y = sub i51 0, %X
  ret i51 %Y
}

; Can't fold subtract here because negation might overflow.
; PR3142
define i25 @test17(i25 %Aok) {
; CHECK-LABEL: @test17(
; CHECK-NEXT:    [[B:%.*]] = sub i25 0, %Aok
; CHECK-NEXT:    [[C:%.*]] = sdiv i25 [[B]], 1234
; CHECK-NEXT:    ret i25 [[C]]
;
  %B = sub i25 0, %Aok
  %C = sdiv i25 %B, 1234
  ret i25 %C
}

define i128 @test18(i128 %Y) {
; CHECK-LABEL: @test18(
; CHECK-NEXT:    ret i128 0
;
  %t1 = shl i128 %Y, 2
  %t2 = shl i128 %Y, 2
  %t3 = sub i128 %t1, %t2
  ret i128 %t3
}

define i39 @test19(i39 %X, i39 %Y) {
; CHECK-LABEL: @test19(
; CHECK-NEXT:    ret i39 %X
;
  %Z = sub i39 %X, %Y
  %Q = add i39 %Z, %Y
  ret i39 %Q
}

define i1 @test20(i33 %g, i33 %h) {
; CHECK-LABEL: @test20(
; CHECK-NEXT:    [[T4:%.*]] = icmp ne i33 %h, 0
; CHECK-NEXT:    ret i1 [[T4]]
;
  %t2 = sub i33 %g, %h
  %t4 = icmp ne i33 %t2, %g
  ret i1 %t4
}

define i1 @test21(i256 %g, i256 %h) {
; CHECK-LABEL: @test21(
; CHECK-NEXT:    [[T4:%.*]] = icmp ne i256 %h, 0
; CHECK-NEXT:    ret i1 [[T4]]
;
  %t2 = sub i256 %g, %h
  %t4 = icmp ne i256 %t2, %g
  ret i1 %t4
}
