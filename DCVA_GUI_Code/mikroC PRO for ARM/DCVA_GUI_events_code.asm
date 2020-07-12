_ValueZero:
;DCVA_GUI_events_code.c,86 :: 		ValueZero(){
;DCVA_GUI_events_code.c,88 :: 		ClassNumber=20;ClassPopulation=5;
MOVS	R1, #20
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
STR	R1, [R0, #0]
MOVS	R1, #5
MOVW	R0, #lo_addr(_ClassPopulation+0)
MOVT	R0, #hi_addr(_ClassPopulation+0)
STR	R1, [R0, #0]
;DCVA_GUI_events_code.c,89 :: 		N=99;
MOVS	R1, #99
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
STR	R1, [R0, #0]
;DCVA_GUI_events_code.c,90 :: 		TrainPicture=ClassNumber*ClassPopulation;
MOV	R1, #100
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
STR	R1, [R0, #0]
;DCVA_GUI_events_code.c,91 :: 		ii=0;jj=0;kk=0;mm=0;x1=0;y1=0;z1=0;
MOVS	R0, #0
MOVW	R2, #lo_addr(_ii+0)
MOVT	R2, #hi_addr(_ii+0)
STR	R0, [R2, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_mm+0)
MOVT	R0, #hi_addr(_mm+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
;DCVA_GUI_events_code.c,92 :: 		p=0;q=0;row=60;col=80;k1=0;q1=50;q2=60;a1=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_q+0)
MOVT	R0, #hi_addr(_q+0)
STR	R1, [R0, #0]
MOVS	R1, #60
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
STR	R1, [R0, #0]
MOVS	R1, #80
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_k1+0)
MOVT	R0, #hi_addr(_k1+0)
STR	R1, [R0, #0]
MOVS	R1, #50
MOVW	R0, #lo_addr(_q1+0)
MOVT	R0, #hi_addr(_q1+0)
STR	R1, [R0, #0]
MOVS	R1, #60
MOVW	R0, #lo_addr(_q2+0)
MOVT	R0, #hi_addr(_q2+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_a1+0)
MOVT	R0, #hi_addr(_a1+0)
STR	R1, [R0, #0]
;DCVA_GUI_events_code.c,93 :: 		ff=0; m1=0;tt=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ff+0)
MOVT	R0, #hi_addr(_ff+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_m1+0)
MOVT	R0, #hi_addr(_m1+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_tt+0)
MOVT	R0, #hi_addr(_tt+0)
STR	R1, [R0, #0]
;DCVA_GUI_events_code.c,94 :: 		tempk1=0;tempk2=0;tempk3=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_tempk1+0)
MOVT	R0, #hi_addr(_tempk1+0)
STRB	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_tempk2+0)
MOVT	R0, #hi_addr(_tempk2+0)
STRB	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_tempk3+0)
MOVT	R0, #hi_addr(_tempk3+0)
STRB	R1, [R0, #0]
;DCVA_GUI_events_code.c,95 :: 		temp1=0;temp2=0;temp3=0;temp4=0;temp5=0;NormFault=0;t=0;c=0;s=0;diag_toplam=0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp2+0)
MOVT	R0, #hi_addr(_temp2+0)
VSTR	#1, S0, [R0, #0]
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VSTR	#1, S0, [R0, #0]
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VSTR	#1, S0, [R0, #0]
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp5+0)
MOVT	R0, #hi_addr(_temp5+0)
VSTR	#1, S0, [R0, #0]
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_NormFault+0)
MOVT	R0, #hi_addr(_NormFault+0)
VSTR	#1, S0, [R0, #0]
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_t+0)
MOVT	R0, #hi_addr(_t+0)
VSTR	#1, S0, [R0, #0]
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_c+0)
MOVT	R0, #hi_addr(_c+0)
VSTR	#1, S0, [R0, #0]
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_s+0)
MOVT	R0, #hi_addr(_s+0)
VSTR	#1, S0, [R0, #0]
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_diag_toplam+0)
MOVT	R0, #hi_addr(_diag_toplam+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,96 :: 		WhoseEar=0;  basla=0;test_count=0;accuracy=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_WhoseEar+0)
MOVT	R0, #hi_addr(_WhoseEar+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_basla+0)
MOVT	R0, #hi_addr(_basla+0)
STRH	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_test_count+0)
MOVT	R0, #hi_addr(_test_count+0)
STRH	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_accuracy+0)
MOVT	R0, #hi_addr(_accuracy+0)
STRH	R1, [R0, #0]
;DCVA_GUI_events_code.c,97 :: 		TestPicture=50;DCVA_TetaC=400;EpsilonK=0;
MOVS	R1, #50
MOVW	R0, #lo_addr(_TestPicture+0)
MOVT	R0, #hi_addr(_TestPicture+0)
STR	R1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17352
VMOV	S0, R0
MOVW	R0, #lo_addr(_DCVA_TetaC+0)
MOVT	R0, #hi_addr(_DCVA_TetaC+0)
VSTR	#1, S0, [R0, #0]
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_EpsilonK+0)
MOVT	R0, #hi_addr(_EpsilonK+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,98 :: 		iteration1=0;iteration2=0;iteration3=0;ite_total=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_iteration1+0)
MOVT	R0, #hi_addr(_iteration1+0)
STRH	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_iteration2+0)
MOVT	R0, #hi_addr(_iteration2+0)
STRH	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_iteration3+0)
MOVT	R0, #hi_addr(_iteration3+0)
STRH	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_ite_total+0)
MOVT	R0, #hi_addr(_ite_total+0)
STRH	R1, [R0, #0]
;DCVA_GUI_events_code.c,99 :: 		for(ii=0;ii<TrainPicture;ii++) {GTemp[ii]=0; MTemp[ii]=0;}
MOVS	R0, #0
STR	R0, [R2, #0]
L_ValueZero0:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_ValueZero1
MOVW	R2, #lo_addr(_ii+0)
MOVT	R2, #hi_addr(_ii+0)
LDR	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R1, R0, R1
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_MTemp+0)
MOVT	R0, #hi_addr(_MTemp+0)
ADDS	R1, R0, R1
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
IT	AL
BAL	L_ValueZero0
L_ValueZero1:
;DCVA_GUI_events_code.c,101 :: 		for(ii=0;ii<(ClassNumber-1);ii++) ProjectedTestImage[ii]=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_ValueZero3:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_ValueZero4
MOVW	R2, #lo_addr(_ii+0)
MOVT	R2, #hi_addr(_ii+0)
LDR	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_ProjectedTestImage+0)
MOVT	R0, #hi_addr(_ProjectedTestImage+0)
ADDS	R1, R0, R1
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
IT	AL
BAL	L_ValueZero3
L_ValueZero4:
;DCVA_GUI_events_code.c,103 :: 		for(y1=0;y1<TrainPicture;y1++){       //V ilk deðer atama eye(n) birim matris
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_ValueZero6:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_ValueZero7
;DCVA_GUI_events_code.c,104 :: 		for(x1=0;x1<TrainPicture;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_ValueZero9:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_ValueZero10
;DCVA_GUI_events_code.c,105 :: 		if (x1==y1) V[x1][y1] = 1;
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_ValueZero12
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
VMOV.F32	S0, #1
VSTR	#1, S0, [R1, #0]
IT	AL
BAL	L_ValueZero13
L_ValueZero12:
;DCVA_GUI_events_code.c,106 :: 		else        V[x1][y1] = 0;}}
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
L_ValueZero13:
;DCVA_GUI_events_code.c,104 :: 		for(x1=0;x1<TrainPicture;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,106 :: 		else        V[x1][y1] = 0;}}
IT	AL
BAL	L_ValueZero9
L_ValueZero10:
;DCVA_GUI_events_code.c,103 :: 		for(y1=0;y1<TrainPicture;y1++){       //V ilk deðer atama eye(n) birim matris
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,106 :: 		else        V[x1][y1] = 0;}}
IT	AL
BAL	L_ValueZero6
L_ValueZero7:
;DCVA_GUI_events_code.c,108 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_ValueZero14:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_ValueZero15
;DCVA_GUI_events_code.c,109 :: 		for(x1=0;x1<TrainPicture;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_ValueZero17:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_ValueZero18
;DCVA_GUI_events_code.c,110 :: 		D[x1][y1] = 0;  R[x1][y1] = 0; L[x1][y1] = 0;}}
MOVW	R3, #lo_addr(_x1+0)
MOVT	R3, #hi_addr(_x1+0)
LDR	R1, [R3, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_D+0)
MOVT	R0, #hi_addr(_D+0)
ADDS	R1, R0, R1
MOVW	R2, #lo_addr(_y1+0)
MOVT	R2, #hi_addr(_y1+0)
LDR	R0, [R2, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
MOV	R0, R3
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
MOV	R0, R3
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,109 :: 		for(x1=0;x1<TrainPicture;x1++){
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;DCVA_GUI_events_code.c,110 :: 		D[x1][y1] = 0;  R[x1][y1] = 0; L[x1][y1] = 0;}}
IT	AL
BAL	L_ValueZero17
L_ValueZero18:
;DCVA_GUI_events_code.c,108 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,110 :: 		D[x1][y1] = 0;  R[x1][y1] = 0; L[x1][y1] = 0;}}
IT	AL
BAL	L_ValueZero14
L_ValueZero15:
;DCVA_GUI_events_code.c,112 :: 		for(y1=0;y1<ClassNumber;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_ValueZero20:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_ValueZero21
;DCVA_GUI_events_code.c,113 :: 		for(x1=0;x1<ClassNumber;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_ValueZero23:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_ValueZero24
;DCVA_GUI_events_code.c,114 :: 		SL[x1][y1] = 0; SV[x1][y1] = 0;}}
MOVW	R3, #lo_addr(_x1+0)
MOVT	R3, #hi_addr(_x1+0)
LDR	R1, [R3, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SL+0)
MOVT	R0, #hi_addr(_SL+0)
ADDS	R1, R0, R1
MOVW	R2, #lo_addr(_y1+0)
MOVT	R2, #hi_addr(_y1+0)
LDR	R0, [R2, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
MOV	R0, R3
LDR	R1, [R0, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SV+0)
MOVT	R0, #hi_addr(_SV+0)
ADDS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,113 :: 		for(x1=0;x1<ClassNumber;x1++){
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;DCVA_GUI_events_code.c,114 :: 		SL[x1][y1] = 0; SV[x1][y1] = 0;}}
IT	AL
BAL	L_ValueZero23
L_ValueZero24:
;DCVA_GUI_events_code.c,112 :: 		for(y1=0;y1<ClassNumber;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,114 :: 		SL[x1][y1] = 0; SV[x1][y1] = 0;}}
IT	AL
BAL	L_ValueZero20
L_ValueZero21:
;DCVA_GUI_events_code.c,116 :: 		for(x1=0;x1<256;x1++) histogram[x1]=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_ValueZero26:
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, #256
IT	CS
BCS	L_ValueZero27
MOVW	R2, #lo_addr(_x1+0)
MOVT	R2, #hi_addr(_x1+0)
LDR	R0, [R2, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(_histogram+0)
MOVT	R0, #hi_addr(_histogram+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRH	R0, [R1, #0]
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
IT	AL
BAL	L_ValueZero26
L_ValueZero27:
;DCVA_GUI_events_code.c,118 :: 		}
L_end_ValueZero:
BX	LR
; end of _ValueZero
_DCVA_START:
;DCVA_GUI_events_code.c,120 :: 		void DCVA_START() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DCVA_GUI_events_code.c,121 :: 		DrawScreen(&Screen5);
MOVW	R0, #lo_addr(_Screen5+0)
MOVT	R0, #hi_addr(_Screen5+0)
BL	_DrawScreen+0
;DCVA_GUI_events_code.c,122 :: 		}
L_end_DCVA_START:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DCVA_START
_J_E_2:
;DCVA_GUI_events_code.c,124 :: 		void J_E_2() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DCVA_GUI_events_code.c,125 :: 		jac_coe=0.01;
MOVW	R0, #55050
MOVT	R0, #15395
VMOV	S0, R0
MOVW	R0, #lo_addr(_jac_coe+0)
MOVT	R0, #hi_addr(_jac_coe+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,126 :: 		DrawScreen(&Screen6);
MOVW	R0, #lo_addr(_Screen6+0)
MOVT	R0, #hi_addr(_Screen6+0)
BL	_DrawScreen+0
;DCVA_GUI_events_code.c,127 :: 		}
L_end_J_E_2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _J_E_2
_J_E_3:
;DCVA_GUI_events_code.c,129 :: 		void J_E_3() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DCVA_GUI_events_code.c,130 :: 		jac_coe=0.001;
MOVW	R0, #4719
MOVT	R0, #14979
VMOV	S0, R0
MOVW	R0, #lo_addr(_jac_coe+0)
MOVT	R0, #hi_addr(_jac_coe+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,131 :: 		DrawScreen(&Screen6);
MOVW	R0, #lo_addr(_Screen6+0)
MOVT	R0, #hi_addr(_Screen6+0)
BL	_DrawScreen+0
;DCVA_GUI_events_code.c,132 :: 		}
L_end_J_E_3:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _J_E_3
_J_E_4:
;DCVA_GUI_events_code.c,134 :: 		void J_E_4() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DCVA_GUI_events_code.c,135 :: 		jac_coe=0.0001;
MOVW	R0, #46871
MOVT	R0, #14545
VMOV	S0, R0
MOVW	R0, #lo_addr(_jac_coe+0)
MOVT	R0, #hi_addr(_jac_coe+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,136 :: 		DrawScreen(&Screen6);
MOVW	R0, #lo_addr(_Screen6+0)
MOVT	R0, #hi_addr(_Screen6+0)
BL	_DrawScreen+0
;DCVA_GUI_events_code.c,137 :: 		}
L_end_J_E_4:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _J_E_4
_J_E_5:
;DCVA_GUI_events_code.c,139 :: 		void J_E_5() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DCVA_GUI_events_code.c,140 :: 		jac_coe=0.00001;
MOVW	R0, #50604
MOVT	R0, #14119
VMOV	S0, R0
MOVW	R0, #lo_addr(_jac_coe+0)
MOVT	R0, #hi_addr(_jac_coe+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,141 :: 		DrawScreen(&Screen6);
MOVW	R0, #lo_addr(_Screen6+0)
MOVT	R0, #hi_addr(_Screen6+0)
BL	_DrawScreen+0
;DCVA_GUI_events_code.c,142 :: 		}
L_end_J_E_5:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _J_E_5
_J_E_6:
;DCVA_GUI_events_code.c,144 :: 		void J_E_6() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DCVA_GUI_events_code.c,145 :: 		jac_coe=0.000001;
MOVW	R0, #14269
MOVT	R0, #13702
VMOV	S0, R0
MOVW	R0, #lo_addr(_jac_coe+0)
MOVT	R0, #hi_addr(_jac_coe+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,146 :: 		DrawScreen(&Screen6);
MOVW	R0, #lo_addr(_Screen6+0)
MOVT	R0, #hi_addr(_Screen6+0)
BL	_DrawScreen+0
;DCVA_GUI_events_code.c,147 :: 		}
L_end_J_E_6:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _J_E_6
_J_E_7:
;DCVA_GUI_events_code.c,149 :: 		void J_E_7() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DCVA_GUI_events_code.c,150 :: 		jac_coe=0.0000001;
MOVW	R0, #49045
MOVT	R0, #13270
VMOV	S0, R0
MOVW	R0, #lo_addr(_jac_coe+0)
MOVT	R0, #hi_addr(_jac_coe+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,151 :: 		DrawScreen(&Screen6);
MOVW	R0, #lo_addr(_Screen6+0)
MOVT	R0, #hi_addr(_Screen6+0)
BL	_DrawScreen+0
;DCVA_GUI_events_code.c,153 :: 		}
L_end_J_E_7:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _J_E_7
_J_E_8:
;DCVA_GUI_events_code.c,155 :: 		void J_E_8() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DCVA_GUI_events_code.c,156 :: 		jac_coe=0.00000001;
MOVW	R0, #52343
MOVT	R0, #12843
VMOV	S0, R0
MOVW	R0, #lo_addr(_jac_coe+0)
MOVT	R0, #hi_addr(_jac_coe+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,157 :: 		DrawScreen(&Screen6);
MOVW	R0, #lo_addr(_Screen6+0)
MOVT	R0, #hi_addr(_Screen6+0)
BL	_DrawScreen+0
;DCVA_GUI_events_code.c,158 :: 		}
L_end_J_E_8:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _J_E_8
_J_E_9:
;DCVA_GUI_events_code.c,160 :: 		void J_E_9() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DCVA_GUI_events_code.c,161 :: 		jac_coe=0.000000001;
MOVW	R0, #28767
MOVT	R0, #12425
VMOV	S0, R0
MOVW	R0, #lo_addr(_jac_coe+0)
MOVT	R0, #hi_addr(_jac_coe+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,162 :: 		DrawScreen(&Screen6);
MOVW	R0, #lo_addr(_Screen6+0)
MOVT	R0, #hi_addr(_Screen6+0)
BL	_DrawScreen+0
;DCVA_GUI_events_code.c,163 :: 		}
L_end_J_E_9:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _J_E_9
_DCVA_TRAINING:
;DCVA_GUI_events_code.c,165 :: 		void DCVA_TRAINING() {
SUB	SP, SP, #16
STR	LR, [SP, #0]
;DCVA_GUI_events_code.c,167 :: 		ValueZero();
BL	_ValueZero+0
;DCVA_GUI_events_code.c,168 :: 		DrawScreen(&Screen2);
MOVW	R0, #lo_addr(_Screen2+0)
MOVT	R0, #hi_addr(_Screen2+0)
BL	_DrawScreen+0
;DCVA_GUI_events_code.c,170 :: 		for(ii=0;ii<row*col;ii++){ // m_ort = row*col x 1
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING29:
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R0, [R0, #0]
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING30
;DCVA_GUI_events_code.c,171 :: 		dd = div(ii,100);
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
MOVS	R1, #100
SXTH	R1, R1
ADD	R12, SP, #4
BL	_div+0
MOVS	R3, #4
MOVW	R2, #lo_addr(_dd+0)
MOVT	R2, #hi_addr(_dd+0)
ADD	R1, SP, #4
L_DCVA_TRAINING32:
LDRB	R0, [R1, #0]
STRB	R0, [R2, #0]
SUBS	R3, R3, #1
UXTB	R3, R3
ADDS	R1, R1, #1
ADDS	R2, R2, #1
CMP	R3, #0
IT	NE
BNE	L_DCVA_TRAINING32
;DCVA_GUI_events_code.c,172 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,173 :: 		for(z1=0;(z1<TrainPicture);z1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING33:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING34
;DCVA_GUI_events_code.c,174 :: 		temp1 =  temp1 + Ear[row*col*z1+ii];
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R0, [R0, #0]
MULS	R1, R0, R1
MOVW	R2, #lo_addr(_z1+0)
MOVT	R2, #hi_addr(_z1+0)
LDR	R0, [R2, #0]
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_Ear+0)
MOVT	R0, #hi_addr(_Ear+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
VMOV	S1, R0
VCVT.F32	#0, S1, S1
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,173 :: 		for(z1=0;(z1<TrainPicture);z1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;DCVA_GUI_events_code.c,174 :: 		temp1 =  temp1 + Ear[row*col*z1+ii];
IT	AL
BAL	L_DCVA_TRAINING33
L_DCVA_TRAINING34:
;DCVA_GUI_events_code.c,175 :: 		R[dd.quot][dd.rem] = temp1/TrainPicture;}
MOVW	R0, #lo_addr(_dd+0)
MOVT	R0, #hi_addr(_dd+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_dd+2)
MOVT	R0, #hi_addr(_dd+2)
LDRSH	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R2, R1, R0
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
VLDR	#1, S0, [R0, #0]
VCVT.F32	#0, S1, S0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VDIV.F32	S0, S0, S1
VSTR	#1, S0, [R2, #0]
;DCVA_GUI_events_code.c,170 :: 		for(ii=0;ii<row*col;ii++){ // m_ort = row*col x 1
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,175 :: 		R[dd.quot][dd.rem] = temp1/TrainPicture;}
IT	AL
BAL	L_DCVA_TRAINING29
L_DCVA_TRAINING30:
;DCVA_GUI_events_code.c,177 :: 		TFT_Write_Text("MEAN OK", 30, 30);
MOVW	R0, #lo_addr(?lstr1_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr1_DCVA_GUI_events_code+0)
MOVS	R2, #30
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,178 :: 		TFT_Write_Text("L=A'*A ?", 30, 50);
MOVW	R0, #lo_addr(?lstr2_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr2_DCVA_GUI_events_code+0)
MOVS	R2, #50
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,180 :: 		for(x1=0;x1<TrainPicture;x1++){        // L = A'*A;
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING36:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING37
;DCVA_GUI_events_code.c,181 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING39:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING40
;DCVA_GUI_events_code.c,182 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,183 :: 		for(ii=0;ii<row*col;ii++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING42:
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R0, [R0, #0]
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING43
;DCVA_GUI_events_code.c,184 :: 		dd = div(ii,100);
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
MOVS	R1, #100
SXTH	R1, R1
ADD	R12, SP, #4
BL	_div+0
MOVS	R3, #4
MOVW	R2, #lo_addr(_dd+0)
MOVT	R2, #hi_addr(_dd+0)
ADD	R1, SP, #4
L_DCVA_TRAINING45:
LDRB	R0, [R1, #0]
STRB	R0, [R2, #0]
SUBS	R3, R3, #1
UXTB	R3, R3
ADDS	R1, R1, #1
ADDS	R2, R2, #1
CMP	R3, #0
IT	NE
BNE	L_DCVA_TRAINING45
;DCVA_GUI_events_code.c,185 :: 		temp1 = temp1 + (ear[row*col*x1 + ii] - R[dd.quot][dd.rem])*(ear[row*col*y1 + ii] - R[dd.quot][dd.rem]);}
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R0, [R0, #0]
MUL	R4, R0, R1
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
MUL	R1, R4, R0
MOVW	R3, #lo_addr(_ii+0)
MOVT	R3, #hi_addr(_ii+0)
LDR	R0, [R3, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_Ear+0)
MOVT	R0, #hi_addr(_Ear+0)
ADDS	R0, R0, R1
LDRB	R2, [R0, #0]
MOVW	R0, #lo_addr(_dd+0)
MOVT	R0, #hi_addr(_dd+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_dd+2)
MOVT	R0, #hi_addr(_dd+2)
LDRSH	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
VMOV	S0, R2
VCVT.F32	#0, S0, S0
VLDR	#1, S2, [R1, #0]
VSUB.F32	S1, S0, S2
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
MUL	R1, R4, R0
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_Ear+0)
MOVT	R0, #hi_addr(_Ear+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
VMOV	S0, R0
VCVT.F32	#0, S0, S0
VSUB.F32	S0, S0, S2
VMUL.F32	S1, S1, S0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,183 :: 		for(ii=0;ii<row*col;ii++){
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;DCVA_GUI_events_code.c,185 :: 		temp1 = temp1 + (ear[row*col*x1 + ii] - R[dd.quot][dd.rem])*(ear[row*col*y1 + ii] - R[dd.quot][dd.rem]);}
IT	AL
BAL	L_DCVA_TRAINING42
L_DCVA_TRAINING43:
;DCVA_GUI_events_code.c,186 :: 		L[x1][y1] = temp1;}}
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOVW	R2, #lo_addr(_y1+0)
MOVT	R2, #hi_addr(_y1+0)
LDR	R0, [R2, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,181 :: 		for(y1=0;y1<TrainPicture;y1++){
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;DCVA_GUI_events_code.c,186 :: 		L[x1][y1] = temp1;}}
IT	AL
BAL	L_DCVA_TRAINING39
L_DCVA_TRAINING40:
;DCVA_GUI_events_code.c,180 :: 		for(x1=0;x1<TrainPicture;x1++){        // L = A'*A;
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,186 :: 		L[x1][y1] = temp1;}}
IT	AL
BAL	L_DCVA_TRAINING36
L_DCVA_TRAINING37:
;DCVA_GUI_events_code.c,188 :: 		TFT_Write_Text("L=A'*A OK", 30, 70);
MOVW	R0, #lo_addr(?lstr3_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr3_DCVA_GUI_events_code+0)
MOVS	R2, #70
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,189 :: 		TFT_Write_Text("JACOBI ITERATION ?", 30, 90);
MOVW	R0, #lo_addr(?lstr4_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr4_DCVA_GUI_events_code+0)
MOVS	R2, #90
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,191 :: 		temp1 = 0;      //en büyük deðer bulma
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,192 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING46:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING47
;DCVA_GUI_events_code.c,193 :: 		for(x1=0;x1<TrainPicture;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING49:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING50
;DCVA_GUI_events_code.c,194 :: 		if ((fabs(L[x1][y1]) > temp1) && (x1 != y1)) {
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
BL	_fabs+0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S1, [R0, #0]
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	LE
BLE	L__DCVA_TRAINING433
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__DCVA_TRAINING432
L__DCVA_TRAINING431:
;DCVA_GUI_events_code.c,195 :: 		temp1 = fabs(L[x1][y1]);
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R0, [SP, #8]
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R0, [SP, #4]
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
BL	_fabs+0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,196 :: 		p=x1;
LDR	R0, [SP, #8]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
STR	R1, [R0, #0]
;DCVA_GUI_events_code.c,197 :: 		q=y1;}}}
LDR	R0, [SP, #4]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_q+0)
MOVT	R0, #hi_addr(_q+0)
STR	R1, [R0, #0]
;DCVA_GUI_events_code.c,194 :: 		if ((fabs(L[x1][y1]) > temp1) && (x1 != y1)) {
L__DCVA_TRAINING433:
L__DCVA_TRAINING432:
;DCVA_GUI_events_code.c,193 :: 		for(x1=0;x1<TrainPicture;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,197 :: 		q=y1;}}}
IT	AL
BAL	L_DCVA_TRAINING49
L_DCVA_TRAINING50:
;DCVA_GUI_events_code.c,192 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,197 :: 		q=y1;}}}
IT	AL
BAL	L_DCVA_TRAINING46
L_DCVA_TRAINING47:
;DCVA_GUI_events_code.c,199 :: 		iteration1 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_iteration1+0)
MOVT	R0, #hi_addr(_iteration1+0)
STRH	R1, [R0, #0]
;DCVA_GUI_events_code.c,200 :: 		basla = 1;                              // jacobi iteration döngü baþangýcý
MOVS	R1, #1
MOVW	R0, #lo_addr(_basla+0)
MOVT	R0, #hi_addr(_basla+0)
STRH	R1, [R0, #0]
;DCVA_GUI_events_code.c,201 :: 		while (basla==1){
L_DCVA_TRAINING55:
MOVW	R0, #lo_addr(_basla+0)
MOVT	R0, #hi_addr(_basla+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_DCVA_TRAINING56
;DCVA_GUI_events_code.c,203 :: 		IntToStr(iteration1,txt1);
MOVW	R0, #lo_addr(_iteration1+0)
MOVT	R0, #hi_addr(_iteration1+0)
LDRH	R0, [R0, #0]
MOVW	R1, #lo_addr(_txt1+0)
MOVT	R1, #hi_addr(_txt1+0)
BL	_IntToStr+0
;DCVA_GUI_events_code.c,204 :: 		TFT_Write_Text(txt1,120,60);
MOVS	R2, #60
MOVS	R1, #120
MOVW	R0, #lo_addr(_txt1+0)
MOVT	R0, #hi_addr(_txt1+0)
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,206 :: 		t = (L[p][q])/((L[q][q])-(L[p][p]));
MOVW	R4, #lo_addr(_p+0)
MOVT	R4, #hi_addr(_p+0)
LDR	R1, [R4, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R3, R0, R1
MOVW	R1, #lo_addr(_q+0)
MOVT	R1, #hi_addr(_q+0)
LDR	R0, [R1, #0]
LSLS	R2, R0, #2
ADDS	R0, R3, R2
VLDR	#1, S2, [R0, #0]
MOV	R0, R1
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R0, R0, R1
ADDS	R0, R0, R2
VLDR	#1, S1, [R0, #0]
MOV	R0, R4
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R3, R0
VLDR	#1, S0, [R0, #0]
VSUB.F32	S0, S1, S0
VDIV.F32	S0, S2, S0
MOVW	R0, #lo_addr(_t+0)
MOVT	R0, #hi_addr(_t+0)
STR	R0, [SP, #4]
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,207 :: 		c = 1/(sqrt(t*t+1));
VMUL.F32	S1, S0, S0
VMOV.F32	S0, #1
VADD.F32	S0, S1, S0
BL	_sqrt+0
VMOV.F32	S1, #1
VDIV.F32	S1, S1, S0
MOVW	R0, #lo_addr(_c+0)
MOVT	R0, #hi_addr(_c+0)
VSTR	#1, S1, [R0, #0]
;DCVA_GUI_events_code.c,208 :: 		s = t*c;
LDR	R0, [SP, #4]
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_s+0)
MOVT	R0, #hi_addr(_s+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,210 :: 		for(y1=0;y1<TrainPicture;y1++){ //matris çarpýmý D([p q],:) = R'*D([p q],:);
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING57:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING58
;DCVA_GUI_events_code.c,211 :: 		temp1 = L[p][y1];
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOVW	R8, #lo_addr(_y1+0)
MOVT	R8, #hi_addr(_y1+0)
LDR	R0, [R8, #0]
LSLS	R2, R0, #2
ADDS	R7, R1, R2
VLDR	#1, S0, [R7, #0]
MOVW	R6, #lo_addr(_temp1+0)
MOVT	R6, #hi_addr(_temp1+0)
VSTR	#1, S0, [R6, #0]
;DCVA_GUI_events_code.c,212 :: 		temp2 = L[q][y1];
MOVW	R5, #lo_addr(_q+0)
MOVT	R5, #hi_addr(_q+0)
LDR	R1, [R5, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R0, R0, R1
ADDS	R0, R0, R2
VLDR	#1, S0, [R0, #0]
MOVW	R4, #lo_addr(_temp2+0)
MOVT	R4, #hi_addr(_temp2+0)
VSTR	#1, S0, [R4, #0]
;DCVA_GUI_events_code.c,213 :: 		temp3 = temp1*c + temp2*(-s);
MOVW	R2, #lo_addr(_c+0)
MOVT	R2, #hi_addr(_c+0)
VLDR	#1, S1, [R2, #0]
MOV	R0, R6
VLDR	#1, S0, [R0, #0]
VMUL.F32	S2, S0, S1
MOVW	R1, #lo_addr(_s+0)
MOVT	R1, #hi_addr(_s+0)
VLDR	#1, S0, [R1, #0]
VNEG.F32	S1, S0
MOV	R0, R4
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VADD.F32	S0, S2, S0
MOVW	R3, #lo_addr(_temp3+0)
MOVT	R3, #hi_addr(_temp3+0)
VSTR	#1, S0, [R3, #0]
;DCVA_GUI_events_code.c,214 :: 		temp4 = temp1*s + temp2*c;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOV	R0, R6
VLDR	#1, S0, [R0, #0]
VMUL.F32	S2, S0, S1
MOV	R0, R2
VLDR	#1, S1, [R0, #0]
MOV	R0, R4
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VADD.F32	S0, S2, S0
MOVW	R2, #lo_addr(_temp4+0)
MOVT	R2, #hi_addr(_temp4+0)
VSTR	#1, S0, [R2, #0]
;DCVA_GUI_events_code.c,215 :: 		L[p][y1] = temp3;
MOV	R0, R3
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R7, #0]
;DCVA_GUI_events_code.c,216 :: 		L[q][y1] = temp4;}
MOV	R0, R5
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOV	R0, R8
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, R2
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,210 :: 		for(y1=0;y1<TrainPicture;y1++){ //matris çarpýmý D([p q],:) = R'*D([p q],:);
MOV	R0, R8
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R8, #0]
;DCVA_GUI_events_code.c,216 :: 		L[q][y1] = temp4;}
IT	AL
BAL	L_DCVA_TRAINING57
L_DCVA_TRAINING58:
;DCVA_GUI_events_code.c,218 :: 		for(x1=0;x1<TrainPicture;x1++){ //matris çarpýmý D(:,[p q]) = D(:,[p q])*R;
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING60:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING61
;DCVA_GUI_events_code.c,219 :: 		temp1 = L[x1][p];
MOVW	R8, #lo_addr(_x1+0)
MOVT	R8, #hi_addr(_x1+0)
LDR	R1, [R8, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R2, R0, R1
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R7, R2, R0
VLDR	#1, S1, [R7, #0]
MOVW	R6, #lo_addr(_temp1+0)
MOVT	R6, #hi_addr(_temp1+0)
VSTR	#1, S1, [R6, #0]
;DCVA_GUI_events_code.c,220 :: 		temp2 = L[x1][q];
MOVW	R5, #lo_addr(_q+0)
MOVT	R5, #hi_addr(_q+0)
LDR	R0, [R5, #0]
LSLS	R0, R0, #2
ADDS	R0, R2, R0
VLDR	#1, S0, [R0, #0]
MOVW	R4, #lo_addr(_temp2+0)
MOVT	R4, #hi_addr(_temp2+0)
VSTR	#1, S0, [R4, #0]
;DCVA_GUI_events_code.c,221 :: 		temp3 = temp1*c + temp2*(-s);
MOVW	R2, #lo_addr(_c+0)
MOVT	R2, #hi_addr(_c+0)
VLDR	#1, S0, [R2, #0]
VMUL.F32	S2, S1, S0
MOVW	R1, #lo_addr(_s+0)
MOVT	R1, #hi_addr(_s+0)
VLDR	#1, S0, [R1, #0]
VNEG.F32	S1, S0
MOV	R0, R4
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VADD.F32	S0, S2, S0
MOVW	R3, #lo_addr(_temp3+0)
MOVT	R3, #hi_addr(_temp3+0)
VSTR	#1, S0, [R3, #0]
;DCVA_GUI_events_code.c,222 :: 		temp4 = temp1*s + temp2*c;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOV	R0, R6
VLDR	#1, S0, [R0, #0]
VMUL.F32	S2, S0, S1
MOV	R0, R2
VLDR	#1, S1, [R0, #0]
MOV	R0, R4
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VADD.F32	S0, S2, S0
MOVW	R2, #lo_addr(_temp4+0)
MOVT	R2, #hi_addr(_temp4+0)
VSTR	#1, S0, [R2, #0]
;DCVA_GUI_events_code.c,223 :: 		L[x1][p] = temp3;
MOV	R0, R3
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R7, #0]
;DCVA_GUI_events_code.c,224 :: 		L[x1][q] = temp4;}
MOV	R0, R8
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOV	R0, R5
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, R2
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,218 :: 		for(x1=0;x1<TrainPicture;x1++){ //matris çarpýmý D(:,[p q]) = D(:,[p q])*R;
MOV	R0, R8
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R8, #0]
;DCVA_GUI_events_code.c,224 :: 		L[x1][q] = temp4;}
IT	AL
BAL	L_DCVA_TRAINING60
L_DCVA_TRAINING61:
;DCVA_GUI_events_code.c,226 :: 		for(x1=0;x1<TrainPicture;x1++){  //matris çarpýmý V(:,[p q]) = V(:,[p q])*R;
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING63:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING64
;DCVA_GUI_events_code.c,227 :: 		temp1 = V[x1][p];
MOVW	R8, #lo_addr(_x1+0)
MOVT	R8, #hi_addr(_x1+0)
LDR	R1, [R8, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R2, R0, R1
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R7, R2, R0
VLDR	#1, S1, [R7, #0]
MOVW	R6, #lo_addr(_temp1+0)
MOVT	R6, #hi_addr(_temp1+0)
VSTR	#1, S1, [R6, #0]
;DCVA_GUI_events_code.c,228 :: 		temp2 = V[x1][q];
MOVW	R5, #lo_addr(_q+0)
MOVT	R5, #hi_addr(_q+0)
LDR	R0, [R5, #0]
LSLS	R0, R0, #2
ADDS	R0, R2, R0
VLDR	#1, S0, [R0, #0]
MOVW	R4, #lo_addr(_temp2+0)
MOVT	R4, #hi_addr(_temp2+0)
VSTR	#1, S0, [R4, #0]
;DCVA_GUI_events_code.c,229 :: 		temp3 = temp1*c + temp2*(-s);
MOVW	R2, #lo_addr(_c+0)
MOVT	R2, #hi_addr(_c+0)
VLDR	#1, S0, [R2, #0]
VMUL.F32	S2, S1, S0
MOVW	R1, #lo_addr(_s+0)
MOVT	R1, #hi_addr(_s+0)
VLDR	#1, S0, [R1, #0]
VNEG.F32	S1, S0
MOV	R0, R4
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VADD.F32	S0, S2, S0
MOVW	R3, #lo_addr(_temp3+0)
MOVT	R3, #hi_addr(_temp3+0)
VSTR	#1, S0, [R3, #0]
;DCVA_GUI_events_code.c,230 :: 		temp4 = temp1*s + temp2*c;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOV	R0, R6
VLDR	#1, S0, [R0, #0]
VMUL.F32	S2, S0, S1
MOV	R0, R2
VLDR	#1, S1, [R0, #0]
MOV	R0, R4
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VADD.F32	S0, S2, S0
MOVW	R2, #lo_addr(_temp4+0)
MOVT	R2, #hi_addr(_temp4+0)
VSTR	#1, S0, [R2, #0]
;DCVA_GUI_events_code.c,231 :: 		V[x1][p] = temp3;
MOV	R0, R3
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R7, #0]
;DCVA_GUI_events_code.c,232 :: 		V[x1][q] = temp4;}
MOV	R0, R8
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOV	R0, R5
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, R2
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,226 :: 		for(x1=0;x1<TrainPicture;x1++){  //matris çarpýmý V(:,[p q]) = V(:,[p q])*R;
MOV	R0, R8
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R8, #0]
;DCVA_GUI_events_code.c,232 :: 		V[x1][q] = temp4;}
IT	AL
BAL	L_DCVA_TRAINING63
L_DCVA_TRAINING64:
;DCVA_GUI_events_code.c,234 :: 		temp1 = 0;      //en büyük deðer bulma
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,235 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING66:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING67
;DCVA_GUI_events_code.c,236 :: 		for(x1=0;x1<TrainPicture;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING69:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING70
;DCVA_GUI_events_code.c,237 :: 		if ((fabs(L[x1][y1]) > temp1) && (x1 != y1)) {
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
BL	_fabs+0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S1, [R0, #0]
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	LE
BLE	L__DCVA_TRAINING435
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__DCVA_TRAINING434
L__DCVA_TRAINING430:
;DCVA_GUI_events_code.c,238 :: 		temp1 = fabs(L[x1][y1]);
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R0, [SP, #8]
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R0, [SP, #4]
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
BL	_fabs+0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,239 :: 		p=x1;
LDR	R0, [SP, #8]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
STR	R1, [R0, #0]
;DCVA_GUI_events_code.c,240 :: 		q=y1;}}}
LDR	R0, [SP, #4]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_q+0)
MOVT	R0, #hi_addr(_q+0)
STR	R1, [R0, #0]
;DCVA_GUI_events_code.c,237 :: 		if ((fabs(L[x1][y1]) > temp1) && (x1 != y1)) {
L__DCVA_TRAINING435:
L__DCVA_TRAINING434:
;DCVA_GUI_events_code.c,236 :: 		for(x1=0;x1<TrainPicture;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,240 :: 		q=y1;}}}
IT	AL
BAL	L_DCVA_TRAINING69
L_DCVA_TRAINING70:
;DCVA_GUI_events_code.c,235 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,240 :: 		q=y1;}}}
IT	AL
BAL	L_DCVA_TRAINING66
L_DCVA_TRAINING67:
;DCVA_GUI_events_code.c,242 :: 		diag_toplam=0;            // döngüden çýkma eþik deðeri
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_diag_toplam+0)
MOVT	R0, #hi_addr(_diag_toplam+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,243 :: 		for(x1=0;x1<TrainPicture;x1++)  diag_toplam = diag_toplam + L[x1][x1]*L[x1][x1];
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING75:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING76
MOVW	R2, #lo_addr(_x1+0)
MOVT	R2, #hi_addr(_x1+0)
LDR	R1, [R2, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
VMUL.F32	S1, S0, S0
MOVW	R0, #lo_addr(_diag_toplam+0)
MOVT	R0, #hi_addr(_diag_toplam+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
IT	AL
BAL	L_DCVA_TRAINING75
L_DCVA_TRAINING76:
;DCVA_GUI_events_code.c,244 :: 		if (fabs(L[p][q]) < jac_coe*sqrt(diag_toplam/TrainPicture)) basla = 0; //e-5 yaptý e-7 yapmadý
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_q+0)
MOVT	R0, #hi_addr(_q+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
BL	_fabs+0
VSTR	#1, S0, [SP, #4]
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
VLDR	#1, S0, [R0, #0]
VCVT.F32	#0, S1, S0
MOVW	R0, #lo_addr(_diag_toplam+0)
MOVT	R0, #hi_addr(_diag_toplam+0)
VLDR	#1, S0, [R0, #0]
VDIV.F32	S0, S0, S1
BL	_sqrt+0
MOVW	R0, #lo_addr(_jac_coe+0)
MOVT	R0, #hi_addr(_jac_coe+0)
VLDR	#1, S1, [R0, #0]
VMUL.F32	S1, S1, S0
VLDR	#1, S0, [SP, #4]
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	GE
BGE	L_DCVA_TRAINING78
MOVS	R1, #0
MOVW	R0, #lo_addr(_basla+0)
MOVT	R0, #hi_addr(_basla+0)
STRH	R1, [R0, #0]
L_DCVA_TRAINING78:
;DCVA_GUI_events_code.c,246 :: 		for(y1=60;y1<80;y1++){
MOVS	R1, #60
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING79:
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, #80
IT	CS
BCS	L_DCVA_TRAINING80
;DCVA_GUI_events_code.c,247 :: 		for(x1=120;x1<160;x1++)
MOVS	R1, #120
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING82:
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, #160
IT	CS
BCS	L_DCVA_TRAINING83
;DCVA_GUI_events_code.c,248 :: 		TFT_Dot(x1, y1, CL_BLUE);}
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
MOVW	R2, #31
BL	_TFT_Dot+0
;DCVA_GUI_events_code.c,247 :: 		for(x1=120;x1<160;x1++)
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,248 :: 		TFT_Dot(x1, y1, CL_BLUE);}
IT	AL
BAL	L_DCVA_TRAINING82
L_DCVA_TRAINING83:
;DCVA_GUI_events_code.c,246 :: 		for(y1=60;y1<80;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,248 :: 		TFT_Dot(x1, y1, CL_BLUE);}
IT	AL
BAL	L_DCVA_TRAINING79
L_DCVA_TRAINING80:
;DCVA_GUI_events_code.c,249 :: 		iteration1 = iteration1 + 1;
MOVW	R1, #lo_addr(_iteration1+0)
MOVT	R1, #hi_addr(_iteration1+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;DCVA_GUI_events_code.c,250 :: 		}
IT	AL
BAL	L_DCVA_TRAINING55
L_DCVA_TRAINING56:
;DCVA_GUI_events_code.c,252 :: 		TFT_Write_Text("JACOBI ITERATION OK", 30, 110);
MOVW	R0, #lo_addr(?lstr5_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr5_DCVA_GUI_events_code+0)
MOVS	R2, #110
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,253 :: 		TFT_Write_Text("EIGENVECTOR ?", 30, 130);
MOVW	R0, #lo_addr(?lstr6_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr6_DCVA_GUI_events_code+0)
MOVS	R2, #130
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,257 :: 		temp1 = -1e+20;
MOVW	R0, #30956
MOVT	R0, #57517
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,258 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING85:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING86
;DCVA_GUI_events_code.c,259 :: 		for(x1=y1;x1<TrainPicture;x1++){
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING88:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING89
;DCVA_GUI_events_code.c,260 :: 		if (L[x1][x1] > temp1) {
MOVW	R2, #lo_addr(_x1+0)
MOVT	R2, #hi_addr(_x1+0)
LDR	R1, [R2, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LE
BLE	L_DCVA_TRAINING91
;DCVA_GUI_events_code.c,261 :: 		temp1 =  L[x1][x1];
MOVW	R2, #lo_addr(_x1+0)
MOVT	R2, #hi_addr(_x1+0)
LDR	R1, [R2, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,262 :: 		ii = x1;}}
MOV	R0, R2
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING91:
;DCVA_GUI_events_code.c,259 :: 		for(x1=y1;x1<TrainPicture;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,262 :: 		ii = x1;}}
IT	AL
BAL	L_DCVA_TRAINING88
L_DCVA_TRAINING89:
;DCVA_GUI_events_code.c,263 :: 		L[ii][ii] =  L[y1][y1];
MOVW	R2, #lo_addr(_ii+0)
MOVT	R2, #hi_addr(_ii+0)
LDR	R1, [R2, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R3, R1, R0
MOVW	R2, #lo_addr(_y1+0)
MOVT	R2, #hi_addr(_y1+0)
LDR	R1, [R2, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R3, #0]
;DCVA_GUI_events_code.c,264 :: 		L[y1][y1] = temp1;
MOV	R0, R2
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R2, R1, R0
MOVW	R1, #lo_addr(_temp1+0)
MOVT	R1, #hi_addr(_temp1+0)
VLDR	#1, S0, [R1, #0]
VSTR	#1, S0, [R2, #0]
;DCVA_GUI_events_code.c,265 :: 		temp1 = -1e+20;
MOVW	R0, #30956
MOVT	R0, #57517
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,266 :: 		for(x1=0;x1<TrainPicture;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING92:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING93
;DCVA_GUI_events_code.c,267 :: 		temp2 = V[x1][ii];
MOVW	R5, #lo_addr(_x1+0)
MOVT	R5, #hi_addr(_x1+0)
LDR	R1, [R5, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R4, R0, R1
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R4, R0
VLDR	#1, S0, [R1, #0]
MOVW	R3, #lo_addr(_temp2+0)
MOVT	R3, #hi_addr(_temp2+0)
VSTR	#1, S0, [R3, #0]
;DCVA_GUI_events_code.c,268 :: 		V[x1][ii] = V[x1][y1];
MOVW	R2, #lo_addr(_y1+0)
MOVT	R2, #hi_addr(_y1+0)
LDR	R0, [R2, #0]
LSLS	R0, R0, #2
ADDS	R0, R4, R0
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,269 :: 		V[x1][y1] = temp2;}}   // V[100][100]  but V[100][99]  only 1 eigenvector is rubbish
MOV	R0, R5
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, R3
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,266 :: 		for(x1=0;x1<TrainPicture;x1++){
MOV	R0, R5
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R5, #0]
;DCVA_GUI_events_code.c,269 :: 		V[x1][y1] = temp2;}}   // V[100][100]  but V[100][99]  only 1 eigenvector is rubbish
IT	AL
BAL	L_DCVA_TRAINING92
L_DCVA_TRAINING93:
;DCVA_GUI_events_code.c,258 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,269 :: 		V[x1][y1] = temp2;}}   // V[100][100]  but V[100][99]  only 1 eigenvector is rubbish
IT	AL
BAL	L_DCVA_TRAINING85
L_DCVA_TRAINING86:
;DCVA_GUI_events_code.c,271 :: 		TFT_Write_Text("EIGENVECTOR OK", 30, 150);
MOVW	R0, #lo_addr(?lstr7_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr7_DCVA_GUI_events_code+0)
MOVS	R2, #150
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,274 :: 		TFT_Write_Text("L=> ProjectedImages", 30, 170);
MOVW	R0, #lo_addr(?lstr8_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr8_DCVA_GUI_events_code+0)
MOVS	R2, #170
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,276 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING95:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING96
;DCVA_GUI_events_code.c,277 :: 		for(x1=0;x1<TrainPicture;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING98:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING99
;DCVA_GUI_events_code.c,278 :: 		L[x1][y1] = 0;}
MOVW	R2, #lo_addr(_x1+0)
MOVT	R2, #hi_addr(_x1+0)
LDR	R1, [R2, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,277 :: 		for(x1=0;x1<TrainPicture;x1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;DCVA_GUI_events_code.c,278 :: 		L[x1][y1] = 0;}
IT	AL
BAL	L_DCVA_TRAINING98
L_DCVA_TRAINING99:
;DCVA_GUI_events_code.c,276 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,278 :: 		L[x1][y1] = 0;}
IT	AL
BAL	L_DCVA_TRAINING95
L_DCVA_TRAINING96:
;DCVA_GUI_events_code.c,280 :: 		TFT_Write_Text("ProjectedImages ?", 30, 190);
MOVW	R0, #lo_addr(?lstr9_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr9_DCVA_GUI_events_code+0)
MOVS	R2, #190
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,282 :: 		for(y1=0;y1<N;y1++){   // V[100][99]       N=99;
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING101:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING102
;DCVA_GUI_events_code.c,283 :: 		for(ii=0;ii<row*col;ii++){        //(row*col x picture)(picture x picture - ClassNumber)
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING104:
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R0, [R0, #0]
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING105
;DCVA_GUI_events_code.c,284 :: 		dd = div(ii,100);
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
MOVS	R1, #100
SXTH	R1, R1
ADD	R12, SP, #4
BL	_div+0
MOVS	R3, #4
MOVW	R2, #lo_addr(_dd+0)
MOVT	R2, #hi_addr(_dd+0)
ADD	R1, SP, #4
L_DCVA_TRAINING107:
LDRB	R0, [R1, #0]
STRB	R0, [R2, #0]
SUBS	R3, R3, #1
UXTB	R3, R3
ADDS	R1, R1, #1
ADDS	R2, R2, #1
CMP	R3, #0
IT	NE
BNE	L_DCVA_TRAINING107
;DCVA_GUI_events_code.c,285 :: 		temp1 = 0;                    // MTemp => norm tutucu
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,286 :: 		for(x1=0;x1<TrainPicture;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING108:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING109
;DCVA_GUI_events_code.c,287 :: 		temp1 = temp1 + (Ear[x1*row*col + ii] - R[dd.quot][dd.rem])*V[x1][y1]; //A*V
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R1, [R0, #0]
MOVW	R3, #lo_addr(_x1+0)
MOVT	R3, #hi_addr(_x1+0)
LDR	R0, [R3, #0]
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
LDRB	R2, [R0, #0]
MOVW	R0, #lo_addr(_dd+0)
MOVT	R0, #hi_addr(_dd+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_dd+2)
MOVT	R0, #hi_addr(_dd+2)
LDRSH	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VMOV	S1, R2
VCVT.F32	#0, S1, S1
VLDR	#1, S0, [R0, #0]
VSUB.F32	S1, S1, S0
MOV	R0, R3
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
VMUL.F32	S1, S1, S0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,286 :: 		for(x1=0;x1<TrainPicture;x1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;DCVA_GUI_events_code.c,287 :: 		temp1 = temp1 + (Ear[x1*row*col + ii] - R[dd.quot][dd.rem])*V[x1][y1]; //A*V
IT	AL
BAL	L_DCVA_TRAINING108
L_DCVA_TRAINING109:
;DCVA_GUI_events_code.c,288 :: 		MTemp[y1] =  MTemp[y1] + temp1*temp1;}}
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_MTemp+0)
MOVT	R0, #hi_addr(_MTemp+0)
ADDS	R2, R0, R1
VLDR	#1, S2, [R2, #0]
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VADD.F32	S0, S2, S0
VSTR	#1, S0, [R2, #0]
;DCVA_GUI_events_code.c,283 :: 		for(ii=0;ii<row*col;ii++){        //(row*col x picture)(picture x picture - ClassNumber)
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,288 :: 		MTemp[y1] =  MTemp[y1] + temp1*temp1;}}
IT	AL
BAL	L_DCVA_TRAINING104
L_DCVA_TRAINING105:
;DCVA_GUI_events_code.c,282 :: 		for(y1=0;y1<N;y1++){   // V[100][99]       N=99;
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,288 :: 		MTemp[y1] =  MTemp[y1] + temp1*temp1;}}
IT	AL
BAL	L_DCVA_TRAINING101
L_DCVA_TRAINING102:
;DCVA_GUI_events_code.c,290 :: 		TFT_Write_Text("NORM KEEP OK", 30, 210);
MOVW	R0, #lo_addr(?lstr10_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr10_DCVA_GUI_events_code+0)
MOVS	R2, #210
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,292 :: 		for(y1=0;y1<N;y1++){        // V=V/norm_tutucu       100x99
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING111:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING112
;DCVA_GUI_events_code.c,293 :: 		for(x1=0;x1<TrainPicture;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING114:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING115
;DCVA_GUI_events_code.c,294 :: 		V[x1][y1] = (V[x1][y1])/(sqrt(MTemp[y1]));}
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R0, [SP, #12]
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R2, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
ADDS	R0, R2, R1
STR	R0, [SP, #8]
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [SP, #4]
MOVW	R0, #lo_addr(_MTemp+0)
MOVT	R0, #hi_addr(_MTemp+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VDIV.F32	S0, S1, S0
LDR	R0, [SP, #8]
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,293 :: 		for(x1=0;x1<TrainPicture;x1++)
LDR	R1, [SP, #12]
MOV	R0, R1
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,294 :: 		V[x1][y1] = (V[x1][y1])/(sqrt(MTemp[y1]));}
IT	AL
BAL	L_DCVA_TRAINING114
L_DCVA_TRAINING115:
;DCVA_GUI_events_code.c,292 :: 		for(y1=0;y1<N;y1++){        // V=V/norm_tutucu       100x99
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,294 :: 		V[x1][y1] = (V[x1][y1])/(sqrt(MTemp[y1]));}
IT	AL
BAL	L_DCVA_TRAINING111
L_DCVA_TRAINING112:
;DCVA_GUI_events_code.c,296 :: 		TFT_Write_Text("V=V/NORM KEEP OK", 30, 230);
MOVW	R0, #lo_addr(?lstr11_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr11_DCVA_GUI_events_code+0)
MOVS	R2, #230
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,298 :: 		for(x1=0;x1<TrainPicture;x1++){        // D = V
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING117:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING118
;DCVA_GUI_events_code.c,299 :: 		for(y1=0;y1<TrainPicture;y1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING120:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING121
;DCVA_GUI_events_code.c,300 :: 		D[x1][y1] = V[x1][y1];}
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MUL	R4, R0, R1
MOVW	R0, #lo_addr(_D+0)
MOVT	R0, #hi_addr(_D+0)
ADDS	R1, R0, R4
MOVW	R3, #lo_addr(_y1+0)
MOVT	R3, #hi_addr(_y1+0)
LDR	R0, [R3, #0]
LSLS	R2, R0, #2
ADDS	R1, R1, R2
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R0, R0, R4
ADDS	R0, R0, R2
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,299 :: 		for(y1=0;y1<TrainPicture;y1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;DCVA_GUI_events_code.c,300 :: 		D[x1][y1] = V[x1][y1];}
IT	AL
BAL	L_DCVA_TRAINING120
L_DCVA_TRAINING121:
;DCVA_GUI_events_code.c,298 :: 		for(x1=0;x1<TrainPicture;x1++){        // D = V
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,300 :: 		D[x1][y1] = V[x1][y1];}
IT	AL
BAL	L_DCVA_TRAINING117
L_DCVA_TRAINING118:
;DCVA_GUI_events_code.c,302 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING123:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING124
;DCVA_GUI_events_code.c,303 :: 		for(x1=0;x1<TrainPicture;x1++){        //(picture x row*col)(row*col x 1)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING126:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING127
;DCVA_GUI_events_code.c,304 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,305 :: 		for(ii=0;ii<row*col;ii++){     // Gtemp = A' * (EarNumber-m_ort)
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING129:
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R0, [R0, #0]
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING130
;DCVA_GUI_events_code.c,306 :: 		dd = div(ii,100);
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
MOVS	R1, #100
SXTH	R1, R1
ADD	R12, SP, #4
BL	_div+0
MOVS	R3, #4
MOVW	R2, #lo_addr(_dd+0)
MOVT	R2, #hi_addr(_dd+0)
ADD	R1, SP, #4
L_DCVA_TRAINING132:
LDRB	R0, [R1, #0]
STRB	R0, [R2, #0]
SUBS	R3, R3, #1
UXTB	R3, R3
ADDS	R1, R1, #1
ADDS	R2, R2, #1
CMP	R3, #0
IT	NE
BNE	L_DCVA_TRAINING132
;DCVA_GUI_events_code.c,307 :: 		temp1 = temp1 + (Ear[y1*row*col+ii] - R[dd.quot][dd.rem])*(Ear[x1*row*col+ii] - R[dd.quot][dd.rem]);}
MOVW	R5, #lo_addr(_row+0)
MOVT	R5, #hi_addr(_row+0)
LDR	R1, [R5, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
MULS	R1, R0, R1
MOVW	R4, #lo_addr(_col+0)
MOVT	R4, #hi_addr(_col+0)
LDR	R0, [R4, #0]
MULS	R1, R0, R1
MOVW	R3, #lo_addr(_ii+0)
MOVT	R3, #hi_addr(_ii+0)
LDR	R0, [R3, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_Ear+0)
MOVT	R0, #hi_addr(_Ear+0)
ADDS	R0, R0, R1
LDRB	R2, [R0, #0]
MOVW	R0, #lo_addr(_dd+0)
MOVT	R0, #hi_addr(_dd+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_dd+2)
MOVT	R0, #hi_addr(_dd+2)
LDRSH	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
VMOV	S0, R2
VCVT.F32	#0, S0, S0
VLDR	#1, S2, [R1, #0]
VSUB.F32	S1, S0, S2
MOV	R0, R5
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
MULS	R1, R0, R1
MOV	R0, R4
LDR	R0, [R0, #0]
MULS	R1, R0, R1
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_Ear+0)
MOVT	R0, #hi_addr(_Ear+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
VMOV	S0, R0
VCVT.F32	#0, S0, S0
VSUB.F32	S0, S0, S2
VMUL.F32	S1, S1, S0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,305 :: 		for(ii=0;ii<row*col;ii++){     // Gtemp = A' * (EarNumber-m_ort)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;DCVA_GUI_events_code.c,307 :: 		temp1 = temp1 + (Ear[y1*row*col+ii] - R[dd.quot][dd.rem])*(Ear[x1*row*col+ii] - R[dd.quot][dd.rem]);}
IT	AL
BAL	L_DCVA_TRAINING129
L_DCVA_TRAINING130:
;DCVA_GUI_events_code.c,308 :: 		GTemp[x1] =  temp1;}
MOVW	R2, #lo_addr(_x1+0)
MOVT	R2, #hi_addr(_x1+0)
LDR	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,303 :: 		for(x1=0;x1<TrainPicture;x1++){        //(picture x row*col)(row*col x 1)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;DCVA_GUI_events_code.c,308 :: 		GTemp[x1] =  temp1;}
IT	AL
BAL	L_DCVA_TRAINING126
L_DCVA_TRAINING127:
;DCVA_GUI_events_code.c,309 :: 		for(x1=0;x1<N;x1++){   // ProjectedImages = V' *  GTemp = V' * A' * (EarNumber-m_ort)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING133:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING134
;DCVA_GUI_events_code.c,310 :: 		temp2 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp2+0)
MOVT	R0, #hi_addr(_temp2+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,311 :: 		for(z1=0;z1<TrainPicture;z1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING136:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING137
;DCVA_GUI_events_code.c,312 :: 		temp2 = temp2 + V[z1][x1]*GTemp[z1]; // L'=L[y1][x1]; L= L[x1][y1]
MOVW	R3, #lo_addr(_z1+0)
MOVT	R3, #hi_addr(_z1+0)
LDR	R1, [R3, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R2, R1, R0
MOV	R0, R3
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R2, #0]
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_temp2+0)
MOVT	R0, #hi_addr(_temp2+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,311 :: 		for(z1=0;z1<TrainPicture;z1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;DCVA_GUI_events_code.c,312 :: 		temp2 = temp2 + V[z1][x1]*GTemp[z1]; // L'=L[y1][x1]; L= L[x1][y1]
IT	AL
BAL	L_DCVA_TRAINING136
L_DCVA_TRAINING137:
;DCVA_GUI_events_code.c,313 :: 		L[x1][y1] = temp2;}} //L[x1][y1] => ProjectedImages[x1][y1]
MOVW	R2, #lo_addr(_x1+0)
MOVT	R2, #hi_addr(_x1+0)
LDR	R1, [R2, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_temp2+0)
MOVT	R0, #hi_addr(_temp2+0)
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,309 :: 		for(x1=0;x1<N;x1++){   // ProjectedImages = V' *  GTemp = V' * A' * (EarNumber-m_ort)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;DCVA_GUI_events_code.c,313 :: 		L[x1][y1] = temp2;}} //L[x1][y1] => ProjectedImages[x1][y1]
IT	AL
BAL	L_DCVA_TRAINING133
L_DCVA_TRAINING134:
;DCVA_GUI_events_code.c,302 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,313 :: 		L[x1][y1] = temp2;}} //L[x1][y1] => ProjectedImages[x1][y1]
IT	AL
BAL	L_DCVA_TRAINING123
L_DCVA_TRAINING124:
;DCVA_GUI_events_code.c,315 :: 		TFT_Write_Text("ProjectedImages OK",30, 250);
MOVW	R0, #lo_addr(?lstr12_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr12_DCVA_GUI_events_code+0)
MOVS	R2, #250
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,316 :: 		TFT_Write_Text("Sw=Aw*Aw' ?", 30, 270);
MOVW	R0, #lo_addr(?lstr13_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr13_DCVA_GUI_events_code+0)
MOVW	R2, #270
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,318 :: 		for(ii=0;ii<ClassNumber;ii++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING139:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING140
;DCVA_GUI_events_code.c,319 :: 		for(x1=0;x1<N;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING142:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING143
;DCVA_GUI_events_code.c,320 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,321 :: 		for(y1=ii*ClassPopulation;y1<(ii+1)*ClassPopulation;y1++)
MOVW	R0, #lo_addr(_ClassPopulation+0)
MOVT	R0, #hi_addr(_ClassPopulation+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING145:
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_ClassPopulation+0)
MOVT	R0, #hi_addr(_ClassPopulation+0)
LDR	R0, [R0, #0]
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING146
;DCVA_GUI_events_code.c,322 :: 		temp1 = temp1 + L[x1][y1];         //  ProjectedImages[99][100]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOVW	R2, #lo_addr(_y1+0)
MOVT	R2, #hi_addr(_y1+0)
LDR	R0, [R2, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,321 :: 		for(y1=ii*ClassPopulation;y1<(ii+1)*ClassPopulation;y1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;DCVA_GUI_events_code.c,322 :: 		temp1 = temp1 + L[x1][y1];         //  ProjectedImages[99][100]
IT	AL
BAL	L_DCVA_TRAINING145
L_DCVA_TRAINING146:
;DCVA_GUI_events_code.c,323 :: 		temp2 = temp1/ClassPopulation;
MOVW	R1, #lo_addr(_ClassPopulation+0)
MOVT	R1, #hi_addr(_ClassPopulation+0)
VLDR	#1, S0, [R1, #0]
VCVT.F32	#0, S1, S0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_temp2+0)
MOVT	R0, #hi_addr(_temp2+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,324 :: 		for(y1=ii*ClassPopulation;y1<(ii+1)*ClassPopulation;y1++)
MOV	R0, R1
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING148:
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_ClassPopulation+0)
MOVT	R0, #hi_addr(_ClassPopulation+0)
LDR	R0, [R0, #0]
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING149
;DCVA_GUI_events_code.c,325 :: 		V[x1][y1] = L[x1][y1] - temp2;  }}    // V[99][100] geçiçi => A matris Sw=A*A'
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MUL	R4, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R2, R0, R4
MOVW	R3, #lo_addr(_y1+0)
MOVT	R3, #hi_addr(_y1+0)
LDR	R0, [R3, #0]
LSLS	R1, R0, #2
ADDS	R2, R2, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R0, R0, R4
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_temp2+0)
MOVT	R0, #hi_addr(_temp2+0)
VLDR	#1, S0, [R0, #0]
VSUB.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;DCVA_GUI_events_code.c,324 :: 		for(y1=ii*ClassPopulation;y1<(ii+1)*ClassPopulation;y1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;DCVA_GUI_events_code.c,325 :: 		V[x1][y1] = L[x1][y1] - temp2;  }}    // V[99][100] geçiçi => A matris Sw=A*A'
IT	AL
BAL	L_DCVA_TRAINING148
L_DCVA_TRAINING149:
;DCVA_GUI_events_code.c,319 :: 		for(x1=0;x1<N;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,325 :: 		V[x1][y1] = L[x1][y1] - temp2;  }}    // V[99][100] geçiçi => A matris Sw=A*A'
IT	AL
BAL	L_DCVA_TRAINING142
L_DCVA_TRAINING143:
;DCVA_GUI_events_code.c,318 :: 		for(ii=0;ii<ClassNumber;ii++){
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,325 :: 		V[x1][y1] = L[x1][y1] - temp2;  }}    // V[99][100] geçiçi => A matris Sw=A*A'
IT	AL
BAL	L_DCVA_TRAINING139
L_DCVA_TRAINING140:
;DCVA_GUI_events_code.c,327 :: 		for(x1=0;x1<N;x1++){        // Sw=A*A'   A[99][100] * A'[100][99]
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING151:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING152
;DCVA_GUI_events_code.c,328 :: 		for(y1=0;y1<N;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING154:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING155
;DCVA_GUI_events_code.c,329 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,330 :: 		for(z1=0;z1<TrainPicture;z1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING157:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING158
;DCVA_GUI_events_code.c,331 :: 		temp1 = temp1 + V[x1][z1] * V[y1][z1];
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOVW	R4, #lo_addr(_z1+0)
MOVT	R4, #hi_addr(_z1+0)
LDR	R0, [R4, #0]
LSLS	R3, R0, #2
ADDS	R2, R1, R3
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R0, R0, R1
ADDS	R0, R0, R3
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R2, #0]
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,330 :: 		for(z1=0;z1<TrainPicture;z1++)
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;DCVA_GUI_events_code.c,331 :: 		temp1 = temp1 + V[x1][z1] * V[y1][z1];
IT	AL
BAL	L_DCVA_TRAINING157
L_DCVA_TRAINING158:
;DCVA_GUI_events_code.c,332 :: 		R[x1][y1] = temp1;}}   // R[99][99] => Sw=A*A'
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R1, R0, R1
MOVW	R2, #lo_addr(_y1+0)
MOVT	R2, #hi_addr(_y1+0)
LDR	R0, [R2, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,328 :: 		for(y1=0;y1<N;y1++){
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;DCVA_GUI_events_code.c,332 :: 		R[x1][y1] = temp1;}}   // R[99][99] => Sw=A*A'
IT	AL
BAL	L_DCVA_TRAINING154
L_DCVA_TRAINING155:
;DCVA_GUI_events_code.c,327 :: 		for(x1=0;x1<N;x1++){        // Sw=A*A'   A[99][100] * A'[100][99]
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,332 :: 		R[x1][y1] = temp1;}}   // R[99][99] => Sw=A*A'
IT	AL
BAL	L_DCVA_TRAINING151
L_DCVA_TRAINING152:
;DCVA_GUI_events_code.c,334 :: 		TFT_Write_Text("Sw=Aw*Aw' OK", 30, 290);
MOVW	R0, #lo_addr(?lstr14_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr14_DCVA_GUI_events_code+0)
MOVW	R2, #290
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,336 :: 		for(y1=0;y1<TrainPicture;y1++){       //V   birim matris
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING160:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING161
;DCVA_GUI_events_code.c,337 :: 		for(x1=0;x1<TrainPicture;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING163:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING164
;DCVA_GUI_events_code.c,338 :: 		if (x1==y1) V[x1][y1] = 1;
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_DCVA_TRAINING166
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
VMOV.F32	S0, #1
VSTR	#1, S0, [R1, #0]
IT	AL
BAL	L_DCVA_TRAINING167
L_DCVA_TRAINING166:
;DCVA_GUI_events_code.c,339 :: 		else        V[x1][y1] = 0;}}
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
L_DCVA_TRAINING167:
;DCVA_GUI_events_code.c,337 :: 		for(x1=0;x1<TrainPicture;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,339 :: 		else        V[x1][y1] = 0;}}
IT	AL
BAL	L_DCVA_TRAINING163
L_DCVA_TRAINING164:
;DCVA_GUI_events_code.c,336 :: 		for(y1=0;y1<TrainPicture;y1++){       //V   birim matris
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,339 :: 		else        V[x1][y1] = 0;}}
IT	AL
BAL	L_DCVA_TRAINING160
L_DCVA_TRAINING161:
;DCVA_GUI_events_code.c,341 :: 		TFT_Fill_Screen(CL_BLUE);
MOVW	R0, #31
BL	_TFT_Fill_Screen+0
;DCVA_GUI_events_code.c,342 :: 		TFT_Write_Text("JACOBI ITERATION-2 ?", 30, 30);     //[V D] = eig(Sw);  R[99][99]
MOVW	R0, #lo_addr(?lstr15_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr15_DCVA_GUI_events_code+0)
MOVS	R2, #30
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,344 :: 		temp1 = 0;      //en büyük deðer bulma
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,345 :: 		for(y1=0;y1<N;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING168:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING169
;DCVA_GUI_events_code.c,346 :: 		for(x1=0;x1<N;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING171:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING172
;DCVA_GUI_events_code.c,347 :: 		if ((fabs(R[x1][y1]) > temp1) && (x1 != y1)) {
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
BL	_fabs+0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S1, [R0, #0]
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	LE
BLE	L__DCVA_TRAINING437
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__DCVA_TRAINING436
L__DCVA_TRAINING429:
;DCVA_GUI_events_code.c,348 :: 		temp1 = fabs(R[x1][y1]);
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R0, [SP, #8]
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R0, [SP, #4]
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
BL	_fabs+0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,349 :: 		p=x1;
LDR	R0, [SP, #8]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
STR	R1, [R0, #0]
;DCVA_GUI_events_code.c,350 :: 		q=y1;}}}
LDR	R0, [SP, #4]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_q+0)
MOVT	R0, #hi_addr(_q+0)
STR	R1, [R0, #0]
;DCVA_GUI_events_code.c,347 :: 		if ((fabs(R[x1][y1]) > temp1) && (x1 != y1)) {
L__DCVA_TRAINING437:
L__DCVA_TRAINING436:
;DCVA_GUI_events_code.c,346 :: 		for(x1=0;x1<N;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,350 :: 		q=y1;}}}
IT	AL
BAL	L_DCVA_TRAINING171
L_DCVA_TRAINING172:
;DCVA_GUI_events_code.c,345 :: 		for(y1=0;y1<N;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,350 :: 		q=y1;}}}
IT	AL
BAL	L_DCVA_TRAINING168
L_DCVA_TRAINING169:
;DCVA_GUI_events_code.c,352 :: 		iteration2 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_iteration2+0)
MOVT	R0, #hi_addr(_iteration2+0)
STRH	R1, [R0, #0]
;DCVA_GUI_events_code.c,353 :: 		basla = 1;                              // jacobi iteration döngü baþangýcý
MOVS	R1, #1
MOVW	R0, #lo_addr(_basla+0)
MOVT	R0, #hi_addr(_basla+0)
STRH	R1, [R0, #0]
;DCVA_GUI_events_code.c,354 :: 		while (basla==1){
L_DCVA_TRAINING177:
MOVW	R0, #lo_addr(_basla+0)
MOVT	R0, #hi_addr(_basla+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_DCVA_TRAINING178
;DCVA_GUI_events_code.c,356 :: 		IntToStr(iteration2,txt1);
MOVW	R0, #lo_addr(_iteration2+0)
MOVT	R0, #hi_addr(_iteration2+0)
LDRH	R0, [R0, #0]
MOVW	R1, #lo_addr(_txt1+0)
MOVT	R1, #hi_addr(_txt1+0)
BL	_IntToStr+0
;DCVA_GUI_events_code.c,357 :: 		TFT_Write_Text(txt1,120,60);
MOVS	R2, #60
MOVS	R1, #120
MOVW	R0, #lo_addr(_txt1+0)
MOVT	R0, #hi_addr(_txt1+0)
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,359 :: 		t = (R[p][q])/((R[q][q])-(R[p][p]));
MOVW	R4, #lo_addr(_p+0)
MOVT	R4, #hi_addr(_p+0)
LDR	R1, [R4, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R3, R0, R1
MOVW	R1, #lo_addr(_q+0)
MOVT	R1, #hi_addr(_q+0)
LDR	R0, [R1, #0]
LSLS	R2, R0, #2
ADDS	R0, R3, R2
VLDR	#1, S2, [R0, #0]
MOV	R0, R1
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R0, R0, R1
ADDS	R0, R0, R2
VLDR	#1, S1, [R0, #0]
MOV	R0, R4
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R3, R0
VLDR	#1, S0, [R0, #0]
VSUB.F32	S0, S1, S0
VDIV.F32	S0, S2, S0
MOVW	R0, #lo_addr(_t+0)
MOVT	R0, #hi_addr(_t+0)
STR	R0, [SP, #4]
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,360 :: 		c = 1/(sqrt(t*t+1));
VMUL.F32	S1, S0, S0
VMOV.F32	S0, #1
VADD.F32	S0, S1, S0
BL	_sqrt+0
VMOV.F32	S1, #1
VDIV.F32	S1, S1, S0
MOVW	R0, #lo_addr(_c+0)
MOVT	R0, #hi_addr(_c+0)
VSTR	#1, S1, [R0, #0]
;DCVA_GUI_events_code.c,361 :: 		s = t*c;
LDR	R0, [SP, #4]
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_s+0)
MOVT	R0, #hi_addr(_s+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,363 :: 		for(y1=0;y1<N;y1++){ //matris çarpýmý D([p q],:) = R'*D([p q],:);
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING179:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING180
;DCVA_GUI_events_code.c,364 :: 		temp1 = R[p][y1];
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R1, R0, R1
MOVW	R8, #lo_addr(_y1+0)
MOVT	R8, #hi_addr(_y1+0)
LDR	R0, [R8, #0]
LSLS	R2, R0, #2
ADDS	R7, R1, R2
VLDR	#1, S0, [R7, #0]
MOVW	R6, #lo_addr(_temp1+0)
MOVT	R6, #hi_addr(_temp1+0)
VSTR	#1, S0, [R6, #0]
;DCVA_GUI_events_code.c,365 :: 		temp2 = R[q][y1];
MOVW	R5, #lo_addr(_q+0)
MOVT	R5, #hi_addr(_q+0)
LDR	R1, [R5, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R0, R0, R1
ADDS	R0, R0, R2
VLDR	#1, S0, [R0, #0]
MOVW	R4, #lo_addr(_temp2+0)
MOVT	R4, #hi_addr(_temp2+0)
VSTR	#1, S0, [R4, #0]
;DCVA_GUI_events_code.c,366 :: 		temp3 = temp1*c + temp2*(-s);
MOVW	R2, #lo_addr(_c+0)
MOVT	R2, #hi_addr(_c+0)
VLDR	#1, S1, [R2, #0]
MOV	R0, R6
VLDR	#1, S0, [R0, #0]
VMUL.F32	S2, S0, S1
MOVW	R1, #lo_addr(_s+0)
MOVT	R1, #hi_addr(_s+0)
VLDR	#1, S0, [R1, #0]
VNEG.F32	S1, S0
MOV	R0, R4
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VADD.F32	S0, S2, S0
MOVW	R3, #lo_addr(_temp3+0)
MOVT	R3, #hi_addr(_temp3+0)
VSTR	#1, S0, [R3, #0]
;DCVA_GUI_events_code.c,367 :: 		temp4 = temp1*s + temp2*c;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOV	R0, R6
VLDR	#1, S0, [R0, #0]
VMUL.F32	S2, S0, S1
MOV	R0, R2
VLDR	#1, S1, [R0, #0]
MOV	R0, R4
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VADD.F32	S0, S2, S0
MOVW	R2, #lo_addr(_temp4+0)
MOVT	R2, #hi_addr(_temp4+0)
VSTR	#1, S0, [R2, #0]
;DCVA_GUI_events_code.c,368 :: 		R[p][y1] = temp3;
MOV	R0, R3
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R7, #0]
;DCVA_GUI_events_code.c,369 :: 		R[q][y1] = temp4;}
MOV	R0, R5
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R1, R0, R1
MOV	R0, R8
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, R2
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,363 :: 		for(y1=0;y1<N;y1++){ //matris çarpýmý D([p q],:) = R'*D([p q],:);
MOV	R0, R8
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R8, #0]
;DCVA_GUI_events_code.c,369 :: 		R[q][y1] = temp4;}
IT	AL
BAL	L_DCVA_TRAINING179
L_DCVA_TRAINING180:
;DCVA_GUI_events_code.c,371 :: 		for(x1=0;x1<N;x1++){ //matris çarpýmý D(:,[p q]) = D(:,[p q])*R;
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING182:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING183
;DCVA_GUI_events_code.c,372 :: 		temp1 = R[x1][p];
MOVW	R8, #lo_addr(_x1+0)
MOVT	R8, #hi_addr(_x1+0)
LDR	R1, [R8, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R2, R0, R1
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R7, R2, R0
VLDR	#1, S1, [R7, #0]
MOVW	R6, #lo_addr(_temp1+0)
MOVT	R6, #hi_addr(_temp1+0)
VSTR	#1, S1, [R6, #0]
;DCVA_GUI_events_code.c,373 :: 		temp2 = R[x1][q];
MOVW	R5, #lo_addr(_q+0)
MOVT	R5, #hi_addr(_q+0)
LDR	R0, [R5, #0]
LSLS	R0, R0, #2
ADDS	R0, R2, R0
VLDR	#1, S0, [R0, #0]
MOVW	R4, #lo_addr(_temp2+0)
MOVT	R4, #hi_addr(_temp2+0)
VSTR	#1, S0, [R4, #0]
;DCVA_GUI_events_code.c,374 :: 		temp3 = temp1*c + temp2*(-s);
MOVW	R2, #lo_addr(_c+0)
MOVT	R2, #hi_addr(_c+0)
VLDR	#1, S0, [R2, #0]
VMUL.F32	S2, S1, S0
MOVW	R1, #lo_addr(_s+0)
MOVT	R1, #hi_addr(_s+0)
VLDR	#1, S0, [R1, #0]
VNEG.F32	S1, S0
MOV	R0, R4
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VADD.F32	S0, S2, S0
MOVW	R3, #lo_addr(_temp3+0)
MOVT	R3, #hi_addr(_temp3+0)
VSTR	#1, S0, [R3, #0]
;DCVA_GUI_events_code.c,375 :: 		temp4 = temp1*s + temp2*c;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOV	R0, R6
VLDR	#1, S0, [R0, #0]
VMUL.F32	S2, S0, S1
MOV	R0, R2
VLDR	#1, S1, [R0, #0]
MOV	R0, R4
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VADD.F32	S0, S2, S0
MOVW	R2, #lo_addr(_temp4+0)
MOVT	R2, #hi_addr(_temp4+0)
VSTR	#1, S0, [R2, #0]
;DCVA_GUI_events_code.c,376 :: 		R[x1][p] = temp3;
MOV	R0, R3
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R7, #0]
;DCVA_GUI_events_code.c,377 :: 		R[x1][q] = temp4;}
MOV	R0, R8
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R1, R0, R1
MOV	R0, R5
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, R2
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,371 :: 		for(x1=0;x1<N;x1++){ //matris çarpýmý D(:,[p q]) = D(:,[p q])*R;
MOV	R0, R8
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R8, #0]
;DCVA_GUI_events_code.c,377 :: 		R[x1][q] = temp4;}
IT	AL
BAL	L_DCVA_TRAINING182
L_DCVA_TRAINING183:
;DCVA_GUI_events_code.c,379 :: 		for(x1=0;x1<N;x1++){  //matris çarpýmý V(:,[p q]) = V(:,[p q])*R;
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING185:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING186
;DCVA_GUI_events_code.c,380 :: 		temp1 = V[x1][p];
MOVW	R8, #lo_addr(_x1+0)
MOVT	R8, #hi_addr(_x1+0)
LDR	R1, [R8, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R2, R0, R1
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R7, R2, R0
VLDR	#1, S1, [R7, #0]
MOVW	R6, #lo_addr(_temp1+0)
MOVT	R6, #hi_addr(_temp1+0)
VSTR	#1, S1, [R6, #0]
;DCVA_GUI_events_code.c,381 :: 		temp2 = V[x1][q];
MOVW	R5, #lo_addr(_q+0)
MOVT	R5, #hi_addr(_q+0)
LDR	R0, [R5, #0]
LSLS	R0, R0, #2
ADDS	R0, R2, R0
VLDR	#1, S0, [R0, #0]
MOVW	R4, #lo_addr(_temp2+0)
MOVT	R4, #hi_addr(_temp2+0)
VSTR	#1, S0, [R4, #0]
;DCVA_GUI_events_code.c,382 :: 		temp3 = temp1*c + temp2*(-s);
MOVW	R2, #lo_addr(_c+0)
MOVT	R2, #hi_addr(_c+0)
VLDR	#1, S0, [R2, #0]
VMUL.F32	S2, S1, S0
MOVW	R1, #lo_addr(_s+0)
MOVT	R1, #hi_addr(_s+0)
VLDR	#1, S0, [R1, #0]
VNEG.F32	S1, S0
MOV	R0, R4
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VADD.F32	S0, S2, S0
MOVW	R3, #lo_addr(_temp3+0)
MOVT	R3, #hi_addr(_temp3+0)
VSTR	#1, S0, [R3, #0]
;DCVA_GUI_events_code.c,383 :: 		temp4 = temp1*s + temp2*c;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOV	R0, R6
VLDR	#1, S0, [R0, #0]
VMUL.F32	S2, S0, S1
MOV	R0, R2
VLDR	#1, S1, [R0, #0]
MOV	R0, R4
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VADD.F32	S0, S2, S0
MOVW	R2, #lo_addr(_temp4+0)
MOVT	R2, #hi_addr(_temp4+0)
VSTR	#1, S0, [R2, #0]
;DCVA_GUI_events_code.c,384 :: 		V[x1][p] = temp3;
MOV	R0, R3
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R7, #0]
;DCVA_GUI_events_code.c,385 :: 		V[x1][q] = temp4;}
MOV	R0, R8
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOV	R0, R5
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, R2
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,379 :: 		for(x1=0;x1<N;x1++){  //matris çarpýmý V(:,[p q]) = V(:,[p q])*R;
MOV	R0, R8
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R8, #0]
;DCVA_GUI_events_code.c,385 :: 		V[x1][q] = temp4;}
IT	AL
BAL	L_DCVA_TRAINING185
L_DCVA_TRAINING186:
;DCVA_GUI_events_code.c,387 :: 		temp1 = 0;      //en büyük deðer bulma
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,388 :: 		for(y1=0;y1<N;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING188:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING189
;DCVA_GUI_events_code.c,389 :: 		for(x1=0;x1<N;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING191:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING192
;DCVA_GUI_events_code.c,390 :: 		if ((fabs(R[x1][y1]) > temp1) && (x1 != y1)) {
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
BL	_fabs+0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S1, [R0, #0]
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	LE
BLE	L__DCVA_TRAINING439
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__DCVA_TRAINING438
L__DCVA_TRAINING428:
;DCVA_GUI_events_code.c,391 :: 		temp1 = fabs(R[x1][y1]);
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R0, [SP, #8]
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R0, [SP, #4]
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
BL	_fabs+0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,392 :: 		p=x1;
LDR	R0, [SP, #8]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
STR	R1, [R0, #0]
;DCVA_GUI_events_code.c,393 :: 		q=y1;}}}
LDR	R0, [SP, #4]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_q+0)
MOVT	R0, #hi_addr(_q+0)
STR	R1, [R0, #0]
;DCVA_GUI_events_code.c,390 :: 		if ((fabs(R[x1][y1]) > temp1) && (x1 != y1)) {
L__DCVA_TRAINING439:
L__DCVA_TRAINING438:
;DCVA_GUI_events_code.c,389 :: 		for(x1=0;x1<N;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,393 :: 		q=y1;}}}
IT	AL
BAL	L_DCVA_TRAINING191
L_DCVA_TRAINING192:
;DCVA_GUI_events_code.c,388 :: 		for(y1=0;y1<N;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,393 :: 		q=y1;}}}
IT	AL
BAL	L_DCVA_TRAINING188
L_DCVA_TRAINING189:
;DCVA_GUI_events_code.c,395 :: 		diag_toplam=0;            // döngüden çýkma eþik deðeri
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_diag_toplam+0)
MOVT	R0, #hi_addr(_diag_toplam+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,396 :: 		for(x1=0;x1<N;x1++)  diag_toplam = diag_toplam + R[x1][x1]*R[x1][x1];
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING197:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING198
MOVW	R2, #lo_addr(_x1+0)
MOVT	R2, #hi_addr(_x1+0)
LDR	R1, [R2, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
VMUL.F32	S1, S0, S0
MOVW	R0, #lo_addr(_diag_toplam+0)
MOVT	R0, #hi_addr(_diag_toplam+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
IT	AL
BAL	L_DCVA_TRAINING197
L_DCVA_TRAINING198:
;DCVA_GUI_events_code.c,397 :: 		if (fabs(R[p][q]) < jac_coe*sqrt(diag_toplam/N)) basla = 0;
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_q+0)
MOVT	R0, #hi_addr(_q+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
BL	_fabs+0
VSTR	#1, S0, [SP, #4]
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
VLDR	#1, S0, [R0, #0]
VCVT.F32	#0, S1, S0
MOVW	R0, #lo_addr(_diag_toplam+0)
MOVT	R0, #hi_addr(_diag_toplam+0)
VLDR	#1, S0, [R0, #0]
VDIV.F32	S0, S0, S1
BL	_sqrt+0
MOVW	R0, #lo_addr(_jac_coe+0)
MOVT	R0, #hi_addr(_jac_coe+0)
VLDR	#1, S1, [R0, #0]
VMUL.F32	S1, S1, S0
VLDR	#1, S0, [SP, #4]
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	GE
BGE	L_DCVA_TRAINING200
MOVS	R1, #0
MOVW	R0, #lo_addr(_basla+0)
MOVT	R0, #hi_addr(_basla+0)
STRH	R1, [R0, #0]
L_DCVA_TRAINING200:
;DCVA_GUI_events_code.c,399 :: 		for(y1=60;y1<80;y1++){
MOVS	R1, #60
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING201:
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, #80
IT	CS
BCS	L_DCVA_TRAINING202
;DCVA_GUI_events_code.c,400 :: 		for(x1=120;x1<160;x1++)
MOVS	R1, #120
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING204:
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, #160
IT	CS
BCS	L_DCVA_TRAINING205
;DCVA_GUI_events_code.c,401 :: 		TFT_Dot(x1, y1, CL_BLUE);}
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
MOVW	R2, #31
BL	_TFT_Dot+0
;DCVA_GUI_events_code.c,400 :: 		for(x1=120;x1<160;x1++)
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,401 :: 		TFT_Dot(x1, y1, CL_BLUE);}
IT	AL
BAL	L_DCVA_TRAINING204
L_DCVA_TRAINING205:
;DCVA_GUI_events_code.c,399 :: 		for(y1=60;y1<80;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,401 :: 		TFT_Dot(x1, y1, CL_BLUE);}
IT	AL
BAL	L_DCVA_TRAINING201
L_DCVA_TRAINING202:
;DCVA_GUI_events_code.c,402 :: 		iteration2 = iteration2 + 1;
MOVW	R1, #lo_addr(_iteration2+0)
MOVT	R1, #hi_addr(_iteration2+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;DCVA_GUI_events_code.c,403 :: 		}
IT	AL
BAL	L_DCVA_TRAINING177
L_DCVA_TRAINING178:
;DCVA_GUI_events_code.c,405 :: 		TFT_Write_Text("JACOBI ITERATION-2 OK", 30, 50);
MOVW	R0, #lo_addr(?lstr16_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr16_DCVA_GUI_events_code+0)
MOVS	R2, #50
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,406 :: 		TFT_Write_Text("V_Sw ?", 30, 70);
MOVW	R0, #lo_addr(?lstr17_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr17_DCVA_GUI_events_code+0)
MOVS	R2, #70
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,410 :: 		temp1 = -1e+20;
MOVW	R0, #30956
MOVT	R0, #57517
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,411 :: 		for(y1=0;y1<N;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING207:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING208
;DCVA_GUI_events_code.c,412 :: 		for(x1=y1;x1<N;x1++){
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING210:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING211
;DCVA_GUI_events_code.c,413 :: 		if (R[x1][x1] > temp1) {
MOVW	R2, #lo_addr(_x1+0)
MOVT	R2, #hi_addr(_x1+0)
LDR	R1, [R2, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LE
BLE	L_DCVA_TRAINING213
;DCVA_GUI_events_code.c,414 :: 		temp1 =  R[x1][x1];
MOVW	R2, #lo_addr(_x1+0)
MOVT	R2, #hi_addr(_x1+0)
LDR	R1, [R2, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,415 :: 		ii = x1;}}
MOV	R0, R2
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING213:
;DCVA_GUI_events_code.c,412 :: 		for(x1=y1;x1<N;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,415 :: 		ii = x1;}}
IT	AL
BAL	L_DCVA_TRAINING210
L_DCVA_TRAINING211:
;DCVA_GUI_events_code.c,416 :: 		R[ii][ii] =  R[y1][y1];
MOVW	R2, #lo_addr(_ii+0)
MOVT	R2, #hi_addr(_ii+0)
LDR	R1, [R2, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R3, R1, R0
MOVW	R2, #lo_addr(_y1+0)
MOVT	R2, #hi_addr(_y1+0)
LDR	R1, [R2, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R3, #0]
;DCVA_GUI_events_code.c,417 :: 		R[y1][y1] = temp1;
MOV	R0, R2
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R2, R1, R0
MOVW	R1, #lo_addr(_temp1+0)
MOVT	R1, #hi_addr(_temp1+0)
VLDR	#1, S0, [R1, #0]
VSTR	#1, S0, [R2, #0]
;DCVA_GUI_events_code.c,418 :: 		temp1 = -1e+20;
MOVW	R0, #30956
MOVT	R0, #57517
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,419 :: 		for(x1=0;x1<N;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING214:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING215
;DCVA_GUI_events_code.c,420 :: 		temp2 = V[x1][ii];
MOVW	R5, #lo_addr(_x1+0)
MOVT	R5, #hi_addr(_x1+0)
LDR	R1, [R5, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R4, R0, R1
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R4, R0
VLDR	#1, S0, [R1, #0]
MOVW	R3, #lo_addr(_temp2+0)
MOVT	R3, #hi_addr(_temp2+0)
VSTR	#1, S0, [R3, #0]
;DCVA_GUI_events_code.c,421 :: 		V[x1][ii] = V[x1][y1];
MOVW	R2, #lo_addr(_y1+0)
MOVT	R2, #hi_addr(_y1+0)
LDR	R0, [R2, #0]
LSLS	R0, R0, #2
ADDS	R0, R4, R0
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,422 :: 		V[x1][y1] = temp2;}}  // V[99][99]  but V_Sw[99][80]  19 eigenvectors are rubbish
MOV	R0, R5
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, R3
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,419 :: 		for(x1=0;x1<N;x1++){
MOV	R0, R5
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R5, #0]
;DCVA_GUI_events_code.c,422 :: 		V[x1][y1] = temp2;}}  // V[99][99]  but V_Sw[99][80]  19 eigenvectors are rubbish
IT	AL
BAL	L_DCVA_TRAINING214
L_DCVA_TRAINING215:
;DCVA_GUI_events_code.c,411 :: 		for(y1=0;y1<N;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,422 :: 		V[x1][y1] = temp2;}}  // V[99][99]  but V_Sw[99][80]  19 eigenvectors are rubbish
IT	AL
BAL	L_DCVA_TRAINING207
L_DCVA_TRAINING208:
;DCVA_GUI_events_code.c,424 :: 		TFT_Write_Text("V_Sw OK", 30, 90);
MOVW	R0, #lo_addr(?lstr18_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr18_DCVA_GUI_events_code+0)
MOVS	R2, #90
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,426 :: 		for(x1=0;x1<N;x1++){        // R[99][99]=V_Sw[99][80] * V_Sw'[80][99]=
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING217:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING218
;DCVA_GUI_events_code.c,427 :: 		for(y1=0;y1<N;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING220:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING221
;DCVA_GUI_events_code.c,428 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,429 :: 		for(z1=0;z1<N-(ClassNumber-1);z1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING223:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R0, [R0, #0]
SUB	R1, R0, R1
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING224
;DCVA_GUI_events_code.c,430 :: 		temp1 = temp1 + V[x1][z1]* V[y1][z1];
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOVW	R4, #lo_addr(_z1+0)
MOVT	R4, #hi_addr(_z1+0)
LDR	R0, [R4, #0]
LSLS	R3, R0, #2
ADDS	R2, R1, R3
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R0, R0, R1
ADDS	R0, R0, R3
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R2, #0]
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,429 :: 		for(z1=0;z1<N-(ClassNumber-1);z1++)
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;DCVA_GUI_events_code.c,430 :: 		temp1 = temp1 + V[x1][z1]* V[y1][z1];
IT	AL
BAL	L_DCVA_TRAINING223
L_DCVA_TRAINING224:
;DCVA_GUI_events_code.c,431 :: 		R[x1][y1] = temp1; }}
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R1, R0, R1
MOVW	R2, #lo_addr(_y1+0)
MOVT	R2, #hi_addr(_y1+0)
LDR	R0, [R2, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,427 :: 		for(y1=0;y1<N;y1++){
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;DCVA_GUI_events_code.c,431 :: 		R[x1][y1] = temp1; }}
IT	AL
BAL	L_DCVA_TRAINING220
L_DCVA_TRAINING221:
;DCVA_GUI_events_code.c,426 :: 		for(x1=0;x1<N;x1++){        // R[99][99]=V_Sw[99][80] * V_Sw'[80][99]=
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,431 :: 		R[x1][y1] = temp1; }}
IT	AL
BAL	L_DCVA_TRAINING217
L_DCVA_TRAINING218:
;DCVA_GUI_events_code.c,433 :: 		for(ii=0;ii<ClassNumber;ii++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING226:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING227
;DCVA_GUI_events_code.c,434 :: 		for(x1=0;x1<N;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING229:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING230
;DCVA_GUI_events_code.c,435 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,436 :: 		for(z1=0;z1<N;z1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING232:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING233
;DCVA_GUI_events_code.c,437 :: 		temp1 = temp1 + R[x1][z1]*L[z1][ClassPopulation*ii];
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R1, R0, R1
MOVW	R4, #lo_addr(_z1+0)
MOVT	R4, #hi_addr(_z1+0)
LDR	R0, [R4, #0]
LSLS	R0, R0, #2
ADDS	R3, R1, R0
MOV	R0, R4
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R2, R0, R1
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ClassPopulation+0)
MOVT	R0, #hi_addr(_ClassPopulation+0)
LDR	R0, [R0, #0]
MULS	R0, R1, R0
LSLS	R0, R0, #2
ADDS	R0, R2, R0
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R3, #0]
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,436 :: 		for(z1=0;z1<N;z1++)
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;DCVA_GUI_events_code.c,437 :: 		temp1 = temp1 + R[x1][z1]*L[z1][ClassPopulation*ii];
IT	AL
BAL	L_DCVA_TRAINING232
L_DCVA_TRAINING233:
;DCVA_GUI_events_code.c,438 :: 		V[x1][ii] = L[x1][ClassPopulation*ii] - temp1;}}      // V[99][20] => Xcom
MOVW	R5, #lo_addr(_x1+0)
MOVT	R5, #hi_addr(_x1+0)
LDR	R1, [R5, #0]
MOVW	R0, #400
MUL	R4, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R2, R0, R4
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
LSLS	R0, R0, #2
ADDS	R3, R2, R0
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R2, R0, R4
MOV	R0, R1
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ClassPopulation+0)
MOVT	R0, #hi_addr(_ClassPopulation+0)
LDR	R0, [R0, #0]
MULS	R0, R1, R0
LSLS	R0, R0, #2
ADDS	R0, R2, R0
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VSUB.F32	S0, S1, S0
VSTR	#1, S0, [R3, #0]
;DCVA_GUI_events_code.c,434 :: 		for(x1=0;x1<N;x1++){
MOV	R0, R5
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R5, #0]
;DCVA_GUI_events_code.c,438 :: 		V[x1][ii] = L[x1][ClassPopulation*ii] - temp1;}}      // V[99][20] => Xcom
IT	AL
BAL	L_DCVA_TRAINING229
L_DCVA_TRAINING230:
;DCVA_GUI_events_code.c,433 :: 		for(ii=0;ii<ClassNumber;ii++){
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,438 :: 		V[x1][ii] = L[x1][ClassPopulation*ii] - temp1;}}      // V[99][20] => Xcom
IT	AL
BAL	L_DCVA_TRAINING226
L_DCVA_TRAINING227:
;DCVA_GUI_events_code.c,440 :: 		TFT_Write_Text("Xcom OK", 30, 110);
MOVW	R0, #lo_addr(?lstr19_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr19_DCVA_GUI_events_code+0)
MOVS	R2, #110
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,442 :: 		for(x1=0;x1<N;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING235:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING236
;DCVA_GUI_events_code.c,443 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,444 :: 		for(y1=0;y1<ClassNumber;y1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING238:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING239
;DCVA_GUI_events_code.c,445 :: 		temp1 = temp1 + V[x1][y1];
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOVW	R2, #lo_addr(_y1+0)
MOVT	R2, #hi_addr(_y1+0)
LDR	R0, [R2, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,444 :: 		for(y1=0;y1<ClassNumber;y1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;DCVA_GUI_events_code.c,445 :: 		temp1 = temp1 + V[x1][y1];
IT	AL
BAL	L_DCVA_TRAINING238
L_DCVA_TRAINING239:
;DCVA_GUI_events_code.c,446 :: 		temp2 = temp1/ClassNumber;
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
VLDR	#1, S0, [R0, #0]
VCVT.F32	#0, S1, S0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_temp2+0)
MOVT	R0, #hi_addr(_temp2+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,447 :: 		for(y1=0;y1<ClassNumber;y1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING241:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING242
;DCVA_GUI_events_code.c,448 :: 		V[x1][y1] = V[x1][y1] - temp2;}     // V[99][20] => Xcom => convert => Acom
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOVW	R3, #lo_addr(_y1+0)
MOVT	R3, #hi_addr(_y1+0)
LDR	R0, [R3, #0]
LSLS	R0, R0, #2
ADDS	R2, R1, R0
VLDR	#1, S1, [R2, #0]
MOVW	R0, #lo_addr(_temp2+0)
MOVT	R0, #hi_addr(_temp2+0)
VLDR	#1, S0, [R0, #0]
VSUB.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;DCVA_GUI_events_code.c,447 :: 		for(y1=0;y1<ClassNumber;y1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;DCVA_GUI_events_code.c,448 :: 		V[x1][y1] = V[x1][y1] - temp2;}     // V[99][20] => Xcom => convert => Acom
IT	AL
BAL	L_DCVA_TRAINING241
L_DCVA_TRAINING242:
;DCVA_GUI_events_code.c,442 :: 		for(x1=0;x1<N;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,448 :: 		V[x1][y1] = V[x1][y1] - temp2;}     // V[99][20] => Xcom => convert => Acom
IT	AL
BAL	L_DCVA_TRAINING235
L_DCVA_TRAINING236:
;DCVA_GUI_events_code.c,450 :: 		TFT_Write_Text("Acom OK", 30, 130);
MOVW	R0, #lo_addr(?lstr20_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr20_DCVA_GUI_events_code+0)
MOVS	R2, #130
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,452 :: 		for(x1=0;x1<ClassNumber;x1++){        // SL[20][20] = SLcom = Acom'[20][99] * Acom[99][20]=
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING244:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING245
;DCVA_GUI_events_code.c,453 :: 		for(y1=0;y1<ClassNumber;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING247:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING248
;DCVA_GUI_events_code.c,454 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,455 :: 		for(z1=0;z1<N;z1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING250:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING251
;DCVA_GUI_events_code.c,456 :: 		temp1 = temp1 + V[z1][x1]* V[z1][y1];
MOVW	R3, #lo_addr(_z1+0)
MOVT	R3, #hi_addr(_z1+0)
LDR	R1, [R3, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R2, R1, R0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R2, #0]
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,455 :: 		for(z1=0;z1<N;z1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;DCVA_GUI_events_code.c,456 :: 		temp1 = temp1 + V[z1][x1]* V[z1][y1];
IT	AL
BAL	L_DCVA_TRAINING250
L_DCVA_TRAINING251:
;DCVA_GUI_events_code.c,457 :: 		SL[x1][y1] = temp1; }}
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SL+0)
MOVT	R0, #hi_addr(_SL+0)
ADDS	R1, R0, R1
MOVW	R2, #lo_addr(_y1+0)
MOVT	R2, #hi_addr(_y1+0)
LDR	R0, [R2, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,453 :: 		for(y1=0;y1<ClassNumber;y1++){
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;DCVA_GUI_events_code.c,457 :: 		SL[x1][y1] = temp1; }}
IT	AL
BAL	L_DCVA_TRAINING247
L_DCVA_TRAINING248:
;DCVA_GUI_events_code.c,452 :: 		for(x1=0;x1<ClassNumber;x1++){        // SL[20][20] = SLcom = Acom'[20][99] * Acom[99][20]=
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,457 :: 		SL[x1][y1] = temp1; }}
IT	AL
BAL	L_DCVA_TRAINING244
L_DCVA_TRAINING245:
;DCVA_GUI_events_code.c,459 :: 		TFT_Write_Text("SLcom OK", 30, 150);
MOVW	R0, #lo_addr(?lstr21_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr21_DCVA_GUI_events_code+0)
MOVS	R2, #150
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,461 :: 		for(y1=0;y1<ClassNumber;y1++){       //SV   birim matris
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING253:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING254
;DCVA_GUI_events_code.c,462 :: 		for(x1=0;x1<ClassNumber;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING256:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING257
;DCVA_GUI_events_code.c,463 :: 		if (x1==y1) SV[x1][y1] = 1;
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_DCVA_TRAINING259
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SV+0)
MOVT	R0, #hi_addr(_SV+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
VMOV.F32	S0, #1
VSTR	#1, S0, [R1, #0]
IT	AL
BAL	L_DCVA_TRAINING260
L_DCVA_TRAINING259:
;DCVA_GUI_events_code.c,464 :: 		else        SV[x1][y1] = 0;}}
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SV+0)
MOVT	R0, #hi_addr(_SV+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
L_DCVA_TRAINING260:
;DCVA_GUI_events_code.c,462 :: 		for(x1=0;x1<ClassNumber;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,464 :: 		else        SV[x1][y1] = 0;}}
IT	AL
BAL	L_DCVA_TRAINING256
L_DCVA_TRAINING257:
;DCVA_GUI_events_code.c,461 :: 		for(y1=0;y1<ClassNumber;y1++){       //SV   birim matris
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,464 :: 		else        SV[x1][y1] = 0;}}
IT	AL
BAL	L_DCVA_TRAINING253
L_DCVA_TRAINING254:
;DCVA_GUI_events_code.c,466 :: 		TFT_Write_Text("JACOBI ITERATION-3 ?", 30, 170);
MOVW	R0, #lo_addr(?lstr22_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr22_DCVA_GUI_events_code+0)
MOVS	R2, #170
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,468 :: 		temp1 = 0;      //en büyük deðer bulma
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,469 :: 		for(y1=0;y1<ClassNumber;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING261:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING262
;DCVA_GUI_events_code.c,470 :: 		for(x1=0;x1<ClassNumber;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING264:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING265
;DCVA_GUI_events_code.c,471 :: 		if ((fabs(SL[x1][y1]) > temp1) && (x1 != y1)) {
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SL+0)
MOVT	R0, #hi_addr(_SL+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
BL	_fabs+0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S1, [R0, #0]
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	LE
BLE	L__DCVA_TRAINING441
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__DCVA_TRAINING440
L__DCVA_TRAINING427:
;DCVA_GUI_events_code.c,472 :: 		temp1 = fabs(SL[x1][y1]);
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R0, [SP, #8]
LDR	R1, [R0, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SL+0)
MOVT	R0, #hi_addr(_SL+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R0, [SP, #4]
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
BL	_fabs+0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,473 :: 		p=x1;
LDR	R0, [SP, #8]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
STR	R1, [R0, #0]
;DCVA_GUI_events_code.c,474 :: 		q=y1;}}}
LDR	R0, [SP, #4]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_q+0)
MOVT	R0, #hi_addr(_q+0)
STR	R1, [R0, #0]
;DCVA_GUI_events_code.c,471 :: 		if ((fabs(SL[x1][y1]) > temp1) && (x1 != y1)) {
L__DCVA_TRAINING441:
L__DCVA_TRAINING440:
;DCVA_GUI_events_code.c,470 :: 		for(x1=0;x1<ClassNumber;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,474 :: 		q=y1;}}}
IT	AL
BAL	L_DCVA_TRAINING264
L_DCVA_TRAINING265:
;DCVA_GUI_events_code.c,469 :: 		for(y1=0;y1<ClassNumber;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,474 :: 		q=y1;}}}
IT	AL
BAL	L_DCVA_TRAINING261
L_DCVA_TRAINING262:
;DCVA_GUI_events_code.c,476 :: 		iteration3 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_iteration3+0)
MOVT	R0, #hi_addr(_iteration3+0)
STRH	R1, [R0, #0]
;DCVA_GUI_events_code.c,477 :: 		basla = 1;                              // jacobi iteration döngü baþangýcý
MOVS	R1, #1
MOVW	R0, #lo_addr(_basla+0)
MOVT	R0, #hi_addr(_basla+0)
STRH	R1, [R0, #0]
;DCVA_GUI_events_code.c,478 :: 		while (basla==1){
L_DCVA_TRAINING270:
MOVW	R0, #lo_addr(_basla+0)
MOVT	R0, #hi_addr(_basla+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_DCVA_TRAINING271
;DCVA_GUI_events_code.c,480 :: 		IntToStr(iteration3,txt1);
MOVW	R0, #lo_addr(_iteration3+0)
MOVT	R0, #hi_addr(_iteration3+0)
LDRH	R0, [R0, #0]
MOVW	R1, #lo_addr(_txt1+0)
MOVT	R1, #hi_addr(_txt1+0)
BL	_IntToStr+0
;DCVA_GUI_events_code.c,481 :: 		TFT_Write_Text(txt1,120,60);
MOVS	R2, #60
MOVS	R1, #120
MOVW	R0, #lo_addr(_txt1+0)
MOVT	R0, #hi_addr(_txt1+0)
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,483 :: 		t = (SL[p][q])/((SL[q][q])-(SL[p][p]));
MOVW	R4, #lo_addr(_p+0)
MOVT	R4, #hi_addr(_p+0)
LDR	R1, [R4, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SL+0)
MOVT	R0, #hi_addr(_SL+0)
ADDS	R3, R0, R1
MOVW	R1, #lo_addr(_q+0)
MOVT	R1, #hi_addr(_q+0)
LDR	R0, [R1, #0]
LSLS	R2, R0, #2
ADDS	R0, R3, R2
VLDR	#1, S2, [R0, #0]
MOV	R0, R1
LDR	R1, [R0, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SL+0)
MOVT	R0, #hi_addr(_SL+0)
ADDS	R0, R0, R1
ADDS	R0, R0, R2
VLDR	#1, S1, [R0, #0]
MOV	R0, R4
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R3, R0
VLDR	#1, S0, [R0, #0]
VSUB.F32	S0, S1, S0
VDIV.F32	S0, S2, S0
MOVW	R0, #lo_addr(_t+0)
MOVT	R0, #hi_addr(_t+0)
STR	R0, [SP, #4]
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,484 :: 		c = 1/(sqrt(t*t+1));
VMUL.F32	S1, S0, S0
VMOV.F32	S0, #1
VADD.F32	S0, S1, S0
BL	_sqrt+0
VMOV.F32	S1, #1
VDIV.F32	S1, S1, S0
MOVW	R0, #lo_addr(_c+0)
MOVT	R0, #hi_addr(_c+0)
VSTR	#1, S1, [R0, #0]
;DCVA_GUI_events_code.c,485 :: 		s = t*c;
LDR	R0, [SP, #4]
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_s+0)
MOVT	R0, #hi_addr(_s+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,487 :: 		for(y1=0;y1<ClassNumber;y1++){ //matris çarpýmý D([p q],:) = R'*D([p q],:);
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING272:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING273
;DCVA_GUI_events_code.c,488 :: 		temp1 = SL[p][y1];
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
LDR	R1, [R0, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SL+0)
MOVT	R0, #hi_addr(_SL+0)
ADDS	R1, R0, R1
MOVW	R8, #lo_addr(_y1+0)
MOVT	R8, #hi_addr(_y1+0)
LDR	R0, [R8, #0]
LSLS	R2, R0, #2
ADDS	R7, R1, R2
VLDR	#1, S0, [R7, #0]
MOVW	R6, #lo_addr(_temp1+0)
MOVT	R6, #hi_addr(_temp1+0)
VSTR	#1, S0, [R6, #0]
;DCVA_GUI_events_code.c,489 :: 		temp2 = SL[q][y1];
MOVW	R5, #lo_addr(_q+0)
MOVT	R5, #hi_addr(_q+0)
LDR	R1, [R5, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SL+0)
MOVT	R0, #hi_addr(_SL+0)
ADDS	R0, R0, R1
ADDS	R0, R0, R2
VLDR	#1, S0, [R0, #0]
MOVW	R4, #lo_addr(_temp2+0)
MOVT	R4, #hi_addr(_temp2+0)
VSTR	#1, S0, [R4, #0]
;DCVA_GUI_events_code.c,490 :: 		temp3 = temp1*c + temp2*(-s);
MOVW	R2, #lo_addr(_c+0)
MOVT	R2, #hi_addr(_c+0)
VLDR	#1, S1, [R2, #0]
MOV	R0, R6
VLDR	#1, S0, [R0, #0]
VMUL.F32	S2, S0, S1
MOVW	R1, #lo_addr(_s+0)
MOVT	R1, #hi_addr(_s+0)
VLDR	#1, S0, [R1, #0]
VNEG.F32	S1, S0
MOV	R0, R4
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VADD.F32	S0, S2, S0
MOVW	R3, #lo_addr(_temp3+0)
MOVT	R3, #hi_addr(_temp3+0)
VSTR	#1, S0, [R3, #0]
;DCVA_GUI_events_code.c,491 :: 		temp4 = temp1*s + temp2*c;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOV	R0, R6
VLDR	#1, S0, [R0, #0]
VMUL.F32	S2, S0, S1
MOV	R0, R2
VLDR	#1, S1, [R0, #0]
MOV	R0, R4
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VADD.F32	S0, S2, S0
MOVW	R2, #lo_addr(_temp4+0)
MOVT	R2, #hi_addr(_temp4+0)
VSTR	#1, S0, [R2, #0]
;DCVA_GUI_events_code.c,492 :: 		SL[p][y1] = temp3;
MOV	R0, R3
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R7, #0]
;DCVA_GUI_events_code.c,493 :: 		SL[q][y1] = temp4;}
MOV	R0, R5
LDR	R1, [R0, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SL+0)
MOVT	R0, #hi_addr(_SL+0)
ADDS	R1, R0, R1
MOV	R0, R8
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, R2
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,487 :: 		for(y1=0;y1<ClassNumber;y1++){ //matris çarpýmý D([p q],:) = R'*D([p q],:);
MOV	R0, R8
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R8, #0]
;DCVA_GUI_events_code.c,493 :: 		SL[q][y1] = temp4;}
IT	AL
BAL	L_DCVA_TRAINING272
L_DCVA_TRAINING273:
;DCVA_GUI_events_code.c,495 :: 		for(x1=0;x1<ClassNumber;x1++){ //matris çarpýmý D(:,[p q]) = D(:,[p q])*R;
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING275:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING276
;DCVA_GUI_events_code.c,496 :: 		temp1 = SL[x1][p];
MOVW	R8, #lo_addr(_x1+0)
MOVT	R8, #hi_addr(_x1+0)
LDR	R1, [R8, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SL+0)
MOVT	R0, #hi_addr(_SL+0)
ADDS	R2, R0, R1
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R7, R2, R0
VLDR	#1, S1, [R7, #0]
MOVW	R6, #lo_addr(_temp1+0)
MOVT	R6, #hi_addr(_temp1+0)
VSTR	#1, S1, [R6, #0]
;DCVA_GUI_events_code.c,497 :: 		temp2 = SL[x1][q];
MOVW	R5, #lo_addr(_q+0)
MOVT	R5, #hi_addr(_q+0)
LDR	R0, [R5, #0]
LSLS	R0, R0, #2
ADDS	R0, R2, R0
VLDR	#1, S0, [R0, #0]
MOVW	R4, #lo_addr(_temp2+0)
MOVT	R4, #hi_addr(_temp2+0)
VSTR	#1, S0, [R4, #0]
;DCVA_GUI_events_code.c,498 :: 		temp3 = temp1*c + temp2*(-s);
MOVW	R2, #lo_addr(_c+0)
MOVT	R2, #hi_addr(_c+0)
VLDR	#1, S0, [R2, #0]
VMUL.F32	S2, S1, S0
MOVW	R1, #lo_addr(_s+0)
MOVT	R1, #hi_addr(_s+0)
VLDR	#1, S0, [R1, #0]
VNEG.F32	S1, S0
MOV	R0, R4
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VADD.F32	S0, S2, S0
MOVW	R3, #lo_addr(_temp3+0)
MOVT	R3, #hi_addr(_temp3+0)
VSTR	#1, S0, [R3, #0]
;DCVA_GUI_events_code.c,499 :: 		temp4 = temp1*s + temp2*c;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOV	R0, R6
VLDR	#1, S0, [R0, #0]
VMUL.F32	S2, S0, S1
MOV	R0, R2
VLDR	#1, S1, [R0, #0]
MOV	R0, R4
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VADD.F32	S0, S2, S0
MOVW	R2, #lo_addr(_temp4+0)
MOVT	R2, #hi_addr(_temp4+0)
VSTR	#1, S0, [R2, #0]
;DCVA_GUI_events_code.c,500 :: 		SL[x1][p] = temp3;
MOV	R0, R3
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R7, #0]
;DCVA_GUI_events_code.c,501 :: 		SL[x1][q] = temp4;}
MOV	R0, R8
LDR	R1, [R0, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SL+0)
MOVT	R0, #hi_addr(_SL+0)
ADDS	R1, R0, R1
MOV	R0, R5
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, R2
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,495 :: 		for(x1=0;x1<ClassNumber;x1++){ //matris çarpýmý D(:,[p q]) = D(:,[p q])*R;
MOV	R0, R8
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R8, #0]
;DCVA_GUI_events_code.c,501 :: 		SL[x1][q] = temp4;}
IT	AL
BAL	L_DCVA_TRAINING275
L_DCVA_TRAINING276:
;DCVA_GUI_events_code.c,503 :: 		for(x1=0;x1<ClassNumber;x1++){  //matris çarpýmý V(:,[p q]) = V(:,[p q])*R;
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING278:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING279
;DCVA_GUI_events_code.c,504 :: 		temp1 = SV[x1][p];
MOVW	R8, #lo_addr(_x1+0)
MOVT	R8, #hi_addr(_x1+0)
LDR	R1, [R8, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SV+0)
MOVT	R0, #hi_addr(_SV+0)
ADDS	R2, R0, R1
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R7, R2, R0
VLDR	#1, S1, [R7, #0]
MOVW	R6, #lo_addr(_temp1+0)
MOVT	R6, #hi_addr(_temp1+0)
VSTR	#1, S1, [R6, #0]
;DCVA_GUI_events_code.c,505 :: 		temp2 = SV[x1][q];
MOVW	R5, #lo_addr(_q+0)
MOVT	R5, #hi_addr(_q+0)
LDR	R0, [R5, #0]
LSLS	R0, R0, #2
ADDS	R0, R2, R0
VLDR	#1, S0, [R0, #0]
MOVW	R4, #lo_addr(_temp2+0)
MOVT	R4, #hi_addr(_temp2+0)
VSTR	#1, S0, [R4, #0]
;DCVA_GUI_events_code.c,506 :: 		temp3 = temp1*c + temp2*(-s);
MOVW	R2, #lo_addr(_c+0)
MOVT	R2, #hi_addr(_c+0)
VLDR	#1, S0, [R2, #0]
VMUL.F32	S2, S1, S0
MOVW	R1, #lo_addr(_s+0)
MOVT	R1, #hi_addr(_s+0)
VLDR	#1, S0, [R1, #0]
VNEG.F32	S1, S0
MOV	R0, R4
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VADD.F32	S0, S2, S0
MOVW	R3, #lo_addr(_temp3+0)
MOVT	R3, #hi_addr(_temp3+0)
VSTR	#1, S0, [R3, #0]
;DCVA_GUI_events_code.c,507 :: 		temp4 = temp1*s + temp2*c;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOV	R0, R6
VLDR	#1, S0, [R0, #0]
VMUL.F32	S2, S0, S1
MOV	R0, R2
VLDR	#1, S1, [R0, #0]
MOV	R0, R4
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VADD.F32	S0, S2, S0
MOVW	R2, #lo_addr(_temp4+0)
MOVT	R2, #hi_addr(_temp4+0)
VSTR	#1, S0, [R2, #0]
;DCVA_GUI_events_code.c,508 :: 		SV[x1][p] = temp3;
MOV	R0, R3
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R7, #0]
;DCVA_GUI_events_code.c,509 :: 		SV[x1][q] = temp4;}
MOV	R0, R8
LDR	R1, [R0, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SV+0)
MOVT	R0, #hi_addr(_SV+0)
ADDS	R1, R0, R1
MOV	R0, R5
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, R2
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,503 :: 		for(x1=0;x1<ClassNumber;x1++){  //matris çarpýmý V(:,[p q]) = V(:,[p q])*R;
MOV	R0, R8
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R8, #0]
;DCVA_GUI_events_code.c,509 :: 		SV[x1][q] = temp4;}
IT	AL
BAL	L_DCVA_TRAINING278
L_DCVA_TRAINING279:
;DCVA_GUI_events_code.c,511 :: 		temp1 = 0;      //en büyük deðer bulma
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,512 :: 		for(y1=0;y1<ClassNumber;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING281:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING282
;DCVA_GUI_events_code.c,513 :: 		for(x1=0;x1<ClassNumber;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING284:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING285
;DCVA_GUI_events_code.c,514 :: 		if ((fabs(SL[x1][y1]) > temp1) && (x1 != y1)) {
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SL+0)
MOVT	R0, #hi_addr(_SL+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
BL	_fabs+0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S1, [R0, #0]
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	LE
BLE	L__DCVA_TRAINING443
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__DCVA_TRAINING442
L__DCVA_TRAINING426:
;DCVA_GUI_events_code.c,515 :: 		temp1 = fabs(SL[x1][y1]);
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R0, [SP, #8]
LDR	R1, [R0, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SL+0)
MOVT	R0, #hi_addr(_SL+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R0, [SP, #4]
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
BL	_fabs+0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,516 :: 		p=x1;
LDR	R0, [SP, #8]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
STR	R1, [R0, #0]
;DCVA_GUI_events_code.c,517 :: 		q=y1;}}}
LDR	R0, [SP, #4]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_q+0)
MOVT	R0, #hi_addr(_q+0)
STR	R1, [R0, #0]
;DCVA_GUI_events_code.c,514 :: 		if ((fabs(SL[x1][y1]) > temp1) && (x1 != y1)) {
L__DCVA_TRAINING443:
L__DCVA_TRAINING442:
;DCVA_GUI_events_code.c,513 :: 		for(x1=0;x1<ClassNumber;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,517 :: 		q=y1;}}}
IT	AL
BAL	L_DCVA_TRAINING284
L_DCVA_TRAINING285:
;DCVA_GUI_events_code.c,512 :: 		for(y1=0;y1<ClassNumber;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,517 :: 		q=y1;}}}
IT	AL
BAL	L_DCVA_TRAINING281
L_DCVA_TRAINING282:
;DCVA_GUI_events_code.c,519 :: 		diag_toplam=0;            // döngüden çýkma eþik deðeri
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_diag_toplam+0)
MOVT	R0, #hi_addr(_diag_toplam+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,520 :: 		for(x1=0;x1<ClassNumber;x1++)  diag_toplam = diag_toplam + SL[x1][x1]*SL[x1][x1];
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING290:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING291
MOVW	R2, #lo_addr(_x1+0)
MOVT	R2, #hi_addr(_x1+0)
LDR	R1, [R2, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SL+0)
MOVT	R0, #hi_addr(_SL+0)
ADDS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
VMUL.F32	S1, S0, S0
MOVW	R0, #lo_addr(_diag_toplam+0)
MOVT	R0, #hi_addr(_diag_toplam+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
IT	AL
BAL	L_DCVA_TRAINING290
L_DCVA_TRAINING291:
;DCVA_GUI_events_code.c,521 :: 		if (fabs(SL[p][q]) < jac_coe*sqrt(diag_toplam/ClassNumber)) basla = 0;
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
LDR	R1, [R0, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SL+0)
MOVT	R0, #hi_addr(_SL+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_q+0)
MOVT	R0, #hi_addr(_q+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
BL	_fabs+0
VSTR	#1, S0, [SP, #4]
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
VLDR	#1, S0, [R0, #0]
VCVT.F32	#0, S1, S0
MOVW	R0, #lo_addr(_diag_toplam+0)
MOVT	R0, #hi_addr(_diag_toplam+0)
VLDR	#1, S0, [R0, #0]
VDIV.F32	S0, S0, S1
BL	_sqrt+0
MOVW	R0, #lo_addr(_jac_coe+0)
MOVT	R0, #hi_addr(_jac_coe+0)
VLDR	#1, S1, [R0, #0]
VMUL.F32	S1, S1, S0
VLDR	#1, S0, [SP, #4]
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	GE
BGE	L_DCVA_TRAINING293
MOVS	R1, #0
MOVW	R0, #lo_addr(_basla+0)
MOVT	R0, #hi_addr(_basla+0)
STRH	R1, [R0, #0]
L_DCVA_TRAINING293:
;DCVA_GUI_events_code.c,523 :: 		for(y1=60;y1<80;y1++){
MOVS	R1, #60
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING294:
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, #80
IT	CS
BCS	L_DCVA_TRAINING295
;DCVA_GUI_events_code.c,524 :: 		for(x1=120;x1<160;x1++)
MOVS	R1, #120
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING297:
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, #160
IT	CS
BCS	L_DCVA_TRAINING298
;DCVA_GUI_events_code.c,525 :: 		TFT_Dot(x1, y1, CL_BLUE);}
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
MOVW	R2, #31
BL	_TFT_Dot+0
;DCVA_GUI_events_code.c,524 :: 		for(x1=120;x1<160;x1++)
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,525 :: 		TFT_Dot(x1, y1, CL_BLUE);}
IT	AL
BAL	L_DCVA_TRAINING297
L_DCVA_TRAINING298:
;DCVA_GUI_events_code.c,523 :: 		for(y1=60;y1<80;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,525 :: 		TFT_Dot(x1, y1, CL_BLUE);}
IT	AL
BAL	L_DCVA_TRAINING294
L_DCVA_TRAINING295:
;DCVA_GUI_events_code.c,526 :: 		iteration3 = iteration3 + 1;
MOVW	R1, #lo_addr(_iteration3+0)
MOVT	R1, #hi_addr(_iteration3+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;DCVA_GUI_events_code.c,527 :: 		}
IT	AL
BAL	L_DCVA_TRAINING270
L_DCVA_TRAINING271:
;DCVA_GUI_events_code.c,529 :: 		TFT_Write_Text("JACOBI ITERATION-3 OK", 30, 190);
MOVW	R0, #lo_addr(?lstr23_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr23_DCVA_GUI_events_code+0)
MOVS	R2, #190
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,530 :: 		TFT_Write_Text("V_SL ?", 30, 210);
MOVW	R0, #lo_addr(?lstr24_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr24_DCVA_GUI_events_code+0)
MOVS	R2, #210
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,534 :: 		temp1 = -1e+20;
MOVW	R0, #30956
MOVT	R0, #57517
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,535 :: 		for(y1=0;y1<ClassNumber;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING300:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING301
;DCVA_GUI_events_code.c,536 :: 		for(x1=y1;x1<ClassNumber;x1++){
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING303:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING304
;DCVA_GUI_events_code.c,537 :: 		if (SL[x1][x1] > temp1) {
MOVW	R2, #lo_addr(_x1+0)
MOVT	R2, #hi_addr(_x1+0)
LDR	R1, [R2, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SL+0)
MOVT	R0, #hi_addr(_SL+0)
ADDS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LE
BLE	L_DCVA_TRAINING306
;DCVA_GUI_events_code.c,538 :: 		temp1 =  SL[x1][x1];
MOVW	R2, #lo_addr(_x1+0)
MOVT	R2, #hi_addr(_x1+0)
LDR	R1, [R2, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SL+0)
MOVT	R0, #hi_addr(_SL+0)
ADDS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,539 :: 		ii = x1;}}
MOV	R0, R2
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING306:
;DCVA_GUI_events_code.c,536 :: 		for(x1=y1;x1<ClassNumber;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,539 :: 		ii = x1;}}
IT	AL
BAL	L_DCVA_TRAINING303
L_DCVA_TRAINING304:
;DCVA_GUI_events_code.c,540 :: 		SL[ii][ii] =  SL[y1][y1];
MOVW	R2, #lo_addr(_ii+0)
MOVT	R2, #hi_addr(_ii+0)
LDR	R1, [R2, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SL+0)
MOVT	R0, #hi_addr(_SL+0)
ADDS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R3, R1, R0
MOVW	R2, #lo_addr(_y1+0)
MOVT	R2, #hi_addr(_y1+0)
LDR	R1, [R2, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SL+0)
MOVT	R0, #hi_addr(_SL+0)
ADDS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R3, #0]
;DCVA_GUI_events_code.c,541 :: 		SL[y1][y1] = temp1;
MOV	R0, R2
LDR	R1, [R0, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SL+0)
MOVT	R0, #hi_addr(_SL+0)
ADDS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R2, R1, R0
MOVW	R1, #lo_addr(_temp1+0)
MOVT	R1, #hi_addr(_temp1+0)
VLDR	#1, S0, [R1, #0]
VSTR	#1, S0, [R2, #0]
;DCVA_GUI_events_code.c,542 :: 		temp1 = -1e+20;
MOVW	R0, #30956
MOVT	R0, #57517
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,543 :: 		for(x1=0;x1<ClassNumber;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING307:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING308
;DCVA_GUI_events_code.c,544 :: 		temp2 = SV[x1][ii];
MOVW	R5, #lo_addr(_x1+0)
MOVT	R5, #hi_addr(_x1+0)
LDR	R1, [R5, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SV+0)
MOVT	R0, #hi_addr(_SV+0)
ADDS	R4, R0, R1
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R4, R0
VLDR	#1, S0, [R1, #0]
MOVW	R3, #lo_addr(_temp2+0)
MOVT	R3, #hi_addr(_temp2+0)
VSTR	#1, S0, [R3, #0]
;DCVA_GUI_events_code.c,545 :: 		SV[x1][ii] = SV[x1][y1];
MOVW	R2, #lo_addr(_y1+0)
MOVT	R2, #hi_addr(_y1+0)
LDR	R0, [R2, #0]
LSLS	R0, R0, #2
ADDS	R0, R4, R0
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,546 :: 		SV[x1][y1] = temp2;}}   // SV[20][20]  but SV[20][19]  only 1 eigenvector is rubbish
MOV	R0, R5
LDR	R1, [R0, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SV+0)
MOVT	R0, #hi_addr(_SV+0)
ADDS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, R3
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,543 :: 		for(x1=0;x1<ClassNumber;x1++){
MOV	R0, R5
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R5, #0]
;DCVA_GUI_events_code.c,546 :: 		SV[x1][y1] = temp2;}}   // SV[20][20]  but SV[20][19]  only 1 eigenvector is rubbish
IT	AL
BAL	L_DCVA_TRAINING307
L_DCVA_TRAINING308:
;DCVA_GUI_events_code.c,535 :: 		for(y1=0;y1<ClassNumber;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,546 :: 		SV[x1][y1] = temp2;}}   // SV[20][20]  but SV[20][19]  only 1 eigenvector is rubbish
IT	AL
BAL	L_DCVA_TRAINING300
L_DCVA_TRAINING301:
;DCVA_GUI_events_code.c,548 :: 		TFT_Write_Text("V_SL OK", 30, 230);
MOVW	R0, #lo_addr(?lstr25_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr25_DCVA_GUI_events_code+0)
MOVS	R2, #230
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,550 :: 		for(x1=0;x1<N;x1++){                    // V_Scom[99][19] = Acom[99][20] * SV[20][19]
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING310:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING311
;DCVA_GUI_events_code.c,551 :: 		for(y1=0;y1<(ClassNumber-1);y1++){  // R[99][19]      = V[99][20]    * SV[20][19]
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING313:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING314
;DCVA_GUI_events_code.c,552 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,553 :: 		for(z1=0;z1<ClassNumber;z1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING316:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING317
;DCVA_GUI_events_code.c,554 :: 		temp1 = temp1 + V[x1][z1]* SV[z1][y1];
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOVW	R3, #lo_addr(_z1+0)
MOVT	R3, #hi_addr(_z1+0)
LDR	R0, [R3, #0]
LSLS	R0, R0, #2
ADDS	R2, R1, R0
MOV	R0, R3
LDR	R1, [R0, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SV+0)
MOVT	R0, #hi_addr(_SV+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R2, #0]
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,553 :: 		for(z1=0;z1<ClassNumber;z1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;DCVA_GUI_events_code.c,554 :: 		temp1 = temp1 + V[x1][z1]* SV[z1][y1];
IT	AL
BAL	L_DCVA_TRAINING316
L_DCVA_TRAINING317:
;DCVA_GUI_events_code.c,555 :: 		R[x1][y1] = temp1; }}
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R1, R0, R1
MOVW	R2, #lo_addr(_y1+0)
MOVT	R2, #hi_addr(_y1+0)
LDR	R0, [R2, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,551 :: 		for(y1=0;y1<(ClassNumber-1);y1++){  // R[99][19]      = V[99][20]    * SV[20][19]
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;DCVA_GUI_events_code.c,555 :: 		R[x1][y1] = temp1; }}
IT	AL
BAL	L_DCVA_TRAINING313
L_DCVA_TRAINING314:
;DCVA_GUI_events_code.c,550 :: 		for(x1=0;x1<N;x1++){                    // V_Scom[99][19] = Acom[99][20] * SV[20][19]
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,555 :: 		R[x1][y1] = temp1; }}
IT	AL
BAL	L_DCVA_TRAINING310
L_DCVA_TRAINING311:
;DCVA_GUI_events_code.c,557 :: 		for(y1=0;y1<(ClassNumber-1);y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING319:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING320
;DCVA_GUI_events_code.c,558 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,559 :: 		for(x1=0;x1<N;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING322:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING323
;DCVA_GUI_events_code.c,560 :: 		temp1 = temp1 + R[x1][y1]*R[x1][y1];
MOVW	R2, #lo_addr(_x1+0)
MOVT	R2, #hi_addr(_x1+0)
LDR	R1, [R2, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
VMUL.F32	S1, S0, S0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,559 :: 		for(x1=0;x1<N;x1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;DCVA_GUI_events_code.c,560 :: 		temp1 = temp1 + R[x1][y1]*R[x1][y1];
IT	AL
BAL	L_DCVA_TRAINING322
L_DCVA_TRAINING323:
;DCVA_GUI_events_code.c,561 :: 		temp2 = sqrt(temp1);
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #lo_addr(_temp2+0)
MOVT	R0, #hi_addr(_temp2+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,562 :: 		for(x1=0;x1<N;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING325:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING326
;DCVA_GUI_events_code.c,563 :: 		V[x1][y1] = R[x1][y1]/temp2;}    // V_Scom[99][19] = normc( R[99][19] );
MOVW	R4, #lo_addr(_x1+0)
MOVT	R4, #hi_addr(_x1+0)
LDR	R1, [R4, #0]
MOVW	R0, #400
MUL	R3, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R2, R0, R3
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
ADDS	R2, R2, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R0, R0, R3
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_temp2+0)
MOVT	R0, #hi_addr(_temp2+0)
VLDR	#1, S0, [R0, #0]
VDIV.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;DCVA_GUI_events_code.c,562 :: 		for(x1=0;x1<N;x1++)
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;DCVA_GUI_events_code.c,563 :: 		V[x1][y1] = R[x1][y1]/temp2;}    // V_Scom[99][19] = normc( R[99][19] );
IT	AL
BAL	L_DCVA_TRAINING325
L_DCVA_TRAINING326:
;DCVA_GUI_events_code.c,557 :: 		for(y1=0;y1<(ClassNumber-1);y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,563 :: 		V[x1][y1] = R[x1][y1]/temp2;}    // V_Scom[99][19] = normc( R[99][19] );
IT	AL
BAL	L_DCVA_TRAINING319
L_DCVA_TRAINING320:
;DCVA_GUI_events_code.c,565 :: 		TFT_Write_Text("V_Scom OK", 30, 250);
MOVW	R0, #lo_addr(?lstr26_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr26_DCVA_GUI_events_code+0)
MOVS	R2, #250
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,566 :: 		TFT_Write_Text("ProjectedImages_DCVA ?", 30, 270);
MOVW	R0, #lo_addr(?lstr27_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr27_DCVA_GUI_events_code+0)
MOVW	R2, #270
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,568 :: 		for(x1=0;x1<(ClassNumber-1);x1++){       // ProjectedImages_DCVA[19][20] = V_Scom'[19][99] * ProjectedImages[99][20 every class]
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING328:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING329
;DCVA_GUI_events_code.c,569 :: 		for(y1=0;y1<ClassNumber;y1++){       // SL[19][20]                   = V'[19][99]    * SV[20][19]
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING331:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING332
;DCVA_GUI_events_code.c,570 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,571 :: 		for(z1=0;z1<N;z1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_DCVA_TRAINING334:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TRAINING335
;DCVA_GUI_events_code.c,572 :: 		temp1 = temp1 + V[z1][x1]* L[z1][y1*ClassPopulation];
MOVW	R4, #lo_addr(_z1+0)
MOVT	R4, #hi_addr(_z1+0)
LDR	R1, [R4, #0]
MOVW	R0, #400
MUL	R2, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R2
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R3, R1, R0
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R2, R0, R2
MOVW	R0, #lo_addr(_ClassPopulation+0)
MOVT	R0, #hi_addr(_ClassPopulation+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
MULS	R0, R1, R0
LSLS	R0, R0, #2
ADDS	R0, R2, R0
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R3, #0]
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,571 :: 		for(z1=0;z1<N;z1++)
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;DCVA_GUI_events_code.c,572 :: 		temp1 = temp1 + V[z1][x1]* L[z1][y1*ClassPopulation];
IT	AL
BAL	L_DCVA_TRAINING334
L_DCVA_TRAINING335:
;DCVA_GUI_events_code.c,573 :: 		SL[x1][y1] = temp1; }}          // ProjectedImages_DCVA[19][20]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SL+0)
MOVT	R0, #hi_addr(_SL+0)
ADDS	R1, R0, R1
MOVW	R2, #lo_addr(_y1+0)
MOVT	R2, #hi_addr(_y1+0)
LDR	R0, [R2, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,569 :: 		for(y1=0;y1<ClassNumber;y1++){       // SL[19][20]                   = V'[19][99]    * SV[20][19]
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;DCVA_GUI_events_code.c,573 :: 		SL[x1][y1] = temp1; }}          // ProjectedImages_DCVA[19][20]
IT	AL
BAL	L_DCVA_TRAINING331
L_DCVA_TRAINING332:
;DCVA_GUI_events_code.c,568 :: 		for(x1=0;x1<(ClassNumber-1);x1++){       // ProjectedImages_DCVA[19][20] = V_Scom'[19][99] * ProjectedImages[99][20 every class]
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,573 :: 		SL[x1][y1] = temp1; }}          // ProjectedImages_DCVA[19][20]
IT	AL
BAL	L_DCVA_TRAINING328
L_DCVA_TRAINING329:
;DCVA_GUI_events_code.c,575 :: 		TFT_Write_Text("ProjectedImages_DCVA OK", 30, 290);
MOVW	R0, #lo_addr(?lstr28_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr28_DCVA_GUI_events_code+0)
MOVW	R2, #290
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,576 :: 		DrawScreen(&Screen3);
MOVW	R0, #lo_addr(_Screen3+0)
MOVT	R0, #hi_addr(_Screen3+0)
BL	_DrawScreen+0
;DCVA_GUI_events_code.c,577 :: 		}
L_end_DCVA_TRAINING:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _DCVA_TRAINING
_DCVA_TEST:
;DCVA_GUI_events_code.c,579 :: 		void DCVA_TEST() {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;DCVA_GUI_events_code.c,580 :: 		DrawScreen(&Screen4);
MOVW	R0, #lo_addr(_Screen4+0)
MOVT	R0, #hi_addr(_Screen4+0)
BL	_DrawScreen+0
;DCVA_GUI_events_code.c,581 :: 		test_count = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_test_count+0)
MOVT	R0, #hi_addr(_test_count+0)
STRH	R1, [R0, #0]
;DCVA_GUI_events_code.c,582 :: 		accuracy = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_accuracy+0)
MOVT	R0, #hi_addr(_accuracy+0)
STRH	R1, [R0, #0]
;DCVA_GUI_events_code.c,583 :: 		NormFault=0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_NormFault+0)
MOVT	R0, #hi_addr(_NormFault+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,585 :: 		for(ii=0;ii<row*col;ii++){ // m_ort = row*col x 1        //M_ORT TEKRAR HESAPLANIYOR
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_DCVA_TEST337:
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R0, [R0, #0]
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TEST338
;DCVA_GUI_events_code.c,586 :: 		dd = div(ii,100);
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
MOVS	R1, #100
SXTH	R1, R1
ADD	R12, SP, #4
BL	_div+0
MOVS	R3, #4
MOVW	R2, #lo_addr(_dd+0)
MOVT	R2, #hi_addr(_dd+0)
ADD	R1, SP, #4
L_DCVA_TEST340:
LDRB	R0, [R1, #0]
STRB	R0, [R2, #0]
SUBS	R3, R3, #1
UXTB	R3, R3
ADDS	R1, R1, #1
ADDS	R2, R2, #1
CMP	R3, #0
IT	NE
BNE	L_DCVA_TEST340
;DCVA_GUI_events_code.c,587 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,588 :: 		for(z1=0;(z1<TrainPicture);z1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_DCVA_TEST341:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TEST342
;DCVA_GUI_events_code.c,589 :: 		temp1 =  temp1 + Ear[row*col*z1+ii];
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R0, [R0, #0]
MULS	R1, R0, R1
MOVW	R2, #lo_addr(_z1+0)
MOVT	R2, #hi_addr(_z1+0)
LDR	R0, [R2, #0]
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_Ear+0)
MOVT	R0, #hi_addr(_Ear+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
VMOV	S1, R0
VCVT.F32	#0, S1, S1
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,588 :: 		for(z1=0;(z1<TrainPicture);z1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;DCVA_GUI_events_code.c,589 :: 		temp1 =  temp1 + Ear[row*col*z1+ii];
IT	AL
BAL	L_DCVA_TEST341
L_DCVA_TEST342:
;DCVA_GUI_events_code.c,590 :: 		R[dd.quot][dd.rem] = temp1/TrainPicture;}
MOVW	R0, #lo_addr(_dd+0)
MOVT	R0, #hi_addr(_dd+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_dd+2)
MOVT	R0, #hi_addr(_dd+2)
LDRSH	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R2, R1, R0
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
VLDR	#1, S0, [R0, #0]
VCVT.F32	#0, S1, S0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VDIV.F32	S0, S0, S1
VSTR	#1, S0, [R2, #0]
;DCVA_GUI_events_code.c,585 :: 		for(ii=0;ii<row*col;ii++){ // m_ort = row*col x 1        //M_ORT TEKRAR HESAPLANIYOR
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,590 :: 		R[dd.quot][dd.rem] = temp1/TrainPicture;}
IT	AL
BAL	L_DCVA_TEST337
L_DCVA_TEST338:
;DCVA_GUI_events_code.c,592 :: 		for(jj=100;jj<TestPicture+100;jj++) {      //TestPicture  = jj
MOVS	R1, #100
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
STR	R1, [R0, #0]
L_DCVA_TEST344:
MOVW	R0, #lo_addr(_TestPicture+0)
MOVT	R0, #hi_addr(_TestPicture+0)
LDR	R0, [R0, #0]
ADDW	R1, R0, #100
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TEST345
;DCVA_GUI_events_code.c,594 :: 		Delay_ms(2000);
MOVW	R7, #10067
MOVT	R7, #1424
NOP
NOP
L_DCVA_TEST347:
SUBS	R7, R7, #1
BNE	L_DCVA_TEST347
NOP
NOP
NOP
NOP
;DCVA_GUI_events_code.c,595 :: 		TFT_Fill_Screen(CL_BLUE);
MOVW	R0, #31
BL	_TFT_Fill_Screen+0
;DCVA_GUI_events_code.c,596 :: 		test_count = test_count + 1;
MOVW	R1, #lo_addr(_test_count+0)
MOVT	R1, #hi_addr(_test_count+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;DCVA_GUI_events_code.c,597 :: 		IntToStr(test_count,txt1);
SXTH	R0, R0
MOVW	R1, #lo_addr(_txt1+0)
MOVT	R1, #hi_addr(_txt1+0)
BL	_IntToStr+0
;DCVA_GUI_events_code.c,598 :: 		TFT_Write_Text(txt1,30,40);
MOVS	R2, #40
MOVS	R1, #30
MOVW	R0, #lo_addr(_txt1+0)
MOVT	R0, #hi_addr(_txt1+0)
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,599 :: 		TFT_Write_Text("TEST IMAGE", 60, 40);
MOVW	R0, #lo_addr(?lstr29_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr29_DCVA_GUI_events_code+0)
MOVS	R2, #40
MOVS	R1, #60
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,601 :: 		ii = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
;DCVA_GUI_events_code.c,602 :: 		for(y1=0;y1<col;y1++){  // "TestPicture" siyah beyaz yazdýrma
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TEST349:
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TEST350
;DCVA_GUI_events_code.c,603 :: 		for(x1=0;x1<row;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TEST352:
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TEST353
;DCVA_GUI_events_code.c,604 :: 		temp5 = TFT_RGBToColor16bit(Ear[jj*row*col+ii], Ear[jj*row*col+ii], Ear[jj*row*col+ii]);
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
MOVW	R0, #lo_addr(_temp5+0)
MOVT	R0, #hi_addr(_temp5+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,605 :: 		TFT_Dot(x1+50, y1+60, temp5);
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
UXTH	R0, R0
UXTH	R2, R0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
ADDW	R1, R0, #60
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R0, [SP, #4]
LDR	R0, [R0, #0]
ADDS	R0, #50
SXTH	R1, R1
SXTH	R0, R0
BL	_TFT_Dot+0
;DCVA_GUI_events_code.c,606 :: 		ii = ii + 1;}}
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,603 :: 		for(x1=0;x1<row;x1++){
LDR	R1, [SP, #4]
MOV	R0, R1
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,606 :: 		ii = ii + 1;}}
IT	AL
BAL	L_DCVA_TEST352
L_DCVA_TEST353:
;DCVA_GUI_events_code.c,602 :: 		for(y1=0;y1<col;y1++){  // "TestPicture" siyah beyaz yazdýrma
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,606 :: 		ii = ii + 1;}}
IT	AL
BAL	L_DCVA_TEST349
L_DCVA_TEST350:
;DCVA_GUI_events_code.c,608 :: 		for(x1=0;x1<TrainPicture;x1++){    //  MTemp (100x1) = (A)'*(TestPicture - m_ort)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TEST355:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TEST356
;DCVA_GUI_events_code.c,609 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,610 :: 		for(ii=0;ii<row*col;ii++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_DCVA_TEST358:
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R0, [R0, #0]
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TEST359
;DCVA_GUI_events_code.c,611 :: 		dd = div(ii,100);
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
MOVS	R1, #100
SXTH	R1, R1
ADD	R12, SP, #4
BL	_div+0
MOVS	R3, #4
MOVW	R2, #lo_addr(_dd+0)
MOVT	R2, #hi_addr(_dd+0)
ADD	R1, SP, #4
L_DCVA_TEST361:
LDRB	R0, [R1, #0]
STRB	R0, [R2, #0]
SUBS	R3, R3, #1
UXTB	R3, R3
ADDS	R1, R1, #1
ADDS	R2, R2, #1
CMP	R3, #0
IT	NE
BNE	L_DCVA_TEST361
;DCVA_GUI_events_code.c,612 :: 		temp1 = temp1 + (Ear[row*col*x1 + ii] - R[dd.quot][dd.rem])*(Ear[row*col*jj + ii] - R[dd.quot][dd.rem]);}
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R0, [R0, #0]
MUL	R4, R0, R1
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
MUL	R1, R4, R0
MOVW	R3, #lo_addr(_ii+0)
MOVT	R3, #hi_addr(_ii+0)
LDR	R0, [R3, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_Ear+0)
MOVT	R0, #hi_addr(_Ear+0)
ADDS	R0, R0, R1
LDRB	R2, [R0, #0]
MOVW	R0, #lo_addr(_dd+0)
MOVT	R0, #hi_addr(_dd+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_R+0)
MOVT	R0, #hi_addr(_R+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_dd+2)
MOVT	R0, #hi_addr(_dd+2)
LDRSH	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
VMOV	S0, R2
VCVT.F32	#0, S0, S0
VLDR	#1, S2, [R1, #0]
VSUB.F32	S1, S0, S2
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
MUL	R1, R4, R0
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_Ear+0)
MOVT	R0, #hi_addr(_Ear+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
VMOV	S0, R0
VCVT.F32	#0, S0, S0
VSUB.F32	S0, S0, S2
VMUL.F32	S1, S1, S0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,610 :: 		for(ii=0;ii<row*col;ii++){
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;DCVA_GUI_events_code.c,612 :: 		temp1 = temp1 + (Ear[row*col*x1 + ii] - R[dd.quot][dd.rem])*(Ear[row*col*jj + ii] - R[dd.quot][dd.rem]);}
IT	AL
BAL	L_DCVA_TEST358
L_DCVA_TEST359:
;DCVA_GUI_events_code.c,613 :: 		MTemp[x1] = temp1;}   //100x1
MOVW	R2, #lo_addr(_x1+0)
MOVT	R2, #hi_addr(_x1+0)
LDR	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_MTemp+0)
MOVT	R0, #hi_addr(_MTemp+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,608 :: 		for(x1=0;x1<TrainPicture;x1++){    //  MTemp (100x1) = (A)'*(TestPicture - m_ort)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;DCVA_GUI_events_code.c,613 :: 		MTemp[x1] = temp1;}   //100x1
IT	AL
BAL	L_DCVA_TEST355
L_DCVA_TEST356:
;DCVA_GUI_events_code.c,615 :: 		for(y1=0;y1<N;y1++){      // GTemp (99x1) = (V)' * MTemp
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TEST362:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TEST363
;DCVA_GUI_events_code.c,616 :: 		temp2 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp2+0)
MOVT	R0, #hi_addr(_temp2+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,617 :: 		for(x1=0;x1<TrainPicture;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TEST365:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TEST366
;DCVA_GUI_events_code.c,618 :: 		temp2 = temp2 + D[x1][y1]*MTemp[x1];     //D=V  => L' * A' *  (TestPicture - m_ort)
MOVW	R3, #lo_addr(_x1+0)
MOVT	R3, #hi_addr(_x1+0)
LDR	R1, [R3, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_D+0)
MOVT	R0, #hi_addr(_D+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R2, R1, R0
MOV	R0, R3
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_MTemp+0)
MOVT	R0, #hi_addr(_MTemp+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R2, #0]
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_temp2+0)
MOVT	R0, #hi_addr(_temp2+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,617 :: 		for(x1=0;x1<TrainPicture;x1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;DCVA_GUI_events_code.c,618 :: 		temp2 = temp2 + D[x1][y1]*MTemp[x1];     //D=V  => L' * A' *  (TestPicture - m_ort)
IT	AL
BAL	L_DCVA_TEST365
L_DCVA_TEST366:
;DCVA_GUI_events_code.c,619 :: 		GTemp[y1] = temp2;}
MOVW	R2, #lo_addr(_y1+0)
MOVT	R2, #hi_addr(_y1+0)
LDR	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_temp2+0)
MOVT	R0, #hi_addr(_temp2+0)
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,615 :: 		for(y1=0;y1<N;y1++){      // GTemp (99x1) = (V)' * MTemp
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;DCVA_GUI_events_code.c,619 :: 		GTemp[y1] = temp2;}
IT	AL
BAL	L_DCVA_TEST362
L_DCVA_TEST363:
;DCVA_GUI_events_code.c,621 :: 		for(y1=0;y1<(ClassNumber-1);y1++){      // ProjectedTestImage (19x1) = (V_Scom)' * GTemp
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TEST368:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TEST369
;DCVA_GUI_events_code.c,622 :: 		temp3 = 0;                         // ProjectedTestImage (19x1) = V'[19][99] *  GTemp[99]
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,623 :: 		for(x1=0;x1<N;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TEST371:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TEST372
;DCVA_GUI_events_code.c,624 :: 		temp3 = temp3 + V[x1][y1]*GTemp[x1];
MOVW	R3, #lo_addr(_x1+0)
MOVT	R3, #hi_addr(_x1+0)
LDR	R1, [R3, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R2, R1, R0
MOV	R0, R3
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R2, #0]
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,623 :: 		for(x1=0;x1<N;x1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;DCVA_GUI_events_code.c,624 :: 		temp3 = temp3 + V[x1][y1]*GTemp[x1];
IT	AL
BAL	L_DCVA_TEST371
L_DCVA_TEST372:
;DCVA_GUI_events_code.c,625 :: 		ProjectedTestImage[y1] = temp3;}
MOVW	R2, #lo_addr(_y1+0)
MOVT	R2, #hi_addr(_y1+0)
LDR	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_ProjectedTestImage+0)
MOVT	R0, #hi_addr(_ProjectedTestImage+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;DCVA_GUI_events_code.c,621 :: 		for(y1=0;y1<(ClassNumber-1);y1++){      // ProjectedTestImage (19x1) = (V_Scom)' * GTemp
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;DCVA_GUI_events_code.c,625 :: 		ProjectedTestImage[y1] = temp3;}
IT	AL
BAL	L_DCVA_TEST368
L_DCVA_TEST369:
;DCVA_GUI_events_code.c,627 :: 		EpsilonK = 1e+15;              //ClassNorm bulunmasý
MOVW	R0, #24489
MOVT	R0, #22627
VMOV	S0, R0
MOVW	R0, #lo_addr(_EpsilonK+0)
MOVT	R0, #hi_addr(_EpsilonK+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,628 :: 		for(y1=0;y1<ClassNumber;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TEST374:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TEST375
;DCVA_GUI_events_code.c,629 :: 		temp4 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,630 :: 		for(x1=0;x1<(ClassNumber-1);x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TEST377:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TEST378
;DCVA_GUI_events_code.c,631 :: 		temp4 = temp4 + (SL[x1][y1] - ProjectedTestImage[x1])*(SL[x1][y1] - ProjectedTestImage[x1]);
MOVW	R2, #lo_addr(_x1+0)
MOVT	R2, #hi_addr(_x1+0)
LDR	R1, [R2, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SL+0)
MOVT	R0, #hi_addr(_SL+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S1, [R0, #0]
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_ProjectedTestImage+0)
MOVT	R0, #hi_addr(_ProjectedTestImage+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VSUB.F32	S0, S1, S0
VMUL.F32	S1, S0, S0
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,630 :: 		for(x1=0;x1<(ClassNumber-1);x1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;DCVA_GUI_events_code.c,631 :: 		temp4 = temp4 + (SL[x1][y1] - ProjectedTestImage[x1])*(SL[x1][y1] - ProjectedTestImage[x1]);
IT	AL
BAL	L_DCVA_TEST377
L_DCVA_TEST378:
;DCVA_GUI_events_code.c,632 :: 		temp4 = sqrt(temp4);
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,633 :: 		if (temp4 < EpsilonK) {
MOVW	R0, #lo_addr(_EpsilonK+0)
MOVT	R0, #hi_addr(_EpsilonK+0)
VLDR	#1, S1, [R0, #0]
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	GE
BGE	L_DCVA_TEST380
;DCVA_GUI_events_code.c,634 :: 		EpsilonK = temp4;
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_EpsilonK+0)
MOVT	R0, #hi_addr(_EpsilonK+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,635 :: 		WhoseEar = ClassPopulation*y1;}}
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ClassPopulation+0)
MOVT	R0, #hi_addr(_ClassPopulation+0)
LDR	R0, [R0, #0]
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_WhoseEar+0)
MOVT	R0, #hi_addr(_WhoseEar+0)
STR	R1, [R0, #0]
L_DCVA_TEST380:
;DCVA_GUI_events_code.c,628 :: 		for(y1=0;y1<ClassNumber;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,635 :: 		WhoseEar = ClassPopulation*y1;}}
IT	AL
BAL	L_DCVA_TEST374
L_DCVA_TEST375:
;DCVA_GUI_events_code.c,638 :: 		NormFault = NormFault + (EpsilonK - DCVA_ORJ[jj-100])*(EpsilonK - DCVA_ORJ[jj-100]);
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
SUBS	R0, #100
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_DCVA_ORJ+0)
MOVT	R0, #hi_addr(_DCVA_ORJ+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R1, #lo_addr(_EpsilonK+0)
MOVT	R1, #hi_addr(_EpsilonK+0)
VLDR	#1, S0, [R1, #0]
VSUB.F32	S0, S0, S1
VMUL.F32	S1, S0, S0
MOVW	R0, #lo_addr(_NormFault+0)
MOVT	R0, #hi_addr(_NormFault+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,641 :: 		if (EpsilonK < DCVA_TetaC) {
MOVW	R0, #lo_addr(_DCVA_TetaC+0)
MOVT	R0, #hi_addr(_DCVA_TetaC+0)
VLDR	#1, S1, [R0, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	GE
BGE	L_DCVA_TEST381
;DCVA_GUI_events_code.c,642 :: 		if (jj<120) accuracy += 2;
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
CMP	R0, #120
IT	CS
BCS	L_DCVA_TEST382
MOVW	R1, #lo_addr(_accuracy+0)
MOVT	R1, #hi_addr(_accuracy+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #2
STRH	R0, [R1, #0]
L_DCVA_TEST382:
;DCVA_GUI_events_code.c,643 :: 		TFT_Write_Text("This picture is ear", 30, 160);
MOVW	R0, #lo_addr(?lstr30_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr30_DCVA_GUI_events_code+0)
MOVS	R2, #160
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,644 :: 		TFT_Write_Text("The ear is in the database", 30, 180);
MOVW	R0, #lo_addr(?lstr31_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr31_DCVA_GUI_events_code+0)
MOVS	R2, #180
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,645 :: 		TFT_Write_Text("EpsilonK", 30, 200);
MOVW	R0, #lo_addr(?lstr32_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr32_DCVA_GUI_events_code+0)
MOVS	R2, #200
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,646 :: 		FloatToStr(EpsilonK ,txt2);
MOVW	R0, #lo_addr(_EpsilonK+0)
MOVT	R0, #hi_addr(_EpsilonK+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_txt2+0)
MOVT	R0, #hi_addr(_txt2+0)
BL	_FloatToStr+0
;DCVA_GUI_events_code.c,647 :: 		TFT_Write_Text(txt2,100,200);
MOVS	R2, #200
MOVS	R1, #100
MOVW	R0, #lo_addr(_txt2+0)
MOVT	R0, #hi_addr(_txt2+0)
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,648 :: 		ii = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
;DCVA_GUI_events_code.c,649 :: 		for(y1=0;y1<col;y1++){  // "WhoseEar" siyah beyaz yazdýrma
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DCVA_TEST383:
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TEST384
;DCVA_GUI_events_code.c,650 :: 		for(x1=0;x1<row;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DCVA_TEST386:
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DCVA_TEST387
;DCVA_GUI_events_code.c,651 :: 		temp5 = TFT_RGBToColor16bit(Ear[WhoseEar*row*col+ii], Ear[WhoseEar*row*col+ii], Ear[WhoseEar*row*col+ii]);
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_WhoseEar+0)
MOVT	R0, #hi_addr(_WhoseEar+0)
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
MOVW	R0, #lo_addr(_temp5+0)
MOVT	R0, #hi_addr(_temp5+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,652 :: 		TFT_Dot(x1+130, y1+60, temp5);
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
UXTH	R0, R0
UXTH	R2, R0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
ADDW	R1, R0, #60
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R0, [SP, #4]
LDR	R0, [R0, #0]
ADDS	R0, #130
SXTH	R1, R1
SXTH	R0, R0
BL	_TFT_Dot+0
;DCVA_GUI_events_code.c,653 :: 		ii = ii + 1;}}
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,650 :: 		for(x1=0;x1<row;x1++){
LDR	R1, [SP, #4]
MOV	R0, R1
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,653 :: 		ii = ii + 1;}}
IT	AL
BAL	L_DCVA_TEST386
L_DCVA_TEST387:
;DCVA_GUI_events_code.c,649 :: 		for(y1=0;y1<col;y1++){  // "WhoseEar" siyah beyaz yazdýrma
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,653 :: 		ii = ii + 1;}}
IT	AL
BAL	L_DCVA_TEST383
L_DCVA_TEST384:
;DCVA_GUI_events_code.c,654 :: 		}
IT	AL
BAL	L_DCVA_TEST389
L_DCVA_TEST381:
;DCVA_GUI_events_code.c,656 :: 		if (jj>=120) accuracy += 2;
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
CMP	R0, #120
IT	CC
BCC	L_DCVA_TEST390
MOVW	R1, #lo_addr(_accuracy+0)
MOVT	R1, #hi_addr(_accuracy+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #2
STRH	R0, [R1, #0]
L_DCVA_TEST390:
;DCVA_GUI_events_code.c,657 :: 		TFT_Write_Text("This is not in the database", 30, 180);
MOVW	R0, #lo_addr(?lstr33_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr33_DCVA_GUI_events_code+0)
MOVS	R2, #180
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,658 :: 		TFT_Write_Text("EpsilonK", 30, 200);
MOVW	R0, #lo_addr(?lstr34_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr34_DCVA_GUI_events_code+0)
MOVS	R2, #200
MOVS	R1, #30
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,659 :: 		FloatToStr(EpsilonK ,txt2);
MOVW	R0, #lo_addr(_EpsilonK+0)
MOVT	R0, #hi_addr(_EpsilonK+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_txt2+0)
MOVT	R0, #hi_addr(_txt2+0)
BL	_FloatToStr+0
;DCVA_GUI_events_code.c,660 :: 		TFT_Write_Text(txt2,100,200);
MOVS	R2, #200
MOVS	R1, #100
MOVW	R0, #lo_addr(_txt2+0)
MOVT	R0, #hi_addr(_txt2+0)
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,661 :: 		}
L_DCVA_TEST389:
;DCVA_GUI_events_code.c,592 :: 		for(jj=100;jj<TestPicture+100;jj++) {      //TestPicture  = jj
MOVW	R1, #lo_addr(_jj+0)
MOVT	R1, #hi_addr(_jj+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,662 :: 		}
IT	AL
BAL	L_DCVA_TEST344
L_DCVA_TEST345:
;DCVA_GUI_events_code.c,663 :: 		ite_total = iteration1 + iteration2 + iteration3;
MOVW	R0, #lo_addr(_iteration2+0)
MOVT	R0, #hi_addr(_iteration2+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_iteration1+0)
MOVT	R0, #hi_addr(_iteration1+0)
LDRH	R0, [R0, #0]
ADDS	R1, R0, R1
UXTH	R1, R1
MOVW	R0, #lo_addr(_iteration3+0)
MOVT	R0, #hi_addr(_iteration3+0)
LDRH	R0, [R0, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_ite_total+0)
MOVT	R0, #hi_addr(_ite_total+0)
STRH	R1, [R0, #0]
;DCVA_GUI_events_code.c,664 :: 		NormFault = (100*sqrt(NormFault))/(5.468008919752826e+03);
MOVW	R0, #lo_addr(_NormFault+0)
MOVT	R0, #hi_addr(_NormFault+0)
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S1, S1, S0
MOVW	R0, #57362
MOVT	R0, #17834
VMOV	S0, R0
VDIV.F32	S0, S1, S0
MOVW	R0, #lo_addr(_NormFault+0)
MOVT	R0, #hi_addr(_NormFault+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,665 :: 		ProgressBar1.Position = accuracy;
MOVW	R0, #lo_addr(_accuracy+0)
MOVT	R0, #hi_addr(_accuracy+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;DCVA_GUI_events_code.c,666 :: 		DrawScreen(&Screen7);
MOVW	R0, #lo_addr(_Screen7+0)
MOVT	R0, #hi_addr(_Screen7+0)
BL	_DrawScreen+0
;DCVA_GUI_events_code.c,668 :: 		TFT_Write_Text("iteration1 = >",10,60);
MOVW	R0, #lo_addr(?lstr35_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr35_DCVA_GUI_events_code+0)
MOVS	R2, #60
MOVS	R1, #10
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,669 :: 		IntToStr(iteration1,txt1);
MOVW	R0, #lo_addr(_iteration1+0)
MOVT	R0, #hi_addr(_iteration1+0)
LDRH	R0, [R0, #0]
MOVW	R1, #lo_addr(_txt1+0)
MOVT	R1, #hi_addr(_txt1+0)
BL	_IntToStr+0
;DCVA_GUI_events_code.c,670 :: 		TFT_Write_Text(txt1,120,60);
MOVS	R2, #60
MOVS	R1, #120
MOVW	R0, #lo_addr(_txt1+0)
MOVT	R0, #hi_addr(_txt1+0)
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,672 :: 		TFT_Write_Text("iteration2 = >",10,80);
MOVW	R0, #lo_addr(?lstr36_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr36_DCVA_GUI_events_code+0)
MOVS	R2, #80
MOVS	R1, #10
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,673 :: 		IntToStr(iteration2,txt1);
MOVW	R0, #lo_addr(_iteration2+0)
MOVT	R0, #hi_addr(_iteration2+0)
LDRH	R0, [R0, #0]
MOVW	R1, #lo_addr(_txt1+0)
MOVT	R1, #hi_addr(_txt1+0)
BL	_IntToStr+0
;DCVA_GUI_events_code.c,674 :: 		TFT_Write_Text(txt1,120,80);
MOVS	R2, #80
MOVS	R1, #120
MOVW	R0, #lo_addr(_txt1+0)
MOVT	R0, #hi_addr(_txt1+0)
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,676 :: 		TFT_Write_Text("iteration3 = >",10,100);
MOVW	R0, #lo_addr(?lstr37_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr37_DCVA_GUI_events_code+0)
MOVS	R2, #100
MOVS	R1, #10
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,677 :: 		IntToStr(iteration3,txt1);
MOVW	R0, #lo_addr(_iteration3+0)
MOVT	R0, #hi_addr(_iteration3+0)
LDRH	R0, [R0, #0]
MOVW	R1, #lo_addr(_txt1+0)
MOVT	R1, #hi_addr(_txt1+0)
BL	_IntToStr+0
;DCVA_GUI_events_code.c,678 :: 		TFT_Write_Text(txt1,120,100);
MOVS	R2, #100
MOVS	R1, #120
MOVW	R0, #lo_addr(_txt1+0)
MOVT	R0, #hi_addr(_txt1+0)
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,680 :: 		TFT_Write_Text("total = >",10,120);
MOVW	R0, #lo_addr(?lstr38_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr38_DCVA_GUI_events_code+0)
MOVS	R2, #120
MOVS	R1, #10
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,681 :: 		IntToStr(ite_total,txt1);
MOVW	R0, #lo_addr(_ite_total+0)
MOVT	R0, #hi_addr(_ite_total+0)
LDRH	R0, [R0, #0]
MOVW	R1, #lo_addr(_txt1+0)
MOVT	R1, #hi_addr(_txt1+0)
BL	_IntToStr+0
;DCVA_GUI_events_code.c,682 :: 		TFT_Write_Text(txt1,120,120);
MOVS	R2, #120
MOVS	R1, #120
MOVW	R0, #lo_addr(_txt1+0)
MOVT	R0, #hi_addr(_txt1+0)
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,684 :: 		TFT_Write_Text("Norm Fault = >",10,140);
MOVW	R0, #lo_addr(?lstr39_DCVA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr39_DCVA_GUI_events_code+0)
MOVS	R2, #140
MOVS	R1, #10
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,685 :: 		FloatToStr(NormFault,txt2);
MOVW	R0, #lo_addr(_NormFault+0)
MOVT	R0, #hi_addr(_NormFault+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_txt2+0)
MOVT	R0, #hi_addr(_txt2+0)
BL	_FloatToStr+0
;DCVA_GUI_events_code.c,686 :: 		TFT_Write_Text(txt2,120,140);
MOVS	R2, #140
MOVS	R1, #120
MOVW	R0, #lo_addr(_txt2+0)
MOVT	R0, #hi_addr(_txt2+0)
BL	_TFT_Write_Text+0
;DCVA_GUI_events_code.c,688 :: 		while(1);
L_DCVA_TEST391:
IT	AL
BAL	L_DCVA_TEST391
;DCVA_GUI_events_code.c,689 :: 		}
L_end_DCVA_TEST:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DCVA_TEST
_Show_database:
;DCVA_GUI_events_code.c,691 :: 		void Show_database() {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;DCVA_GUI_events_code.c,692 :: 		DrawScreen(&Screen8);
MOVW	R0, #lo_addr(_Screen8+0)
MOVT	R0, #hi_addr(_Screen8+0)
BL	_DrawScreen+0
;DCVA_GUI_events_code.c,693 :: 		ValueZero();
BL	_ValueZero+0
;DCVA_GUI_events_code.c,694 :: 		ii = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
;DCVA_GUI_events_code.c,695 :: 		for(jj=0;jj<20;jj++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
STR	R1, [R0, #0]
L_Show_database393:
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
CMP	R0, #20
IT	CS
BCS	L_Show_database394
;DCVA_GUI_events_code.c,697 :: 		for(z1=0;z1<5;z1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_Show_database396:
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, #5
IT	CS
BCS	L_Show_database397
;DCVA_GUI_events_code.c,698 :: 		Delay_ms(100);
MOVW	R7, #13609
MOVT	R7, #71
NOP
NOP
L_Show_database399:
SUBS	R7, R7, #1
BNE	L_Show_database399
NOP
NOP
;DCVA_GUI_events_code.c,699 :: 		for(x1=0;x1<256;x1++) histogram[x1]=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Show_database401:
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, #256
IT	CS
BCS	L_Show_database402
MOVW	R2, #lo_addr(_x1+0)
MOVT	R2, #hi_addr(_x1+0)
LDR	R0, [R2, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(_histogram+0)
MOVT	R0, #hi_addr(_histogram+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRH	R0, [R1, #0]
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
IT	AL
BAL	L_Show_database401
L_Show_database402:
;DCVA_GUI_events_code.c,701 :: 		for(y1=0;y1<col;y1++){  // "Training set"
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Show_database404:
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Show_database405
;DCVA_GUI_events_code.c,702 :: 		for(x1=0;x1<row;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Show_database407:
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Show_database408
;DCVA_GUI_events_code.c,703 :: 		tempk1=Ear[ii];
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R0, [SP, #8]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_Ear+0)
MOVT	R0, #hi_addr(_Ear+0)
ADDS	R0, R0, R1
LDRB	R3, [R0, #0]
MOVW	R0, #lo_addr(_tempk1+0)
MOVT	R0, #hi_addr(_tempk1+0)
STRB	R3, [R0, #0]
;DCVA_GUI_events_code.c,704 :: 		temp1 = TFT_RGBToColor16bit(tempk1, tempk1, tempk1);
UXTB	R2, R3
UXTB	R1, R3
UXTB	R0, R3
BL	_TFT_RGBToColor16bit+0
VMOV	S0, R0
VCVT.F32	#0, S0, S0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;DCVA_GUI_events_code.c,705 :: 		TFT_Dot(x1+10+z1*60, y1+25, temp1);
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
UXTH	R0, R0
UXTH	R4, R0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
ADDW	R3, R0, #25
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R0, [SP, #4]
LDR	R0, [R0, #0]
ADDW	R2, R0, #10
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R1, [R0, #0]
MOVS	R0, #60
MULS	R0, R1, R0
ADDS	R0, R2, R0
UXTH	R2, R4
SXTH	R1, R3
SXTH	R0, R0
BL	_TFT_Dot+0
;DCVA_GUI_events_code.c,706 :: 		histogram[tempk1] = histogram[tempk1] + 1;
MOVW	R0, #lo_addr(_tempk1+0)
MOVT	R0, #hi_addr(_tempk1+0)
LDRB	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(_histogram+0)
MOVT	R0, #hi_addr(_histogram+0)
ADDS	R1, R0, R1
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;DCVA_GUI_events_code.c,707 :: 		ii = ii + 1;}}
LDR	R1, [SP, #8]
MOV	R0, R1
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,702 :: 		for(x1=0;x1<row;x1++){
LDR	R1, [SP, #4]
MOV	R0, R1
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,707 :: 		ii = ii + 1;}}
IT	AL
BAL	L_Show_database407
L_Show_database408:
;DCVA_GUI_events_code.c,701 :: 		for(y1=0;y1<col;y1++){  // "Training set"
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,707 :: 		ii = ii + 1;}}
IT	AL
BAL	L_Show_database404
L_Show_database405:
;DCVA_GUI_events_code.c,709 :: 		for(y1=105;y1<240;y1++){
MOVS	R1, #105
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Show_database410:
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, #240
IT	CS
BCS	L_Show_database411
;DCVA_GUI_events_code.c,710 :: 		for(x1=0;x1<320;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Show_database413:
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, #320
IT	CS
BCS	L_Show_database414
;DCVA_GUI_events_code.c,711 :: 		TFT_Dot(x1, y1, CL_WHITE);}
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
MOVW	R2, #65535
BL	_TFT_Dot+0
;DCVA_GUI_events_code.c,710 :: 		for(x1=0;x1<320;x1++)
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,711 :: 		TFT_Dot(x1, y1, CL_WHITE);}
IT	AL
BAL	L_Show_database413
L_Show_database414:
;DCVA_GUI_events_code.c,709 :: 		for(y1=105;y1<240;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,711 :: 		TFT_Dot(x1, y1, CL_WHITE);}
IT	AL
BAL	L_Show_database410
L_Show_database411:
;DCVA_GUI_events_code.c,713 :: 		if (z1==0)DrawLabel(&Diagram8_S2L4);
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Show_database416
MOVW	R0, #lo_addr(_Diagram8_S2L4+0)
MOVT	R0, #hi_addr(_Diagram8_S2L4+0)
BL	_DrawLabel+0
L_Show_database416:
;DCVA_GUI_events_code.c,714 :: 		if (z1==1)DrawLabel(&Diagram8_S2L5);
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Show_database417
MOVW	R0, #lo_addr(_Diagram8_S2L5+0)
MOVT	R0, #hi_addr(_Diagram8_S2L5+0)
BL	_DrawLabel+0
L_Show_database417:
;DCVA_GUI_events_code.c,715 :: 		if (z1==2)DrawLabel(&Diagram8_S2L6);
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_Show_database418
MOVW	R0, #lo_addr(_Diagram8_S2L6+0)
MOVT	R0, #hi_addr(_Diagram8_S2L6+0)
BL	_DrawLabel+0
L_Show_database418:
;DCVA_GUI_events_code.c,716 :: 		if (z1==3)DrawLabel(&Diagram8_S2L7);
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, #3
IT	NE
BNE	L_Show_database419
MOVW	R0, #lo_addr(_Diagram8_S2L7+0)
MOVT	R0, #hi_addr(_Diagram8_S2L7+0)
BL	_DrawLabel+0
L_Show_database419:
;DCVA_GUI_events_code.c,717 :: 		if (z1==4)DrawLabel(&Diagram8_S2L8);
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, #4
IT	NE
BNE	L_Show_database420
MOVW	R0, #lo_addr(_Diagram8_S2L8+0)
MOVT	R0, #hi_addr(_Diagram8_S2L8+0)
BL	_DrawLabel+0
L_Show_database420:
;DCVA_GUI_events_code.c,719 :: 		TFT_Line(32,235,32+256,235);
MOVS	R3, #235
SXTH	R3, R3
MOVW	R2, #288
SXTH	R2, R2
MOVS	R1, #235
SXTH	R1, R1
MOVS	R0, #32
SXTH	R0, R0
BL	_TFT_Line+0
;DCVA_GUI_events_code.c,721 :: 		for(x1=0;x1<256;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Show_database421:
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, #256
IT	CS
BCS	L_Show_database422
;DCVA_GUI_events_code.c,722 :: 		kk = histogram[x1];
MOVW	R3, #lo_addr(_x1+0)
MOVT	R3, #hi_addr(_x1+0)
LDR	R0, [R3, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(_histogram+0)
MOVT	R0, #hi_addr(_histogram+0)
ADDS	R0, R0, R1
LDRH	R0, [R0, #0]
MOVW	R2, #lo_addr(_kk+0)
MOVT	R2, #hi_addr(_kk+0)
STR	R0, [R2, #0]
;DCVA_GUI_events_code.c,723 :: 		TFT_V_Line(235,235-kk,32+x1);}
MOV	R0, R3
LDR	R0, [R0, #0]
ADDW	R1, R0, #32
MOV	R0, R2
LDR	R0, [R0, #0]
RSB	R0, R0, #235
SXTH	R2, R1
SXTH	R1, R0
MOVS	R0, #235
SXTH	R0, R0
BL	_TFT_V_Line+0
;DCVA_GUI_events_code.c,721 :: 		for(x1=0;x1<256;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,723 :: 		TFT_V_Line(235,235-kk,32+x1);}
IT	AL
BAL	L_Show_database421
L_Show_database422:
;DCVA_GUI_events_code.c,697 :: 		for(z1=0;z1<5;z1++){
MOVW	R1, #lo_addr(_z1+0)
MOVT	R1, #hi_addr(_z1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,725 :: 		}}
IT	AL
BAL	L_Show_database396
L_Show_database397:
;DCVA_GUI_events_code.c,695 :: 		for(jj=0;jj<20;jj++){
MOVW	R1, #lo_addr(_jj+0)
MOVT	R1, #hi_addr(_jj+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;DCVA_GUI_events_code.c,725 :: 		}}
IT	AL
BAL	L_Show_database393
L_Show_database394:
;DCVA_GUI_events_code.c,727 :: 		Delay_ms(500);
MOVW	R7, #2515
MOVT	R7, #356
NOP
NOP
L_Show_database424:
SUBS	R7, R7, #1
BNE	L_Show_database424
NOP
NOP
NOP
NOP
;DCVA_GUI_events_code.c,728 :: 		DrawScreen(&Screen1);
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;DCVA_GUI_events_code.c,730 :: 		}
L_end_Show_database:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Show_database
