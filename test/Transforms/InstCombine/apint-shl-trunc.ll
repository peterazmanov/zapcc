; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -instcombine -S | FileCheck %s

define i1 @test0(i39 %X, i39 %A) {
; CHECK-LABEL: @test0(
; CHECK-NEXT:    [[TMP1:%.*]] = shl i39 1, %A
; CHECK-NEXT:    [[TMP2:%.*]] = and i39 [[TMP1]], %X
; CHECK-NEXT:    [[D:%.*]] = icmp ne i39 [[TMP2]], 0
; CHECK-NEXT:    ret i1 [[D]]
;
  %B = lshr i39 %X, %A
  %D = trunc i39 %B to i1
  ret i1 %D
}

define i1 @test1(i799 %X, i799 %A) {
; CHECK-LABEL: @test1(
; CHECK-NEXT:    [[TMP1:%.*]] = shl i799 1, %A
; CHECK-NEXT:    [[TMP2:%.*]] = and i799 [[TMP1]], %X
; CHECK-NEXT:    [[D:%.*]] = icmp ne i799 [[TMP2]], 0
; CHECK-NEXT:    ret i1 [[D]]
;
  %B = lshr i799 %X, %A
  %D = trunc i799 %B to i1
  ret i1 %D
}

define <2 x i1> @test0vec(<2 x i39> %X, <2 x i39> %A) {
; CHECK-LABEL: @test0vec(
; CHECK-NEXT:    [[TMP1:%.*]] = shl <2 x i39> <i39 1, i39 1>, %A
; CHECK-NEXT:    [[TMP2:%.*]] = and <2 x i39> [[TMP1]], %X
; CHECK-NEXT:    [[D:%.*]] = icmp ne <2 x i39> [[TMP2]], zeroinitializer
; CHECK-NEXT:    ret <2 x i1> [[D]]
;
  %B = lshr <2 x i39> %X, %A
  %D = trunc <2 x i39> %B to <2 x i1>
  ret <2 x i1> %D
}

