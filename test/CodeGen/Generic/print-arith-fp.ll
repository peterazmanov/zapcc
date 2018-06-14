; RUN: llc < %s
@a_str = internal constant [8 x i8] c"a = %f\0A\00"		; <[8 x i8]*> [#uses=1]
@b_str = internal constant [8 x i8] c"b = %f\0A\00"		; <[8 x i8]*> [#uses=1]
@add_str = internal constant [12 x i8] c"a + b = %f\0A\00"		; <[12 x i8]*> [#uses=1]
@sub_str = internal constant [12 x i8] c"a - b = %f\0A\00"		; <[12 x i8]*> [#uses=1]
@mul_str = internal constant [12 x i8] c"a * b = %f\0A\00"		; <[12 x i8]*> [#uses=1]
@div_str = internal constant [12 x i8] c"b / a = %f\0A\00"		; <[12 x i8]*> [#uses=1]
@rem_str = internal constant [13 x i8] c"b %% a = %f\0A\00"		; <[13 x i8]*> [#uses=1]
@lt_str = internal constant [12 x i8] c"a < b = %d\0A\00"		; <[12 x i8]*> [#uses=1]
@le_str = internal constant [13 x i8] c"a <= b = %d\0A\00"		; <[13 x i8]*> [#uses=1]
@gt_str = internal constant [12 x i8] c"a > b = %d\0A\00"		; <[12 x i8]*> [#uses=1]
@ge_str = internal constant [13 x i8] c"a >= b = %d\0A\00"		; <[13 x i8]*> [#uses=1]
@eq_str = internal constant [13 x i8] c"a == b = %d\0A\00"		; <[13 x i8]*> [#uses=1]
@ne_str = internal constant [13 x i8] c"a != b = %d\0A\00"		; <[13 x i8]*> [#uses=1]
@A = global double 2.000000e+00		; <double*> [#uses=1]
@B = global double 5.000000e+00		; <double*> [#uses=1]

declare i32 @printf(i8*, ...)

define i32 @main() {
	%a = load double, double* @A		; <double> [#uses=12]
	%b = load double, double* @B		; <double> [#uses=12]
	%a_s = getelementptr [8 x i8], [8 x i8]* @a_str, i64 0, i64 0		; <i8*> [#uses=1]
	%b_s = getelementptr [8 x i8], [8 x i8]* @b_str, i64 0, i64 0		; <i8*> [#uses=1]
	call i32 (i8*, ...) @printf( i8* %a_s, double %a )		; <i32>:1 [#uses=0]
	call i32 (i8*, ...) @printf( i8* %b_s, double %b )		; <i32>:2 [#uses=0]
	%add_r = fadd double %a, %b		; <double> [#uses=1]
	%sub_r = fsub double %a, %b		; <double> [#uses=1]
	%mul_r = fmul double %a, %b		; <double> [#uses=1]
	%div_r = fdiv double %b, %a		; <double> [#uses=1]
	%rem_r = frem double %b, %a		; <double> [#uses=1]
	%add_s = getelementptr [12 x i8], [12 x i8]* @add_str, i64 0, i64 0		; <i8*> [#uses=1]
	%sub_s = getelementptr [12 x i8], [12 x i8]* @sub_str, i64 0, i64 0		; <i8*> [#uses=1]
	%mul_s = getelementptr [12 x i8], [12 x i8]* @mul_str, i64 0, i64 0		; <i8*> [#uses=1]
	%div_s = getelementptr [12 x i8], [12 x i8]* @div_str, i64 0, i64 0		; <i8*> [#uses=1]
	%rem_s = getelementptr [13 x i8], [13 x i8]* @rem_str, i64 0, i64 0		; <i8*> [#uses=1]
	call i32 (i8*, ...) @printf( i8* %add_s, double %add_r )		; <i32>:3 [#uses=0]
	call i32 (i8*, ...) @printf( i8* %sub_s, double %sub_r )		; <i32>:4 [#uses=0]
	call i32 (i8*, ...) @printf( i8* %mul_s, double %mul_r )		; <i32>:5 [#uses=0]
	call i32 (i8*, ...) @printf( i8* %div_s, double %div_r )		; <i32>:6 [#uses=0]
	call i32 (i8*, ...) @printf( i8* %rem_s, double %rem_r )		; <i32>:7 [#uses=0]
	%lt_r = fcmp olt double %a, %b		; <i1> [#uses=1]
	%le_r = fcmp ole double %a, %b		; <i1> [#uses=1]
	%gt_r = fcmp ogt double %a, %b		; <i1> [#uses=1]
	%ge_r = fcmp oge double %a, %b		; <i1> [#uses=1]
	%eq_r = fcmp oeq double %a, %b		; <i1> [#uses=1]
	%ne_r = fcmp une double %a, %b		; <i1> [#uses=1]
	%lt_s = getelementptr [12 x i8], [12 x i8]* @lt_str, i64 0, i64 0		; <i8*> [#uses=1]
	%le_s = getelementptr [13 x i8], [13 x i8]* @le_str, i64 0, i64 0		; <i8*> [#uses=1]
	%gt_s = getelementptr [12 x i8], [12 x i8]* @gt_str, i64 0, i64 0		; <i8*> [#uses=1]
	%ge_s = getelementptr [13 x i8], [13 x i8]* @ge_str, i64 0, i64 0		; <i8*> [#uses=1]
	%eq_s = getelementptr [13 x i8], [13 x i8]* @eq_str, i64 0, i64 0		; <i8*> [#uses=1]
	%ne_s = getelementptr [13 x i8], [13 x i8]* @ne_str, i64 0, i64 0		; <i8*> [#uses=1]
	call i32 (i8*, ...) @printf( i8* %lt_s, i1 %lt_r )		; <i32>:8 [#uses=0]
	call i32 (i8*, ...) @printf( i8* %le_s, i1 %le_r )		; <i32>:9 [#uses=0]
	call i32 (i8*, ...) @printf( i8* %gt_s, i1 %gt_r )		; <i32>:10 [#uses=0]
	call i32 (i8*, ...) @printf( i8* %ge_s, i1 %ge_r )		; <i32>:11 [#uses=0]
	call i32 (i8*, ...) @printf( i8* %eq_s, i1 %eq_r )		; <i32>:12 [#uses=0]
	call i32 (i8*, ...) @printf( i8* %ne_s, i1 %ne_r )		; <i32>:13 [#uses=0]
	ret i32 0
}
