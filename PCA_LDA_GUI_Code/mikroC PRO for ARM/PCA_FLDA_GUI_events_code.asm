_reset_zero:
;PCA_FLDA_GUI_events_code.c,142 :: 		void reset_zero(){
SUB	SP, SP, #4
;PCA_FLDA_GUI_events_code.c,143 :: 		ii=0;jj=0;kk=0;mm=0;x1=0;y1=0;z1=0;
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
;PCA_FLDA_GUI_events_code.c,144 :: 		p=0;q=0;row=60;col=80;k1=0;q1=50;q2=60;a1=0;
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
;PCA_FLDA_GUI_events_code.c,145 :: 		ff=0; N=50;m1=0;tt=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ff+0)
MOVT	R0, #hi_addr(_ff+0)
STR	R1, [R0, #0]
MOVS	R1, #50
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_m1+0)
MOVT	R0, #hi_addr(_m1+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_tt+0)
MOVT	R0, #hi_addr(_tt+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,146 :: 		temp1=0;temp2=0;temp3=0;temp4=0;temp5=0;NormFault=0;t=0;c=0;s=0;diag_toplam=0;
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
;PCA_FLDA_GUI_events_code.c,147 :: 		WhoseEar=0; iteration=0; basla=0;test_count=0;accuracy=0;QR_iteration=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_WhoseEar+0)
MOVT	R0, #hi_addr(_WhoseEar+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_iteration+0)
MOVT	R0, #hi_addr(_iteration+0)
STRH	R1, [R0, #0]
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
MOVS	R1, #0
MOVW	R0, #lo_addr(_QR_iteration+0)
MOVT	R0, #hi_addr(_QR_iteration+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,148 :: 		ClassNumber=20;ClassPopulation=5;
MOVS	R1, #20
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
STR	R1, [R0, #0]
MOVS	R1, #5
MOVW	R0, #lo_addr(_ClassPopulation+0)
MOVT	R0, #hi_addr(_ClassPopulation+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,149 :: 		TrainPicture=ClassNumber*ClassPopulation;
MOV	R1, #100
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,150 :: 		TestPicture=50;FLDA_TetaC=400;PCA_TetaC=1200;EpsilonK=0;jac_coe=0;
MOVS	R1, #50
MOVW	R0, #lo_addr(_TestPicture+0)
MOVT	R0, #hi_addr(_TestPicture+0)
STR	R1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17352
VMOV	S0, R0
MOVW	R0, #lo_addr(_FLDA_TetaC+0)
MOVT	R0, #hi_addr(_FLDA_TetaC+0)
VSTR	#1, S0, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17558
VMOV	S0, R0
MOVW	R0, #lo_addr(_PCA_TetaC+0)
MOVT	R0, #hi_addr(_PCA_TetaC+0)
VSTR	#1, S0, [R0, #0]
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_EpsilonK+0)
MOVT	R0, #hi_addr(_EpsilonK+0)
VSTR	#1, S0, [R0, #0]
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_jac_coe+0)
MOVT	R0, #hi_addr(_jac_coe+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,152 :: 		for(ii=0;ii<N;ii++) ProjectedTestImage[ii]=0;
MOVS	R0, #0
STR	R0, [R2, #0]
L_reset_zero0:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_reset_zero1
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
BAL	L_reset_zero0
L_reset_zero1:
;PCA_FLDA_GUI_events_code.c,153 :: 		for(ii=0;ii<row*col;ii++) m_ort[ii]=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_reset_zero3:
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
BCS	L_reset_zero4
MOVW	R2, #lo_addr(_ii+0)
MOVT	R2, #hi_addr(_ii+0)
LDR	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_m_ort+0)
MOVT	R0, #hi_addr(_m_ort+0)
ADDS	R1, R0, R1
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
IT	AL
BAL	L_reset_zero3
L_reset_zero4:
;PCA_FLDA_GUI_events_code.c,154 :: 		for(ii=0;ii<N;ii++) BTemp[ii] = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_reset_zero6:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_reset_zero7
MOVW	R2, #lo_addr(_ii+0)
MOVT	R2, #hi_addr(_ii+0)
LDR	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_BTemp+0)
MOVT	R0, #hi_addr(_BTemp+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STR	R0, [R1, #0]
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
IT	AL
BAL	L_reset_zero6
L_reset_zero7:
;PCA_FLDA_GUI_events_code.c,155 :: 		for(ii=0;ii<N;ii++) RTemp[ii] = ii;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_reset_zero9:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_reset_zero10
MOVW	R2, #lo_addr(_ii+0)
MOVT	R2, #hi_addr(_ii+0)
LDR	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_RTemp+0)
MOVT	R0, #hi_addr(_RTemp+0)
ADDS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
STR	R0, [R1, #0]
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
IT	AL
BAL	L_reset_zero9
L_reset_zero10:
;PCA_FLDA_GUI_events_code.c,156 :: 		for(ii=0;ii<TrainPicture;ii++) {GTemp[ii]=0;  MTemp[ii]=0; }
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_reset_zero12:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_reset_zero13
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
BAL	L_reset_zero12
L_reset_zero13:
;PCA_FLDA_GUI_events_code.c,157 :: 		for(ii=0;ii<N;ii++) KTemp[ii]=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_reset_zero15:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_reset_zero16
MOVW	R2, #lo_addr(_ii+0)
MOVT	R2, #hi_addr(_ii+0)
LDR	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_KTemp+0)
MOVT	R0, #hi_addr(_KTemp+0)
ADDS	R1, R0, R1
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
IT	AL
BAL	L_reset_zero15
L_reset_zero16:
;PCA_FLDA_GUI_events_code.c,159 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_reset_zero18:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_reset_zero19
;PCA_FLDA_GUI_events_code.c,160 :: 		for(x1=0;x1<TrainPicture;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_reset_zero21:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_reset_zero22
;PCA_FLDA_GUI_events_code.c,161 :: 		L[x1][y1] = 0;}
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
;PCA_FLDA_GUI_events_code.c,160 :: 		for(x1=0;x1<TrainPicture;x1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,161 :: 		L[x1][y1] = 0;}
IT	AL
BAL	L_reset_zero21
L_reset_zero22:
;PCA_FLDA_GUI_events_code.c,159 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,161 :: 		L[x1][y1] = 0;}
IT	AL
BAL	L_reset_zero18
L_reset_zero19:
;PCA_FLDA_GUI_events_code.c,163 :: 		for(y1=0;y1<(ClassNumber-1);y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_reset_zero24:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_reset_zero25
;PCA_FLDA_GUI_events_code.c,164 :: 		for(x1=0;x1<N;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_reset_zero27:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_reset_zero28
;PCA_FLDA_GUI_events_code.c,165 :: 		Fisher[x1][y1]=0;}
MOVW	R2, #lo_addr(_x1+0)
MOVT	R2, #hi_addr(_x1+0)
LDR	R1, [R2, #0]
MOVS	R0, #76
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_Fisher+0)
MOVT	R0, #hi_addr(_Fisher+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,164 :: 		for(x1=0;x1<N;x1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,165 :: 		Fisher[x1][y1]=0;}
IT	AL
BAL	L_reset_zero27
L_reset_zero28:
;PCA_FLDA_GUI_events_code.c,163 :: 		for(y1=0;y1<(ClassNumber-1);y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,165 :: 		Fisher[x1][y1]=0;}
IT	AL
BAL	L_reset_zero24
L_reset_zero25:
;PCA_FLDA_GUI_events_code.c,167 :: 		for(y1=0;y1<N;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_reset_zero30:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_reset_zero31
;PCA_FLDA_GUI_events_code.c,168 :: 		for(x1=0;x1<N;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_reset_zero33:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_reset_zero34
;PCA_FLDA_GUI_events_code.c,169 :: 		SS[x1][y1] = 0;}
MOVW	R2, #lo_addr(_x1+0)
MOVT	R2, #hi_addr(_x1+0)
LDR	R1, [R2, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SS+0)
MOVT	R0, #hi_addr(_SS+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,168 :: 		for(x1=0;x1<N;x1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,169 :: 		SS[x1][y1] = 0;}
IT	AL
BAL	L_reset_zero33
L_reset_zero34:
;PCA_FLDA_GUI_events_code.c,167 :: 		for(y1=0;y1<N;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,169 :: 		SS[x1][y1] = 0;}
IT	AL
BAL	L_reset_zero30
L_reset_zero31:
;PCA_FLDA_GUI_events_code.c,172 :: 		for(y1=0;y1<TrainPicture;y1++){       //V ilk deðer atama eye(n) birim matris
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_reset_zero36:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_reset_zero37
;PCA_FLDA_GUI_events_code.c,173 :: 		for(x1=0;x1<TrainPicture;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_reset_zero39:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_reset_zero40
;PCA_FLDA_GUI_events_code.c,174 :: 		if (x1==y1) V[x1][y1] = 1;
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_reset_zero42
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
BAL	L_reset_zero43
L_reset_zero42:
;PCA_FLDA_GUI_events_code.c,175 :: 		else        V[x1][y1] = 0;}}
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
L_reset_zero43:
;PCA_FLDA_GUI_events_code.c,173 :: 		for(x1=0;x1<TrainPicture;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,175 :: 		else        V[x1][y1] = 0;}}
IT	AL
BAL	L_reset_zero39
L_reset_zero40:
;PCA_FLDA_GUI_events_code.c,172 :: 		for(y1=0;y1<TrainPicture;y1++){       //V ilk deðer atama eye(n) birim matris
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,175 :: 		else        V[x1][y1] = 0;}}
IT	AL
BAL	L_reset_zero36
L_reset_zero37:
;PCA_FLDA_GUI_events_code.c,177 :: 		}
L_end_reset_zero:
ADD	SP, SP, #4
BX	LR
; end of _reset_zero
_S1_START:
;PCA_FLDA_GUI_events_code.c,180 :: 		void S1_START() {                 //SCREEN-1
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PCA_FLDA_GUI_events_code.c,181 :: 		DrawScreen(&Screen2);
MOVW	R0, #lo_addr(_Screen2+0)
MOVT	R0, #hi_addr(_Screen2+0)
BL	_DrawScreen+0
;PCA_FLDA_GUI_events_code.c,182 :: 		reset_zero();
BL	_reset_zero+0
;PCA_FLDA_GUI_events_code.c,183 :: 		}
L_end_S1_START:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _S1_START
_FLDA_SELECT:
;PCA_FLDA_GUI_events_code.c,185 :: 		void FLDA_SELECT() {             //SCREEN-2
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PCA_FLDA_GUI_events_code.c,186 :: 		DrawScreen(&Screen3);
MOVW	R0, #lo_addr(_Screen3+0)
MOVT	R0, #hi_addr(_Screen3+0)
BL	_DrawScreen+0
;PCA_FLDA_GUI_events_code.c,187 :: 		convert_pca_flda = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_convert_pca_flda+0)
MOVT	R0, #hi_addr(_convert_pca_flda+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,188 :: 		}
L_end_FLDA_SELECT:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FLDA_SELECT
_PCA_SELECT:
;PCA_FLDA_GUI_events_code.c,190 :: 		void PCA_SELECT() {             //SCREEN-2
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PCA_FLDA_GUI_events_code.c,191 :: 		DrawScreen(&Screen3);
MOVW	R0, #lo_addr(_Screen3+0)
MOVT	R0, #hi_addr(_Screen3+0)
BL	_DrawScreen+0
;PCA_FLDA_GUI_events_code.c,192 :: 		convert_pca_flda = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_convert_pca_flda+0)
MOVT	R0, #hi_addr(_convert_pca_flda+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,193 :: 		}
L_end_PCA_SELECT:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _PCA_SELECT
_JACOBI_SELECT:
;PCA_FLDA_GUI_events_code.c,196 :: 		void JACOBI_SELECT() {          //SCREEN-3
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PCA_FLDA_GUI_events_code.c,197 :: 		DrawScreen(&Screen5);
MOVW	R0, #lo_addr(_Screen5+0)
MOVT	R0, #hi_addr(_Screen5+0)
BL	_DrawScreen+0
;PCA_FLDA_GUI_events_code.c,198 :: 		}
L_end_JACOBI_SELECT:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _JACOBI_SELECT
_J_E_2:
;PCA_FLDA_GUI_events_code.c,201 :: 		void J_E_2() {              //SCREEN-5
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PCA_FLDA_GUI_events_code.c,202 :: 		jac_coe = 0.01;
MOVW	R0, #55050
MOVT	R0, #15395
VMOV	S0, R0
MOVW	R0, #lo_addr(_jac_coe+0)
MOVT	R0, #hi_addr(_jac_coe+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,203 :: 		if (convert_pca_flda == 0) DrawScreen(&Screen6);
MOVW	R1, #lo_addr(_convert_pca_flda+0)
MOVT	R1, #hi_addr(_convert_pca_flda+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_J_E_244
MOVW	R0, #lo_addr(_Screen6+0)
MOVT	R0, #hi_addr(_Screen6+0)
BL	_DrawScreen+0
IT	AL
BAL	L_J_E_245
L_J_E_244:
;PCA_FLDA_GUI_events_code.c,204 :: 		else DrawScreen(&Screen11);
MOVW	R0, #lo_addr(_Screen11+0)
MOVT	R0, #hi_addr(_Screen11+0)
BL	_DrawScreen+0
L_J_E_245:
;PCA_FLDA_GUI_events_code.c,205 :: 		}
L_end_J_E_2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _J_E_2
_J_E_3:
;PCA_FLDA_GUI_events_code.c,207 :: 		void J_E_3() {             //SCREEN-5
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PCA_FLDA_GUI_events_code.c,208 :: 		jac_coe = 0.001;
MOVW	R0, #4719
MOVT	R0, #14979
VMOV	S0, R0
MOVW	R0, #lo_addr(_jac_coe+0)
MOVT	R0, #hi_addr(_jac_coe+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,209 :: 		if (convert_pca_flda == 0) DrawScreen(&Screen6);
MOVW	R1, #lo_addr(_convert_pca_flda+0)
MOVT	R1, #hi_addr(_convert_pca_flda+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_J_E_346
MOVW	R0, #lo_addr(_Screen6+0)
MOVT	R0, #hi_addr(_Screen6+0)
BL	_DrawScreen+0
IT	AL
BAL	L_J_E_347
L_J_E_346:
;PCA_FLDA_GUI_events_code.c,210 :: 		else DrawScreen(&Screen11);
MOVW	R0, #lo_addr(_Screen11+0)
MOVT	R0, #hi_addr(_Screen11+0)
BL	_DrawScreen+0
L_J_E_347:
;PCA_FLDA_GUI_events_code.c,211 :: 		}
L_end_J_E_3:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _J_E_3
_J_E_4:
;PCA_FLDA_GUI_events_code.c,213 :: 		void J_E_4() {               //SCREEN-5
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PCA_FLDA_GUI_events_code.c,214 :: 		jac_coe = 0.0001;
MOVW	R0, #46871
MOVT	R0, #14545
VMOV	S0, R0
MOVW	R0, #lo_addr(_jac_coe+0)
MOVT	R0, #hi_addr(_jac_coe+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,215 :: 		if (convert_pca_flda == 0) DrawScreen(&Screen6);
MOVW	R1, #lo_addr(_convert_pca_flda+0)
MOVT	R1, #hi_addr(_convert_pca_flda+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_J_E_448
MOVW	R0, #lo_addr(_Screen6+0)
MOVT	R0, #hi_addr(_Screen6+0)
BL	_DrawScreen+0
IT	AL
BAL	L_J_E_449
L_J_E_448:
;PCA_FLDA_GUI_events_code.c,216 :: 		else DrawScreen(&Screen11);
MOVW	R0, #lo_addr(_Screen11+0)
MOVT	R0, #hi_addr(_Screen11+0)
BL	_DrawScreen+0
L_J_E_449:
;PCA_FLDA_GUI_events_code.c,217 :: 		}
L_end_J_E_4:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _J_E_4
_J_E_5:
;PCA_FLDA_GUI_events_code.c,219 :: 		void J_E_5() {              //SCREEN-5
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PCA_FLDA_GUI_events_code.c,220 :: 		jac_coe = 0.00001;
MOVW	R0, #50604
MOVT	R0, #14119
VMOV	S0, R0
MOVW	R0, #lo_addr(_jac_coe+0)
MOVT	R0, #hi_addr(_jac_coe+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,221 :: 		if (convert_pca_flda == 0) DrawScreen(&Screen6);
MOVW	R1, #lo_addr(_convert_pca_flda+0)
MOVT	R1, #hi_addr(_convert_pca_flda+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_J_E_550
MOVW	R0, #lo_addr(_Screen6+0)
MOVT	R0, #hi_addr(_Screen6+0)
BL	_DrawScreen+0
IT	AL
BAL	L_J_E_551
L_J_E_550:
;PCA_FLDA_GUI_events_code.c,222 :: 		else DrawScreen(&Screen11);
MOVW	R0, #lo_addr(_Screen11+0)
MOVT	R0, #hi_addr(_Screen11+0)
BL	_DrawScreen+0
L_J_E_551:
;PCA_FLDA_GUI_events_code.c,223 :: 		}
L_end_J_E_5:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _J_E_5
_J_E_6:
;PCA_FLDA_GUI_events_code.c,225 :: 		void J_E_6() {              //SCREEN-5
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PCA_FLDA_GUI_events_code.c,226 :: 		jac_coe = 0.000001;
MOVW	R0, #14269
MOVT	R0, #13702
VMOV	S0, R0
MOVW	R0, #lo_addr(_jac_coe+0)
MOVT	R0, #hi_addr(_jac_coe+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,227 :: 		if (convert_pca_flda == 0) DrawScreen(&Screen6);
MOVW	R1, #lo_addr(_convert_pca_flda+0)
MOVT	R1, #hi_addr(_convert_pca_flda+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_J_E_652
MOVW	R0, #lo_addr(_Screen6+0)
MOVT	R0, #hi_addr(_Screen6+0)
BL	_DrawScreen+0
IT	AL
BAL	L_J_E_653
L_J_E_652:
;PCA_FLDA_GUI_events_code.c,228 :: 		else DrawScreen(&Screen11);
MOVW	R0, #lo_addr(_Screen11+0)
MOVT	R0, #hi_addr(_Screen11+0)
BL	_DrawScreen+0
L_J_E_653:
;PCA_FLDA_GUI_events_code.c,229 :: 		}
L_end_J_E_6:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _J_E_6
_J_E_7:
;PCA_FLDA_GUI_events_code.c,231 :: 		void J_E_7() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PCA_FLDA_GUI_events_code.c,232 :: 		jac_coe = 0.0000001;
MOVW	R0, #49045
MOVT	R0, #13270
VMOV	S0, R0
MOVW	R0, #lo_addr(_jac_coe+0)
MOVT	R0, #hi_addr(_jac_coe+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,233 :: 		if (convert_pca_flda == 0) DrawScreen(&Screen6);
MOVW	R1, #lo_addr(_convert_pca_flda+0)
MOVT	R1, #hi_addr(_convert_pca_flda+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_J_E_754
MOVW	R0, #lo_addr(_Screen6+0)
MOVT	R0, #hi_addr(_Screen6+0)
BL	_DrawScreen+0
IT	AL
BAL	L_J_E_755
L_J_E_754:
;PCA_FLDA_GUI_events_code.c,234 :: 		else DrawScreen(&Screen11);
MOVW	R0, #lo_addr(_Screen11+0)
MOVT	R0, #hi_addr(_Screen11+0)
BL	_DrawScreen+0
L_J_E_755:
;PCA_FLDA_GUI_events_code.c,235 :: 		}
L_end_J_E_7:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _J_E_7
_J_E_8:
;PCA_FLDA_GUI_events_code.c,237 :: 		void J_E_8() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PCA_FLDA_GUI_events_code.c,238 :: 		jac_coe = 0.00000001;
MOVW	R0, #52343
MOVT	R0, #12843
VMOV	S0, R0
MOVW	R0, #lo_addr(_jac_coe+0)
MOVT	R0, #hi_addr(_jac_coe+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,239 :: 		if (convert_pca_flda == 0) DrawScreen(&Screen6);
MOVW	R1, #lo_addr(_convert_pca_flda+0)
MOVT	R1, #hi_addr(_convert_pca_flda+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_J_E_856
MOVW	R0, #lo_addr(_Screen6+0)
MOVT	R0, #hi_addr(_Screen6+0)
BL	_DrawScreen+0
IT	AL
BAL	L_J_E_857
L_J_E_856:
;PCA_FLDA_GUI_events_code.c,240 :: 		else DrawScreen(&Screen11);
MOVW	R0, #lo_addr(_Screen11+0)
MOVT	R0, #hi_addr(_Screen11+0)
BL	_DrawScreen+0
L_J_E_857:
;PCA_FLDA_GUI_events_code.c,241 :: 		}
L_end_J_E_8:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _J_E_8
_projected_images_find:
;PCA_FLDA_GUI_events_code.c,242 :: 		void projected_images_find (){
SUB	SP, SP, #16
STR	LR, [SP, #0]
;PCA_FLDA_GUI_events_code.c,244 :: 		for(ii=0;ii<row*col;ii++){ // m_ort = row*col x 1
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_projected_images_find58:
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
BCS	L_projected_images_find59
;PCA_FLDA_GUI_events_code.c,245 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,246 :: 		for(x1=0;(x1<TrainPicture);x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_projected_images_find61:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_projected_images_find62
;PCA_FLDA_GUI_events_code.c,247 :: 		temp1 =  temp1 + Ear[row*col*x1+ii];
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R0, [R0, #0]
MULS	R1, R0, R1
MOVW	R2, #lo_addr(_x1+0)
MOVT	R2, #hi_addr(_x1+0)
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
;PCA_FLDA_GUI_events_code.c,246 :: 		for(x1=0;(x1<TrainPicture);x1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,247 :: 		temp1 =  temp1 + Ear[row*col*x1+ii];
IT	AL
BAL	L_projected_images_find61
L_projected_images_find62:
;PCA_FLDA_GUI_events_code.c,248 :: 		m_ort[ii] = temp1/TrainPicture;}
MOVW	R3, #lo_addr(_ii+0)
MOVT	R3, #hi_addr(_ii+0)
LDR	R0, [R3, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_m_ort+0)
MOVT	R0, #hi_addr(_m_ort+0)
ADDS	R2, R0, R1
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
VLDR	#1, S0, [R0, #0]
VCVT.F32	#0, S1, S0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VDIV.F32	S0, S0, S1
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,244 :: 		for(ii=0;ii<row*col;ii++){ // m_ort = row*col x 1
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,248 :: 		m_ort[ii] = temp1/TrainPicture;}
IT	AL
BAL	L_projected_images_find58
L_projected_images_find59:
;PCA_FLDA_GUI_events_code.c,250 :: 		TFT_Write_Text("MEAN OK", 30, 30);
MOVW	R0, #lo_addr(?lstr1_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr1_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #30
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,251 :: 		TFT_Write_Text("L=A'*A ?", 30, 50);
MOVW	R0, #lo_addr(?lstr2_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr2_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #50
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,253 :: 		for(x1=0;x1<TrainPicture;x1++){        // L = A'*A;
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_projected_images_find64:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_projected_images_find65
;PCA_FLDA_GUI_events_code.c,254 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_projected_images_find67:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_projected_images_find68
;PCA_FLDA_GUI_events_code.c,255 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,256 :: 		for(ii=0;ii<row*col;ii++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_projected_images_find70:
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
BCS	L_projected_images_find71
;PCA_FLDA_GUI_events_code.c,257 :: 		temp1 = temp1 + (ear[row*col*x1 + ii] - m_ort[ii])*(ear[row*col*y1 + ii] - m_ort[ii]);
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R0, [R0, #0]
MUL	R5, R0, R1
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
MUL	R1, R5, R0
MOVW	R4, #lo_addr(_ii+0)
MOVT	R4, #hi_addr(_ii+0)
LDR	R0, [R4, #0]
ADDS	R0, R1, R0
MOVW	R3, #lo_addr(_Ear+0)
MOVT	R3, #hi_addr(_Ear+0)
ADDS	R0, R3, R0
LDRB	R2, [R0, #0]
MOV	R0, R4
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_m_ort+0)
MOVT	R0, #hi_addr(_m_ort+0)
ADDS	R1, R0, R1
VMOV	S0, R2
VCVT.F32	#0, S0, S0
VLDR	#1, S2, [R1, #0]
VSUB.F32	S1, S0, S2
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
MUL	R1, R5, R0
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R1, R0
ADDS	R0, R3, R0
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
;PCA_FLDA_GUI_events_code.c,256 :: 		for(ii=0;ii<row*col;ii++)
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;PCA_FLDA_GUI_events_code.c,257 :: 		temp1 = temp1 + (ear[row*col*x1 + ii] - m_ort[ii])*(ear[row*col*y1 + ii] - m_ort[ii]);
IT	AL
BAL	L_projected_images_find70
L_projected_images_find71:
;PCA_FLDA_GUI_events_code.c,258 :: 		L[x1][y1] = temp1;}}
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
;PCA_FLDA_GUI_events_code.c,254 :: 		for(y1=0;y1<TrainPicture;y1++){
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,258 :: 		L[x1][y1] = temp1;}}
IT	AL
BAL	L_projected_images_find67
L_projected_images_find68:
;PCA_FLDA_GUI_events_code.c,253 :: 		for(x1=0;x1<TrainPicture;x1++){        // L = A'*A;
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,258 :: 		L[x1][y1] = temp1;}}
IT	AL
BAL	L_projected_images_find64
L_projected_images_find65:
;PCA_FLDA_GUI_events_code.c,260 :: 		TFT_Write_Text("L=A'*A OK", 30, 70);
MOVW	R0, #lo_addr(?lstr3_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr3_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #70
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,262 :: 		TFT_Write_Text("JACOBI ITERATION ?", 30, 90);
MOVW	R0, #lo_addr(?lstr4_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr4_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #90
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,264 :: 		temp1 = 0;      //en büyük deðer bulma
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,265 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_projected_images_find73:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_projected_images_find74
;PCA_FLDA_GUI_events_code.c,266 :: 		for(x1=0;x1<TrainPicture;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_projected_images_find76:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_projected_images_find77
;PCA_FLDA_GUI_events_code.c,267 :: 		if ((fabs(L[x1][y1]) > temp1) && (x1 != y1)) {
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
BLE	L__projected_images_find609
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__projected_images_find608
L__projected_images_find607:
;PCA_FLDA_GUI_events_code.c,268 :: 		temp1 = fabs(L[x1][y1]);
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
;PCA_FLDA_GUI_events_code.c,269 :: 		p=x1;
LDR	R0, [SP, #8]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,270 :: 		q=y1;}}}
LDR	R0, [SP, #4]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_q+0)
MOVT	R0, #hi_addr(_q+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,267 :: 		if ((fabs(L[x1][y1]) > temp1) && (x1 != y1)) {
L__projected_images_find609:
L__projected_images_find608:
;PCA_FLDA_GUI_events_code.c,266 :: 		for(x1=0;x1<TrainPicture;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,270 :: 		q=y1;}}}
IT	AL
BAL	L_projected_images_find76
L_projected_images_find77:
;PCA_FLDA_GUI_events_code.c,265 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,270 :: 		q=y1;}}}
IT	AL
BAL	L_projected_images_find73
L_projected_images_find74:
;PCA_FLDA_GUI_events_code.c,272 :: 		iteration = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_iteration+0)
MOVT	R0, #hi_addr(_iteration+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,273 :: 		basla = 1;                              // jacobi iteration döngü baþangýcý
MOVS	R1, #1
MOVW	R0, #lo_addr(_basla+0)
MOVT	R0, #hi_addr(_basla+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,274 :: 		while (basla==1){
L_projected_images_find82:
MOVW	R0, #lo_addr(_basla+0)
MOVT	R0, #hi_addr(_basla+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_projected_images_find83
;PCA_FLDA_GUI_events_code.c,279 :: 		t = (L[p][q])/((L[q][q])-(L[p][p]));
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
;PCA_FLDA_GUI_events_code.c,280 :: 		c = 1/(sqrt(t*t+1));
VMUL.F32	S1, S0, S0
VMOV.F32	S0, #1
VADD.F32	S0, S1, S0
BL	_sqrt+0
VMOV.F32	S1, #1
VDIV.F32	S1, S1, S0
MOVW	R0, #lo_addr(_c+0)
MOVT	R0, #hi_addr(_c+0)
VSTR	#1, S1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,281 :: 		s = t*c;
LDR	R0, [SP, #4]
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_s+0)
MOVT	R0, #hi_addr(_s+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,283 :: 		for(y1=0;y1<TrainPicture;y1++){ //matris çarpýmý D([p q],:) = R'*D([p q],:);
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_projected_images_find84:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_projected_images_find85
;PCA_FLDA_GUI_events_code.c,284 :: 		temp1 = L[p][y1];
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
;PCA_FLDA_GUI_events_code.c,285 :: 		temp2 = L[q][y1];
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
;PCA_FLDA_GUI_events_code.c,286 :: 		temp3 = temp1*c + temp2*(-s);
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
;PCA_FLDA_GUI_events_code.c,287 :: 		temp4 = temp1*s + temp2*c;
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
;PCA_FLDA_GUI_events_code.c,288 :: 		L[p][y1] = temp3;
MOV	R0, R3
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R7, #0]
;PCA_FLDA_GUI_events_code.c,289 :: 		L[q][y1] = temp4;}
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
;PCA_FLDA_GUI_events_code.c,283 :: 		for(y1=0;y1<TrainPicture;y1++){ //matris çarpýmý D([p q],:) = R'*D([p q],:);
MOV	R0, R8
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R8, #0]
;PCA_FLDA_GUI_events_code.c,289 :: 		L[q][y1] = temp4;}
IT	AL
BAL	L_projected_images_find84
L_projected_images_find85:
;PCA_FLDA_GUI_events_code.c,291 :: 		for(x1=0;x1<TrainPicture;x1++){ //matris çarpýmý D(:,[p q]) = D(:,[p q])*R;
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_projected_images_find87:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_projected_images_find88
;PCA_FLDA_GUI_events_code.c,292 :: 		temp1 = L[x1][p];
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
;PCA_FLDA_GUI_events_code.c,293 :: 		temp2 = L[x1][q];
MOVW	R5, #lo_addr(_q+0)
MOVT	R5, #hi_addr(_q+0)
LDR	R0, [R5, #0]
LSLS	R0, R0, #2
ADDS	R0, R2, R0
VLDR	#1, S0, [R0, #0]
MOVW	R4, #lo_addr(_temp2+0)
MOVT	R4, #hi_addr(_temp2+0)
VSTR	#1, S0, [R4, #0]
;PCA_FLDA_GUI_events_code.c,294 :: 		temp3 = temp1*c + temp2*(-s);
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
;PCA_FLDA_GUI_events_code.c,295 :: 		temp4 = temp1*s + temp2*c;
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
;PCA_FLDA_GUI_events_code.c,296 :: 		L[x1][p] = temp3;
MOV	R0, R3
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R7, #0]
;PCA_FLDA_GUI_events_code.c,297 :: 		L[x1][q] = temp4;}
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
;PCA_FLDA_GUI_events_code.c,291 :: 		for(x1=0;x1<TrainPicture;x1++){ //matris çarpýmý D(:,[p q]) = D(:,[p q])*R;
MOV	R0, R8
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R8, #0]
;PCA_FLDA_GUI_events_code.c,297 :: 		L[x1][q] = temp4;}
IT	AL
BAL	L_projected_images_find87
L_projected_images_find88:
;PCA_FLDA_GUI_events_code.c,299 :: 		for(x1=0;x1<TrainPicture;x1++){  //matris çarpýmý V(:,[p q]) = V(:,[p q])*R;
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_projected_images_find90:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_projected_images_find91
;PCA_FLDA_GUI_events_code.c,300 :: 		temp1 = V[x1][p];
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
;PCA_FLDA_GUI_events_code.c,301 :: 		temp2 = V[x1][q];
MOVW	R5, #lo_addr(_q+0)
MOVT	R5, #hi_addr(_q+0)
LDR	R0, [R5, #0]
LSLS	R0, R0, #2
ADDS	R0, R2, R0
VLDR	#1, S0, [R0, #0]
MOVW	R4, #lo_addr(_temp2+0)
MOVT	R4, #hi_addr(_temp2+0)
VSTR	#1, S0, [R4, #0]
;PCA_FLDA_GUI_events_code.c,302 :: 		temp3 = temp1*c + temp2*(-s);
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
;PCA_FLDA_GUI_events_code.c,303 :: 		temp4 = temp1*s + temp2*c;
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
;PCA_FLDA_GUI_events_code.c,304 :: 		V[x1][p] = temp3;
MOV	R0, R3
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R7, #0]
;PCA_FLDA_GUI_events_code.c,305 :: 		V[x1][q] = temp4;}
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
;PCA_FLDA_GUI_events_code.c,299 :: 		for(x1=0;x1<TrainPicture;x1++){  //matris çarpýmý V(:,[p q]) = V(:,[p q])*R;
MOV	R0, R8
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R8, #0]
;PCA_FLDA_GUI_events_code.c,305 :: 		V[x1][q] = temp4;}
IT	AL
BAL	L_projected_images_find90
L_projected_images_find91:
;PCA_FLDA_GUI_events_code.c,307 :: 		temp1 = 0;      //en büyük deðer bulma
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,308 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_projected_images_find93:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_projected_images_find94
;PCA_FLDA_GUI_events_code.c,309 :: 		for(x1=0;x1<TrainPicture;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_projected_images_find96:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_projected_images_find97
;PCA_FLDA_GUI_events_code.c,310 :: 		if ((fabs(L[x1][y1]) > temp1) && (x1 != y1)) {
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
BLE	L__projected_images_find611
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__projected_images_find610
L__projected_images_find606:
;PCA_FLDA_GUI_events_code.c,311 :: 		temp1 = fabs(L[x1][y1]);
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
;PCA_FLDA_GUI_events_code.c,312 :: 		p=x1;
LDR	R0, [SP, #8]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,313 :: 		q=y1;}}}
LDR	R0, [SP, #4]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_q+0)
MOVT	R0, #hi_addr(_q+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,310 :: 		if ((fabs(L[x1][y1]) > temp1) && (x1 != y1)) {
L__projected_images_find611:
L__projected_images_find610:
;PCA_FLDA_GUI_events_code.c,309 :: 		for(x1=0;x1<TrainPicture;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,313 :: 		q=y1;}}}
IT	AL
BAL	L_projected_images_find96
L_projected_images_find97:
;PCA_FLDA_GUI_events_code.c,308 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,313 :: 		q=y1;}}}
IT	AL
BAL	L_projected_images_find93
L_projected_images_find94:
;PCA_FLDA_GUI_events_code.c,315 :: 		diag_toplam=0;            // döngüden çýkma eþik deðeri
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_diag_toplam+0)
MOVT	R0, #hi_addr(_diag_toplam+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,316 :: 		for(x1=0;x1<TrainPicture;x1++)  diag_toplam = diag_toplam + L[x1][x1]*L[x1][x1];
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_projected_images_find102:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_projected_images_find103
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
BAL	L_projected_images_find102
L_projected_images_find103:
;PCA_FLDA_GUI_events_code.c,317 :: 		if (fabs(L[p][q]) < jac_coe*sqrt(diag_toplam/TrainPicture)) basla = 0; //e-5 yaptý e-7 yapmadý
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
BGE	L_projected_images_find105
MOVS	R1, #0
MOVW	R0, #lo_addr(_basla+0)
MOVT	R0, #hi_addr(_basla+0)
STRH	R1, [R0, #0]
L_projected_images_find105:
;PCA_FLDA_GUI_events_code.c,322 :: 		iteration = iteration + 1;
MOVW	R1, #lo_addr(_iteration+0)
MOVT	R1, #hi_addr(_iteration+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,323 :: 		}
IT	AL
BAL	L_projected_images_find82
L_projected_images_find83:
;PCA_FLDA_GUI_events_code.c,325 :: 		TFT_Write_Text("JACOBI ITERATION OK", 30, 110);
MOVW	R0, #lo_addr(?lstr5_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr5_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #110
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,326 :: 		TFT_Write_Text("EIGENVECTOR ?", 30, 130);
MOVW	R0, #lo_addr(?lstr6_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr6_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #130
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,330 :: 		temp1 = -1e-10;
MOVW	R0, #59135
MOVT	R0, #44763
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,331 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_projected_images_find106:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_projected_images_find107
;PCA_FLDA_GUI_events_code.c,332 :: 		for(x1=y1;x1<TrainPicture;x1++){
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_projected_images_find109:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_projected_images_find110
;PCA_FLDA_GUI_events_code.c,333 :: 		if (L[x1][x1] > temp1) {
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
BLE	L_projected_images_find112
;PCA_FLDA_GUI_events_code.c,334 :: 		temp1 =  L[x1][x1];
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
;PCA_FLDA_GUI_events_code.c,335 :: 		ii = x1;}}
MOV	R0, R2
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_projected_images_find112:
;PCA_FLDA_GUI_events_code.c,332 :: 		for(x1=y1;x1<TrainPicture;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,335 :: 		ii = x1;}}
IT	AL
BAL	L_projected_images_find109
L_projected_images_find110:
;PCA_FLDA_GUI_events_code.c,336 :: 		L[ii][ii] =  L[y1][y1];
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
;PCA_FLDA_GUI_events_code.c,337 :: 		L[y1][y1] = temp1;
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
;PCA_FLDA_GUI_events_code.c,338 :: 		temp1 = -1e-10;
MOVW	R0, #59135
MOVT	R0, #44763
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,339 :: 		for(x1=0;x1<TrainPicture;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_projected_images_find113:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_projected_images_find114
;PCA_FLDA_GUI_events_code.c,340 :: 		GTemp[x1] = V[x1][ii];
MOVW	R4, #lo_addr(_x1+0)
MOVT	R4, #hi_addr(_x1+0)
LDR	R0, [R4, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R3, R0, R1
MOV	R0, R4
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOVW	R2, #lo_addr(_ii+0)
MOVT	R2, #hi_addr(_ii+0)
LDR	R0, [R2, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,341 :: 		V[x1][ii] = V[x1][y1];
MOV	R0, R4
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R3, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R3, R0
MOVW	R2, #lo_addr(_y1+0)
MOVT	R2, #hi_addr(_y1+0)
LDR	R0, [R2, #0]
LSLS	R0, R0, #2
ADDS	R0, R3, R0
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,342 :: 		V[x1][y1] = GTemp[x1];}}  // Özdeðerler büyükten küçüðe numarasý tutuluyor (özvektörler için)
MOV	R0, R4
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R2, R1, R0
MOV	R0, R4
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,339 :: 		for(x1=0;x1<TrainPicture;x1++){
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;PCA_FLDA_GUI_events_code.c,342 :: 		V[x1][y1] = GTemp[x1];}}  // Özdeðerler büyükten küçüðe numarasý tutuluyor (özvektörler için)
IT	AL
BAL	L_projected_images_find113
L_projected_images_find114:
;PCA_FLDA_GUI_events_code.c,331 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,342 :: 		V[x1][y1] = GTemp[x1];}}  // Özdeðerler büyükten küçüðe numarasý tutuluyor (özvektörler için)
IT	AL
BAL	L_projected_images_find106
L_projected_images_find107:
;PCA_FLDA_GUI_events_code.c,344 :: 		TFT_Write_Text("EIGENVECTOR OK", 30, 150);
MOVW	R0, #lo_addr(?lstr7_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr7_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #150
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,346 :: 		TFT_Write_Text("L=> ProjectedImages", 30, 170);
MOVW	R0, #lo_addr(?lstr8_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr8_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #170
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,348 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_projected_images_find116:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_projected_images_find117
;PCA_FLDA_GUI_events_code.c,349 :: 		for(x1=0;x1<TrainPicture;x1++) L[x1][y1] = 0;}
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_projected_images_find119:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_projected_images_find120
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
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
IT	AL
BAL	L_projected_images_find119
L_projected_images_find120:
;PCA_FLDA_GUI_events_code.c,348 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,349 :: 		for(x1=0;x1<TrainPicture;x1++) L[x1][y1] = 0;}
IT	AL
BAL	L_projected_images_find116
L_projected_images_find117:
;PCA_FLDA_GUI_events_code.c,351 :: 		TFT_Write_Text("ProjectedImages ?", 30, 190);
MOVW	R0, #lo_addr(?lstr9_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr9_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #190
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,353 :: 		for(y1=0;y1<N;y1++){   // V[100][50]
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_projected_images_find122:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_projected_images_find123
;PCA_FLDA_GUI_events_code.c,354 :: 		for(ii=0;ii<row*col;ii++){        //(row*col x picture)(picture x picture - ClassNumber)
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_projected_images_find125:
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
BCS	L_projected_images_find126
;PCA_FLDA_GUI_events_code.c,355 :: 		temp1 = 0;                    // KTemp => norm tutucu
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,356 :: 		for(x1=0;x1<TrainPicture;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_projected_images_find128:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_projected_images_find129
;PCA_FLDA_GUI_events_code.c,357 :: 		temp1 = temp1 + (Ear[x1*row*col + ii] - m_ort[ii])*V[x1][y1]; //A*V
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R1, [R0, #0]
MOVW	R4, #lo_addr(_x1+0)
MOVT	R4, #hi_addr(_x1+0)
LDR	R0, [R4, #0]
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R0, [R0, #0]
MULS	R1, R0, R1
MOVW	R3, #lo_addr(_ii+0)
MOVT	R3, #hi_addr(_ii+0)
LDR	R0, [R3, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_Ear+0)
MOVT	R0, #hi_addr(_Ear+0)
ADDS	R0, R0, R1
LDRB	R2, [R0, #0]
MOV	R0, R3
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_m_ort+0)
MOVT	R0, #hi_addr(_m_ort+0)
ADDS	R0, R0, R1
VMOV	S1, R2
VCVT.F32	#0, S1, S1
VLDR	#1, S0, [R0, #0]
VSUB.F32	S1, S1, S0
MOV	R0, R4
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
;PCA_FLDA_GUI_events_code.c,356 :: 		for(x1=0;x1<TrainPicture;x1++)
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;PCA_FLDA_GUI_events_code.c,357 :: 		temp1 = temp1 + (Ear[x1*row*col + ii] - m_ort[ii])*V[x1][y1]; //A*V
IT	AL
BAL	L_projected_images_find128
L_projected_images_find129:
;PCA_FLDA_GUI_events_code.c,358 :: 		KTemp[y1] =  KTemp[y1] + temp1*temp1;}}
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_KTemp+0)
MOVT	R0, #hi_addr(_KTemp+0)
ADDS	R2, R0, R1
VLDR	#1, S2, [R2, #0]
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VADD.F32	S0, S2, S0
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,354 :: 		for(ii=0;ii<row*col;ii++){        //(row*col x picture)(picture x picture - ClassNumber)
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,358 :: 		KTemp[y1] =  KTemp[y1] + temp1*temp1;}}
IT	AL
BAL	L_projected_images_find125
L_projected_images_find126:
;PCA_FLDA_GUI_events_code.c,353 :: 		for(y1=0;y1<N;y1++){   // V[100][50]
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,358 :: 		KTemp[y1] =  KTemp[y1] + temp1*temp1;}}
IT	AL
BAL	L_projected_images_find122
L_projected_images_find123:
;PCA_FLDA_GUI_events_code.c,360 :: 		TFT_Write_Text("NORM KEEP OK", 30, 210);
MOVW	R0, #lo_addr(?lstr10_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr10_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #210
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,362 :: 		for(y1=0;y1<N;y1++){        // V=V/norm_tutucu       100x50
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_projected_images_find131:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_projected_images_find132
;PCA_FLDA_GUI_events_code.c,363 :: 		for(x1=0;x1<TrainPicture;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_projected_images_find134:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_projected_images_find135
;PCA_FLDA_GUI_events_code.c,364 :: 		V[x1][y1] = (V[x1][y1])/(sqrt(KTemp[y1]));}
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
MOVW	R0, #lo_addr(_KTemp+0)
MOVT	R0, #hi_addr(_KTemp+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VDIV.F32	S0, S1, S0
LDR	R0, [SP, #8]
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,363 :: 		for(x1=0;x1<TrainPicture;x1++)
LDR	R1, [SP, #12]
MOV	R0, R1
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,364 :: 		V[x1][y1] = (V[x1][y1])/(sqrt(KTemp[y1]));}
IT	AL
BAL	L_projected_images_find134
L_projected_images_find135:
;PCA_FLDA_GUI_events_code.c,362 :: 		for(y1=0;y1<N;y1++){        // V=V/norm_tutucu       100x50
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,364 :: 		V[x1][y1] = (V[x1][y1])/(sqrt(KTemp[y1]));}
IT	AL
BAL	L_projected_images_find131
L_projected_images_find132:
;PCA_FLDA_GUI_events_code.c,366 :: 		TFT_Write_Text("V=V/NORM KEEP OK", 30, 230);
MOVW	R0, #lo_addr(?lstr11_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr11_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #230
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,368 :: 		for(ii=0;ii<TrainPicture;ii++) GTemp[ii]=0;   // GTemp sýfýrlandý
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_projected_images_find137:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_projected_images_find138
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
ADDS	R0, R0, #1
STR	R0, [R2, #0]
IT	AL
BAL	L_projected_images_find137
L_projected_images_find138:
;PCA_FLDA_GUI_events_code.c,370 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_projected_images_find140:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_projected_images_find141
;PCA_FLDA_GUI_events_code.c,371 :: 		for(x1=0;x1<TrainPicture;x1++){        //(picture x row*col)(row*col x 1)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_projected_images_find143:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_projected_images_find144
;PCA_FLDA_GUI_events_code.c,372 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,373 :: 		for(ii=0;ii<row*col;ii++)     // Gtemp = A' * (EarNumber-m_ort)
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_projected_images_find146:
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
BCS	L_projected_images_find147
;PCA_FLDA_GUI_events_code.c,374 :: 		temp1 = temp1 + (Ear[y1*row*col+ii] - m_ort[ii])*(Ear[x1*row*col+ii] - m_ort[ii]);
MOVW	R6, #lo_addr(_row+0)
MOVT	R6, #hi_addr(_row+0)
LDR	R1, [R6, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
MULS	R1, R0, R1
MOVW	R5, #lo_addr(_col+0)
MOVT	R5, #hi_addr(_col+0)
LDR	R0, [R5, #0]
MULS	R1, R0, R1
MOVW	R4, #lo_addr(_ii+0)
MOVT	R4, #hi_addr(_ii+0)
LDR	R0, [R4, #0]
ADDS	R0, R1, R0
MOVW	R3, #lo_addr(_Ear+0)
MOVT	R3, #hi_addr(_Ear+0)
ADDS	R0, R3, R0
LDRB	R2, [R0, #0]
MOV	R0, R4
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_m_ort+0)
MOVT	R0, #hi_addr(_m_ort+0)
ADDS	R1, R0, R1
VMOV	S0, R2
VCVT.F32	#0, S0, S0
VLDR	#1, S2, [R1, #0]
VSUB.F32	S1, S0, S2
MOV	R0, R6
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
MULS	R1, R0, R1
MOV	R0, R5
LDR	R0, [R0, #0]
MULS	R1, R0, R1
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R1, R0
ADDS	R0, R3, R0
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
;PCA_FLDA_GUI_events_code.c,373 :: 		for(ii=0;ii<row*col;ii++)     // Gtemp = A' * (EarNumber-m_ort)
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;PCA_FLDA_GUI_events_code.c,374 :: 		temp1 = temp1 + (Ear[y1*row*col+ii] - m_ort[ii])*(Ear[x1*row*col+ii] - m_ort[ii]);
IT	AL
BAL	L_projected_images_find146
L_projected_images_find147:
;PCA_FLDA_GUI_events_code.c,375 :: 		GTemp[x1] =  temp1;}
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
;PCA_FLDA_GUI_events_code.c,371 :: 		for(x1=0;x1<TrainPicture;x1++){        //(picture x row*col)(row*col x 1)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,375 :: 		GTemp[x1] =  temp1;}
IT	AL
BAL	L_projected_images_find143
L_projected_images_find144:
;PCA_FLDA_GUI_events_code.c,376 :: 		for(x1=0;x1<N;x1++){   // ProjectedImages = V' *  GTemp = V' * A' * (EarNumber-m_ort)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_projected_images_find149:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_projected_images_find150
;PCA_FLDA_GUI_events_code.c,377 :: 		temp2 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp2+0)
MOVT	R0, #hi_addr(_temp2+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,378 :: 		for(z1=0;z1<TrainPicture;z1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_projected_images_find152:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_projected_images_find153
;PCA_FLDA_GUI_events_code.c,379 :: 		temp2 = temp2 + V[z1][x1]*GTemp[z1]; // L'=L[y1][x1]; L= L[x1][y1]
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
;PCA_FLDA_GUI_events_code.c,378 :: 		for(z1=0;z1<TrainPicture;z1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,379 :: 		temp2 = temp2 + V[z1][x1]*GTemp[z1]; // L'=L[y1][x1]; L= L[x1][y1]
IT	AL
BAL	L_projected_images_find152
L_projected_images_find153:
;PCA_FLDA_GUI_events_code.c,380 :: 		L[x1][y1] = temp2;}} //L[x1][y1] => ProjectedImages[x1][y1]
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
;PCA_FLDA_GUI_events_code.c,376 :: 		for(x1=0;x1<N;x1++){   // ProjectedImages = V' *  GTemp = V' * A' * (EarNumber-m_ort)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,380 :: 		L[x1][y1] = temp2;}} //L[x1][y1] => ProjectedImages[x1][y1]
IT	AL
BAL	L_projected_images_find149
L_projected_images_find150:
;PCA_FLDA_GUI_events_code.c,370 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,380 :: 		L[x1][y1] = temp2;}} //L[x1][y1] => ProjectedImages[x1][y1]
IT	AL
BAL	L_projected_images_find140
L_projected_images_find141:
;PCA_FLDA_GUI_events_code.c,382 :: 		TFT_Write_Text("ProjectedImages OK",30, 250);
MOVW	R0, #lo_addr(?lstr12_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr12_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #250
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,383 :: 		}
L_end_projected_images_find:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _projected_images_find
_PCA_TRAINING_START:
;PCA_FLDA_GUI_events_code.c,384 :: 		void PCA_TRAINING_START() {    //SCREEN-6
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PCA_FLDA_GUI_events_code.c,385 :: 		DrawScreen(&Screen7);
MOVW	R0, #lo_addr(_Screen7+0)
MOVT	R0, #hi_addr(_Screen7+0)
BL	_DrawScreen+0
;PCA_FLDA_GUI_events_code.c,386 :: 		projected_images_find ();
BL	_projected_images_find+0
;PCA_FLDA_GUI_events_code.c,387 :: 		DrawScreen(&Screen8);
MOVW	R0, #lo_addr(_Screen8+0)
MOVT	R0, #hi_addr(_Screen8+0)
BL	_DrawScreen+0
;PCA_FLDA_GUI_events_code.c,388 :: 		}
L_end_PCA_TRAINING_START:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _PCA_TRAINING_START
_PCA_TEST_START:
;PCA_FLDA_GUI_events_code.c,390 :: 		void PCA_TEST_START() {      //SCREEN-8
SUB	SP, SP, #8
STR	LR, [SP, #0]
;PCA_FLDA_GUI_events_code.c,391 :: 		DrawScreen(&Screen9);
MOVW	R0, #lo_addr(_Screen9+0)
MOVT	R0, #hi_addr(_Screen9+0)
BL	_DrawScreen+0
;PCA_FLDA_GUI_events_code.c,392 :: 		test_count = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_test_count+0)
MOVT	R0, #hi_addr(_test_count+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,393 :: 		accuracy = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_accuracy+0)
MOVT	R0, #hi_addr(_accuracy+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,394 :: 		NormFault=0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_NormFault+0)
MOVT	R0, #hi_addr(_NormFault+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,395 :: 		for(jj=100;jj<TestPicture+100;jj++) {      //TestPicture  = jj
MOVS	R1, #100
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
STR	R1, [R0, #0]
L_PCA_TEST_START155:
MOVW	R0, #lo_addr(_TestPicture+0)
MOVT	R0, #hi_addr(_TestPicture+0)
LDR	R0, [R0, #0]
ADDW	R1, R0, #100
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_PCA_TEST_START156
;PCA_FLDA_GUI_events_code.c,397 :: 		test_count = test_count + 1;
MOVW	R1, #lo_addr(_test_count+0)
MOVT	R1, #hi_addr(_test_count+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,398 :: 		IntToStr(test_count,txt1);
SXTH	R0, R0
MOVW	R1, #lo_addr(_txt1+0)
MOVT	R1, #hi_addr(_txt1+0)
BL	_IntToStr+0
;PCA_FLDA_GUI_events_code.c,399 :: 		TFT_Write_Text(txt1,30,40);
MOVS	R2, #40
MOVS	R1, #30
MOVW	R0, #lo_addr(_txt1+0)
MOVT	R0, #hi_addr(_txt1+0)
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,400 :: 		TFT_Write_Text("TEST IMAGE", 60, 40);
MOVW	R0, #lo_addr(?lstr13_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr13_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #40
MOVS	R1, #60
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,402 :: 		ii = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,403 :: 		for(y1=0;y1<col;y1++){  // "TestPicture" siyah beyaz yazdýrma
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_PCA_TEST_START158:
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_PCA_TEST_START159
;PCA_FLDA_GUI_events_code.c,404 :: 		for(x1=0;x1<row;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_PCA_TEST_START161:
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_PCA_TEST_START162
;PCA_FLDA_GUI_events_code.c,405 :: 		temp5 = TFT_RGBToColor16bit(Ear[jj*row*col+ii], Ear[jj*row*col+ii], Ear[jj*row*col+ii]);
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
;PCA_FLDA_GUI_events_code.c,406 :: 		TFT_Dot(x1+50, y1+60, temp5);
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
;PCA_FLDA_GUI_events_code.c,407 :: 		ii = ii + 1;}}
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,404 :: 		for(x1=0;x1<row;x1++){
LDR	R1, [SP, #4]
MOV	R0, R1
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,407 :: 		ii = ii + 1;}}
IT	AL
BAL	L_PCA_TEST_START161
L_PCA_TEST_START162:
;PCA_FLDA_GUI_events_code.c,403 :: 		for(y1=0;y1<col;y1++){  // "TestPicture" siyah beyaz yazdýrma
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,407 :: 		ii = ii + 1;}}
IT	AL
BAL	L_PCA_TEST_START158
L_PCA_TEST_START159:
;PCA_FLDA_GUI_events_code.c,409 :: 		for(x1=0;x1<TrainPicture;x1++){    //  MTemp (100x1) = (A)'*(TestPicture - m_ort)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_PCA_TEST_START164:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_PCA_TEST_START165
;PCA_FLDA_GUI_events_code.c,410 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,411 :: 		for(ii=0;ii<row*col;ii++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_PCA_TEST_START167:
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
BCS	L_PCA_TEST_START168
;PCA_FLDA_GUI_events_code.c,412 :: 		temp1 = temp1 + (Ear[row*col*x1 + ii] - m_ort[ii])*(Ear[row*col*jj + ii] - m_ort[ii]);
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R0, [R0, #0]
MUL	R5, R0, R1
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
MUL	R1, R5, R0
MOVW	R4, #lo_addr(_ii+0)
MOVT	R4, #hi_addr(_ii+0)
LDR	R0, [R4, #0]
ADDS	R0, R1, R0
MOVW	R3, #lo_addr(_Ear+0)
MOVT	R3, #hi_addr(_Ear+0)
ADDS	R0, R3, R0
LDRB	R2, [R0, #0]
MOV	R0, R4
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_m_ort+0)
MOVT	R0, #hi_addr(_m_ort+0)
ADDS	R1, R0, R1
VMOV	S0, R2
VCVT.F32	#0, S0, S0
VLDR	#1, S2, [R1, #0]
VSUB.F32	S1, S0, S2
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
MUL	R1, R5, R0
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R1, R0
ADDS	R0, R3, R0
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
;PCA_FLDA_GUI_events_code.c,411 :: 		for(ii=0;ii<row*col;ii++)
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;PCA_FLDA_GUI_events_code.c,412 :: 		temp1 = temp1 + (Ear[row*col*x1 + ii] - m_ort[ii])*(Ear[row*col*jj + ii] - m_ort[ii]);
IT	AL
BAL	L_PCA_TEST_START167
L_PCA_TEST_START168:
;PCA_FLDA_GUI_events_code.c,413 :: 		MTemp[x1] = temp1;}   //100x1
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
;PCA_FLDA_GUI_events_code.c,409 :: 		for(x1=0;x1<TrainPicture;x1++){    //  MTemp (100x1) = (A)'*(TestPicture - m_ort)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,413 :: 		MTemp[x1] = temp1;}   //100x1
IT	AL
BAL	L_PCA_TEST_START164
L_PCA_TEST_START165:
;PCA_FLDA_GUI_events_code.c,415 :: 		for(y1=0;y1<N;y1++){      // ProjectedTestImage (50x1) = (V)' * MTemp
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_PCA_TEST_START170:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_PCA_TEST_START171
;PCA_FLDA_GUI_events_code.c,416 :: 		temp2 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp2+0)
MOVT	R0, #hi_addr(_temp2+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,417 :: 		for(x1=0;x1<TrainPicture;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_PCA_TEST_START173:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_PCA_TEST_START174
;PCA_FLDA_GUI_events_code.c,418 :: 		temp2 = temp2 + V[x1][y1]*MTemp[x1];
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
;PCA_FLDA_GUI_events_code.c,417 :: 		for(x1=0;x1<TrainPicture;x1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,418 :: 		temp2 = temp2 + V[x1][y1]*MTemp[x1];
IT	AL
BAL	L_PCA_TEST_START173
L_PCA_TEST_START174:
;PCA_FLDA_GUI_events_code.c,419 :: 		ProjectedTestImage[y1] = temp2;}
MOVW	R2, #lo_addr(_y1+0)
MOVT	R2, #hi_addr(_y1+0)
LDR	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_ProjectedTestImage+0)
MOVT	R0, #hi_addr(_ProjectedTestImage+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_temp2+0)
MOVT	R0, #hi_addr(_temp2+0)
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,415 :: 		for(y1=0;y1<N;y1++){      // ProjectedTestImage (50x1) = (V)' * MTemp
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,419 :: 		ProjectedTestImage[y1] = temp2;}
IT	AL
BAL	L_PCA_TEST_START170
L_PCA_TEST_START171:
;PCA_FLDA_GUI_events_code.c,421 :: 		EpsilonK = 1e+5;             //ClassNorm bulunmasý
MOVW	R0, #20480
MOVT	R0, #18371
VMOV	S0, R0
MOVW	R0, #lo_addr(_EpsilonK+0)
MOVT	R0, #hi_addr(_EpsilonK+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,422 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_PCA_TEST_START176:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_PCA_TEST_START177
;PCA_FLDA_GUI_events_code.c,423 :: 		temp4 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,424 :: 		for(x1=0;x1<N;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_PCA_TEST_START179:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_PCA_TEST_START180
;PCA_FLDA_GUI_events_code.c,425 :: 		temp4 = temp4 + (L[x1][y1] - ProjectedTestImage[x1])*(L[x1][y1] - ProjectedTestImage[x1]);
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
;PCA_FLDA_GUI_events_code.c,424 :: 		for(x1=0;x1<N;x1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,425 :: 		temp4 = temp4 + (L[x1][y1] - ProjectedTestImage[x1])*(L[x1][y1] - ProjectedTestImage[x1]);
IT	AL
BAL	L_PCA_TEST_START179
L_PCA_TEST_START180:
;PCA_FLDA_GUI_events_code.c,426 :: 		temp4 = sqrt(temp4);
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,427 :: 		if (temp4 < EpsilonK) {
MOVW	R0, #lo_addr(_EpsilonK+0)
MOVT	R0, #hi_addr(_EpsilonK+0)
VLDR	#1, S1, [R0, #0]
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	GE
BGE	L_PCA_TEST_START182
;PCA_FLDA_GUI_events_code.c,428 :: 		EpsilonK = temp4;
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_EpsilonK+0)
MOVT	R0, #hi_addr(_EpsilonK+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,429 :: 		WhoseEar = y1;}}
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_WhoseEar+0)
MOVT	R0, #hi_addr(_WhoseEar+0)
STR	R1, [R0, #0]
L_PCA_TEST_START182:
;PCA_FLDA_GUI_events_code.c,422 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,429 :: 		WhoseEar = y1;}}
IT	AL
BAL	L_PCA_TEST_START176
L_PCA_TEST_START177:
;PCA_FLDA_GUI_events_code.c,432 :: 		NormFault = NormFault + (EpsilonK - PCA_ORJ[jj-100])*(EpsilonK - PCA_ORJ[jj-100]);
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
SUBS	R0, #100
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_PCA_ORJ+0)
MOVT	R0, #hi_addr(_PCA_ORJ+0)
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
;PCA_FLDA_GUI_events_code.c,435 :: 		if (EpsilonK < PCA_TetaC) {
MOVW	R0, #lo_addr(_PCA_TetaC+0)
MOVT	R0, #hi_addr(_PCA_TetaC+0)
VLDR	#1, S1, [R0, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	GE
BGE	L_PCA_TEST_START183
;PCA_FLDA_GUI_events_code.c,436 :: 		if (jj<120) accuracy += 2;
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
CMP	R0, #120
IT	CS
BCS	L_PCA_TEST_START184
MOVW	R1, #lo_addr(_accuracy+0)
MOVT	R1, #hi_addr(_accuracy+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #2
STRH	R0, [R1, #0]
L_PCA_TEST_START184:
;PCA_FLDA_GUI_events_code.c,437 :: 		TFT_Write_Text("This picture is ear", 30, 160);
MOVW	R0, #lo_addr(?lstr14_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr14_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #160
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,438 :: 		TFT_Write_Text("The ear is in the database", 30, 180);
MOVW	R0, #lo_addr(?lstr15_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr15_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #180
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,439 :: 		TFT_Write_Text("EpsilonK", 30, 200);
MOVW	R0, #lo_addr(?lstr16_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr16_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #200
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,440 :: 		FloatToStr(EpsilonK ,txt2);
MOVW	R0, #lo_addr(_EpsilonK+0)
MOVT	R0, #hi_addr(_EpsilonK+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_txt2+0)
MOVT	R0, #hi_addr(_txt2+0)
BL	_FloatToStr+0
;PCA_FLDA_GUI_events_code.c,441 :: 		TFT_Write_Text(txt2,100,200);
MOVS	R2, #200
MOVS	R1, #100
MOVW	R0, #lo_addr(_txt2+0)
MOVT	R0, #hi_addr(_txt2+0)
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,442 :: 		ii = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,443 :: 		for(y1=0;y1<col;y1++){  // "WhoseEar" siyah beyaz yazdýrma
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_PCA_TEST_START185:
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_PCA_TEST_START186
;PCA_FLDA_GUI_events_code.c,444 :: 		for(x1=0;x1<row;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_PCA_TEST_START188:
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_PCA_TEST_START189
;PCA_FLDA_GUI_events_code.c,445 :: 		temp5 = TFT_RGBToColor16bit(Ear[WhoseEar*row*col+ii], Ear[WhoseEar*row*col+ii], Ear[WhoseEar*row*col+ii]);
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
;PCA_FLDA_GUI_events_code.c,446 :: 		TFT_Dot(x1+130, y1+60, temp5);
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
;PCA_FLDA_GUI_events_code.c,447 :: 		ii = ii + 1;}}
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,444 :: 		for(x1=0;x1<row;x1++){
LDR	R1, [SP, #4]
MOV	R0, R1
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,447 :: 		ii = ii + 1;}}
IT	AL
BAL	L_PCA_TEST_START188
L_PCA_TEST_START189:
;PCA_FLDA_GUI_events_code.c,443 :: 		for(y1=0;y1<col;y1++){  // "WhoseEar" siyah beyaz yazdýrma
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,447 :: 		ii = ii + 1;}}
IT	AL
BAL	L_PCA_TEST_START185
L_PCA_TEST_START186:
;PCA_FLDA_GUI_events_code.c,448 :: 		}
IT	AL
BAL	L_PCA_TEST_START191
L_PCA_TEST_START183:
;PCA_FLDA_GUI_events_code.c,450 :: 		if (jj>=120) accuracy += 2;
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
CMP	R0, #120
IT	CC
BCC	L_PCA_TEST_START192
MOVW	R1, #lo_addr(_accuracy+0)
MOVT	R1, #hi_addr(_accuracy+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #2
STRH	R0, [R1, #0]
L_PCA_TEST_START192:
;PCA_FLDA_GUI_events_code.c,451 :: 		TFT_Write_Text("This is not in the database", 30, 180);
MOVW	R0, #lo_addr(?lstr17_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr17_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #180
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,452 :: 		TFT_Write_Text("EpsilonK", 30, 200);
MOVW	R0, #lo_addr(?lstr18_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr18_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #200
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,453 :: 		FloatToStr(EpsilonK ,txt2);
MOVW	R0, #lo_addr(_EpsilonK+0)
MOVT	R0, #hi_addr(_EpsilonK+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_txt2+0)
MOVT	R0, #hi_addr(_txt2+0)
BL	_FloatToStr+0
;PCA_FLDA_GUI_events_code.c,454 :: 		TFT_Write_Text(txt2,100,200);
MOVS	R2, #200
MOVS	R1, #100
MOVW	R0, #lo_addr(_txt2+0)
MOVT	R0, #hi_addr(_txt2+0)
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,455 :: 		}
L_PCA_TEST_START191:
;PCA_FLDA_GUI_events_code.c,456 :: 		Delay_ms(1);
MOVW	R7, #55998
MOVT	R7, #0
NOP
NOP
L_PCA_TEST_START193:
SUBS	R7, R7, #1
BNE	L_PCA_TEST_START193
NOP
NOP
NOP
;PCA_FLDA_GUI_events_code.c,457 :: 		DrawScreen(&Screen9);
MOVW	R0, #lo_addr(_Screen9+0)
MOVT	R0, #hi_addr(_Screen9+0)
BL	_DrawScreen+0
;PCA_FLDA_GUI_events_code.c,395 :: 		for(jj=100;jj<TestPicture+100;jj++) {      //TestPicture  = jj
MOVW	R1, #lo_addr(_jj+0)
MOVT	R1, #hi_addr(_jj+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,459 :: 		}
IT	AL
BAL	L_PCA_TEST_START155
L_PCA_TEST_START156:
;PCA_FLDA_GUI_events_code.c,460 :: 		NormFault = (100*sqrt(NormFault))/(1.296512347478959e+04);
MOVW	R0, #lo_addr(_NormFault+0)
MOVT	R0, #hi_addr(_NormFault+0)
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S1, S1, S0
MOVW	R0, #38014
MOVT	R0, #17994
VMOV	S0, R0
VDIV.F32	S0, S1, S0
MOVW	R0, #lo_addr(_NormFault+0)
MOVT	R0, #hi_addr(_NormFault+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,461 :: 		ProgressBar1.Position = accuracy+1;
MOVW	R0, #lo_addr(_accuracy+0)
MOVT	R0, #hi_addr(_accuracy+0)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_ProgressBar1+48)
MOVT	R0, #hi_addr(_ProgressBar1+48)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,462 :: 		DrawScreen(&Screen10);
MOVW	R0, #lo_addr(_Screen10+0)
MOVT	R0, #hi_addr(_Screen10+0)
BL	_DrawScreen+0
;PCA_FLDA_GUI_events_code.c,463 :: 		TFT_Write_Text("iteration = >",10,60);
MOVW	R0, #lo_addr(?lstr19_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr19_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #60
MOVS	R1, #10
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,464 :: 		IntToStr(iteration,txt1);
MOVW	R0, #lo_addr(_iteration+0)
MOVT	R0, #hi_addr(_iteration+0)
LDRH	R0, [R0, #0]
MOVW	R1, #lo_addr(_txt1+0)
MOVT	R1, #hi_addr(_txt1+0)
BL	_IntToStr+0
;PCA_FLDA_GUI_events_code.c,465 :: 		TFT_Write_Text(txt1,120,60);
MOVS	R2, #60
MOVS	R1, #120
MOVW	R0, #lo_addr(_txt1+0)
MOVT	R0, #hi_addr(_txt1+0)
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,466 :: 		TFT_Write_Text("Norm Fault = >",10,100);
MOVW	R0, #lo_addr(?lstr20_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr20_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #100
MOVS	R1, #10
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,467 :: 		FloatToStr(NormFault,txt2);
MOVW	R0, #lo_addr(_NormFault+0)
MOVT	R0, #hi_addr(_NormFault+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_txt2+0)
MOVT	R0, #hi_addr(_txt2+0)
BL	_FloatToStr+0
;PCA_FLDA_GUI_events_code.c,468 :: 		TFT_Write_Text(txt2,120,100);
MOVS	R2, #100
MOVS	R1, #120
MOVW	R0, #lo_addr(_txt2+0)
MOVT	R0, #hi_addr(_txt2+0)
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,470 :: 		}
L_end_PCA_TEST_START:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _PCA_TEST_START
_PCA_RESULTS_MAIN:
;PCA_FLDA_GUI_events_code.c,472 :: 		void PCA_RESULTS_MAIN() {    //SCREEN-10
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PCA_FLDA_GUI_events_code.c,473 :: 		DrawScreen(&Screen1);
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;PCA_FLDA_GUI_events_code.c,474 :: 		}
L_end_PCA_RESULTS_MAIN:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _PCA_RESULTS_MAIN
_FLDA_PART_1_START:
;PCA_FLDA_GUI_events_code.c,476 :: 		void FLDA_PART_1_START() {   //SCREEN-11
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PCA_FLDA_GUI_events_code.c,477 :: 		DrawScreen(&Screen12);
MOVW	R0, #lo_addr(_Screen12+0)
MOVT	R0, #hi_addr(_Screen12+0)
BL	_DrawScreen+0
;PCA_FLDA_GUI_events_code.c,478 :: 		projected_images_find ();
BL	_projected_images_find+0
;PCA_FLDA_GUI_events_code.c,479 :: 		DrawScreen(&Screen13);
MOVW	R0, #lo_addr(_Screen13+0)
MOVT	R0, #hi_addr(_Screen13+0)
BL	_DrawScreen+0
;PCA_FLDA_GUI_events_code.c,480 :: 		}
L_end_FLDA_PART_1_START:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FLDA_PART_1_START
_FLDA_PART_2_START:
;PCA_FLDA_GUI_events_code.c,482 :: 		void FLDA_PART_2_START() {    //SCREEN-13
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PCA_FLDA_GUI_events_code.c,483 :: 		DrawScreen(&Screen14);
MOVW	R0, #lo_addr(_Screen14+0)
MOVT	R0, #hi_addr(_Screen14+0)
BL	_DrawScreen+0
;PCA_FLDA_GUI_events_code.c,484 :: 		}
L_end_FLDA_PART_2_START:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FLDA_PART_2_START
_QR2_10:
;PCA_FLDA_GUI_events_code.c,485 :: 		void QR2_10() {           //SCREEN-14
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PCA_FLDA_GUI_events_code.c,486 :: 		QR_iteration = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_QR_iteration+0)
MOVT	R0, #hi_addr(_QR_iteration+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,487 :: 		DrawScreen(&Screen15);
MOVW	R0, #lo_addr(_Screen15+0)
MOVT	R0, #hi_addr(_Screen15+0)
BL	_DrawScreen+0
;PCA_FLDA_GUI_events_code.c,488 :: 		}
L_end_QR2_10:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _QR2_10
_QR2_15:
;PCA_FLDA_GUI_events_code.c,490 :: 		void QR2_15() {           //SCREEN-14
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PCA_FLDA_GUI_events_code.c,491 :: 		QR_iteration = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_QR_iteration+0)
MOVT	R0, #hi_addr(_QR_iteration+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,492 :: 		DrawScreen(&Screen15);
MOVW	R0, #lo_addr(_Screen15+0)
MOVT	R0, #hi_addr(_Screen15+0)
BL	_DrawScreen+0
;PCA_FLDA_GUI_events_code.c,493 :: 		}
L_end_QR2_15:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _QR2_15
_QR2_25:
;PCA_FLDA_GUI_events_code.c,495 :: 		void QR2_25() {          //SCREEN-14
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PCA_FLDA_GUI_events_code.c,496 :: 		QR_iteration = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_QR_iteration+0)
MOVT	R0, #hi_addr(_QR_iteration+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,497 :: 		DrawScreen(&Screen15);
MOVW	R0, #lo_addr(_Screen15+0)
MOVT	R0, #hi_addr(_Screen15+0)
BL	_DrawScreen+0
;PCA_FLDA_GUI_events_code.c,498 :: 		}
L_end_QR2_25:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _QR2_25
_QR2_50:
;PCA_FLDA_GUI_events_code.c,500 :: 		void QR2_50() {           //SCREEN-14
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PCA_FLDA_GUI_events_code.c,501 :: 		QR_iteration = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_QR_iteration+0)
MOVT	R0, #hi_addr(_QR_iteration+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,502 :: 		DrawScreen(&Screen15);
MOVW	R0, #lo_addr(_Screen15+0)
MOVT	R0, #hi_addr(_Screen15+0)
BL	_DrawScreen+0
;PCA_FLDA_GUI_events_code.c,503 :: 		}
L_end_QR2_50:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _QR2_50
_QR2_75:
;PCA_FLDA_GUI_events_code.c,505 :: 		void QR2_75() {          //SCREEN-14
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PCA_FLDA_GUI_events_code.c,506 :: 		QR_iteration = 75;
MOVS	R1, #75
MOVW	R0, #lo_addr(_QR_iteration+0)
MOVT	R0, #hi_addr(_QR_iteration+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,507 :: 		DrawScreen(&Screen15);
MOVW	R0, #lo_addr(_Screen15+0)
MOVT	R0, #hi_addr(_Screen15+0)
BL	_DrawScreen+0
;PCA_FLDA_GUI_events_code.c,508 :: 		}
L_end_QR2_75:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _QR2_75
_QR2_100:
;PCA_FLDA_GUI_events_code.c,510 :: 		void QR2_100() {        //SCREEN-14
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PCA_FLDA_GUI_events_code.c,511 :: 		QR_iteration = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_QR_iteration+0)
MOVT	R0, #hi_addr(_QR_iteration+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,512 :: 		DrawScreen(&Screen15);
MOVW	R0, #lo_addr(_Screen15+0)
MOVT	R0, #hi_addr(_Screen15+0)
BL	_DrawScreen+0
;PCA_FLDA_GUI_events_code.c,513 :: 		}
L_end_QR2_100:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _QR2_100
_FLDA_CONTINUE:
;PCA_FLDA_GUI_events_code.c,515 :: 		void FLDA_CONTINUE() {    //SCREEN-15
SUB	SP, SP, #8
STR	LR, [SP, #0]
;PCA_FLDA_GUI_events_code.c,516 :: 		DrawScreen(&Screen16);
MOVW	R0, #lo_addr(_Screen16+0)
MOVT	R0, #hi_addr(_Screen16+0)
BL	_DrawScreen+0
;PCA_FLDA_GUI_events_code.c,517 :: 		TFT_Write_Text("Sw ?", 30, 50);
MOVW	R0, #lo_addr(?lstr21_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr21_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #50
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,519 :: 		for(ii=0;ii<ClassNumber;ii++){ // m_ort = row*col x 1
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE195:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE196
;PCA_FLDA_GUI_events_code.c,521 :: 		for(x1=0;x1<N;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE198:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE199
;PCA_FLDA_GUI_events_code.c,522 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,523 :: 		for(y1=ii*ClassPopulation;y1<(ii+1)*ClassPopulation;y1++)
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
L_FLDA_CONTINUE201:
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
BCS	L_FLDA_CONTINUE202
;PCA_FLDA_GUI_events_code.c,524 :: 		temp1 = temp1 + L[x1][y1];
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
;PCA_FLDA_GUI_events_code.c,523 :: 		for(y1=ii*ClassPopulation;y1<(ii+1)*ClassPopulation;y1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,524 :: 		temp1 = temp1 + L[x1][y1];
IT	AL
BAL	L_FLDA_CONTINUE201
L_FLDA_CONTINUE202:
;PCA_FLDA_GUI_events_code.c,525 :: 		GTemp[x1] = temp1/ClassPopulation;}
MOVW	R3, #lo_addr(_x1+0)
MOVT	R3, #hi_addr(_x1+0)
LDR	R0, [R3, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R2, R0, R1
MOVW	R0, #lo_addr(_ClassPopulation+0)
MOVT	R0, #hi_addr(_ClassPopulation+0)
VLDR	#1, S0, [R0, #0]
VCVT.F32	#0, S1, S0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VDIV.F32	S0, S0, S1
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,521 :: 		for(x1=0;x1<N;x1++){
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,525 :: 		GTemp[x1] = temp1/ClassPopulation;}
IT	AL
BAL	L_FLDA_CONTINUE198
L_FLDA_CONTINUE199:
;PCA_FLDA_GUI_events_code.c,527 :: 		for(y1=0;y1<N;y1++)      //  V[x1][y1+50] sýfýrlandý
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE204:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE205
;PCA_FLDA_GUI_events_code.c,528 :: 		for(x1=0;x1<N;x1++) V[x1][y1+50] = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE207:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE208
MOVW	R2, #lo_addr(_x1+0)
MOVT	R2, #hi_addr(_x1+0)
LDR	R1, [R2, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
ADDS	R0, #50
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
IT	AL
BAL	L_FLDA_CONTINUE207
L_FLDA_CONTINUE208:
;PCA_FLDA_GUI_events_code.c,527 :: 		for(y1=0;y1<N;y1++)      //  V[x1][y1+50] sýfýrlandý
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,528 :: 		for(x1=0;x1<N;x1++) V[x1][y1+50] = 0;
IT	AL
BAL	L_FLDA_CONTINUE204
L_FLDA_CONTINUE205:
;PCA_FLDA_GUI_events_code.c,530 :: 		for(y1=ii*ClassPopulation;y1<(ii+1)*ClassPopulation;y1++){
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
L_FLDA_CONTINUE210:
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
BCS	L_FLDA_CONTINUE211
;PCA_FLDA_GUI_events_code.c,531 :: 		for(z1=0;z1<N;z1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE213:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE214
;PCA_FLDA_GUI_events_code.c,532 :: 		for(x1=0;x1<N;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE216:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE217
;PCA_FLDA_GUI_events_code.c,533 :: 		V[x1][z1+50] =  V[x1][z1+50]  + (L[x1][y1]-GTemp[x1])*(L[z1][y1]-GTemp[x1]); }}
MOVW	R5, #lo_addr(_x1+0)
MOVT	R5, #hi_addr(_x1+0)
LDR	R1, [R5, #0]
MOVW	R0, #400
MUL	R2, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R2
MOVW	R4, #lo_addr(_z1+0)
MOVT	R4, #hi_addr(_z1+0)
LDR	R0, [R4, #0]
ADDS	R0, #50
LSLS	R0, R0, #2
ADDS	R3, R1, R0
VLDR	#1, S3, [R3, #0]
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R2
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R2, R0, #2
ADDS	R0, R1, R2
VLDR	#1, S0, [R0, #0]
MOV	R0, R5
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R0, R0, R1
VLDR	#1, S2, [R0, #0]
VSUB.F32	S1, S0, S2
MOV	R0, R4
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R0, R0, R1
ADDS	R0, R0, R2
VLDR	#1, S0, [R0, #0]
VSUB.F32	S0, S0, S2
VMUL.F32	S0, S1, S0
VADD.F32	S0, S3, S0
VSTR	#1, S0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,532 :: 		for(x1=0;x1<N;x1++)
MOV	R0, R5
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R5, #0]
;PCA_FLDA_GUI_events_code.c,533 :: 		V[x1][z1+50] =  V[x1][z1+50]  + (L[x1][y1]-GTemp[x1])*(L[z1][y1]-GTemp[x1]); }}
IT	AL
BAL	L_FLDA_CONTINUE216
L_FLDA_CONTINUE217:
;PCA_FLDA_GUI_events_code.c,531 :: 		for(z1=0;z1<N;z1++){
MOVW	R1, #lo_addr(_z1+0)
MOVT	R1, #hi_addr(_z1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,533 :: 		V[x1][z1+50] =  V[x1][z1+50]  + (L[x1][y1]-GTemp[x1])*(L[z1][y1]-GTemp[x1]); }}
IT	AL
BAL	L_FLDA_CONTINUE213
L_FLDA_CONTINUE214:
;PCA_FLDA_GUI_events_code.c,530 :: 		for(y1=ii*ClassPopulation;y1<(ii+1)*ClassPopulation;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,533 :: 		V[x1][z1+50] =  V[x1][z1+50]  + (L[x1][y1]-GTemp[x1])*(L[z1][y1]-GTemp[x1]); }}
IT	AL
BAL	L_FLDA_CONTINUE210
L_FLDA_CONTINUE211:
;PCA_FLDA_GUI_events_code.c,535 :: 		for(y1=0;y1<N;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE219:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE220
;PCA_FLDA_GUI_events_code.c,536 :: 		for(x1=0;x1<N;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE222:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE223
;PCA_FLDA_GUI_events_code.c,537 :: 		SS[x1][y1] = SS[x1][y1] + V[x1][y1+50];}  }     // Sw 50x50
MOVW	R4, #lo_addr(_x1+0)
MOVT	R4, #hi_addr(_x1+0)
LDR	R1, [R4, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SS+0)
MOVT	R0, #hi_addr(_SS+0)
ADDS	R1, R0, R1
MOVW	R3, #lo_addr(_y1+0)
MOVT	R3, #hi_addr(_y1+0)
LDR	R0, [R3, #0]
LSLS	R0, R0, #2
ADDS	R2, R1, R0
VLDR	#1, S1, [R2, #0]
MOV	R0, R4
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, #50
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,536 :: 		for(x1=0;x1<N;x1++)
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;PCA_FLDA_GUI_events_code.c,537 :: 		SS[x1][y1] = SS[x1][y1] + V[x1][y1+50];}  }     // Sw 50x50
IT	AL
BAL	L_FLDA_CONTINUE222
L_FLDA_CONTINUE223:
;PCA_FLDA_GUI_events_code.c,535 :: 		for(y1=0;y1<N;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,537 :: 		SS[x1][y1] = SS[x1][y1] + V[x1][y1+50];}  }     // Sw 50x50
IT	AL
BAL	L_FLDA_CONTINUE219
L_FLDA_CONTINUE220:
;PCA_FLDA_GUI_events_code.c,519 :: 		for(ii=0;ii<ClassNumber;ii++){ // m_ort = row*col x 1
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,537 :: 		SS[x1][y1] = SS[x1][y1] + V[x1][y1+50];}  }     // Sw 50x50
IT	AL
BAL	L_FLDA_CONTINUE195
L_FLDA_CONTINUE196:
;PCA_FLDA_GUI_events_code.c,539 :: 		TFT_Write_Text("Sw OK", 30, 70);
MOVW	R0, #lo_addr(?lstr22_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr22_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #70
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,540 :: 		TFT_Write_Text("inv(Sw) ?", 30, 90);
MOVW	R0, #lo_addr(?lstr23_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr23_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #90
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,542 :: 		for(ii=0;ii<TrainPicture;ii++)   {GTemp[ii]= 0;  MTemp[ii] = 0; }
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE225:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE226
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
BAL	L_FLDA_CONTINUE225
L_FLDA_CONTINUE226:
;PCA_FLDA_GUI_events_code.c,543 :: 		for(ii=0;ii<N;ii++) BTemp[ii] = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE228:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE229
MOVW	R2, #lo_addr(_ii+0)
MOVT	R2, #hi_addr(_ii+0)
LDR	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_BTemp+0)
MOVT	R0, #hi_addr(_BTemp+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STR	R0, [R1, #0]
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
IT	AL
BAL	L_FLDA_CONTINUE228
L_FLDA_CONTINUE229:
;PCA_FLDA_GUI_events_code.c,544 :: 		for(ii=0;ii<N;ii++) RTemp[ii] = ii;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE231:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE232
MOVW	R2, #lo_addr(_ii+0)
MOVT	R2, #hi_addr(_ii+0)
LDR	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_RTemp+0)
MOVT	R0, #hi_addr(_RTemp+0)
ADDS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
STR	R0, [R1, #0]
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
IT	AL
BAL	L_FLDA_CONTINUE231
L_FLDA_CONTINUE232:
;PCA_FLDA_GUI_events_code.c,546 :: 		for(p=0;p<(N-1);p++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE234:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE235
;PCA_FLDA_GUI_events_code.c,548 :: 		temp1 = 0;      //en büyük deðer bulma pivot
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,549 :: 		for(x1=p;x1<N;x1++){
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE237:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE238
;PCA_FLDA_GUI_events_code.c,550 :: 		if (fabs(SS[x1][p]) > temp1) {
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SS+0)
MOVT	R0, #hi_addr(_SS+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
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
BLE	L_FLDA_CONTINUE240
;PCA_FLDA_GUI_events_code.c,551 :: 		temp1 = fabs(SS[x1][p]);
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R0, [SP, #4]
LDR	R1, [R0, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SS+0)
MOVT	R0, #hi_addr(_SS+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
BL	_fabs+0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,552 :: 		jj=x1;}}
LDR	R0, [SP, #4]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE240:
;PCA_FLDA_GUI_events_code.c,549 :: 		for(x1=p;x1<N;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,552 :: 		jj=x1;}}
IT	AL
BAL	L_FLDA_CONTINUE237
L_FLDA_CONTINUE238:
;PCA_FLDA_GUI_events_code.c,554 :: 		for(ii=0;ii<N;ii++){   //row changing
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE241:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE242
;PCA_FLDA_GUI_events_code.c,555 :: 		temp2 = SS[p][ii];
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
LDR	R1, [R0, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SS+0)
MOVT	R0, #hi_addr(_SS+0)
ADDS	R1, R0, R1
MOVW	R6, #lo_addr(_ii+0)
MOVT	R6, #hi_addr(_ii+0)
LDR	R0, [R6, #0]
LSLS	R5, R0, #2
ADDS	R0, R1, R5
VLDR	#1, S0, [R0, #0]
MOVW	R4, #lo_addr(_temp2+0)
MOVT	R4, #hi_addr(_temp2+0)
VSTR	#1, S0, [R4, #0]
;PCA_FLDA_GUI_events_code.c,556 :: 		SS[p][ii] = SS[jj][ii];
MOV	R3, R0
MOVW	R2, #lo_addr(_jj+0)
MOVT	R2, #hi_addr(_jj+0)
LDR	R1, [R2, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SS+0)
MOVT	R0, #hi_addr(_SS+0)
ADDS	R0, R0, R1
ADDS	R0, R0, R5
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,557 :: 		SS[jj][ii] = temp2;}
MOV	R0, R2
LDR	R1, [R0, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SS+0)
MOVT	R0, #hi_addr(_SS+0)
ADDS	R1, R0, R1
MOV	R0, R6
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, R4
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,554 :: 		for(ii=0;ii<N;ii++){   //row changing
MOV	R0, R6
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R6, #0]
;PCA_FLDA_GUI_events_code.c,557 :: 		SS[jj][ii] = temp2;}
IT	AL
BAL	L_FLDA_CONTINUE241
L_FLDA_CONTINUE242:
;PCA_FLDA_GUI_events_code.c,559 :: 		mm = RTemp[p];
MOVW	R5, #lo_addr(_p+0)
MOVT	R5, #hi_addr(_p+0)
LDR	R0, [R5, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_RTemp+0)
MOVT	R0, #hi_addr(_RTemp+0)
ADDS	R4, R0, R1
LDR	R0, [R4, #0]
MOVW	R3, #lo_addr(_mm+0)
MOVT	R3, #hi_addr(_mm+0)
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,560 :: 		RTemp[p] = RTemp[jj];
MOVW	R2, #lo_addr(_jj+0)
MOVT	R2, #hi_addr(_jj+0)
LDR	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_RTemp+0)
MOVT	R0, #hi_addr(_RTemp+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
STR	R0, [R4, #0]
;PCA_FLDA_GUI_events_code.c,561 :: 		RTemp[jj] = mm;
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_RTemp+0)
MOVT	R0, #hi_addr(_RTemp+0)
ADDS	R1, R0, R1
MOV	R0, R3
LDR	R0, [R0, #0]
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,563 :: 		for (kk=(p+1);kk<N;kk++){
MOV	R0, R5
LDR	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE244:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE245
;PCA_FLDA_GUI_events_code.c,564 :: 		temp3 = SS[kk][p]/SS[p][p];
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R1, [R0, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SS+0)
MOVT	R0, #hi_addr(_SS+0)
ADDS	R1, R0, R1
MOVW	R4, #lo_addr(_p+0)
MOVT	R4, #hi_addr(_p+0)
LDR	R0, [R4, #0]
LSLS	R3, R0, #2
ADDS	R2, R1, R3
VLDR	#1, S1, [R2, #0]
MOV	R0, R4
LDR	R1, [R0, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SS+0)
MOVT	R0, #hi_addr(_SS+0)
ADDS	R0, R0, R1
ADDS	R0, R0, R3
VLDR	#1, S0, [R0, #0]
VDIV.F32	S0, S1, S0
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,565 :: 		SS[kk][p] = temp3;
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,566 :: 		for(ii=(p+1);ii<N;ii++)
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE247:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE248
;PCA_FLDA_GUI_events_code.c,567 :: 		SS[kk][ii] = SS[kk][ii] - temp3*SS[p][ii]; }
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R1, [R0, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SS+0)
MOVT	R0, #hi_addr(_SS+0)
ADDS	R1, R0, R1
MOVW	R4, #lo_addr(_ii+0)
MOVT	R4, #hi_addr(_ii+0)
LDR	R0, [R4, #0]
LSLS	R3, R0, #2
ADDS	R2, R1, R3
VLDR	#1, S2, [R2, #0]
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
LDR	R1, [R0, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SS+0)
MOVT	R0, #hi_addr(_SS+0)
ADDS	R0, R0, R1
ADDS	R0, R0, R3
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSUB.F32	S0, S2, S0
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,566 :: 		for(ii=(p+1);ii<N;ii++)
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;PCA_FLDA_GUI_events_code.c,567 :: 		SS[kk][ii] = SS[kk][ii] - temp3*SS[p][ii]; }
IT	AL
BAL	L_FLDA_CONTINUE247
L_FLDA_CONTINUE248:
;PCA_FLDA_GUI_events_code.c,563 :: 		for (kk=(p+1);kk<N;kk++){
MOVW	R1, #lo_addr(_kk+0)
MOVT	R1, #hi_addr(_kk+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,567 :: 		SS[kk][ii] = SS[kk][ii] - temp3*SS[p][ii]; }
IT	AL
BAL	L_FLDA_CONTINUE244
L_FLDA_CONTINUE245:
;PCA_FLDA_GUI_events_code.c,546 :: 		for(p=0;p<(N-1);p++){
MOVW	R1, #lo_addr(_p+0)
MOVT	R1, #hi_addr(_p+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,568 :: 		}
IT	AL
BAL	L_FLDA_CONTINUE234
L_FLDA_CONTINUE235:
;PCA_FLDA_GUI_events_code.c,569 :: 		x1 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,570 :: 		for(jj=0;jj<N;jj++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE250:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE251
;PCA_FLDA_GUI_events_code.c,572 :: 		for(ii=0;ii<TrainPicture;ii++) {GTemp[ii]= 0;  MTemp[ii] = 0;}
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE253:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE254
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
BAL	L_FLDA_CONTINUE253
L_FLDA_CONTINUE254:
;PCA_FLDA_GUI_events_code.c,574 :: 		for(ii=0;ii<N;ii++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE256:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE257
;PCA_FLDA_GUI_events_code.c,575 :: 		if (x1 == ii) BTemp[ii] = 1;
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_FLDA_CONTINUE259
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_BTemp+0)
MOVT	R0, #hi_addr(_BTemp+0)
ADDS	R1, R0, R1
MOVS	R0, #1
STR	R0, [R1, #0]
IT	AL
BAL	L_FLDA_CONTINUE260
L_FLDA_CONTINUE259:
;PCA_FLDA_GUI_events_code.c,576 :: 		else  BTemp[ii] = 0;}
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_BTemp+0)
MOVT	R0, #hi_addr(_BTemp+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STR	R0, [R1, #0]
L_FLDA_CONTINUE260:
;PCA_FLDA_GUI_events_code.c,574 :: 		for(ii=0;ii<N;ii++){
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,576 :: 		else  BTemp[ii] = 0;}
IT	AL
BAL	L_FLDA_CONTINUE256
L_FLDA_CONTINUE257:
;PCA_FLDA_GUI_events_code.c,579 :: 		mm = RTemp[0];
MOVW	R2, #lo_addr(_RTemp+0)
MOVT	R2, #hi_addr(_RTemp+0)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_mm+0)
MOVT	R0, #hi_addr(_mm+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,580 :: 		MTemp[0] =  BTemp[mm];
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_BTemp+0)
MOVT	R0, #hi_addr(_BTemp+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
VMOV	S0, R0
VCVT.F32	#1, S0, S0
MOVW	R0, #lo_addr(_MTemp+0)
MOVT	R0, #hi_addr(_MTemp+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,581 :: 		for (kk=1;kk<N;kk++){
MOVS	R1, #1
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE261:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE262
;PCA_FLDA_GUI_events_code.c,582 :: 		temp4 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,583 :: 		for (z1=0;z1<(kk);z1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE264:
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE265
;PCA_FLDA_GUI_events_code.c,584 :: 		temp4 = temp4 + SS[kk][z1]*MTemp[z1];
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R1, [R0, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SS+0)
MOVT	R0, #hi_addr(_SS+0)
ADDS	R2, R0, R1
MOVW	R3, #lo_addr(_z1+0)
MOVT	R3, #hi_addr(_z1+0)
LDR	R0, [R3, #0]
LSLS	R1, R0, #2
ADDS	R2, R2, R1
MOVW	R0, #lo_addr(_MTemp+0)
MOVT	R0, #hi_addr(_MTemp+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R2, #0]
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,583 :: 		for (z1=0;z1<(kk);z1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,584 :: 		temp4 = temp4 + SS[kk][z1]*MTemp[z1];
IT	AL
BAL	L_FLDA_CONTINUE264
L_FLDA_CONTINUE265:
;PCA_FLDA_GUI_events_code.c,585 :: 		mm = RTemp[kk];
MOVW	R3, #lo_addr(_kk+0)
MOVT	R3, #hi_addr(_kk+0)
LDR	R0, [R3, #0]
LSLS	R2, R0, #2
MOVW	R0, #lo_addr(_RTemp+0)
MOVT	R0, #hi_addr(_RTemp+0)
ADDS	R0, R0, R2
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_mm+0)
MOVT	R0, #hi_addr(_mm+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,586 :: 		MTemp[kk] =  BTemp[mm] - temp4;}
MOVW	R0, #lo_addr(_MTemp+0)
MOVT	R0, #hi_addr(_MTemp+0)
ADDS	R2, R0, R2
LSLS	R1, R1, #2
MOVW	R0, #lo_addr(_BTemp+0)
MOVT	R0, #hi_addr(_BTemp+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
VMOV	S1, R0
VCVT.F32	#1, S1, S1
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VLDR	#1, S0, [R0, #0]
VSUB.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,581 :: 		for (kk=1;kk<N;kk++){
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,586 :: 		MTemp[kk] =  BTemp[mm] - temp4;}
IT	AL
BAL	L_FLDA_CONTINUE261
L_FLDA_CONTINUE262:
;PCA_FLDA_GUI_events_code.c,589 :: 		GTemp[N-1] = MTemp[N-1]/SS[N-1][N-1];
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
LSLS	R3, R1, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R2, R0, R3
MOVW	R0, #lo_addr(_MTemp+0)
MOVT	R0, #hi_addr(_MTemp+0)
ADDS	R0, R0, R3
VLDR	#1, S1, [R0, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SS+0)
MOVT	R0, #hi_addr(_SS+0)
ADDS	R0, R0, R1
ADDS	R0, R0, R3
VLDR	#1, S0, [R0, #0]
VDIV.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,590 :: 		for (kk=0;kk<(N-1);kk++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE267:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE268
;PCA_FLDA_GUI_events_code.c,591 :: 		temp5 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp5+0)
MOVT	R0, #hi_addr(_temp5+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,592 :: 		for (z1=(N-1-kk);z1<N;z1++)
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
SUB	R1, R1, R0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE270:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE271
;PCA_FLDA_GUI_events_code.c,593 :: 		temp5 = temp5 + SS[N-2-kk][z1]*GTemp[z1];
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #2
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
SUB	R1, R1, R0
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SS+0)
MOVT	R0, #hi_addr(_SS+0)
ADDS	R2, R0, R1
MOVW	R3, #lo_addr(_z1+0)
MOVT	R3, #hi_addr(_z1+0)
LDR	R0, [R3, #0]
LSLS	R1, R0, #2
ADDS	R2, R2, R1
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R2, #0]
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_temp5+0)
MOVT	R0, #hi_addr(_temp5+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,592 :: 		for (z1=(N-1-kk);z1<N;z1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,593 :: 		temp5 = temp5 + SS[N-2-kk][z1]*GTemp[z1];
IT	AL
BAL	L_FLDA_CONTINUE270
L_FLDA_CONTINUE271:
;PCA_FLDA_GUI_events_code.c,594 :: 		GTemp[N-2-kk] =  (MTemp[N-2-kk] - temp5)/SS[N-2-kk][N-2-kk];}
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #2
MOVW	R5, #lo_addr(_kk+0)
MOVT	R5, #hi_addr(_kk+0)
LDR	R0, [R5, #0]
SUB	R4, R1, R0
LSLS	R3, R4, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R2, R0, R3
MOVW	R0, #lo_addr(_MTemp+0)
MOVT	R0, #hi_addr(_MTemp+0)
ADDS	R0, R0, R3
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_temp5+0)
MOVT	R0, #hi_addr(_temp5+0)
VLDR	#1, S0, [R0, #0]
VSUB.F32	S1, S1, S0
MOVS	R0, #200
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_SS+0)
MOVT	R0, #hi_addr(_SS+0)
ADDS	R0, R0, R1
ADDS	R0, R0, R3
VLDR	#1, S0, [R0, #0]
VDIV.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,590 :: 		for (kk=0;kk<(N-1);kk++){
MOV	R0, R5
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R5, #0]
;PCA_FLDA_GUI_events_code.c,594 :: 		GTemp[N-2-kk] =  (MTemp[N-2-kk] - temp5)/SS[N-2-kk][N-2-kk];}
IT	AL
BAL	L_FLDA_CONTINUE267
L_FLDA_CONTINUE268:
;PCA_FLDA_GUI_events_code.c,596 :: 		for(kk=0;kk<N;kk++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE273:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE274
;PCA_FLDA_GUI_events_code.c,597 :: 		V[kk][jj+50] = GTemp[kk]; // inv(Sw) = V[50][50] ;
MOVW	R3, #lo_addr(_kk+0)
MOVT	R3, #hi_addr(_kk+0)
LDR	R1, [R3, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
ADDS	R0, #50
LSLS	R0, R0, #2
ADDS	R2, R1, R0
MOV	R0, R3
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,596 :: 		for(kk=0;kk<N;kk++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,597 :: 		V[kk][jj+50] = GTemp[kk]; // inv(Sw) = V[50][50] ;
IT	AL
BAL	L_FLDA_CONTINUE273
L_FLDA_CONTINUE274:
;PCA_FLDA_GUI_events_code.c,598 :: 		x1 = x1 + 1;
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,570 :: 		for(jj=0;jj<N;jj++){
MOVW	R1, #lo_addr(_jj+0)
MOVT	R1, #hi_addr(_jj+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,599 :: 		}
IT	AL
BAL	L_FLDA_CONTINUE250
L_FLDA_CONTINUE251:
;PCA_FLDA_GUI_events_code.c,601 :: 		TFT_Write_Text("inv(Sw) OK",30, 110);
MOVW	R0, #lo_addr(?lstr24_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr24_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #110
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,602 :: 		TFT_Write_Text("Sb ?",  30, 130);
MOVW	R0, #lo_addr(?lstr25_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr25_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #130
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,604 :: 		for(x1=0;x1<N;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE276:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE277
;PCA_FLDA_GUI_events_code.c,605 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,606 :: 		for(y1=0;y1<TrainPicture;y1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE279:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE280
;PCA_FLDA_GUI_events_code.c,607 :: 		temp1 =  temp1 + L[x1][y1];    //L => projectedimages 50x100
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
;PCA_FLDA_GUI_events_code.c,606 :: 		for(y1=0;y1<TrainPicture;y1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,607 :: 		temp1 =  temp1 + L[x1][y1];    //L => projectedimages 50x100
IT	AL
BAL	L_FLDA_CONTINUE279
L_FLDA_CONTINUE280:
;PCA_FLDA_GUI_events_code.c,608 :: 		Mtemp[x1] = temp1/TrainPicture;}  //Mtemp toplam ortalama 50x1
MOVW	R3, #lo_addr(_x1+0)
MOVT	R3, #hi_addr(_x1+0)
LDR	R0, [R3, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_MTemp+0)
MOVT	R0, #hi_addr(_MTemp+0)
ADDS	R2, R0, R1
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
VLDR	#1, S0, [R0, #0]
VCVT.F32	#0, S1, S0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VDIV.F32	S0, S0, S1
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,604 :: 		for(x1=0;x1<N;x1++){
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,608 :: 		Mtemp[x1] = temp1/TrainPicture;}  //Mtemp toplam ortalama 50x1
IT	AL
BAL	L_FLDA_CONTINUE276
L_FLDA_CONTINUE277:
;PCA_FLDA_GUI_events_code.c,610 :: 		for(x1=0;x1<N;x1++)      //  L[50-99][0-49]   50x50 => Sb
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE282:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE283
;PCA_FLDA_GUI_events_code.c,611 :: 		for(y1=0;y1<N;y1++) L[x1+50][y1] = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE285:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE286
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
ADDW	R1, R0, #50
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
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
IT	AL
BAL	L_FLDA_CONTINUE285
L_FLDA_CONTINUE286:
;PCA_FLDA_GUI_events_code.c,610 :: 		for(x1=0;x1<N;x1++)      //  L[50-99][0-49]   50x50 => Sb
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,611 :: 		for(y1=0;y1<N;y1++) L[x1+50][y1] = 0;
IT	AL
BAL	L_FLDA_CONTINUE282
L_FLDA_CONTINUE283:
;PCA_FLDA_GUI_events_code.c,613 :: 		for(ii=0;ii<ClassNumber;ii++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE288:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE289
;PCA_FLDA_GUI_events_code.c,615 :: 		for(x1=0;x1<N;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE291:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE292
;PCA_FLDA_GUI_events_code.c,616 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,617 :: 		for(y1=ii*ClassPopulation;y1<(ii+1)*ClassPopulation;y1++)
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
L_FLDA_CONTINUE294:
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
BCS	L_FLDA_CONTINUE295
;PCA_FLDA_GUI_events_code.c,618 :: 		temp1 = temp1 + L[x1][y1];
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
;PCA_FLDA_GUI_events_code.c,617 :: 		for(y1=ii*ClassPopulation;y1<(ii+1)*ClassPopulation;y1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,618 :: 		temp1 = temp1 + L[x1][y1];
IT	AL
BAL	L_FLDA_CONTINUE294
L_FLDA_CONTINUE295:
;PCA_FLDA_GUI_events_code.c,619 :: 		GTemp[x1] = temp1/ClassPopulation;}     // GTemp = sýnýf ortalamasý
MOVW	R3, #lo_addr(_x1+0)
MOVT	R3, #hi_addr(_x1+0)
LDR	R0, [R3, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R2, R0, R1
MOVW	R0, #lo_addr(_ClassPopulation+0)
MOVT	R0, #hi_addr(_ClassPopulation+0)
VLDR	#1, S0, [R0, #0]
VCVT.F32	#0, S1, S0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VDIV.F32	S0, S0, S1
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,615 :: 		for(x1=0;x1<N;x1++){
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,619 :: 		GTemp[x1] = temp1/ClassPopulation;}     // GTemp = sýnýf ortalamasý
IT	AL
BAL	L_FLDA_CONTINUE291
L_FLDA_CONTINUE292:
;PCA_FLDA_GUI_events_code.c,621 :: 		for(x1=0;x1<N;x1++){       // Sb = Sb + (m_sýnýf - m_ort_toplam)*(m_sýnýf - m_ort_toplam)';
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE297:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE298
;PCA_FLDA_GUI_events_code.c,622 :: 		for(y1=0;y1<N;y1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE300:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE301
;PCA_FLDA_GUI_events_code.c,623 :: 		L[x1+50][y1] = L[x1+50][y1] + (GTemp[x1]-Mtemp[x1])*(GTemp[y1]-Mtemp[y1]);}
MOVW	R2, #lo_addr(_x1+0)
MOVT	R2, #hi_addr(_x1+0)
LDR	R0, [R2, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOVW	R5, #lo_addr(_y1+0)
MOVT	R5, #hi_addr(_y1+0)
LDR	R0, [R5, #0]
LSLS	R4, R0, #2
ADDS	R3, R1, R4
VLDR	#1, S3, [R3, #0]
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_MTemp+0)
MOVT	R0, #hi_addr(_MTemp+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VSUB.F32	S2, S1, S0
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R0, R0, R4
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_MTemp+0)
MOVT	R0, #hi_addr(_MTemp+0)
ADDS	R0, R0, R4
VLDR	#1, S0, [R0, #0]
VSUB.F32	S0, S1, S0
VMUL.F32	S0, S2, S0
VADD.F32	S0, S3, S0
VSTR	#1, S0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,622 :: 		for(y1=0;y1<N;y1++)
MOV	R0, R5
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R5, #0]
;PCA_FLDA_GUI_events_code.c,623 :: 		L[x1+50][y1] = L[x1+50][y1] + (GTemp[x1]-Mtemp[x1])*(GTemp[y1]-Mtemp[y1]);}
IT	AL
BAL	L_FLDA_CONTINUE300
L_FLDA_CONTINUE301:
;PCA_FLDA_GUI_events_code.c,621 :: 		for(x1=0;x1<N;x1++){       // Sb = Sb + (m_sýnýf - m_ort_toplam)*(m_sýnýf - m_ort_toplam)';
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,623 :: 		L[x1+50][y1] = L[x1+50][y1] + (GTemp[x1]-Mtemp[x1])*(GTemp[y1]-Mtemp[y1]);}
IT	AL
BAL	L_FLDA_CONTINUE297
L_FLDA_CONTINUE298:
;PCA_FLDA_GUI_events_code.c,613 :: 		for(ii=0;ii<ClassNumber;ii++){
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,624 :: 		}
IT	AL
BAL	L_FLDA_CONTINUE288
L_FLDA_CONTINUE289:
;PCA_FLDA_GUI_events_code.c,625 :: 		TFT_Write_Text("Sb OK",  30, 150);
MOVW	R0, #lo_addr(?lstr26_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr26_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #150
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,627 :: 		for(x1=0;x1<N;x1++){       // S =inv(Sw)*Sb 50x50
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE303:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE304
;PCA_FLDA_GUI_events_code.c,628 :: 		for(y1=0;y1<N;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE306:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE307
;PCA_FLDA_GUI_events_code.c,629 :: 		temp3 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,630 :: 		for(z1=0;z1<N;z1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE309:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE310
;PCA_FLDA_GUI_events_code.c,631 :: 		temp3 = temp3 + V[x1][z1+50]*L[z1+50][y1];
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R2, R0, R1
MOVW	R3, #lo_addr(_z1+0)
MOVT	R3, #hi_addr(_z1+0)
LDR	R0, [R3, #0]
ADDW	R1, R0, #50
LSLS	R0, R1, #2
ADDS	R2, R2, R0
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
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R2, #0]
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,630 :: 		for(z1=0;z1<N;z1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,631 :: 		temp3 = temp3 + V[x1][z1+50]*L[z1+50][y1];
IT	AL
BAL	L_FLDA_CONTINUE309
L_FLDA_CONTINUE310:
;PCA_FLDA_GUI_events_code.c,632 :: 		SS[x1][y1] = temp3;}}
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SS+0)
MOVT	R0, #hi_addr(_SS+0)
ADDS	R1, R0, R1
MOVW	R2, #lo_addr(_y1+0)
MOVT	R2, #hi_addr(_y1+0)
LDR	R0, [R2, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,628 :: 		for(y1=0;y1<N;y1++){
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,632 :: 		SS[x1][y1] = temp3;}}
IT	AL
BAL	L_FLDA_CONTINUE306
L_FLDA_CONTINUE307:
;PCA_FLDA_GUI_events_code.c,627 :: 		for(x1=0;x1<N;x1++){       // S =inv(Sw)*Sb 50x50
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,632 :: 		SS[x1][y1] = temp3;}}
IT	AL
BAL	L_FLDA_CONTINUE303
L_FLDA_CONTINUE304:
;PCA_FLDA_GUI_events_code.c,634 :: 		TFT_Write_Text("S OK",  30, 170);
MOVW	R0, #lo_addr(?lstr27_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr27_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #170
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,635 :: 		TFT_Write_Text("QR Algorithm Start",  30, 190);
MOVW	R0, #lo_addr(?lstr28_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr28_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #190
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,636 :: 		for(x1=0;x1<N;x1++){        // Q matrisi  Q=SS;
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE312:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE313
;PCA_FLDA_GUI_events_code.c,637 :: 		for(y1=0;y1<N;y1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE315:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE316
;PCA_FLDA_GUI_events_code.c,638 :: 		L[50+x1][y1] = SS[x1][y1];}
MOVW	R5, #lo_addr(_x1+0)
MOVT	R5, #hi_addr(_x1+0)
LDR	R0, [R5, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOVW	R4, #lo_addr(_y1+0)
MOVT	R4, #hi_addr(_y1+0)
LDR	R0, [R4, #0]
LSLS	R3, R0, #2
ADDS	R2, R1, R3
MOV	R0, R5
LDR	R1, [R0, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SS+0)
MOVT	R0, #hi_addr(_SS+0)
ADDS	R0, R0, R1
ADDS	R0, R0, R3
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,637 :: 		for(y1=0;y1<N;y1++)
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;PCA_FLDA_GUI_events_code.c,638 :: 		L[50+x1][y1] = SS[x1][y1];}
IT	AL
BAL	L_FLDA_CONTINUE315
L_FLDA_CONTINUE316:
;PCA_FLDA_GUI_events_code.c,636 :: 		for(x1=0;x1<N;x1++){        // Q matrisi  Q=SS;
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,638 :: 		L[50+x1][y1] = SS[x1][y1];}
IT	AL
BAL	L_FLDA_CONTINUE312
L_FLDA_CONTINUE313:
;PCA_FLDA_GUI_events_code.c,640 :: 		for(y1=0;y1<N;y1++){       //V birim matris 50x50
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE318:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE319
;PCA_FLDA_GUI_events_code.c,641 :: 		for(x1=0;x1<N;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE321:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE322
;PCA_FLDA_GUI_events_code.c,642 :: 		if (x1==y1) V[x1][y1+50] = 1;
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_FLDA_CONTINUE324
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
ADDS	R0, #50
LSLS	R0, R0, #2
ADDS	R1, R1, R0
VMOV.F32	S0, #1
VSTR	#1, S0, [R1, #0]
IT	AL
BAL	L_FLDA_CONTINUE325
L_FLDA_CONTINUE324:
;PCA_FLDA_GUI_events_code.c,643 :: 		else        V[x1][y1+50] = 0;}}
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
ADDS	R0, #50
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
L_FLDA_CONTINUE325:
;PCA_FLDA_GUI_events_code.c,641 :: 		for(x1=0;x1<N;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,643 :: 		else        V[x1][y1+50] = 0;}}
IT	AL
BAL	L_FLDA_CONTINUE321
L_FLDA_CONTINUE322:
;PCA_FLDA_GUI_events_code.c,640 :: 		for(y1=0;y1<N;y1++){       //V birim matris 50x50
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,643 :: 		else        V[x1][y1+50] = 0;}}
IT	AL
BAL	L_FLDA_CONTINUE318
L_FLDA_CONTINUE319:
;PCA_FLDA_GUI_events_code.c,645 :: 		for(ii=0;ii<QR_iteration;ii++){  //QR büyük dongu-1
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE326:
MOVW	R0, #lo_addr(_QR_iteration+0)
MOVT	R0, #hi_addr(_QR_iteration+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE327
;PCA_FLDA_GUI_events_code.c,647 :: 		for(x1=0;x1<N;x1++){                   // R matrisi
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE329:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE330
;PCA_FLDA_GUI_events_code.c,648 :: 		for(y1=0;y1<N;y1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE332:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE333
;PCA_FLDA_GUI_events_code.c,649 :: 		L[50+x1][50+y1] = 0;}
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOVW	R2, #lo_addr(_y1+0)
MOVT	R2, #hi_addr(_y1+0)
LDR	R0, [R2, #0]
ADDS	R0, #50
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,648 :: 		for(y1=0;y1<N;y1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,649 :: 		L[50+x1][50+y1] = 0;}
IT	AL
BAL	L_FLDA_CONTINUE332
L_FLDA_CONTINUE333:
;PCA_FLDA_GUI_events_code.c,647 :: 		for(x1=0;x1<N;x1++){                   // R matrisi
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,649 :: 		L[50+x1][50+y1] = 0;}
IT	AL
BAL	L_FLDA_CONTINUE329
L_FLDA_CONTINUE330:
;PCA_FLDA_GUI_events_code.c,651 :: 		for(kk=0;kk<N;kk++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE335:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE336
;PCA_FLDA_GUI_events_code.c,652 :: 		for(jj=0;jj<kk;jj++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE338:
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE339
;PCA_FLDA_GUI_events_code.c,653 :: 		temp3 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,654 :: 		for(x1=0;x1<N;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE341:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE342
;PCA_FLDA_GUI_events_code.c,655 :: 		temp3 = temp3 + L[50+x1][jj]*L[50+x1][kk];  //R = Q'*Q
MOVW	R3, #lo_addr(_x1+0)
MOVT	R3, #hi_addr(_x1+0)
LDR	R0, [R3, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R2, R1, R0
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R2, #0]
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,654 :: 		for(x1=0;x1<N;x1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,655 :: 		temp3 = temp3 + L[50+x1][jj]*L[50+x1][kk];  //R = Q'*Q
IT	AL
BAL	L_FLDA_CONTINUE341
L_FLDA_CONTINUE342:
;PCA_FLDA_GUI_events_code.c,656 :: 		L[50+jj][50+kk] = temp3;
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
ADDS	R0, #50
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,657 :: 		for(x1=0;x1<N;x1++)      // R*Q =  MTemp[x1]
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE344:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE345
;PCA_FLDA_GUI_events_code.c,658 :: 		MTemp[x1] =  L[50+jj][50+kk]*L[50+x1][jj];
MOVW	R4, #lo_addr(_x1+0)
MOVT	R4, #hi_addr(_x1+0)
LDR	R0, [R4, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_MTemp+0)
MOVT	R0, #hi_addr(_MTemp+0)
ADDS	R3, R0, R1
MOVW	R2, #lo_addr(_jj+0)
MOVT	R2, #hi_addr(_jj+0)
LDR	R0, [R2, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
ADDS	R0, #50
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S1, [R0, #0]
MOV	R0, R4
LDR	R0, [R0, #0]
ADDW	R1, R0, #50
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
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,657 :: 		for(x1=0;x1<N;x1++)      // R*Q =  MTemp[x1]
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;PCA_FLDA_GUI_events_code.c,658 :: 		MTemp[x1] =  L[50+jj][50+kk]*L[50+x1][jj];
IT	AL
BAL	L_FLDA_CONTINUE344
L_FLDA_CONTINUE345:
;PCA_FLDA_GUI_events_code.c,659 :: 		for(x1=0;x1<N;x1++)   //Q=Q-RQ
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE347:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE348
;PCA_FLDA_GUI_events_code.c,660 :: 		GTemp[x1]   = L[50+x1][kk] - MTemp[x1] ;
MOVW	R4, #lo_addr(_x1+0)
MOVT	R4, #hi_addr(_x1+0)
LDR	R0, [R4, #0]
LSLS	R3, R0, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R2, R0, R3
MOV	R0, R4
LDR	R0, [R0, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_MTemp+0)
MOVT	R0, #hi_addr(_MTemp+0)
ADDS	R0, R0, R3
VLDR	#1, S0, [R0, #0]
VSUB.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,659 :: 		for(x1=0;x1<N;x1++)   //Q=Q-RQ
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;PCA_FLDA_GUI_events_code.c,660 :: 		GTemp[x1]   = L[50+x1][kk] - MTemp[x1] ;
IT	AL
BAL	L_FLDA_CONTINUE347
L_FLDA_CONTINUE348:
;PCA_FLDA_GUI_events_code.c,661 :: 		for(x1=0;x1<N;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE350:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE351
;PCA_FLDA_GUI_events_code.c,662 :: 		L[50+x1][kk] = GTemp[x1];  }
MOVW	R3, #lo_addr(_x1+0)
MOVT	R3, #hi_addr(_x1+0)
LDR	R0, [R3, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R2, R1, R0
MOV	R0, R3
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,661 :: 		for(x1=0;x1<N;x1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,662 :: 		L[50+x1][kk] = GTemp[x1];  }
IT	AL
BAL	L_FLDA_CONTINUE350
L_FLDA_CONTINUE351:
;PCA_FLDA_GUI_events_code.c,652 :: 		for(jj=0;jj<kk;jj++){
MOVW	R1, #lo_addr(_jj+0)
MOVT	R1, #hi_addr(_jj+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,662 :: 		L[50+x1][kk] = GTemp[x1];  }
IT	AL
BAL	L_FLDA_CONTINUE338
L_FLDA_CONTINUE339:
;PCA_FLDA_GUI_events_code.c,664 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,665 :: 		for(x1=0;x1<N;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE353:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE354
;PCA_FLDA_GUI_events_code.c,666 :: 		temp1 = temp1 + L[50+x1][kk]*L[50+x1][kk];
MOVW	R2, #lo_addr(_x1+0)
MOVT	R2, #hi_addr(_x1+0)
LDR	R0, [R2, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
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
;PCA_FLDA_GUI_events_code.c,665 :: 		for(x1=0;x1<N;x1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,666 :: 		temp1 = temp1 + L[50+x1][kk]*L[50+x1][kk];
IT	AL
BAL	L_FLDA_CONTINUE353
L_FLDA_CONTINUE354:
;PCA_FLDA_GUI_events_code.c,667 :: 		L[50+kk][50+kk] = sqrt(temp1);  //norm (Q)
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
ADDW	R2, R0, #50
MOVW	R0, #400
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
LSLS	R0, R2, #2
ADDS	R0, R1, R0
STR	R0, [SP, #4]
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
LDR	R0, [SP, #4]
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,669 :: 		for(x1=0;x1<N;x1++)  // Q =Q/R
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE356:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE357
;PCA_FLDA_GUI_events_code.c,670 :: 		L[50+x1][kk] = L[50+x1][kk]/L[50+kk][50+kk];
MOVW	R4, #lo_addr(_x1+0)
MOVT	R4, #hi_addr(_x1+0)
LDR	R0, [R4, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R2, R0, R1
MOVW	R1, #lo_addr(_kk+0)
MOVT	R1, #hi_addr(_kk+0)
LDR	R0, [R1, #0]
LSLS	R0, R0, #2
ADDS	R3, R2, R0
VLDR	#1, S1, [R3, #0]
MOV	R0, R1
LDR	R0, [R0, #0]
ADDW	R2, R0, #50
MOVW	R0, #400
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
LSLS	R0, R2, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
VDIV.F32	S0, S1, S0
VSTR	#1, S0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,669 :: 		for(x1=0;x1<N;x1++)  // Q =Q/R
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;PCA_FLDA_GUI_events_code.c,670 :: 		L[50+x1][kk] = L[50+x1][kk]/L[50+kk][50+kk];
IT	AL
BAL	L_FLDA_CONTINUE356
L_FLDA_CONTINUE357:
;PCA_FLDA_GUI_events_code.c,651 :: 		for(kk=0;kk<N;kk++){
MOVW	R1, #lo_addr(_kk+0)
MOVT	R1, #hi_addr(_kk+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,671 :: 		}
IT	AL
BAL	L_FLDA_CONTINUE335
L_FLDA_CONTINUE336:
;PCA_FLDA_GUI_events_code.c,673 :: 		for(x1=0;x1<N;x1++){        // V[50][50] =V[50][50]*Q[50][50]
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE359:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE360
;PCA_FLDA_GUI_events_code.c,674 :: 		for(m1=0;m1<N;m1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_m1+0)
MOVT	R0, #hi_addr(_m1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE362:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_m1+0)
MOVT	R0, #hi_addr(_m1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE363
;PCA_FLDA_GUI_events_code.c,675 :: 		GTemp[m1] = V[x1][m1+50];
MOVW	R3, #lo_addr(_m1+0)
MOVT	R3, #hi_addr(_m1+0)
LDR	R0, [R3, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R2, R0, R1
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, #50
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,674 :: 		for(m1=0;m1<N;m1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,675 :: 		GTemp[m1] = V[x1][m1+50];
IT	AL
BAL	L_FLDA_CONTINUE362
L_FLDA_CONTINUE363:
;PCA_FLDA_GUI_events_code.c,676 :: 		for(y1=0;y1<N;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE365:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE366
;PCA_FLDA_GUI_events_code.c,677 :: 		temp3 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,678 :: 		for(z1=0;z1<N;z1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE368:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE369
;PCA_FLDA_GUI_events_code.c,679 :: 		temp3 = temp3 + GTemp[z1]*L[z1+50][y1];
MOVW	R3, #lo_addr(_z1+0)
MOVT	R3, #hi_addr(_z1+0)
LDR	R0, [R3, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R2, R0, R1
MOV	R0, R3
LDR	R0, [R0, #0]
ADDW	R1, R0, #50
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
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R2, #0]
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,678 :: 		for(z1=0;z1<N;z1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,679 :: 		temp3 = temp3 + GTemp[z1]*L[z1+50][y1];
IT	AL
BAL	L_FLDA_CONTINUE368
L_FLDA_CONTINUE369:
;PCA_FLDA_GUI_events_code.c,680 :: 		V[x1][y1+50] = temp3;}}
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
ADDS	R0, #50
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,676 :: 		for(y1=0;y1<N;y1++){
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,680 :: 		V[x1][y1+50] = temp3;}}
IT	AL
BAL	L_FLDA_CONTINUE365
L_FLDA_CONTINUE366:
;PCA_FLDA_GUI_events_code.c,673 :: 		for(x1=0;x1<N;x1++){        // V[50][50] =V[50][50]*Q[50][50]
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,680 :: 		V[x1][y1+50] = temp3;}}
IT	AL
BAL	L_FLDA_CONTINUE359
L_FLDA_CONTINUE360:
;PCA_FLDA_GUI_events_code.c,682 :: 		for(y1=0;y1<N;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE371:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE372
;PCA_FLDA_GUI_events_code.c,683 :: 		for(m1=0;m1<N;m1++)            // Q atanýyor
MOVS	R1, #0
MOVW	R0, #lo_addr(_m1+0)
MOVT	R0, #hi_addr(_m1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE374:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_m1+0)
MOVT	R0, #hi_addr(_m1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE375
;PCA_FLDA_GUI_events_code.c,684 :: 		GTemp[m1] = L[50+m1][y1];
MOVW	R3, #lo_addr(_m1+0)
MOVT	R3, #hi_addr(_m1+0)
LDR	R0, [R3, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R2, R0, R1
MOV	R0, R3
LDR	R0, [R0, #0]
ADDW	R1, R0, #50
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
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,683 :: 		for(m1=0;m1<N;m1++)            // Q atanýyor
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,684 :: 		GTemp[m1] = L[50+m1][y1];
IT	AL
BAL	L_FLDA_CONTINUE374
L_FLDA_CONTINUE375:
;PCA_FLDA_GUI_events_code.c,685 :: 		for(x1=0;x1<N;x1++){       // Q[50][50]= R[50][50]*Q[50][50]
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE377:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE378
;PCA_FLDA_GUI_events_code.c,686 :: 		temp3 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,687 :: 		for(z1=0;z1<N;z1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE380:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE381
;PCA_FLDA_GUI_events_code.c,688 :: 		temp3 = temp3 + L[x1+50][z1+50]*GTemp[z1];
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOVW	R3, #lo_addr(_z1+0)
MOVT	R3, #hi_addr(_z1+0)
LDR	R0, [R3, #0]
ADDS	R0, #50
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
;PCA_FLDA_GUI_events_code.c,687 :: 		for(z1=0;z1<N;z1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,688 :: 		temp3 = temp3 + L[x1+50][z1+50]*GTemp[z1];
IT	AL
BAL	L_FLDA_CONTINUE380
L_FLDA_CONTINUE381:
;PCA_FLDA_GUI_events_code.c,689 :: 		L[50+x1][y1] = temp3;}}
MOVW	R2, #lo_addr(_x1+0)
MOVT	R2, #hi_addr(_x1+0)
LDR	R0, [R2, #0]
ADDW	R1, R0, #50
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
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,685 :: 		for(x1=0;x1<N;x1++){       // Q[50][50]= R[50][50]*Q[50][50]
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,689 :: 		L[50+x1][y1] = temp3;}}
IT	AL
BAL	L_FLDA_CONTINUE377
L_FLDA_CONTINUE378:
;PCA_FLDA_GUI_events_code.c,682 :: 		for(y1=0;y1<N;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,689 :: 		L[50+x1][y1] = temp3;}}
IT	AL
BAL	L_FLDA_CONTINUE371
L_FLDA_CONTINUE372:
;PCA_FLDA_GUI_events_code.c,645 :: 		for(ii=0;ii<QR_iteration;ii++){  //QR büyük dongu-1
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,690 :: 		}
IT	AL
BAL	L_FLDA_CONTINUE326
L_FLDA_CONTINUE327:
;PCA_FLDA_GUI_events_code.c,693 :: 		for(x1=0;x1<N;x1++)              //eigenvalue => KTemp
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE383:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE384
;PCA_FLDA_GUI_events_code.c,694 :: 		KTemp[x1] = L[50+x1][x1];
MOVW	R4, #lo_addr(_x1+0)
MOVT	R4, #hi_addr(_x1+0)
LDR	R0, [R4, #0]
LSLS	R3, R0, #2
MOVW	R0, #lo_addr(_KTemp+0)
MOVT	R0, #hi_addr(_KTemp+0)
ADDS	R2, R0, R3
MOV	R0, R4
LDR	R0, [R0, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R0, R0, R1
ADDS	R0, R0, R3
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,693 :: 		for(x1=0;x1<N;x1++)              //eigenvalue => KTemp
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;PCA_FLDA_GUI_events_code.c,694 :: 		KTemp[x1] = L[50+x1][x1];
IT	AL
BAL	L_FLDA_CONTINUE383
L_FLDA_CONTINUE384:
;PCA_FLDA_GUI_events_code.c,696 :: 		TFT_Write_Text("Eigenvalue OK",  30, 210);
MOVW	R0, #lo_addr(?lstr29_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr29_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #210
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,697 :: 		TFT_Write_Text("FISHER Eigenvector ?",  30, 230);
MOVW	R0, #lo_addr(?lstr30_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr30_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #230
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,698 :: 		for(x1=0;x1<N;x1++)   // (ClassNumber-1) özvektor V_Fisher ilk özvektor
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE386:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE387
;PCA_FLDA_GUI_events_code.c,699 :: 		Fisher[x1][0] = V[x1][0+50];
MOVW	R3, #lo_addr(_x1+0)
MOVT	R3, #hi_addr(_x1+0)
LDR	R1, [R3, #0]
MOVS	R0, #76
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_Fisher+0)
MOVT	R0, #hi_addr(_Fisher+0)
ADDS	R0, R0, R1
MOV	R2, R0
MOV	R0, R3
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R0, R0, R1
ADDS	R0, #200
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,698 :: 		for(x1=0;x1<N;x1++)   // (ClassNumber-1) özvektor V_Fisher ilk özvektor
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,699 :: 		Fisher[x1][0] = V[x1][0+50];
IT	AL
BAL	L_FLDA_CONTINUE386
L_FLDA_CONTINUE387:
;PCA_FLDA_GUI_events_code.c,701 :: 		for(tt=1;tt<ClassNumber-1;tt++) {
MOVS	R1, #1
MOVW	R0, #lo_addr(_tt+0)
MOVT	R0, #hi_addr(_tt+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE389:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_tt+0)
MOVT	R0, #hi_addr(_tt+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE390
;PCA_FLDA_GUI_events_code.c,703 :: 		for(x1=0;x1<N;x1++){        // V[50+x1][y1]=SS;
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE392:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE393
;PCA_FLDA_GUI_events_code.c,704 :: 		for(y1=0;y1<N;y1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE395:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE396
;PCA_FLDA_GUI_events_code.c,705 :: 		V[50+x1][y1+50] = SS[x1][y1];}
MOVW	R4, #lo_addr(_x1+0)
MOVT	R4, #hi_addr(_x1+0)
LDR	R0, [R4, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOVW	R3, #lo_addr(_y1+0)
MOVT	R3, #hi_addr(_y1+0)
LDR	R0, [R3, #0]
ADDS	R0, #50
LSLS	R0, R0, #2
ADDS	R2, R1, R0
MOV	R0, R4
LDR	R1, [R0, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SS+0)
MOVT	R0, #hi_addr(_SS+0)
ADDS	R1, R0, R1
MOV	R0, R3
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,704 :: 		for(y1=0;y1<N;y1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,705 :: 		V[50+x1][y1+50] = SS[x1][y1];}
IT	AL
BAL	L_FLDA_CONTINUE395
L_FLDA_CONTINUE396:
;PCA_FLDA_GUI_events_code.c,703 :: 		for(x1=0;x1<N;x1++){        // V[50+x1][y1]=SS;
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,705 :: 		V[50+x1][y1+50] = SS[x1][y1];}
IT	AL
BAL	L_FLDA_CONTINUE392
L_FLDA_CONTINUE393:
;PCA_FLDA_GUI_events_code.c,707 :: 		for(x1=0;x1<N;x1++)                            // cc   tersi alýnacak eigenvalue çýkartýlmýþ vektor
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE398:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE399
;PCA_FLDA_GUI_events_code.c,708 :: 		V[50+x1][x1+50] = SS[x1][x1] - KTemp[tt];
MOVW	R3, #lo_addr(_x1+0)
MOVT	R3, #hi_addr(_x1+0)
LDR	R0, [R3, #0]
ADDW	R2, R0, #50
MOVW	R0, #400
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
LSLS	R0, R2, #2
ADDS	R2, R1, R0
MOV	R0, R3
LDR	R1, [R0, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_SS+0)
MOVT	R0, #hi_addr(_SS+0)
ADDS	R1, R0, R1
MOV	R0, R3
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_tt+0)
MOVT	R0, #hi_addr(_tt+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_KTemp+0)
MOVT	R0, #hi_addr(_KTemp+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VSUB.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,707 :: 		for(x1=0;x1<N;x1++)                            // cc   tersi alýnacak eigenvalue çýkartýlmýþ vektor
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,708 :: 		V[50+x1][x1+50] = SS[x1][x1] - KTemp[tt];
IT	AL
BAL	L_FLDA_CONTINUE398
L_FLDA_CONTINUE399:
;PCA_FLDA_GUI_events_code.c,710 :: 		for(ii=0;ii<TrainPicture;ii++)   {GTemp[ii]= 0;  MTemp[ii] = 0; }
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE401:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE402
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
BAL	L_FLDA_CONTINUE401
L_FLDA_CONTINUE402:
;PCA_FLDA_GUI_events_code.c,711 :: 		for(ii=0;ii<N;ii++) BTemp[ii] = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE404:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE405
MOVW	R2, #lo_addr(_ii+0)
MOVT	R2, #hi_addr(_ii+0)
LDR	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_BTemp+0)
MOVT	R0, #hi_addr(_BTemp+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STR	R0, [R1, #0]
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
IT	AL
BAL	L_FLDA_CONTINUE404
L_FLDA_CONTINUE405:
;PCA_FLDA_GUI_events_code.c,712 :: 		for(ii=0;ii<N;ii++) RTemp[ii] = ii;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE407:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE408
MOVW	R2, #lo_addr(_ii+0)
MOVT	R2, #hi_addr(_ii+0)
LDR	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_RTemp+0)
MOVT	R0, #hi_addr(_RTemp+0)
ADDS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
STR	R0, [R1, #0]
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
IT	AL
BAL	L_FLDA_CONTINUE407
L_FLDA_CONTINUE408:
;PCA_FLDA_GUI_events_code.c,713 :: 		TFT_Write_Text("inverse ?",  30, 250);
MOVW	R0, #lo_addr(?lstr31_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr31_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #250
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,714 :: 		for(p=0;p<(N-1);p++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE410:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE411
;PCA_FLDA_GUI_events_code.c,716 :: 		temp1 = 0;      //en büyük deðer bulma pivot
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,717 :: 		for(x1=p;x1<N;x1++){
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE413:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE414
;PCA_FLDA_GUI_events_code.c,718 :: 		if (fabs(V[x1+50][p+50]) > temp1) {
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
LDR	R0, [R0, #0]
ADDS	R0, #50
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
BLE	L_FLDA_CONTINUE416
;PCA_FLDA_GUI_events_code.c,719 :: 		temp1 = fabs(V[x1+50][p+50]);
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R0, [SP, #4]
LDR	R0, [R0, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
LDR	R0, [R0, #0]
ADDS	R0, #50
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
BL	_fabs+0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,720 :: 		jj=x1;}}
LDR	R0, [SP, #4]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE416:
;PCA_FLDA_GUI_events_code.c,717 :: 		for(x1=p;x1<N;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,720 :: 		jj=x1;}}
IT	AL
BAL	L_FLDA_CONTINUE413
L_FLDA_CONTINUE414:
;PCA_FLDA_GUI_events_code.c,722 :: 		for(ii=0;ii<N;ii++){   //row changing
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE417:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE418
;PCA_FLDA_GUI_events_code.c,723 :: 		temp2 = V[p+50][ii+50];
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
LDR	R0, [R0, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOVW	R6, #lo_addr(_ii+0)
MOVT	R6, #hi_addr(_ii+0)
LDR	R0, [R6, #0]
ADDS	R0, #50
LSLS	R5, R0, #2
ADDS	R0, R1, R5
VLDR	#1, S0, [R0, #0]
MOVW	R4, #lo_addr(_temp2+0)
MOVT	R4, #hi_addr(_temp2+0)
VSTR	#1, S0, [R4, #0]
;PCA_FLDA_GUI_events_code.c,724 :: 		V[p+50][ii+50] = V[jj+50][ii+50];
MOV	R3, R0
MOVW	R2, #lo_addr(_jj+0)
MOVT	R2, #hi_addr(_jj+0)
LDR	R0, [R2, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R0, R0, R1
ADDS	R0, R0, R5
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,725 :: 		V[jj+50][ii+50] = temp2;}
MOV	R0, R2
LDR	R0, [R0, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOV	R0, R6
LDR	R0, [R0, #0]
ADDS	R0, #50
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, R4
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,722 :: 		for(ii=0;ii<N;ii++){   //row changing
MOV	R0, R6
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R6, #0]
;PCA_FLDA_GUI_events_code.c,725 :: 		V[jj+50][ii+50] = temp2;}
IT	AL
BAL	L_FLDA_CONTINUE417
L_FLDA_CONTINUE418:
;PCA_FLDA_GUI_events_code.c,727 :: 		mm = RTemp[p];
MOVW	R5, #lo_addr(_p+0)
MOVT	R5, #hi_addr(_p+0)
LDR	R0, [R5, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_RTemp+0)
MOVT	R0, #hi_addr(_RTemp+0)
ADDS	R4, R0, R1
LDR	R0, [R4, #0]
MOVW	R3, #lo_addr(_mm+0)
MOVT	R3, #hi_addr(_mm+0)
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,728 :: 		RTemp[p] = RTemp[jj];
MOVW	R2, #lo_addr(_jj+0)
MOVT	R2, #hi_addr(_jj+0)
LDR	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_RTemp+0)
MOVT	R0, #hi_addr(_RTemp+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
STR	R0, [R4, #0]
;PCA_FLDA_GUI_events_code.c,729 :: 		RTemp[jj] = mm;
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_RTemp+0)
MOVT	R0, #hi_addr(_RTemp+0)
ADDS	R1, R0, R1
MOV	R0, R3
LDR	R0, [R0, #0]
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,731 :: 		for (kk=(p+1);kk<N;kk++){
MOV	R0, R5
LDR	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE420:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE421
;PCA_FLDA_GUI_events_code.c,732 :: 		temp3 = V[kk+50][p+50]/V[p+50][p+50];
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R2, R0, R1
MOVW	R5, #lo_addr(_p+0)
MOVT	R5, #hi_addr(_p+0)
LDR	R0, [R5, #0]
ADDW	R1, R0, #50
LSLS	R4, R1, #2
ADDS	R3, R2, R4
VLDR	#1, S1, [R3, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R0, R0, R1
ADDS	R0, R0, R4
VLDR	#1, S0, [R0, #0]
VDIV.F32	S0, S1, S0
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,733 :: 		V[kk+50][p+50] = temp3;
VSTR	#1, S0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,734 :: 		for(ii=(p+1);ii<N;ii++)
MOV	R0, R5
LDR	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE423:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE424
;PCA_FLDA_GUI_events_code.c,735 :: 		V[kk+50][ii+50] = V[kk+50][ii+50] - temp3*V[p+50][ii+50]; }
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOVW	R4, #lo_addr(_ii+0)
MOVT	R4, #hi_addr(_ii+0)
LDR	R0, [R4, #0]
ADDS	R0, #50
LSLS	R3, R0, #2
ADDS	R2, R1, R3
VLDR	#1, S2, [R2, #0]
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
LDR	R0, [R0, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R0, R0, R1
ADDS	R0, R0, R3
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSUB.F32	S0, S2, S0
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,734 :: 		for(ii=(p+1);ii<N;ii++)
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;PCA_FLDA_GUI_events_code.c,735 :: 		V[kk+50][ii+50] = V[kk+50][ii+50] - temp3*V[p+50][ii+50]; }
IT	AL
BAL	L_FLDA_CONTINUE423
L_FLDA_CONTINUE424:
;PCA_FLDA_GUI_events_code.c,731 :: 		for (kk=(p+1);kk<N;kk++){
MOVW	R1, #lo_addr(_kk+0)
MOVT	R1, #hi_addr(_kk+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,735 :: 		V[kk+50][ii+50] = V[kk+50][ii+50] - temp3*V[p+50][ii+50]; }
IT	AL
BAL	L_FLDA_CONTINUE420
L_FLDA_CONTINUE421:
;PCA_FLDA_GUI_events_code.c,714 :: 		for(p=0;p<(N-1);p++){
MOVW	R1, #lo_addr(_p+0)
MOVT	R1, #hi_addr(_p+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,736 :: 		}
IT	AL
BAL	L_FLDA_CONTINUE410
L_FLDA_CONTINUE411:
;PCA_FLDA_GUI_events_code.c,737 :: 		x1 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,738 :: 		for(jj=0;jj<N;jj++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE426:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE427
;PCA_FLDA_GUI_events_code.c,740 :: 		for(ii=0;ii<TrainPicture;ii++) {GTemp[ii]= 0;  MTemp[ii] = 0;}
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE429:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE430
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
BAL	L_FLDA_CONTINUE429
L_FLDA_CONTINUE430:
;PCA_FLDA_GUI_events_code.c,742 :: 		for(ii=0;ii<N;ii++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE432:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE433
;PCA_FLDA_GUI_events_code.c,743 :: 		if (x1 == ii) BTemp[ii] = 1;
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_FLDA_CONTINUE435
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_BTemp+0)
MOVT	R0, #hi_addr(_BTemp+0)
ADDS	R1, R0, R1
MOVS	R0, #1
STR	R0, [R1, #0]
IT	AL
BAL	L_FLDA_CONTINUE436
L_FLDA_CONTINUE435:
;PCA_FLDA_GUI_events_code.c,744 :: 		else  BTemp[ii] = 0;}
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_BTemp+0)
MOVT	R0, #hi_addr(_BTemp+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STR	R0, [R1, #0]
L_FLDA_CONTINUE436:
;PCA_FLDA_GUI_events_code.c,742 :: 		for(ii=0;ii<N;ii++){
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,744 :: 		else  BTemp[ii] = 0;}
IT	AL
BAL	L_FLDA_CONTINUE432
L_FLDA_CONTINUE433:
;PCA_FLDA_GUI_events_code.c,747 :: 		mm = RTemp[0];
MOVW	R2, #lo_addr(_RTemp+0)
MOVT	R2, #hi_addr(_RTemp+0)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_mm+0)
MOVT	R0, #hi_addr(_mm+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,748 :: 		MTemp[0] =  BTemp[mm];
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_BTemp+0)
MOVT	R0, #hi_addr(_BTemp+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
VMOV	S0, R0
VCVT.F32	#1, S0, S0
MOVW	R0, #lo_addr(_MTemp+0)
MOVT	R0, #hi_addr(_MTemp+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,749 :: 		for (kk=1;kk<N;kk++){
MOVS	R1, #1
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE437:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE438
;PCA_FLDA_GUI_events_code.c,750 :: 		temp4 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,751 :: 		for (z1=0;z1<(kk);z1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE440:
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE441
;PCA_FLDA_GUI_events_code.c,752 :: 		temp4 = temp4 + V[kk+50][z1+50]*MTemp[z1];
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOVW	R3, #lo_addr(_z1+0)
MOVT	R3, #hi_addr(_z1+0)
LDR	R0, [R3, #0]
ADDS	R0, #50
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
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,751 :: 		for (z1=0;z1<(kk);z1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,752 :: 		temp4 = temp4 + V[kk+50][z1+50]*MTemp[z1];
IT	AL
BAL	L_FLDA_CONTINUE440
L_FLDA_CONTINUE441:
;PCA_FLDA_GUI_events_code.c,753 :: 		mm = RTemp[kk];
MOVW	R3, #lo_addr(_kk+0)
MOVT	R3, #hi_addr(_kk+0)
LDR	R0, [R3, #0]
LSLS	R2, R0, #2
MOVW	R0, #lo_addr(_RTemp+0)
MOVT	R0, #hi_addr(_RTemp+0)
ADDS	R0, R0, R2
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_mm+0)
MOVT	R0, #hi_addr(_mm+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,754 :: 		MTemp[kk] =  BTemp[mm] - temp4;}
MOVW	R0, #lo_addr(_MTemp+0)
MOVT	R0, #hi_addr(_MTemp+0)
ADDS	R2, R0, R2
LSLS	R1, R1, #2
MOVW	R0, #lo_addr(_BTemp+0)
MOVT	R0, #hi_addr(_BTemp+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
VMOV	S1, R0
VCVT.F32	#1, S1, S1
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VLDR	#1, S0, [R0, #0]
VSUB.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,749 :: 		for (kk=1;kk<N;kk++){
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,754 :: 		MTemp[kk] =  BTemp[mm] - temp4;}
IT	AL
BAL	L_FLDA_CONTINUE437
L_FLDA_CONTINUE438:
;PCA_FLDA_GUI_events_code.c,757 :: 		GTemp[N-1] = MTemp[N-1]/V[N-1+50][N-1+50];
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R0, [R0, #0]
SUBS	R2, R0, #1
LSLS	R1, R2, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R3, R0, R1
MOVW	R0, #lo_addr(_MTemp+0)
MOVT	R0, #hi_addr(_MTemp+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
ADDS	R2, #50
MOVW	R0, #400
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
LSLS	R0, R2, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
VDIV.F32	S0, S1, S0
VSTR	#1, S0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,758 :: 		for (kk=0;kk<(N-1);kk++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE443:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE444
;PCA_FLDA_GUI_events_code.c,759 :: 		temp5 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp5+0)
MOVT	R0, #hi_addr(_temp5+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,760 :: 		for (z1=(N-1-kk);z1<N;z1++)
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
SUB	R1, R1, R0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE446:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE447
;PCA_FLDA_GUI_events_code.c,761 :: 		temp5 = temp5 + V[N-2-kk+50][z1+50]*GTemp[z1];
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #2
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
SUB	R0, R1, R0
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOVW	R3, #lo_addr(_z1+0)
MOVT	R3, #hi_addr(_z1+0)
LDR	R0, [R3, #0]
ADDS	R0, #50
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
MOVW	R0, #lo_addr(_temp5+0)
MOVT	R0, #hi_addr(_temp5+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,760 :: 		for (z1=(N-1-kk);z1<N;z1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,761 :: 		temp5 = temp5 + V[N-2-kk+50][z1+50]*GTemp[z1];
IT	AL
BAL	L_FLDA_CONTINUE446
L_FLDA_CONTINUE447:
;PCA_FLDA_GUI_events_code.c,762 :: 		GTemp[N-2-kk] =  (MTemp[N-2-kk] - temp5)/V[N-2-kk+50][N-2-kk+50];}
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #2
MOVW	R4, #lo_addr(_kk+0)
MOVT	R4, #hi_addr(_kk+0)
LDR	R0, [R4, #0]
SUB	R2, R1, R0
LSLS	R1, R2, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R3, R0, R1
MOVW	R0, #lo_addr(_MTemp+0)
MOVT	R0, #hi_addr(_MTemp+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_temp5+0)
MOVT	R0, #hi_addr(_temp5+0)
VLDR	#1, S0, [R0, #0]
VSUB.F32	S1, S1, S0
ADDS	R2, #50
MOVW	R0, #400
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
LSLS	R0, R2, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
VDIV.F32	S0, S1, S0
VSTR	#1, S0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,758 :: 		for (kk=0;kk<(N-1);kk++){
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;PCA_FLDA_GUI_events_code.c,762 :: 		GTemp[N-2-kk] =  (MTemp[N-2-kk] - temp5)/V[N-2-kk+50][N-2-kk+50];}
IT	AL
BAL	L_FLDA_CONTINUE443
L_FLDA_CONTINUE444:
;PCA_FLDA_GUI_events_code.c,764 :: 		for(kk=0;kk<N;kk++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE449:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE450
;PCA_FLDA_GUI_events_code.c,765 :: 		L[50+kk][jj] = GTemp[kk];
MOVW	R3, #lo_addr(_kk+0)
MOVT	R3, #hi_addr(_kk+0)
LDR	R0, [R3, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R2, R1, R0
MOV	R0, R3
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,764 :: 		for(kk=0;kk<N;kk++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,765 :: 		L[50+kk][jj] = GTemp[kk];
IT	AL
BAL	L_FLDA_CONTINUE449
L_FLDA_CONTINUE450:
;PCA_FLDA_GUI_events_code.c,766 :: 		x1 = x1 + 1;
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,738 :: 		for(jj=0;jj<N;jj++){
MOVW	R1, #lo_addr(_jj+0)
MOVT	R1, #hi_addr(_jj+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,767 :: 		}
IT	AL
BAL	L_FLDA_CONTINUE426
L_FLDA_CONTINUE427:
;PCA_FLDA_GUI_events_code.c,768 :: 		TFT_Write_Text("inverse OK",  30, 270);
MOVW	R0, #lo_addr(?lstr32_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr32_PCA_FLDA_GUI_events_code+0)
MOVW	R2, #270
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,771 :: 		for(y1=0;y1<N;y1++){       //V birim matris 50x50
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE452:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE453
;PCA_FLDA_GUI_events_code.c,772 :: 		for(x1=0;x1<N;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE455:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE456
;PCA_FLDA_GUI_events_code.c,773 :: 		if (x1==y1) V[x1][y1+50] = 1;
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_FLDA_CONTINUE458
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
ADDS	R0, #50
LSLS	R0, R0, #2
ADDS	R1, R1, R0
VMOV.F32	S0, #1
VSTR	#1, S0, [R1, #0]
IT	AL
BAL	L_FLDA_CONTINUE459
L_FLDA_CONTINUE458:
;PCA_FLDA_GUI_events_code.c,774 :: 		else        V[x1][y1+50] = 0;}}
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
ADDS	R0, #50
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
L_FLDA_CONTINUE459:
;PCA_FLDA_GUI_events_code.c,772 :: 		for(x1=0;x1<N;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,774 :: 		else        V[x1][y1+50] = 0;}}
IT	AL
BAL	L_FLDA_CONTINUE455
L_FLDA_CONTINUE456:
;PCA_FLDA_GUI_events_code.c,771 :: 		for(y1=0;y1<N;y1++){       //V birim matris 50x50
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,774 :: 		else        V[x1][y1+50] = 0;}}
IT	AL
BAL	L_FLDA_CONTINUE452
L_FLDA_CONTINUE453:
;PCA_FLDA_GUI_events_code.c,776 :: 		for(ii=0;ii<QR_iteration;ii++){  //QR büyük dongu-1
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE460:
MOVW	R0, #lo_addr(_QR_iteration+0)
MOVT	R0, #hi_addr(_QR_iteration+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE461
;PCA_FLDA_GUI_events_code.c,778 :: 		for(x1=0;x1<N;x1++){                   // R matrisi
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE463:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE464
;PCA_FLDA_GUI_events_code.c,779 :: 		for(y1=0;y1<N;y1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE466:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE467
;PCA_FLDA_GUI_events_code.c,780 :: 		L[50+x1][50+y1] = 0;}
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOVW	R2, #lo_addr(_y1+0)
MOVT	R2, #hi_addr(_y1+0)
LDR	R0, [R2, #0]
ADDS	R0, #50
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,779 :: 		for(y1=0;y1<N;y1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,780 :: 		L[50+x1][50+y1] = 0;}
IT	AL
BAL	L_FLDA_CONTINUE466
L_FLDA_CONTINUE467:
;PCA_FLDA_GUI_events_code.c,778 :: 		for(x1=0;x1<N;x1++){                   // R matrisi
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,780 :: 		L[50+x1][50+y1] = 0;}
IT	AL
BAL	L_FLDA_CONTINUE463
L_FLDA_CONTINUE464:
;PCA_FLDA_GUI_events_code.c,782 :: 		for(kk=0;kk<N;kk++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE469:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE470
;PCA_FLDA_GUI_events_code.c,783 :: 		for(jj=0;jj<kk;jj++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE472:
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE473
;PCA_FLDA_GUI_events_code.c,784 :: 		temp3 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,785 :: 		for(x1=0;x1<N;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE475:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE476
;PCA_FLDA_GUI_events_code.c,786 :: 		temp3 = temp3 + L[50+x1][jj]*L[50+x1][kk];  //R = Q'*Q
MOVW	R3, #lo_addr(_x1+0)
MOVT	R3, #hi_addr(_x1+0)
LDR	R0, [R3, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R2, R1, R0
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R2, #0]
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,785 :: 		for(x1=0;x1<N;x1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,786 :: 		temp3 = temp3 + L[50+x1][jj]*L[50+x1][kk];  //R = Q'*Q
IT	AL
BAL	L_FLDA_CONTINUE475
L_FLDA_CONTINUE476:
;PCA_FLDA_GUI_events_code.c,787 :: 		L[50+jj][50+kk] = temp3;
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
ADDS	R0, #50
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,788 :: 		for(x1=0;x1<N;x1++)      // R*Q =  MTemp[x1]
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE478:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE479
;PCA_FLDA_GUI_events_code.c,789 :: 		MTemp[x1] =  L[50+jj][50+kk]*L[50+x1][jj];
MOVW	R4, #lo_addr(_x1+0)
MOVT	R4, #hi_addr(_x1+0)
LDR	R0, [R4, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_MTemp+0)
MOVT	R0, #hi_addr(_MTemp+0)
ADDS	R3, R0, R1
MOVW	R2, #lo_addr(_jj+0)
MOVT	R2, #hi_addr(_jj+0)
LDR	R0, [R2, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
ADDS	R0, #50
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S1, [R0, #0]
MOV	R0, R4
LDR	R0, [R0, #0]
ADDW	R1, R0, #50
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
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,788 :: 		for(x1=0;x1<N;x1++)      // R*Q =  MTemp[x1]
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;PCA_FLDA_GUI_events_code.c,789 :: 		MTemp[x1] =  L[50+jj][50+kk]*L[50+x1][jj];
IT	AL
BAL	L_FLDA_CONTINUE478
L_FLDA_CONTINUE479:
;PCA_FLDA_GUI_events_code.c,790 :: 		for(x1=0;x1<N;x1++)   //Q=Q-RQ
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE481:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE482
;PCA_FLDA_GUI_events_code.c,791 :: 		GTemp[x1]   = L[50+x1][kk] - MTemp[x1] ;
MOVW	R4, #lo_addr(_x1+0)
MOVT	R4, #hi_addr(_x1+0)
LDR	R0, [R4, #0]
LSLS	R3, R0, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R2, R0, R3
MOV	R0, R4
LDR	R0, [R0, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_MTemp+0)
MOVT	R0, #hi_addr(_MTemp+0)
ADDS	R0, R0, R3
VLDR	#1, S0, [R0, #0]
VSUB.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,790 :: 		for(x1=0;x1<N;x1++)   //Q=Q-RQ
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;PCA_FLDA_GUI_events_code.c,791 :: 		GTemp[x1]   = L[50+x1][kk] - MTemp[x1] ;
IT	AL
BAL	L_FLDA_CONTINUE481
L_FLDA_CONTINUE482:
;PCA_FLDA_GUI_events_code.c,792 :: 		for(x1=0;x1<N;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE484:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE485
;PCA_FLDA_GUI_events_code.c,793 :: 		L[50+x1][kk] = GTemp[x1];  }
MOVW	R3, #lo_addr(_x1+0)
MOVT	R3, #hi_addr(_x1+0)
LDR	R0, [R3, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R2, R1, R0
MOV	R0, R3
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,792 :: 		for(x1=0;x1<N;x1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,793 :: 		L[50+x1][kk] = GTemp[x1];  }
IT	AL
BAL	L_FLDA_CONTINUE484
L_FLDA_CONTINUE485:
;PCA_FLDA_GUI_events_code.c,783 :: 		for(jj=0;jj<kk;jj++){
MOVW	R1, #lo_addr(_jj+0)
MOVT	R1, #hi_addr(_jj+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,793 :: 		L[50+x1][kk] = GTemp[x1];  }
IT	AL
BAL	L_FLDA_CONTINUE472
L_FLDA_CONTINUE473:
;PCA_FLDA_GUI_events_code.c,795 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,796 :: 		for(x1=0;x1<N;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE487:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE488
;PCA_FLDA_GUI_events_code.c,797 :: 		temp1 = temp1 + L[50+x1][kk]*L[50+x1][kk];
MOVW	R2, #lo_addr(_x1+0)
MOVT	R2, #hi_addr(_x1+0)
LDR	R0, [R2, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
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
;PCA_FLDA_GUI_events_code.c,796 :: 		for(x1=0;x1<N;x1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,797 :: 		temp1 = temp1 + L[50+x1][kk]*L[50+x1][kk];
IT	AL
BAL	L_FLDA_CONTINUE487
L_FLDA_CONTINUE488:
;PCA_FLDA_GUI_events_code.c,798 :: 		L[50+kk][50+kk] = sqrt(temp1);  //norm (Q)
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
ADDW	R2, R0, #50
MOVW	R0, #400
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
LSLS	R0, R2, #2
ADDS	R0, R1, R0
STR	R0, [SP, #4]
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
LDR	R0, [SP, #4]
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,800 :: 		for(x1=0;x1<N;x1++)  // Q =Q/R
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE490:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE491
;PCA_FLDA_GUI_events_code.c,801 :: 		L[50+x1][kk] = L[50+x1][kk]/L[50+kk][50+kk];
MOVW	R4, #lo_addr(_x1+0)
MOVT	R4, #hi_addr(_x1+0)
LDR	R0, [R4, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R2, R0, R1
MOVW	R1, #lo_addr(_kk+0)
MOVT	R1, #hi_addr(_kk+0)
LDR	R0, [R1, #0]
LSLS	R0, R0, #2
ADDS	R3, R2, R0
VLDR	#1, S1, [R3, #0]
MOV	R0, R1
LDR	R0, [R0, #0]
ADDW	R2, R0, #50
MOVW	R0, #400
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
LSLS	R0, R2, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
VDIV.F32	S0, S1, S0
VSTR	#1, S0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,800 :: 		for(x1=0;x1<N;x1++)  // Q =Q/R
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;PCA_FLDA_GUI_events_code.c,801 :: 		L[50+x1][kk] = L[50+x1][kk]/L[50+kk][50+kk];
IT	AL
BAL	L_FLDA_CONTINUE490
L_FLDA_CONTINUE491:
;PCA_FLDA_GUI_events_code.c,782 :: 		for(kk=0;kk<N;kk++){
MOVW	R1, #lo_addr(_kk+0)
MOVT	R1, #hi_addr(_kk+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,802 :: 		}
IT	AL
BAL	L_FLDA_CONTINUE469
L_FLDA_CONTINUE470:
;PCA_FLDA_GUI_events_code.c,804 :: 		for(x1=0;x1<N;x1++){        // V[50][50] =V[50][50]*Q[50][50]
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE493:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE494
;PCA_FLDA_GUI_events_code.c,805 :: 		for(m1=0;m1<N;m1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_m1+0)
MOVT	R0, #hi_addr(_m1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE496:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_m1+0)
MOVT	R0, #hi_addr(_m1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE497
;PCA_FLDA_GUI_events_code.c,806 :: 		GTemp[m1] = V[x1][m1+50];
MOVW	R3, #lo_addr(_m1+0)
MOVT	R3, #hi_addr(_m1+0)
LDR	R0, [R3, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R2, R0, R1
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R1, R0, R1
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, #50
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,805 :: 		for(m1=0;m1<N;m1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,806 :: 		GTemp[m1] = V[x1][m1+50];
IT	AL
BAL	L_FLDA_CONTINUE496
L_FLDA_CONTINUE497:
;PCA_FLDA_GUI_events_code.c,807 :: 		for(y1=0;y1<N;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE499:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE500
;PCA_FLDA_GUI_events_code.c,808 :: 		temp3 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,809 :: 		for(z1=0;z1<N;z1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE502:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE503
;PCA_FLDA_GUI_events_code.c,810 :: 		temp3 = temp3 + GTemp[z1]*L[z1+50][y1];
MOVW	R3, #lo_addr(_z1+0)
MOVT	R3, #hi_addr(_z1+0)
LDR	R0, [R3, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R2, R0, R1
MOV	R0, R3
LDR	R0, [R0, #0]
ADDW	R1, R0, #50
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
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R2, #0]
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,809 :: 		for(z1=0;z1<N;z1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,810 :: 		temp3 = temp3 + GTemp[z1]*L[z1+50][y1];
IT	AL
BAL	L_FLDA_CONTINUE502
L_FLDA_CONTINUE503:
;PCA_FLDA_GUI_events_code.c,811 :: 		V[x1][y1+50] = temp3;}}
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
ADDS	R0, #50
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,807 :: 		for(y1=0;y1<N;y1++){
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,811 :: 		V[x1][y1+50] = temp3;}}
IT	AL
BAL	L_FLDA_CONTINUE499
L_FLDA_CONTINUE500:
;PCA_FLDA_GUI_events_code.c,804 :: 		for(x1=0;x1<N;x1++){        // V[50][50] =V[50][50]*Q[50][50]
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,811 :: 		V[x1][y1+50] = temp3;}}
IT	AL
BAL	L_FLDA_CONTINUE493
L_FLDA_CONTINUE494:
;PCA_FLDA_GUI_events_code.c,813 :: 		for(y1=0;y1<N;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE505:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE506
;PCA_FLDA_GUI_events_code.c,814 :: 		for(m1=0;m1<N;m1++)            // Q atanýyor
MOVS	R1, #0
MOVW	R0, #lo_addr(_m1+0)
MOVT	R0, #hi_addr(_m1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE508:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_m1+0)
MOVT	R0, #hi_addr(_m1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE509
;PCA_FLDA_GUI_events_code.c,815 :: 		GTemp[m1] = L[50+m1][y1];
MOVW	R3, #lo_addr(_m1+0)
MOVT	R3, #hi_addr(_m1+0)
LDR	R0, [R3, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R2, R0, R1
MOV	R0, R3
LDR	R0, [R0, #0]
ADDW	R1, R0, #50
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
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,814 :: 		for(m1=0;m1<N;m1++)            // Q atanýyor
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,815 :: 		GTemp[m1] = L[50+m1][y1];
IT	AL
BAL	L_FLDA_CONTINUE508
L_FLDA_CONTINUE509:
;PCA_FLDA_GUI_events_code.c,816 :: 		for(x1=0;x1<N;x1++){       // Q[50][50]= R[50][50]*Q[50][50]
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE511:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE512
;PCA_FLDA_GUI_events_code.c,817 :: 		temp3 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,818 :: 		for(z1=0;z1<N;z1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE514:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE515
;PCA_FLDA_GUI_events_code.c,819 :: 		temp3 = temp3 + L[x1+50][z1+50]*GTemp[z1];
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
ADDW	R1, R0, #50
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
MOVW	R3, #lo_addr(_z1+0)
MOVT	R3, #hi_addr(_z1+0)
LDR	R0, [R3, #0]
ADDS	R0, #50
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
;PCA_FLDA_GUI_events_code.c,818 :: 		for(z1=0;z1<N;z1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,819 :: 		temp3 = temp3 + L[x1+50][z1+50]*GTemp[z1];
IT	AL
BAL	L_FLDA_CONTINUE514
L_FLDA_CONTINUE515:
;PCA_FLDA_GUI_events_code.c,820 :: 		L[50+x1][y1] = temp3;}}
MOVW	R2, #lo_addr(_x1+0)
MOVT	R2, #hi_addr(_x1+0)
LDR	R0, [R2, #0]
ADDW	R1, R0, #50
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
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,816 :: 		for(x1=0;x1<N;x1++){       // Q[50][50]= R[50][50]*Q[50][50]
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,820 :: 		L[50+x1][y1] = temp3;}}
IT	AL
BAL	L_FLDA_CONTINUE511
L_FLDA_CONTINUE512:
;PCA_FLDA_GUI_events_code.c,813 :: 		for(y1=0;y1<N;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,820 :: 		L[50+x1][y1] = temp3;}}
IT	AL
BAL	L_FLDA_CONTINUE505
L_FLDA_CONTINUE506:
;PCA_FLDA_GUI_events_code.c,776 :: 		for(ii=0;ii<QR_iteration;ii++){  //QR büyük dongu-1
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,824 :: 		}
IT	AL
BAL	L_FLDA_CONTINUE460
L_FLDA_CONTINUE461:
;PCA_FLDA_GUI_events_code.c,826 :: 		for(x1=0;x1<N;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE517:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE518
;PCA_FLDA_GUI_events_code.c,827 :: 		Fisher[x1][tt] = V[x1][0+50];
MOVW	R3, #lo_addr(_x1+0)
MOVT	R3, #hi_addr(_x1+0)
LDR	R1, [R3, #0]
MOVS	R0, #76
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_Fisher+0)
MOVT	R0, #hi_addr(_Fisher+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_tt+0)
MOVT	R0, #hi_addr(_tt+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R2, R1, R0
MOV	R0, R3
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_V+0)
MOVT	R0, #hi_addr(_V+0)
ADDS	R0, R0, R1
ADDS	R0, #200
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,826 :: 		for(x1=0;x1<N;x1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,827 :: 		Fisher[x1][tt] = V[x1][0+50];
IT	AL
BAL	L_FLDA_CONTINUE517
L_FLDA_CONTINUE518:
;PCA_FLDA_GUI_events_code.c,828 :: 		TFT_Write_Text("FISHER Eigenvector OK",  30, 290);
MOVW	R0, #lo_addr(?lstr33_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr33_PCA_FLDA_GUI_events_code+0)
MOVW	R2, #290
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,701 :: 		for(tt=1;tt<ClassNumber-1;tt++) {
MOVW	R1, #lo_addr(_tt+0)
MOVT	R1, #hi_addr(_tt+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,829 :: 		}
IT	AL
BAL	L_FLDA_CONTINUE389
L_FLDA_CONTINUE390:
;PCA_FLDA_GUI_events_code.c,831 :: 		for(x1=0;x1<(ClassNumber-1);x1++){       // ProjectedImages_Fisher(:,i)=V_Fisher'*ProjectedImages(:,i)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE520:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE521
;PCA_FLDA_GUI_events_code.c,832 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE523:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE524
;PCA_FLDA_GUI_events_code.c,833 :: 		temp3 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,834 :: 		for(z1=0;z1<N;z1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_FLDA_CONTINUE526:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_CONTINUE527
;PCA_FLDA_GUI_events_code.c,835 :: 		temp3 = temp3 + Fisher[z1][x1]*L[z1][y1];
MOVW	R3, #lo_addr(_z1+0)
MOVT	R3, #hi_addr(_z1+0)
LDR	R1, [R3, #0]
MOVS	R0, #76
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_Fisher+0)
MOVT	R0, #hi_addr(_Fisher+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R2, R1, R0
MOV	R0, R3
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
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R2, #0]
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,834 :: 		for(z1=0;z1<N;z1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,835 :: 		temp3 = temp3 + Fisher[z1][x1]*L[z1][y1];
IT	AL
BAL	L_FLDA_CONTINUE526
L_FLDA_CONTINUE527:
;PCA_FLDA_GUI_events_code.c,836 :: 		L[x1+50][y1] = temp3;}}
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
ADDW	R1, R0, #50
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
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,832 :: 		for(y1=0;y1<TrainPicture;y1++){
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,836 :: 		L[x1+50][y1] = temp3;}}
IT	AL
BAL	L_FLDA_CONTINUE523
L_FLDA_CONTINUE524:
;PCA_FLDA_GUI_events_code.c,831 :: 		for(x1=0;x1<(ClassNumber-1);x1++){       // ProjectedImages_Fisher(:,i)=V_Fisher'*ProjectedImages(:,i)
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,836 :: 		L[x1+50][y1] = temp3;}}
IT	AL
BAL	L_FLDA_CONTINUE520
L_FLDA_CONTINUE521:
;PCA_FLDA_GUI_events_code.c,838 :: 		TFT_Write_Text("QR Algorithm Finish",  30, 310);
MOVW	R0, #lo_addr(?lstr34_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr34_PCA_FLDA_GUI_events_code+0)
MOVW	R2, #310
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,840 :: 		DrawScreen(&Screen17);
MOVW	R0, #lo_addr(_Screen17+0)
MOVT	R0, #hi_addr(_Screen17+0)
BL	_DrawScreen+0
;PCA_FLDA_GUI_events_code.c,841 :: 		}
L_end_FLDA_CONTINUE:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _FLDA_CONTINUE
_FLDA_TEST:
;PCA_FLDA_GUI_events_code.c,843 :: 		void FLDA_TEST() {       //SCREEN-17
SUB	SP, SP, #8
STR	LR, [SP, #0]
;PCA_FLDA_GUI_events_code.c,844 :: 		DrawScreen(&Screen18);
MOVW	R0, #lo_addr(_Screen18+0)
MOVT	R0, #hi_addr(_Screen18+0)
BL	_DrawScreen+0
;PCA_FLDA_GUI_events_code.c,845 :: 		test_count = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_test_count+0)
MOVT	R0, #hi_addr(_test_count+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,846 :: 		accuracy = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_accuracy+0)
MOVT	R0, #hi_addr(_accuracy+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,847 :: 		NormFault=0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_NormFault+0)
MOVT	R0, #hi_addr(_NormFault+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,848 :: 		for(jj=100;jj<TestPicture+100;jj++) {      //TestPicture  = jj
MOVS	R1, #100
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
STR	R1, [R0, #0]
L_FLDA_TEST529:
MOVW	R0, #lo_addr(_TestPicture+0)
MOVT	R0, #hi_addr(_TestPicture+0)
LDR	R0, [R0, #0]
ADDW	R1, R0, #100
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_TEST530
;PCA_FLDA_GUI_events_code.c,850 :: 		test_count = test_count + 1;
MOVW	R1, #lo_addr(_test_count+0)
MOVT	R1, #hi_addr(_test_count+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,851 :: 		IntToStr(test_count,txt1);
SXTH	R0, R0
MOVW	R1, #lo_addr(_txt1+0)
MOVT	R1, #hi_addr(_txt1+0)
BL	_IntToStr+0
;PCA_FLDA_GUI_events_code.c,852 :: 		TFT_Write_Text(txt1,30,40);
MOVS	R2, #40
MOVS	R1, #30
MOVW	R0, #lo_addr(_txt1+0)
MOVT	R0, #hi_addr(_txt1+0)
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,853 :: 		TFT_Write_Text("TEST IMAGE", 60, 40);
MOVW	R0, #lo_addr(?lstr35_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr35_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #40
MOVS	R1, #60
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,855 :: 		ii = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,856 :: 		for(y1=0;y1<col;y1++){  // "TestPicture" siyah beyaz yazdýrma
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_FLDA_TEST532:
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_TEST533
;PCA_FLDA_GUI_events_code.c,857 :: 		for(x1=0;x1<row;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_TEST535:
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_TEST536
;PCA_FLDA_GUI_events_code.c,858 :: 		temp5 = TFT_RGBToColor16bit(Ear[jj*row*col+ii], Ear[jj*row*col+ii], Ear[jj*row*col+ii]);
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
;PCA_FLDA_GUI_events_code.c,859 :: 		TFT_Dot(x1+50, y1+60, temp5);
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
;PCA_FLDA_GUI_events_code.c,860 :: 		ii = ii + 1;}}
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,857 :: 		for(x1=0;x1<row;x1++){
LDR	R1, [SP, #4]
MOV	R0, R1
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,860 :: 		ii = ii + 1;}}
IT	AL
BAL	L_FLDA_TEST535
L_FLDA_TEST536:
;PCA_FLDA_GUI_events_code.c,856 :: 		for(y1=0;y1<col;y1++){  // "TestPicture" siyah beyaz yazdýrma
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,860 :: 		ii = ii + 1;}}
IT	AL
BAL	L_FLDA_TEST532
L_FLDA_TEST533:
;PCA_FLDA_GUI_events_code.c,862 :: 		for(x1=0;x1<TrainPicture;x1++){    //  MTemp (100x1) = (A)'*(TestPicture - m_ort)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_TEST538:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_TEST539
;PCA_FLDA_GUI_events_code.c,863 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,864 :: 		for(ii=0;ii<row*col;ii++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_FLDA_TEST541:
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
BCS	L_FLDA_TEST542
;PCA_FLDA_GUI_events_code.c,865 :: 		temp1 = temp1 + (ear[row*col*x1 + ii] - m_ort[ii])*(ear[row*col*jj + ii] - m_ort[ii]);
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R0, [R0, #0]
MUL	R5, R0, R1
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
MUL	R1, R5, R0
MOVW	R4, #lo_addr(_ii+0)
MOVT	R4, #hi_addr(_ii+0)
LDR	R0, [R4, #0]
ADDS	R0, R1, R0
MOVW	R3, #lo_addr(_Ear+0)
MOVT	R3, #hi_addr(_Ear+0)
ADDS	R0, R3, R0
LDRB	R2, [R0, #0]
MOV	R0, R4
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_m_ort+0)
MOVT	R0, #hi_addr(_m_ort+0)
ADDS	R1, R0, R1
VMOV	S0, R2
VCVT.F32	#0, S0, S0
VLDR	#1, S2, [R1, #0]
VSUB.F32	S1, S0, S2
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
MUL	R1, R5, R0
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R1, R0
ADDS	R0, R3, R0
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
;PCA_FLDA_GUI_events_code.c,864 :: 		for(ii=0;ii<row*col;ii++)
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;PCA_FLDA_GUI_events_code.c,865 :: 		temp1 = temp1 + (ear[row*col*x1 + ii] - m_ort[ii])*(ear[row*col*jj + ii] - m_ort[ii]);
IT	AL
BAL	L_FLDA_TEST541
L_FLDA_TEST542:
;PCA_FLDA_GUI_events_code.c,866 :: 		MTemp[x1] = temp1;}   //100x1
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
;PCA_FLDA_GUI_events_code.c,862 :: 		for(x1=0;x1<TrainPicture;x1++){    //  MTemp (100x1) = (A)'*(TestPicture - m_ort)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,866 :: 		MTemp[x1] = temp1;}   //100x1
IT	AL
BAL	L_FLDA_TEST538
L_FLDA_TEST539:
;PCA_FLDA_GUI_events_code.c,868 :: 		for(y1=0;y1<N;y1++){      // GTemp (50x1) = (V)' * MTemp
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_FLDA_TEST544:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_TEST545
;PCA_FLDA_GUI_events_code.c,869 :: 		temp2 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp2+0)
MOVT	R0, #hi_addr(_temp2+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,870 :: 		for(x1=0;x1<TrainPicture;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_TEST547:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_TEST548
;PCA_FLDA_GUI_events_code.c,871 :: 		temp2 = temp2 + V[x1][y1]*MTemp[x1];
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
;PCA_FLDA_GUI_events_code.c,870 :: 		for(x1=0;x1<TrainPicture;x1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,871 :: 		temp2 = temp2 + V[x1][y1]*MTemp[x1];
IT	AL
BAL	L_FLDA_TEST547
L_FLDA_TEST548:
;PCA_FLDA_GUI_events_code.c,872 :: 		GTemp[y1] = temp2;}
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
;PCA_FLDA_GUI_events_code.c,868 :: 		for(y1=0;y1<N;y1++){      // GTemp (50x1) = (V)' * MTemp
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,872 :: 		GTemp[y1] = temp2;}
IT	AL
BAL	L_FLDA_TEST544
L_FLDA_TEST545:
;PCA_FLDA_GUI_events_code.c,874 :: 		for(y1=0;y1<(ClassNumber-1);y1++){      // ProjectedTestImage (19x1) = (Fisher)' * GTemp
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_FLDA_TEST550:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_TEST551
;PCA_FLDA_GUI_events_code.c,875 :: 		temp3 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,876 :: 		for(x1=0;x1<N;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_TEST553:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_TEST554
;PCA_FLDA_GUI_events_code.c,877 :: 		temp3 = temp3 + Fisher[x1][y1]*GTemp[x1];
MOVW	R3, #lo_addr(_x1+0)
MOVT	R3, #hi_addr(_x1+0)
LDR	R1, [R3, #0]
MOVS	R0, #76
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_Fisher+0)
MOVT	R0, #hi_addr(_Fisher+0)
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
;PCA_FLDA_GUI_events_code.c,876 :: 		for(x1=0;x1<N;x1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;PCA_FLDA_GUI_events_code.c,877 :: 		temp3 = temp3 + Fisher[x1][y1]*GTemp[x1];
IT	AL
BAL	L_FLDA_TEST553
L_FLDA_TEST554:
;PCA_FLDA_GUI_events_code.c,878 :: 		ProjectedTestImage[y1] = temp3;}
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
;PCA_FLDA_GUI_events_code.c,874 :: 		for(y1=0;y1<(ClassNumber-1);y1++){      // ProjectedTestImage (19x1) = (Fisher)' * GTemp
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,878 :: 		ProjectedTestImage[y1] = temp3;}
IT	AL
BAL	L_FLDA_TEST550
L_FLDA_TEST551:
;PCA_FLDA_GUI_events_code.c,880 :: 		EpsilonK = 1e+5;              //ClassNorm bulunmasý
MOVW	R0, #20480
MOVT	R0, #18371
VMOV	S0, R0
MOVW	R0, #lo_addr(_EpsilonK+0)
MOVT	R0, #hi_addr(_EpsilonK+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,881 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_FLDA_TEST556:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_TEST557
;PCA_FLDA_GUI_events_code.c,882 :: 		temp4 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,883 :: 		for(x1=0;x1<(ClassNumber-1);x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_TEST559:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_TEST560
;PCA_FLDA_GUI_events_code.c,884 :: 		temp4 = temp4 + (L[x1+50][y1] - ProjectedTestImage[x1])*(L[x1+50][y1] - ProjectedTestImage[x1]);
MOVW	R2, #lo_addr(_x1+0)
MOVT	R2, #hi_addr(_x1+0)
LDR	R0, [R2, #0]
ADDW	R1, R0, #50
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
;PCA_FLDA_GUI_events_code.c,883 :: 		for(x1=0;x1<(ClassNumber-1);x1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;PCA_FLDA_GUI_events_code.c,884 :: 		temp4 = temp4 + (L[x1+50][y1] - ProjectedTestImage[x1])*(L[x1+50][y1] - ProjectedTestImage[x1]);
IT	AL
BAL	L_FLDA_TEST559
L_FLDA_TEST560:
;PCA_FLDA_GUI_events_code.c,885 :: 		temp4 = sqrt(temp4);
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,886 :: 		if (temp4 < EpsilonK) {
MOVW	R0, #lo_addr(_EpsilonK+0)
MOVT	R0, #hi_addr(_EpsilonK+0)
VLDR	#1, S1, [R0, #0]
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	GE
BGE	L_FLDA_TEST562
;PCA_FLDA_GUI_events_code.c,887 :: 		EpsilonK = temp4;
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_EpsilonK+0)
MOVT	R0, #hi_addr(_EpsilonK+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,888 :: 		WhoseEar = y1;}}
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_WhoseEar+0)
MOVT	R0, #hi_addr(_WhoseEar+0)
STR	R1, [R0, #0]
L_FLDA_TEST562:
;PCA_FLDA_GUI_events_code.c,881 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,888 :: 		WhoseEar = y1;}}
IT	AL
BAL	L_FLDA_TEST556
L_FLDA_TEST557:
;PCA_FLDA_GUI_events_code.c,891 :: 		NormFault = NormFault + (EpsilonK - FLDA_ORJ[jj-100])*(EpsilonK - FLDA_ORJ[jj-100]);
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
SUBS	R0, #100
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_FLDA_ORJ+0)
MOVT	R0, #hi_addr(_FLDA_ORJ+0)
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
;PCA_FLDA_GUI_events_code.c,895 :: 		if (EpsilonK < FLDA_TetaC) {
MOVW	R0, #lo_addr(_FLDA_TetaC+0)
MOVT	R0, #hi_addr(_FLDA_TetaC+0)
VLDR	#1, S1, [R0, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	GE
BGE	L_FLDA_TEST563
;PCA_FLDA_GUI_events_code.c,896 :: 		if (jj<120) accuracy += 2;
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
CMP	R0, #120
IT	CS
BCS	L_FLDA_TEST564
MOVW	R1, #lo_addr(_accuracy+0)
MOVT	R1, #hi_addr(_accuracy+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #2
STRH	R0, [R1, #0]
L_FLDA_TEST564:
;PCA_FLDA_GUI_events_code.c,897 :: 		TFT_Write_Text("This picture is ear", 30, 160);
MOVW	R0, #lo_addr(?lstr36_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr36_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #160
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,898 :: 		TFT_Write_Text("The ear is in the database", 30, 180);
MOVW	R0, #lo_addr(?lstr37_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr37_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #180
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,899 :: 		TFT_Write_Text("Epsilon", 30, 200);
MOVW	R0, #lo_addr(?lstr38_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr38_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #200
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,900 :: 		FloatToStr(EpsilonK ,txt2);
MOVW	R0, #lo_addr(_EpsilonK+0)
MOVT	R0, #hi_addr(_EpsilonK+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_txt2+0)
MOVT	R0, #hi_addr(_txt2+0)
BL	_FloatToStr+0
;PCA_FLDA_GUI_events_code.c,901 :: 		TFT_Write_Text(txt2,100,200);
MOVS	R2, #200
MOVS	R1, #100
MOVW	R0, #lo_addr(_txt2+0)
MOVT	R0, #hi_addr(_txt2+0)
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,902 :: 		ii = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,903 :: 		for(y1=0;y1<col;y1++){  // "WhoseEar" siyah beyaz yazdýrma
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_FLDA_TEST565:
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_TEST566
;PCA_FLDA_GUI_events_code.c,904 :: 		for(x1=0;x1<row;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_FLDA_TEST568:
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_FLDA_TEST569
;PCA_FLDA_GUI_events_code.c,905 :: 		temp5 = TFT_RGBToColor16bit(Ear[WhoseEar*row*col+ii], Ear[WhoseEar*row*col+ii], Ear[WhoseEar*row*col+ii]);
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
;PCA_FLDA_GUI_events_code.c,906 :: 		TFT_Dot(x1+130, y1+60, temp5);
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
;PCA_FLDA_GUI_events_code.c,907 :: 		ii = ii + 1;}}
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,904 :: 		for(x1=0;x1<row;x1++){
LDR	R1, [SP, #4]
MOV	R0, R1
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,907 :: 		ii = ii + 1;}}
IT	AL
BAL	L_FLDA_TEST568
L_FLDA_TEST569:
;PCA_FLDA_GUI_events_code.c,903 :: 		for(y1=0;y1<col;y1++){  // "WhoseEar" siyah beyaz yazdýrma
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,907 :: 		ii = ii + 1;}}
IT	AL
BAL	L_FLDA_TEST565
L_FLDA_TEST566:
;PCA_FLDA_GUI_events_code.c,908 :: 		}
IT	AL
BAL	L_FLDA_TEST571
L_FLDA_TEST563:
;PCA_FLDA_GUI_events_code.c,910 :: 		if (jj>=120) accuracy += 2;
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
CMP	R0, #120
IT	CC
BCC	L_FLDA_TEST572
MOVW	R1, #lo_addr(_accuracy+0)
MOVT	R1, #hi_addr(_accuracy+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #2
STRH	R0, [R1, #0]
L_FLDA_TEST572:
;PCA_FLDA_GUI_events_code.c,911 :: 		TFT_Write_Text("This is not in the database", 30, 180);
MOVW	R0, #lo_addr(?lstr39_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr39_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #180
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,912 :: 		TFT_Write_Text("Epsilon", 30, 200);
MOVW	R0, #lo_addr(?lstr40_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr40_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #200
MOVS	R1, #30
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,913 :: 		FloatToStr(EpsilonK ,txt2);
MOVW	R0, #lo_addr(_EpsilonK+0)
MOVT	R0, #hi_addr(_EpsilonK+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_txt2+0)
MOVT	R0, #hi_addr(_txt2+0)
BL	_FloatToStr+0
;PCA_FLDA_GUI_events_code.c,914 :: 		TFT_Write_Text(txt2,100,200);
MOVS	R2, #200
MOVS	R1, #100
MOVW	R0, #lo_addr(_txt2+0)
MOVT	R0, #hi_addr(_txt2+0)
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,915 :: 		}
L_FLDA_TEST571:
;PCA_FLDA_GUI_events_code.c,916 :: 		Delay_ms(1);
MOVW	R7, #55998
MOVT	R7, #0
NOP
NOP
L_FLDA_TEST573:
SUBS	R7, R7, #1
BNE	L_FLDA_TEST573
NOP
NOP
NOP
;PCA_FLDA_GUI_events_code.c,917 :: 		DrawScreen(&Screen18);
MOVW	R0, #lo_addr(_Screen18+0)
MOVT	R0, #hi_addr(_Screen18+0)
BL	_DrawScreen+0
;PCA_FLDA_GUI_events_code.c,848 :: 		for(jj=100;jj<TestPicture+100;jj++) {      //TestPicture  = jj
MOVW	R1, #lo_addr(_jj+0)
MOVT	R1, #hi_addr(_jj+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,918 :: 		}
IT	AL
BAL	L_FLDA_TEST529
L_FLDA_TEST530:
;PCA_FLDA_GUI_events_code.c,919 :: 		NormFault = (100*sqrt(NormFault))/(5.844566796674060e+03);
MOVW	R0, #lo_addr(_NormFault+0)
MOVT	R0, #hi_addr(_NormFault+0)
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S1, S1, S0
MOVW	R0, #42121
MOVT	R0, #17846
VMOV	S0, R0
VDIV.F32	S0, S1, S0
MOVW	R0, #lo_addr(_NormFault+0)
MOVT	R0, #hi_addr(_NormFault+0)
VSTR	#1, S0, [R0, #0]
;PCA_FLDA_GUI_events_code.c,920 :: 		ProgressBar2.Position = accuracy+1;
MOVW	R0, #lo_addr(_accuracy+0)
MOVT	R0, #hi_addr(_accuracy+0)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_ProgressBar2+48)
MOVT	R0, #hi_addr(_ProgressBar2+48)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,921 :: 		DrawScreen(&Screen19);
MOVW	R0, #lo_addr(_Screen19+0)
MOVT	R0, #hi_addr(_Screen19+0)
BL	_DrawScreen+0
;PCA_FLDA_GUI_events_code.c,922 :: 		TFT_Write_Text("iteration = >",10,60);
MOVW	R0, #lo_addr(?lstr41_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr41_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #60
MOVS	R1, #10
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,923 :: 		IntToStr(iteration,txt1);
MOVW	R0, #lo_addr(_iteration+0)
MOVT	R0, #hi_addr(_iteration+0)
LDRH	R0, [R0, #0]
MOVW	R1, #lo_addr(_txt1+0)
MOVT	R1, #hi_addr(_txt1+0)
BL	_IntToStr+0
;PCA_FLDA_GUI_events_code.c,924 :: 		TFT_Write_Text(txt1,120,60);
MOVS	R2, #60
MOVS	R1, #120
MOVW	R0, #lo_addr(_txt1+0)
MOVT	R0, #hi_addr(_txt1+0)
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,925 :: 		TFT_Write_Text("Norm Fault = >",10,100);
MOVW	R0, #lo_addr(?lstr42_PCA_FLDA_GUI_events_code+0)
MOVT	R0, #hi_addr(?lstr42_PCA_FLDA_GUI_events_code+0)
MOVS	R2, #100
MOVS	R1, #10
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,926 :: 		FloatToStr(NormFault,txt2);
MOVW	R0, #lo_addr(_NormFault+0)
MOVT	R0, #hi_addr(_NormFault+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_txt2+0)
MOVT	R0, #hi_addr(_txt2+0)
BL	_FloatToStr+0
;PCA_FLDA_GUI_events_code.c,927 :: 		TFT_Write_Text(txt2,120,100);
MOVS	R2, #100
MOVS	R1, #120
MOVW	R0, #lo_addr(_txt2+0)
MOVT	R0, #hi_addr(_txt2+0)
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_events_code.c,929 :: 		}
L_end_FLDA_TEST:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _FLDA_TEST
_FLDA_RESULTS_MAIN:
;PCA_FLDA_GUI_events_code.c,931 :: 		void FLDA_RESULTS_MAIN() {  //SCREEN-19
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PCA_FLDA_GUI_events_code.c,932 :: 		DrawScreen(&Screen1);
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;PCA_FLDA_GUI_events_code.c,933 :: 		}
L_end_FLDA_RESULTS_MAIN:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FLDA_RESULTS_MAIN
_DATABASE_SHOW:
;PCA_FLDA_GUI_events_code.c,935 :: 		void DATABASE_SHOW() {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;PCA_FLDA_GUI_events_code.c,936 :: 		DrawScreen(&Screen20);
MOVW	R0, #lo_addr(_Screen20+0)
MOVT	R0, #hi_addr(_Screen20+0)
BL	_DrawScreen+0
;PCA_FLDA_GUI_events_code.c,938 :: 		for(jj=0;jj<TrainPicture;jj=jj+4){
MOVS	R1, #0
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
STR	R1, [R0, #0]
L_DATABASE_SHOW575:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DATABASE_SHOW576
;PCA_FLDA_GUI_events_code.c,939 :: 		Delay_ms(100);
MOVW	R7, #29438
MOVT	R7, #85
NOP
NOP
L_DATABASE_SHOW578:
SUBS	R7, R7, #1
BNE	L_DATABASE_SHOW578
NOP
NOP
NOP
;PCA_FLDA_GUI_events_code.c,940 :: 		ii=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,941 :: 		for(y1=0;y1<col;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DATABASE_SHOW580:
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DATABASE_SHOW581
;PCA_FLDA_GUI_events_code.c,942 :: 		for(x1=0;x1<row;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DATABASE_SHOW583:
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DATABASE_SHOW584
;PCA_FLDA_GUI_events_code.c,943 :: 		temp1 = TFT_RGBToColor16bit(Ear[jj*row*col+ii], Ear[jj*row*col+ii], Ear[jj*row*col+ii]);
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
;PCA_FLDA_GUI_events_code.c,944 :: 		TFT_Dot(x1+50,y1+80,temp1);
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
UXTH	R0, R0
UXTH	R2, R0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
ADDW	R1, R0, #80
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R0, [SP, #4]
LDR	R0, [R0, #0]
ADDS	R0, #50
SXTH	R1, R1
SXTH	R0, R0
BL	_TFT_Dot+0
;PCA_FLDA_GUI_events_code.c,945 :: 		ii=ii+1;}}
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,942 :: 		for(x1=0;x1<row;x1++){
LDR	R1, [SP, #4]
MOV	R0, R1
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,945 :: 		ii=ii+1;}}
IT	AL
BAL	L_DATABASE_SHOW583
L_DATABASE_SHOW584:
;PCA_FLDA_GUI_events_code.c,941 :: 		for(y1=0;y1<col;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,945 :: 		ii=ii+1;}}
IT	AL
BAL	L_DATABASE_SHOW580
L_DATABASE_SHOW581:
;PCA_FLDA_GUI_events_code.c,947 :: 		ii=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,948 :: 		for(y1=0;y1<col;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DATABASE_SHOW586:
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DATABASE_SHOW587
;PCA_FLDA_GUI_events_code.c,949 :: 		for(x1=0;x1<row;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DATABASE_SHOW589:
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DATABASE_SHOW590
;PCA_FLDA_GUI_events_code.c,950 :: 		temp1 = TFT_RGBToColor16bit(Ear[(jj+1)*row*col+ii], Ear[(jj+1)*row*col+ii], Ear[(jj+1)*row*col+ii]);
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
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
;PCA_FLDA_GUI_events_code.c,951 :: 		TFT_Dot(x1+130,y1+80,temp1);
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
UXTH	R0, R0
UXTH	R2, R0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
ADDW	R1, R0, #80
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R0, [SP, #4]
LDR	R0, [R0, #0]
ADDS	R0, #130
SXTH	R1, R1
SXTH	R0, R0
BL	_TFT_Dot+0
;PCA_FLDA_GUI_events_code.c,952 :: 		ii=ii+1;}}
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,949 :: 		for(x1=0;x1<row;x1++){
LDR	R1, [SP, #4]
MOV	R0, R1
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,952 :: 		ii=ii+1;}}
IT	AL
BAL	L_DATABASE_SHOW589
L_DATABASE_SHOW590:
;PCA_FLDA_GUI_events_code.c,948 :: 		for(y1=0;y1<col;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,952 :: 		ii=ii+1;}}
IT	AL
BAL	L_DATABASE_SHOW586
L_DATABASE_SHOW587:
;PCA_FLDA_GUI_events_code.c,954 :: 		ii=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,955 :: 		for(y1=0;y1<col;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DATABASE_SHOW592:
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DATABASE_SHOW593
;PCA_FLDA_GUI_events_code.c,956 :: 		for(x1=0;x1<row;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DATABASE_SHOW595:
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DATABASE_SHOW596
;PCA_FLDA_GUI_events_code.c,957 :: 		temp1 = TFT_RGBToColor16bit(Ear[(jj+2)*row*col+ii], Ear[(jj+2)*row*col+ii], Ear[(jj+2)*row*col+ii]);
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
ADDS	R1, R0, #2
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
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
;PCA_FLDA_GUI_events_code.c,958 :: 		TFT_Dot(x1+50,y1+200,temp1);
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
UXTH	R0, R0
UXTH	R2, R0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
ADDW	R1, R0, #200
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R0, [SP, #4]
LDR	R0, [R0, #0]
ADDS	R0, #50
SXTH	R1, R1
SXTH	R0, R0
BL	_TFT_Dot+0
;PCA_FLDA_GUI_events_code.c,959 :: 		ii=ii+1;}}
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,956 :: 		for(x1=0;x1<row;x1++){
LDR	R1, [SP, #4]
MOV	R0, R1
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,959 :: 		ii=ii+1;}}
IT	AL
BAL	L_DATABASE_SHOW595
L_DATABASE_SHOW596:
;PCA_FLDA_GUI_events_code.c,955 :: 		for(y1=0;y1<col;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,959 :: 		ii=ii+1;}}
IT	AL
BAL	L_DATABASE_SHOW592
L_DATABASE_SHOW593:
;PCA_FLDA_GUI_events_code.c,961 :: 		ii=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_events_code.c,962 :: 		for(y1=0;y1<col;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_DATABASE_SHOW598:
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DATABASE_SHOW599
;PCA_FLDA_GUI_events_code.c,963 :: 		for(x1=0;x1<row;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_DATABASE_SHOW601:
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_DATABASE_SHOW602
;PCA_FLDA_GUI_events_code.c,964 :: 		temp1 = TFT_RGBToColor16bit(Ear[(jj+3)*row*col+ii], Ear[(jj+3)*row*col+ii], Ear[(jj+3)*row*col+ii]);
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
ADDS	R1, R0, #3
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
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
;PCA_FLDA_GUI_events_code.c,965 :: 		TFT_Dot(x1+130,y1+200,temp1);
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
UXTH	R0, R0
UXTH	R2, R0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
ADDW	R1, R0, #200
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R0, [SP, #4]
LDR	R0, [R0, #0]
ADDS	R0, #130
SXTH	R1, R1
SXTH	R0, R0
BL	_TFT_Dot+0
;PCA_FLDA_GUI_events_code.c,966 :: 		ii=ii+1;}}
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,963 :: 		for(x1=0;x1<row;x1++){
LDR	R1, [SP, #4]
MOV	R0, R1
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,966 :: 		ii=ii+1;}}
IT	AL
BAL	L_DATABASE_SHOW601
L_DATABASE_SHOW602:
;PCA_FLDA_GUI_events_code.c,962 :: 		for(y1=0;y1<col;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,966 :: 		ii=ii+1;}}
IT	AL
BAL	L_DATABASE_SHOW598
L_DATABASE_SHOW599:
;PCA_FLDA_GUI_events_code.c,938 :: 		for(jj=0;jj<TrainPicture;jj=jj+4){
MOVW	R1, #lo_addr(_jj+0)
MOVT	R1, #hi_addr(_jj+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #4
STR	R0, [R1, #0]
;PCA_FLDA_GUI_events_code.c,968 :: 		}
IT	AL
BAL	L_DATABASE_SHOW575
L_DATABASE_SHOW576:
;PCA_FLDA_GUI_events_code.c,970 :: 		Delay_ms(1000);
MOVW	R7, #32254
MOVT	R7, #854
NOP
NOP
L_DATABASE_SHOW604:
SUBS	R7, R7, #1
BNE	L_DATABASE_SHOW604
NOP
NOP
NOP
;PCA_FLDA_GUI_events_code.c,971 :: 		DrawScreen(&Screen1);
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;PCA_FLDA_GUI_events_code.c,972 :: 		}
L_end_DATABASE_SHOW:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DATABASE_SHOW
