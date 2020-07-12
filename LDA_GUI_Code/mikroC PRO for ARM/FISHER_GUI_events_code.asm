_Database_Show:
;FISHER_GUI_events_code.c,32 :: 		void Database_Show() {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;FISHER_GUI_events_code.c,33 :: 		DrawScreen(&DatabaseScreen2);
MOVW	R0, #lo_addr(_DatabaseScreen2+0)
MOVT	R0, #hi_addr(_DatabaseScreen2+0)
BL	_DrawScreen+0
;FISHER_GUI_events_code.c,34 :: 		k1=0;a1=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_k1+0)
MOVT	R0, #hi_addr(_k1+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_a1+0)
MOVT	R0, #hi_addr(_a1+0)
STR	R1, [R0, #0]
;FISHER_GUI_events_code.c,35 :: 		for(jj=0;jj<TrainPicture;jj++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
STR	R1, [R0, #0]
L_Database_Show0:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Database_Show1
;FISHER_GUI_events_code.c,36 :: 		if (a1==(3*k1))    {q1 = 50; q2 = 60;}
MOVW	R0, #lo_addr(_k1+0)
MOVT	R0, #hi_addr(_k1+0)
LDR	R1, [R0, #0]
MOVS	R0, #3
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_a1+0)
MOVT	R0, #hi_addr(_a1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_Database_Show3
MOVS	R1, #50
MOVW	R0, #lo_addr(_q1+0)
MOVT	R0, #hi_addr(_q1+0)
STR	R1, [R0, #0]
MOVS	R1, #60
MOVW	R0, #lo_addr(_q2+0)
MOVT	R0, #hi_addr(_q2+0)
STR	R1, [R0, #0]
L_Database_Show3:
;FISHER_GUI_events_code.c,37 :: 		if (a1==(3*k1+1))   q1 = 130;
MOVW	R0, #lo_addr(_k1+0)
MOVT	R0, #hi_addr(_k1+0)
LDR	R1, [R0, #0]
MOVS	R0, #3
MULS	R0, R1, R0
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_a1+0)
MOVT	R0, #hi_addr(_a1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_Database_Show4
MOVS	R1, #130
MOVW	R0, #lo_addr(_q1+0)
MOVT	R0, #hi_addr(_q1+0)
STR	R1, [R0, #0]
L_Database_Show4:
;FISHER_GUI_events_code.c,38 :: 		if (a1==(3*k1+2))  {q1 = 90; q2 = 180; k1 = k1 + 1;}
MOVW	R0, #lo_addr(_k1+0)
MOVT	R0, #hi_addr(_k1+0)
LDR	R1, [R0, #0]
MOVS	R0, #3
MULS	R0, R1, R0
ADDS	R1, R0, #2
MOVW	R0, #lo_addr(_a1+0)
MOVT	R0, #hi_addr(_a1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_Database_Show5
MOVS	R1, #90
MOVW	R0, #lo_addr(_q1+0)
MOVT	R0, #hi_addr(_q1+0)
STR	R1, [R0, #0]
MOVS	R1, #180
MOVW	R0, #lo_addr(_q2+0)
MOVT	R0, #hi_addr(_q2+0)
STR	R1, [R0, #0]
MOVW	R1, #lo_addr(_k1+0)
MOVT	R1, #hi_addr(_k1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
L_Database_Show5:
;FISHER_GUI_events_code.c,39 :: 		Delay_ms(100);
MOVW	R7, #13609
MOVT	R7, #71
NOP
NOP
L_Database_Show6:
SUBS	R7, R7, #1
BNE	L_Database_Show6
NOP
NOP
;FISHER_GUI_events_code.c,40 :: 		ii=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
;FISHER_GUI_events_code.c,41 :: 		for(y1=0;y1<col;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Database_Show8:
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Database_Show9
;FISHER_GUI_events_code.c,42 :: 		for(x1=0;x1<row;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Database_Show11:
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Database_Show12
;FISHER_GUI_events_code.c,43 :: 		temp1 = TFT_RGBToColor16bit(Ear[jj*row*col+ii], Ear[jj*row*col+ii], Ear[jj*row*col+ii]);
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R0, [R0, #0]
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_Ear+0)
MOVT	R0, #hi_addr(_Ear+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
UXTB	R2, R0
UXTB	R1, R0
BL	_TFT_RGBToColor16bit+0
VMOV	S0, R0
VCVT.F32	#0, S0, S0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;FISHER_GUI_events_code.c,44 :: 		TFT_Dot(x1+q1,y1+q2,temp1);
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
UXTH	R0, R0
UXTH	R3, R0
MOVW	R0, #lo_addr(_q2+0)
MOVT	R0, #hi_addr(_q2+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
ADDS	R2, R0, R1
MOVW	R0, #lo_addr(_q1+0)
MOVT	R0, #hi_addr(_q1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R0, [SP, #4]
LDR	R0, [R0, #0]
ADDS	R0, R0, R1
SXTH	R1, R2
UXTH	R2, R3
SXTH	R0, R0
BL	_TFT_Dot+0
;FISHER_GUI_events_code.c,45 :: 		ii=ii+1;}}
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;FISHER_GUI_events_code.c,42 :: 		for(x1=0;x1<row;x1++){
LDR	R1, [SP, #4]
MOV	R0, R1
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;FISHER_GUI_events_code.c,45 :: 		ii=ii+1;}}
IT	AL
BAL	L_Database_Show11
L_Database_Show12:
;FISHER_GUI_events_code.c,41 :: 		for(y1=0;y1<col;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;FISHER_GUI_events_code.c,45 :: 		ii=ii+1;}}
IT	AL
BAL	L_Database_Show8
L_Database_Show9:
;FISHER_GUI_events_code.c,46 :: 		a1 = a1 + 1;}
MOVW	R1, #lo_addr(_a1+0)
MOVT	R1, #hi_addr(_a1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;FISHER_GUI_events_code.c,35 :: 		for(jj=0;jj<TrainPicture;jj++){
MOVW	R1, #lo_addr(_jj+0)
MOVT	R1, #hi_addr(_jj+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;FISHER_GUI_events_code.c,46 :: 		a1 = a1 + 1;}
IT	AL
BAL	L_Database_Show0
L_Database_Show1:
;FISHER_GUI_events_code.c,48 :: 		DrawScreen(&MainScreen1);
MOVW	R0, #lo_addr(_MainScreen1+0)
MOVT	R0, #hi_addr(_MainScreen1+0)
BL	_DrawScreen+0
;FISHER_GUI_events_code.c,49 :: 		}
L_end_Database_Show:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Database_Show
_Training:
;FISHER_GUI_events_code.c,51 :: 		void Training() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;FISHER_GUI_events_code.c,52 :: 		DrawScreen(&TrainingScreen3);
MOVW	R0, #lo_addr(_TrainingScreen3+0)
MOVT	R0, #hi_addr(_TrainingScreen3+0)
BL	_DrawScreen+0
;FISHER_GUI_events_code.c,53 :: 		Delay_ms(3000);
MOVW	R7, #15102
MOVT	R7, #2136
NOP
NOP
L_Training14:
SUBS	R7, R7, #1
BNE	L_Training14
NOP
NOP
NOP
;FISHER_GUI_events_code.c,54 :: 		DrawScreen(&MainScreen1);
MOVW	R0, #lo_addr(_MainScreen1+0)
MOVT	R0, #hi_addr(_MainScreen1+0)
BL	_DrawScreen+0
;FISHER_GUI_events_code.c,55 :: 		}
L_end_Training:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Training
_Test:
;FISHER_GUI_events_code.c,57 :: 		void Test() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;FISHER_GUI_events_code.c,58 :: 		DrawScreen(&TestScreen4);
MOVW	R0, #lo_addr(_TestScreen4+0)
MOVT	R0, #hi_addr(_TestScreen4+0)
BL	_DrawScreen+0
;FISHER_GUI_events_code.c,59 :: 		Delay_ms(3000);
MOVW	R7, #15102
MOVT	R7, #2136
NOP
NOP
L_Test16:
SUBS	R7, R7, #1
BNE	L_Test16
NOP
NOP
NOP
;FISHER_GUI_events_code.c,60 :: 		DrawScreen(&MainScreen1);
MOVW	R0, #lo_addr(_MainScreen1+0)
MOVT	R0, #hi_addr(_MainScreen1+0)
BL	_DrawScreen+0
;FISHER_GUI_events_code.c,61 :: 		}
L_end_Test:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Test
_CP_2:
;FISHER_GUI_events_code.c,65 :: 		void CP_2() {
SUB	SP, SP, #4
;FISHER_GUI_events_code.c,67 :: 		}
L_end_CP_2:
ADD	SP, SP, #4
BX	LR
; end of _CP_2
_CP_3:
;FISHER_GUI_events_code.c,69 :: 		void CP_3() {
SUB	SP, SP, #4
;FISHER_GUI_events_code.c,71 :: 		}
L_end_CP_3:
ADD	SP, SP, #4
BX	LR
; end of _CP_3
_CP_4:
;FISHER_GUI_events_code.c,73 :: 		void CP_4() {
SUB	SP, SP, #4
;FISHER_GUI_events_code.c,75 :: 		}
L_end_CP_4:
ADD	SP, SP, #4
BX	LR
; end of _CP_4
_CP_5:
;FISHER_GUI_events_code.c,77 :: 		void CP_5() {
SUB	SP, SP, #4
;FISHER_GUI_events_code.c,79 :: 		}
L_end_CP_5:
ADD	SP, SP, #4
BX	LR
; end of _CP_5
