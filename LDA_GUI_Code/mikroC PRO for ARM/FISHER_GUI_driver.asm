_Init_ADC:
;FISHER_GUI_driver.c,61 :: 		void Init_ADC() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;FISHER_GUI_driver.c,62 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_8 | _ADC_CHANNEL_9);
MOVW	R0, #768
BL	_ADC_Set_Input_Channel+0
;FISHER_GUI_driver.c,63 :: 		ADC1_Init();
BL	_ADC1_Init+0
;FISHER_GUI_driver.c,64 :: 		Delay_ms(100);
MOVW	R7, #13609
MOVT	R7, #71
NOP
NOP
L_Init_ADC0:
SUBS	R7, R7, #1
BNE	L_Init_ADC0
NOP
NOP
;FISHER_GUI_driver.c,65 :: 		}
L_end_Init_ADC:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_ADC
_TFT_Get_Data:
;FISHER_GUI_driver.c,67 :: 		char* TFT_Get_Data(unsigned long offset, unsigned long count, unsigned long *num) {
; offset start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
;FISHER_GUI_driver.c,71 :: 		start_sector = Mmc_Get_File_Write_Sector() + offset/512;
STR	R2, [SP, #16]
MOV	R2, R0
STR	R1, [SP, #12]
; offset end address is: 0 (R0)
; offset start address is: 8 (R2)
BL	_Mmc_Get_File_Write_Sector+0
LSRS	R3, R2, #9
ADDS	R4, R0, R3
STR	R4, [SP, #4]
;FISHER_GUI_driver.c,72 :: 		pos = (unsigned long)offset%512;
MOVW	R3, #511
AND	R3, R2, R3, LSL #0
; offset end address is: 8 (R2)
STRH	R3, [SP, #8]
;FISHER_GUI_driver.c,74 :: 		if(start_sector == currentSector+1) {
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
LDR	R3, [R3, #0]
ADDS	R3, R3, #1
CMP	R4, R3
IT	NE
BNE	L_TFT_Get_Data2
;FISHER_GUI_driver.c,75 :: 		Mmc_Multi_Read_Sector(Ext_Data_Buffer);
MOVW	R0, #lo_addr(_Ext_Data_Buffer+0)
MOVT	R0, #hi_addr(_Ext_Data_Buffer+0)
BL	_Mmc_Multi_Read_Sector+0
;FISHER_GUI_driver.c,76 :: 		currentSector = start_sector;
LDR	R4, [SP, #4]
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
STR	R4, [R3, #0]
;FISHER_GUI_driver.c,77 :: 		} else if (start_sector != currentSector) {
IT	AL
BAL	L_TFT_Get_Data3
L_TFT_Get_Data2:
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
LDR	R4, [R3, #0]
LDR	R3, [SP, #4]
CMP	R3, R4
IT	EQ
BEQ	L_TFT_Get_Data4
;FISHER_GUI_driver.c,78 :: 		if(currentSector != -1)
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
LDR	R3, [R3, #0]
CMP	R3, #-1
IT	EQ
BEQ	L_TFT_Get_Data5
;FISHER_GUI_driver.c,79 :: 		Mmc_Multi_Read_Stop();
BL	_Mmc_Multi_Read_Stop+0
L_TFT_Get_Data5:
;FISHER_GUI_driver.c,80 :: 		Mmc_Multi_Read_Start(start_sector);
LDR	R0, [SP, #4]
BL	_Mmc_Multi_Read_Start+0
;FISHER_GUI_driver.c,81 :: 		Mmc_Multi_Read_Sector(Ext_Data_Buffer);
MOVW	R0, #lo_addr(_Ext_Data_Buffer+0)
MOVT	R0, #hi_addr(_Ext_Data_Buffer+0)
BL	_Mmc_Multi_Read_Sector+0
;FISHER_GUI_driver.c,82 :: 		currentSector = start_sector;
LDR	R4, [SP, #4]
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
STR	R4, [R3, #0]
;FISHER_GUI_driver.c,83 :: 		}
L_TFT_Get_Data4:
L_TFT_Get_Data3:
;FISHER_GUI_driver.c,85 :: 		if(count>512-pos)
LDRH	R3, [SP, #8]
RSB	R4, R3, #512
UXTH	R4, R4
LDR	R3, [SP, #12]
CMP	R3, R4
IT	LS
BLS	L_TFT_Get_Data6
;FISHER_GUI_driver.c,86 :: 		*num = 512-pos;
LDRH	R3, [SP, #8]
RSB	R4, R3, #512
UXTH	R4, R4
LDR	R3, [SP, #16]
STR	R4, [R3, #0]
IT	AL
BAL	L_TFT_Get_Data7
L_TFT_Get_Data6:
;FISHER_GUI_driver.c,88 :: 		*num = count;
LDR	R4, [SP, #12]
LDR	R3, [SP, #16]
STR	R4, [R3, #0]
L_TFT_Get_Data7:
;FISHER_GUI_driver.c,90 :: 		return Ext_Data_Buffer+pos;
LDRH	R4, [SP, #8]
MOVW	R3, #lo_addr(_Ext_Data_Buffer+0)
MOVT	R3, #hi_addr(_Ext_Data_Buffer+0)
ADDS	R3, R3, R4
MOV	R0, R3
;FISHER_GUI_driver.c,91 :: 		}
L_end_TFT_Get_Data:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _TFT_Get_Data
FISHER_GUI_driver_InitializeTouchPanel:
;FISHER_GUI_driver.c,92 :: 		static void InitializeTouchPanel() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;FISHER_GUI_driver.c,93 :: 		Init_ADC();
BL	_Init_ADC+0
;FISHER_GUI_driver.c,94 :: 		TFT_Init(240, 320);
MOVW	R1, #320
MOVS	R0, #240
BL	_TFT_Init+0
;FISHER_GUI_driver.c,95 :: 		TFT_Set_Ext_Buffer(TFT_Get_Data);
MOVW	R0, #lo_addr(_TFT_Get_Data+0)
MOVT	R0, #hi_addr(_TFT_Get_Data+0)
BL	_TFT_Set_Ext_Buffer+0
;FISHER_GUI_driver.c,97 :: 		TP_TFT_Init(240, 320, 8, 9);                                  // Initialize touch panel
MOVS	R3, #9
MOVS	R2, #8
MOVW	R1, #320
MOVS	R0, #240
BL	_TP_TFT_Init+0
;FISHER_GUI_driver.c,98 :: 		TP_TFT_Set_ADC_Threshold(ADC_THRESHOLD);                              // Set touch panel ADC threshold
MOVW	R0, #1500
SXTH	R0, R0
BL	_TP_TFT_Set_ADC_Threshold+0
;FISHER_GUI_driver.c,100 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,101 :: 		PressedObject = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PressedObject+0)
MOVT	R0, #hi_addr(_PressedObject+0)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,102 :: 		PressedObjectType = -1;
MOVW	R1, #65535
SXTH	R1, R1
MOVW	R0, #lo_addr(_PressedObjectType+0)
MOVT	R0, #hi_addr(_PressedObjectType+0)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,103 :: 		}
L_end_InitializeTouchPanel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of FISHER_GUI_driver_InitializeTouchPanel
_Calibrate:
;FISHER_GUI_driver.c,105 :: 		void Calibrate() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;FISHER_GUI_driver.c,106 :: 		TFT_Set_Pen(CL_WHITE, 3);
MOVS	R1, #3
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;FISHER_GUI_driver.c,107 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;FISHER_GUI_driver.c,108 :: 		TFT_Write_Text("Touch selected corners for calibration", 1, 150);
MOVW	R0, #lo_addr(?lstr1_FISHER_GUI_driver+0)
MOVT	R0, #hi_addr(?lstr1_FISHER_GUI_driver+0)
MOVS	R2, #150
MOVS	R1, #1
BL	_TFT_Write_Text+0
;FISHER_GUI_driver.c,109 :: 		TFT_Line(0, 319, 5, 319);
MOVW	R3, #319
SXTH	R3, R3
MOVS	R2, #5
SXTH	R2, R2
MOVW	R1, #319
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;FISHER_GUI_driver.c,110 :: 		TFT_Line(0, 319, 0, 314);
MOVW	R3, #314
SXTH	R3, R3
MOVS	R2, #0
SXTH	R2, R2
MOVW	R1, #319
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;FISHER_GUI_driver.c,111 :: 		TFT_Line(0, 319, 10, 309);
MOVW	R3, #309
SXTH	R3, R3
MOVS	R2, #10
SXTH	R2, R2
MOVW	R1, #319
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;FISHER_GUI_driver.c,112 :: 		TFT_Write_Text("first here", 20, 290);
MOVW	R0, #lo_addr(?lstr2_FISHER_GUI_driver+0)
MOVT	R0, #hi_addr(?lstr2_FISHER_GUI_driver+0)
MOVW	R2, #290
MOVS	R1, #20
BL	_TFT_Write_Text+0
;FISHER_GUI_driver.c,114 :: 		TP_TFT_Calibrate_Min();                      // Calibration of bottom left corner
BL	_TP_TFT_Calibrate_Min+0
;FISHER_GUI_driver.c,115 :: 		Delay_ms(500);
MOVW	R7, #2515
MOVT	R7, #356
NOP
NOP
L_Calibrate8:
SUBS	R7, R7, #1
BNE	L_Calibrate8
NOP
NOP
NOP
NOP
;FISHER_GUI_driver.c,117 :: 		TFT_Set_Pen(CL_BLACK, 3);
MOVS	R1, #3
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;FISHER_GUI_driver.c,118 :: 		TFT_Set_Font(TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #0
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;FISHER_GUI_driver.c,119 :: 		TFT_Line(0, 319, 5, 319);
MOVW	R3, #319
SXTH	R3, R3
MOVS	R2, #5
SXTH	R2, R2
MOVW	R1, #319
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;FISHER_GUI_driver.c,120 :: 		TFT_Line(0, 319, 0, 314);
MOVW	R3, #314
SXTH	R3, R3
MOVS	R2, #0
SXTH	R2, R2
MOVW	R1, #319
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;FISHER_GUI_driver.c,121 :: 		TFT_Line(0, 319, 10, 309);
MOVW	R3, #309
SXTH	R3, R3
MOVS	R2, #10
SXTH	R2, R2
MOVW	R1, #319
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;FISHER_GUI_driver.c,122 :: 		TFT_Write_Text("first here", 20, 290);
MOVW	R0, #lo_addr(?lstr3_FISHER_GUI_driver+0)
MOVT	R0, #hi_addr(?lstr3_FISHER_GUI_driver+0)
MOVW	R2, #290
MOVS	R1, #20
BL	_TFT_Write_Text+0
;FISHER_GUI_driver.c,124 :: 		TFT_Set_Pen(CL_WHITE, 3);
MOVS	R1, #3
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;FISHER_GUI_driver.c,125 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;FISHER_GUI_driver.c,126 :: 		TFT_Write_Text("now here ", 180, 15);
MOVW	R0, #lo_addr(?lstr4_FISHER_GUI_driver+0)
MOVT	R0, #hi_addr(?lstr4_FISHER_GUI_driver+0)
MOVS	R2, #15
MOVS	R1, #180
BL	_TFT_Write_Text+0
;FISHER_GUI_driver.c,127 :: 		TFT_Line(239, 0, 234, 0);
MOVS	R3, #0
SXTH	R3, R3
MOVS	R2, #234
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #239
SXTH	R0, R0
BL	_TFT_Line+0
;FISHER_GUI_driver.c,128 :: 		TFT_Line(239, 0, 239, 5);
MOVS	R3, #5
SXTH	R3, R3
MOVS	R2, #239
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #239
SXTH	R0, R0
BL	_TFT_Line+0
;FISHER_GUI_driver.c,129 :: 		TFT_Line(239, 0, 229, 10);
MOVS	R3, #10
SXTH	R3, R3
MOVS	R2, #229
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #239
SXTH	R0, R0
BL	_TFT_Line+0
;FISHER_GUI_driver.c,131 :: 		TP_TFT_Calibrate_Max();                      // Calibration of bottom left corner
BL	_TP_TFT_Calibrate_Max+0
;FISHER_GUI_driver.c,132 :: 		Delay_ms(500);
MOVW	R7, #2515
MOVT	R7, #356
NOP
NOP
L_Calibrate10:
SUBS	R7, R7, #1
BNE	L_Calibrate10
NOP
NOP
NOP
NOP
;FISHER_GUI_driver.c,133 :: 		}
L_end_Calibrate:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Calibrate
FISHER_GUI_driver_InitializeObjects:
;FISHER_GUI_driver.c,235 :: 		static void InitializeObjects() {
SUB	SP, SP, #4
;FISHER_GUI_driver.c,236 :: 		MainScreen1.Color                     = 0xFFF0;
MOVW	R1, #65520
MOVW	R0, #lo_addr(_MainScreen1+0)
MOVT	R0, #hi_addr(_MainScreen1+0)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,237 :: 		MainScreen1.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_MainScreen1+2)
MOVT	R0, #hi_addr(_MainScreen1+2)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,238 :: 		MainScreen1.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_MainScreen1+4)
MOVT	R0, #hi_addr(_MainScreen1+4)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,239 :: 		MainScreen1.Buttons_RoundCount        = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_MainScreen1+8)
MOVT	R0, #hi_addr(_MainScreen1+8)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,240 :: 		MainScreen1.Buttons_Round             = Screen1_Buttons_Round;
MOVW	R1, #lo_addr(_Screen1_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen1_Buttons_Round+0)
MOVW	R0, #lo_addr(_MainScreen1+12)
MOVT	R0, #hi_addr(_MainScreen1+12)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,241 :: 		MainScreen1.LabelsCount               = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_MainScreen1+16)
MOVT	R0, #hi_addr(_MainScreen1+16)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,242 :: 		MainScreen1.Labels                    = Screen1_Labels;
MOVW	R1, #lo_addr(_Screen1_Labels+0)
MOVT	R1, #hi_addr(_Screen1_Labels+0)
MOVW	R0, #lo_addr(_MainScreen1+20)
MOVT	R0, #hi_addr(_MainScreen1+20)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,243 :: 		MainScreen1.ImagesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_MainScreen1+24)
MOVT	R0, #hi_addr(_MainScreen1+24)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,244 :: 		MainScreen1.RadioButtonsCount           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_MainScreen1+32)
MOVT	R0, #hi_addr(_MainScreen1+32)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,245 :: 		MainScreen1.RadioButtons                = Screen1_RadioButtons;
MOVW	R1, #lo_addr(_Screen1_RadioButtons+0)
MOVT	R1, #hi_addr(_Screen1_RadioButtons+0)
MOVW	R0, #lo_addr(_MainScreen1+36)
MOVT	R0, #hi_addr(_MainScreen1+36)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,246 :: 		MainScreen1.ProgressBarsCount           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_MainScreen1+40)
MOVT	R0, #hi_addr(_MainScreen1+40)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,247 :: 		MainScreen1.ProgressBars                = Screen1_ProgressBars;
MOVW	R1, #lo_addr(_Screen1_ProgressBars+0)
MOVT	R1, #hi_addr(_Screen1_ProgressBars+0)
MOVW	R0, #lo_addr(_MainScreen1+44)
MOVT	R0, #hi_addr(_MainScreen1+44)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,248 :: 		MainScreen1.ObjectsCount              = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_MainScreen1+6)
MOVT	R0, #hi_addr(_MainScreen1+6)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,250 :: 		DatabaseScreen2.Color                     = 0x07FF;
MOVW	R1, #2047
MOVW	R0, #lo_addr(_DatabaseScreen2+0)
MOVT	R0, #hi_addr(_DatabaseScreen2+0)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,251 :: 		DatabaseScreen2.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_DatabaseScreen2+2)
MOVT	R0, #hi_addr(_DatabaseScreen2+2)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,252 :: 		DatabaseScreen2.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_DatabaseScreen2+4)
MOVT	R0, #hi_addr(_DatabaseScreen2+4)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,253 :: 		DatabaseScreen2.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DatabaseScreen2+8)
MOVT	R0, #hi_addr(_DatabaseScreen2+8)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,254 :: 		DatabaseScreen2.LabelsCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DatabaseScreen2+16)
MOVT	R0, #hi_addr(_DatabaseScreen2+16)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,255 :: 		DatabaseScreen2.Labels                    = Screen2_Labels;
MOVW	R1, #lo_addr(_Screen2_Labels+0)
MOVT	R1, #hi_addr(_Screen2_Labels+0)
MOVW	R0, #lo_addr(_DatabaseScreen2+20)
MOVT	R0, #hi_addr(_DatabaseScreen2+20)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,256 :: 		DatabaseScreen2.ImagesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DatabaseScreen2+24)
MOVT	R0, #hi_addr(_DatabaseScreen2+24)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,257 :: 		DatabaseScreen2.RadioButtonsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DatabaseScreen2+32)
MOVT	R0, #hi_addr(_DatabaseScreen2+32)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,258 :: 		DatabaseScreen2.ProgressBarsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DatabaseScreen2+40)
MOVT	R0, #hi_addr(_DatabaseScreen2+40)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,259 :: 		DatabaseScreen2.ObjectsCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DatabaseScreen2+6)
MOVT	R0, #hi_addr(_DatabaseScreen2+6)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,261 :: 		TrainingScreen3.Color                     = 0x07F0;
MOVW	R1, #2032
MOVW	R0, #lo_addr(_TrainingScreen3+0)
MOVT	R0, #hi_addr(_TrainingScreen3+0)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,262 :: 		TrainingScreen3.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_TrainingScreen3+2)
MOVT	R0, #hi_addr(_TrainingScreen3+2)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,263 :: 		TrainingScreen3.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_TrainingScreen3+4)
MOVT	R0, #hi_addr(_TrainingScreen3+4)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,264 :: 		TrainingScreen3.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TrainingScreen3+8)
MOVT	R0, #hi_addr(_TrainingScreen3+8)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,265 :: 		TrainingScreen3.LabelsCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_TrainingScreen3+16)
MOVT	R0, #hi_addr(_TrainingScreen3+16)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,266 :: 		TrainingScreen3.Labels                    = Screen3_Labels;
MOVW	R1, #lo_addr(_Screen3_Labels+0)
MOVT	R1, #hi_addr(_Screen3_Labels+0)
MOVW	R0, #lo_addr(_TrainingScreen3+20)
MOVT	R0, #hi_addr(_TrainingScreen3+20)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,267 :: 		TrainingScreen3.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_TrainingScreen3+24)
MOVT	R0, #hi_addr(_TrainingScreen3+24)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,268 :: 		TrainingScreen3.Images                    = Screen3_Images;
MOVW	R1, #lo_addr(_Screen3_Images+0)
MOVT	R1, #hi_addr(_Screen3_Images+0)
MOVW	R0, #lo_addr(_TrainingScreen3+28)
MOVT	R0, #hi_addr(_TrainingScreen3+28)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,269 :: 		TrainingScreen3.RadioButtonsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TrainingScreen3+32)
MOVT	R0, #hi_addr(_TrainingScreen3+32)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,270 :: 		TrainingScreen3.ProgressBarsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TrainingScreen3+40)
MOVT	R0, #hi_addr(_TrainingScreen3+40)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,271 :: 		TrainingScreen3.ObjectsCount              = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_TrainingScreen3+6)
MOVT	R0, #hi_addr(_TrainingScreen3+6)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,273 :: 		TestScreen4.Color                     = 0x8140;
MOVW	R1, #33088
MOVW	R0, #lo_addr(_TestScreen4+0)
MOVT	R0, #hi_addr(_TestScreen4+0)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,274 :: 		TestScreen4.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_TestScreen4+2)
MOVT	R0, #hi_addr(_TestScreen4+2)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,275 :: 		TestScreen4.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_TestScreen4+4)
MOVT	R0, #hi_addr(_TestScreen4+4)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,276 :: 		TestScreen4.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TestScreen4+8)
MOVT	R0, #hi_addr(_TestScreen4+8)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,277 :: 		TestScreen4.LabelsCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_TestScreen4+16)
MOVT	R0, #hi_addr(_TestScreen4+16)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,278 :: 		TestScreen4.Labels                    = Screen4_Labels;
MOVW	R1, #lo_addr(_Screen4_Labels+0)
MOVT	R1, #hi_addr(_Screen4_Labels+0)
MOVW	R0, #lo_addr(_TestScreen4+20)
MOVT	R0, #hi_addr(_TestScreen4+20)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,279 :: 		TestScreen4.ImagesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TestScreen4+24)
MOVT	R0, #hi_addr(_TestScreen4+24)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,280 :: 		TestScreen4.RadioButtonsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TestScreen4+32)
MOVT	R0, #hi_addr(_TestScreen4+32)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,281 :: 		TestScreen4.ProgressBarsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TestScreen4+40)
MOVT	R0, #hi_addr(_TestScreen4+40)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,282 :: 		TestScreen4.ObjectsCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_TestScreen4+6)
MOVT	R0, #hi_addr(_TestScreen4+6)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,285 :: 		Label1.OwnerScreen     = &MainScreen1;
MOVW	R1, #lo_addr(_MainScreen1+0)
MOVT	R1, #hi_addr(_MainScreen1+0)
MOVW	R0, #lo_addr(_Label1+0)
MOVT	R0, #hi_addr(_Label1+0)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,286 :: 		Label1.Order          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+4)
MOVT	R0, #hi_addr(_Label1+4)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,287 :: 		Label1.Left           = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label1+6)
MOVT	R0, #hi_addr(_Label1+6)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,288 :: 		Label1.Top            = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Label1+8)
MOVT	R0, #hi_addr(_Label1+8)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,289 :: 		Label1.Width          = 168;
MOVS	R1, #168
MOVW	R0, #lo_addr(_Label1+10)
MOVT	R0, #hi_addr(_Label1+10)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,290 :: 		Label1.Height         = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label1+12)
MOVT	R0, #hi_addr(_Label1+12)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,291 :: 		Label1.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+26)
MOVT	R0, #hi_addr(_Label1+26)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,292 :: 		Label1.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+27)
MOVT	R0, #hi_addr(_Label1+27)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,293 :: 		Label1.Caption        = Label1_Caption;
MOVW	R1, #lo_addr(_Label1_Caption+0)
MOVT	R1, #hi_addr(_Label1_Caption+0)
MOVW	R0, #lo_addr(_Label1+16)
MOVT	R0, #hi_addr(_Label1+16)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,294 :: 		Label1.FontName       = Arial13x16_Italic;
MOVW	R1, #2559
MOVT	R1, #0
MOVW	R0, #lo_addr(_Label1+20)
MOVT	R0, #hi_addr(_Label1+20)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,295 :: 		Label1.Font_Color     = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label1+24)
MOVT	R0, #hi_addr(_Label1+24)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,296 :: 		Label1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+28)
MOVT	R0, #hi_addr(_Label1+28)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,297 :: 		Label1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+32)
MOVT	R0, #hi_addr(_Label1+32)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,298 :: 		Label1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+36)
MOVT	R0, #hi_addr(_Label1+36)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,299 :: 		Label1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+40)
MOVT	R0, #hi_addr(_Label1+40)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,301 :: 		Test_ButtonRound1.OwnerScreen     = &MainScreen1;
MOVW	R1, #lo_addr(_MainScreen1+0)
MOVT	R1, #hi_addr(_MainScreen1+0)
MOVW	R0, #lo_addr(_Test_ButtonRound1+0)
MOVT	R0, #hi_addr(_Test_ButtonRound1+0)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,302 :: 		Test_ButtonRound1.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Test_ButtonRound1+4)
MOVT	R0, #hi_addr(_Test_ButtonRound1+4)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,303 :: 		Test_ButtonRound1.Left            = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Test_ButtonRound1+6)
MOVT	R0, #hi_addr(_Test_ButtonRound1+6)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,304 :: 		Test_ButtonRound1.Top             = 210;
MOVS	R1, #210
MOVW	R0, #lo_addr(_Test_ButtonRound1+8)
MOVT	R0, #hi_addr(_Test_ButtonRound1+8)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,305 :: 		Test_ButtonRound1.Width           = 77;
MOVS	R1, #77
MOVW	R0, #lo_addr(_Test_ButtonRound1+10)
MOVT	R0, #hi_addr(_Test_ButtonRound1+10)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,306 :: 		Test_ButtonRound1.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Test_ButtonRound1+12)
MOVT	R0, #hi_addr(_Test_ButtonRound1+12)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,307 :: 		Test_ButtonRound1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Test_ButtonRound1+14)
MOVT	R0, #hi_addr(_Test_ButtonRound1+14)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,308 :: 		Test_ButtonRound1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Test_ButtonRound1+16)
MOVT	R0, #hi_addr(_Test_ButtonRound1+16)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,309 :: 		Test_ButtonRound1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Test_ButtonRound1+18)
MOVT	R0, #hi_addr(_Test_ButtonRound1+18)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,310 :: 		Test_ButtonRound1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Test_ButtonRound1+19)
MOVT	R0, #hi_addr(_Test_ButtonRound1+19)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,311 :: 		Test_ButtonRound1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Test_ButtonRound1+20)
MOVT	R0, #hi_addr(_Test_ButtonRound1+20)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,312 :: 		Test_ButtonRound1.Caption         = Test_ButtonRound1_Caption;
MOVW	R1, #lo_addr(_Test_ButtonRound1_Caption+0)
MOVT	R1, #hi_addr(_Test_ButtonRound1_Caption+0)
MOVW	R0, #lo_addr(_Test_ButtonRound1+24)
MOVT	R0, #hi_addr(_Test_ButtonRound1+24)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,313 :: 		Test_ButtonRound1.TextAlign             = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Test_ButtonRound1+28)
MOVT	R0, #hi_addr(_Test_ButtonRound1+28)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,314 :: 		Test_ButtonRound1.FontName        = Tahoma11x13_Regular;
MOVW	R1, #7391
MOVT	R1, #0
MOVW	R0, #lo_addr(_Test_ButtonRound1+32)
MOVT	R0, #hi_addr(_Test_ButtonRound1+32)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,315 :: 		Test_ButtonRound1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Test_ButtonRound1+47)
MOVT	R0, #hi_addr(_Test_ButtonRound1+47)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,316 :: 		Test_ButtonRound1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Test_ButtonRound1+36)
MOVT	R0, #hi_addr(_Test_ButtonRound1+36)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,317 :: 		Test_ButtonRound1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Test_ButtonRound1+38)
MOVT	R0, #hi_addr(_Test_ButtonRound1+38)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,318 :: 		Test_ButtonRound1.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Test_ButtonRound1+39)
MOVT	R0, #hi_addr(_Test_ButtonRound1+39)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,319 :: 		Test_ButtonRound1.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Test_ButtonRound1+40)
MOVT	R0, #hi_addr(_Test_ButtonRound1+40)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,320 :: 		Test_ButtonRound1.Gradient_End_Color      = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Test_ButtonRound1+42)
MOVT	R0, #hi_addr(_Test_ButtonRound1+42)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,321 :: 		Test_ButtonRound1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Test_ButtonRound1+44)
MOVT	R0, #hi_addr(_Test_ButtonRound1+44)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,322 :: 		Test_ButtonRound1.Press_Color     = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_Test_ButtonRound1+48)
MOVT	R0, #hi_addr(_Test_ButtonRound1+48)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,323 :: 		Test_ButtonRound1.Corner_Radius      = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Test_ButtonRound1+46)
MOVT	R0, #hi_addr(_Test_ButtonRound1+46)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,324 :: 		Test_ButtonRound1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Test_ButtonRound1+52)
MOVT	R0, #hi_addr(_Test_ButtonRound1+52)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,325 :: 		Test_ButtonRound1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Test_ButtonRound1+56)
MOVT	R0, #hi_addr(_Test_ButtonRound1+56)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,326 :: 		Test_ButtonRound1.OnClickPtr      = Test;
MOVW	R1, #lo_addr(_Test+0)
MOVT	R1, #hi_addr(_Test+0)
MOVW	R0, #lo_addr(_Test_ButtonRound1+60)
MOVT	R0, #hi_addr(_Test_ButtonRound1+60)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,327 :: 		Test_ButtonRound1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Test_ButtonRound1+64)
MOVT	R0, #hi_addr(_Test_ButtonRound1+64)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,329 :: 		Training_ButtonRound1.OwnerScreen     = &MainScreen1;
MOVW	R1, #lo_addr(_MainScreen1+0)
MOVT	R1, #hi_addr(_MainScreen1+0)
MOVW	R0, #lo_addr(_Training_ButtonRound1+0)
MOVT	R0, #hi_addr(_Training_ButtonRound1+0)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,330 :: 		Training_ButtonRound1.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Training_ButtonRound1+4)
MOVT	R0, #hi_addr(_Training_ButtonRound1+4)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,331 :: 		Training_ButtonRound1.Left            = 30;
MOVS	R1, #30
MOVW	R0, #lo_addr(_Training_ButtonRound1+6)
MOVT	R0, #hi_addr(_Training_ButtonRound1+6)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,332 :: 		Training_ButtonRound1.Top             = 145;
MOVS	R1, #145
MOVW	R0, #lo_addr(_Training_ButtonRound1+8)
MOVT	R0, #hi_addr(_Training_ButtonRound1+8)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,333 :: 		Training_ButtonRound1.Width           = 75;
MOVS	R1, #75
MOVW	R0, #lo_addr(_Training_ButtonRound1+10)
MOVT	R0, #hi_addr(_Training_ButtonRound1+10)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,334 :: 		Training_ButtonRound1.Height          = 34;
MOVS	R1, #34
MOVW	R0, #lo_addr(_Training_ButtonRound1+12)
MOVT	R0, #hi_addr(_Training_ButtonRound1+12)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,335 :: 		Training_ButtonRound1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Training_ButtonRound1+14)
MOVT	R0, #hi_addr(_Training_ButtonRound1+14)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,336 :: 		Training_ButtonRound1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Training_ButtonRound1+16)
MOVT	R0, #hi_addr(_Training_ButtonRound1+16)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,337 :: 		Training_ButtonRound1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Training_ButtonRound1+18)
MOVT	R0, #hi_addr(_Training_ButtonRound1+18)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,338 :: 		Training_ButtonRound1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Training_ButtonRound1+19)
MOVT	R0, #hi_addr(_Training_ButtonRound1+19)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,339 :: 		Training_ButtonRound1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Training_ButtonRound1+20)
MOVT	R0, #hi_addr(_Training_ButtonRound1+20)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,340 :: 		Training_ButtonRound1.Caption         = Training_ButtonRound1_Caption;
MOVW	R1, #lo_addr(_Training_ButtonRound1_Caption+0)
MOVT	R1, #hi_addr(_Training_ButtonRound1_Caption+0)
MOVW	R0, #lo_addr(_Training_ButtonRound1+24)
MOVT	R0, #hi_addr(_Training_ButtonRound1+24)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,341 :: 		Training_ButtonRound1.TextAlign             = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Training_ButtonRound1+28)
MOVT	R0, #hi_addr(_Training_ButtonRound1+28)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,342 :: 		Training_ButtonRound1.FontName        = Tahoma11x13_Regular;
MOVW	R1, #7391
MOVT	R1, #0
MOVW	R0, #lo_addr(_Training_ButtonRound1+32)
MOVT	R0, #hi_addr(_Training_ButtonRound1+32)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,343 :: 		Training_ButtonRound1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Training_ButtonRound1+47)
MOVT	R0, #hi_addr(_Training_ButtonRound1+47)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,344 :: 		Training_ButtonRound1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Training_ButtonRound1+36)
MOVT	R0, #hi_addr(_Training_ButtonRound1+36)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,345 :: 		Training_ButtonRound1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Training_ButtonRound1+38)
MOVT	R0, #hi_addr(_Training_ButtonRound1+38)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,346 :: 		Training_ButtonRound1.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Training_ButtonRound1+39)
MOVT	R0, #hi_addr(_Training_ButtonRound1+39)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,347 :: 		Training_ButtonRound1.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Training_ButtonRound1+40)
MOVT	R0, #hi_addr(_Training_ButtonRound1+40)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,348 :: 		Training_ButtonRound1.Gradient_End_Color      = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Training_ButtonRound1+42)
MOVT	R0, #hi_addr(_Training_ButtonRound1+42)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,349 :: 		Training_ButtonRound1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Training_ButtonRound1+44)
MOVT	R0, #hi_addr(_Training_ButtonRound1+44)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,350 :: 		Training_ButtonRound1.Press_Color     = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_Training_ButtonRound1+48)
MOVT	R0, #hi_addr(_Training_ButtonRound1+48)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,351 :: 		Training_ButtonRound1.Corner_Radius      = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Training_ButtonRound1+46)
MOVT	R0, #hi_addr(_Training_ButtonRound1+46)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,352 :: 		Training_ButtonRound1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Training_ButtonRound1+52)
MOVT	R0, #hi_addr(_Training_ButtonRound1+52)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,353 :: 		Training_ButtonRound1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Training_ButtonRound1+56)
MOVT	R0, #hi_addr(_Training_ButtonRound1+56)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,354 :: 		Training_ButtonRound1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Training_ButtonRound1+60)
MOVT	R0, #hi_addr(_Training_ButtonRound1+60)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,355 :: 		Training_ButtonRound1.OnPressPtr      = Training;
MOVW	R1, #lo_addr(_Training+0)
MOVT	R1, #hi_addr(_Training+0)
MOVW	R0, #lo_addr(_Training_ButtonRound1+64)
MOVT	R0, #hi_addr(_Training_ButtonRound1+64)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,357 :: 		Database_Show_ButtonRound1.OwnerScreen     = &MainScreen1;
MOVW	R1, #lo_addr(_MainScreen1+0)
MOVT	R1, #hi_addr(_MainScreen1+0)
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+0)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+0)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,358 :: 		Database_Show_ButtonRound1.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+4)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+4)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,359 :: 		Database_Show_ButtonRound1.Left            = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+6)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+6)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,360 :: 		Database_Show_ButtonRound1.Top             = 83;
MOVS	R1, #83
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+8)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+8)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,361 :: 		Database_Show_ButtonRound1.Width           = 89;
MOVS	R1, #89
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+10)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+10)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,362 :: 		Database_Show_ButtonRound1.Height          = 35;
MOVS	R1, #35
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+12)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+12)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,363 :: 		Database_Show_ButtonRound1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+14)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+14)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,364 :: 		Database_Show_ButtonRound1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+16)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+16)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,365 :: 		Database_Show_ButtonRound1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+18)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+18)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,366 :: 		Database_Show_ButtonRound1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+19)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+19)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,367 :: 		Database_Show_ButtonRound1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+20)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+20)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,368 :: 		Database_Show_ButtonRound1.Caption         = Database_Show_ButtonRound1_Caption;
MOVW	R1, #lo_addr(_Database_Show_ButtonRound1_Caption+0)
MOVT	R1, #hi_addr(_Database_Show_ButtonRound1_Caption+0)
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+24)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+24)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,369 :: 		Database_Show_ButtonRound1.TextAlign             = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+28)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+28)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,370 :: 		Database_Show_ButtonRound1.FontName        = Tahoma11x13_Regular;
MOVW	R1, #7391
MOVT	R1, #0
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+32)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+32)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,371 :: 		Database_Show_ButtonRound1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+47)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+47)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,372 :: 		Database_Show_ButtonRound1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+36)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+36)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,373 :: 		Database_Show_ButtonRound1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+38)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+38)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,374 :: 		Database_Show_ButtonRound1.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+39)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+39)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,375 :: 		Database_Show_ButtonRound1.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+40)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+40)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,376 :: 		Database_Show_ButtonRound1.Gradient_End_Color      = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+42)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+42)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,377 :: 		Database_Show_ButtonRound1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+44)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+44)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,378 :: 		Database_Show_ButtonRound1.Press_Color     = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+48)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+48)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,379 :: 		Database_Show_ButtonRound1.Corner_Radius      = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+46)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+46)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,380 :: 		Database_Show_ButtonRound1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+52)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+52)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,381 :: 		Database_Show_ButtonRound1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+56)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+56)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,382 :: 		Database_Show_ButtonRound1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+60)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+60)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,383 :: 		Database_Show_ButtonRound1.OnPressPtr      = Database_Show;
MOVW	R1, #lo_addr(_Database_Show+0)
MOVT	R1, #hi_addr(_Database_Show+0)
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+64)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+64)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,385 :: 		CP_2_RadioButton1.OwnerScreen     = &MainScreen1;
MOVW	R1, #lo_addr(_MainScreen1+0)
MOVT	R1, #hi_addr(_MainScreen1+0)
MOVW	R0, #lo_addr(_CP_2_RadioButton1+0)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+0)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,386 :: 		CP_2_RadioButton1.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_CP_2_RadioButton1+4)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+4)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,387 :: 		CP_2_RadioButton1.Left            = 162;
MOVS	R1, #162
MOVW	R0, #lo_addr(_CP_2_RadioButton1+6)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+6)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,388 :: 		CP_2_RadioButton1.Top             = 90;
MOVS	R1, #90
MOVW	R0, #lo_addr(_CP_2_RadioButton1+8)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+8)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,389 :: 		CP_2_RadioButton1.Width           = 47;
MOVS	R1, #47
MOVW	R0, #lo_addr(_CP_2_RadioButton1+10)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+10)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,390 :: 		CP_2_RadioButton1.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_CP_2_RadioButton1+12)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+12)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,391 :: 		CP_2_RadioButton1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_2_RadioButton1+14)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+14)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,392 :: 		CP_2_RadioButton1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_2_RadioButton1+16)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+16)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,393 :: 		CP_2_RadioButton1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_2_RadioButton1+18)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+18)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,394 :: 		CP_2_RadioButton1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_2_RadioButton1+19)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+19)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,395 :: 		CP_2_RadioButton1.Checked          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_2_RadioButton1+20)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+20)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,396 :: 		CP_2_RadioButton1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_2_RadioButton1+21)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+21)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,397 :: 		CP_2_RadioButton1.Caption         = CP_2_RadioButton1_Caption;
MOVW	R1, #lo_addr(_CP_2_RadioButton1_Caption+0)
MOVT	R1, #hi_addr(_CP_2_RadioButton1_Caption+0)
MOVW	R0, #lo_addr(_CP_2_RadioButton1+24)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+24)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,398 :: 		CP_2_RadioButton1.TextAlign            = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_2_RadioButton1+28)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+28)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,399 :: 		CP_2_RadioButton1.FontName        = Tahoma11x13_Regular;
MOVW	R1, #7391
MOVT	R1, #0
MOVW	R0, #lo_addr(_CP_2_RadioButton1+32)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+32)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,400 :: 		CP_2_RadioButton1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_2_RadioButton1+48)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+48)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,401 :: 		CP_2_RadioButton1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_2_RadioButton1+36)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+36)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,402 :: 		CP_2_RadioButton1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_2_RadioButton1+38)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+38)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,403 :: 		CP_2_RadioButton1.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_2_RadioButton1+39)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+39)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,404 :: 		CP_2_RadioButton1.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_CP_2_RadioButton1+40)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+40)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,405 :: 		CP_2_RadioButton1.Gradient_End_Color      = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CP_2_RadioButton1+42)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+42)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,406 :: 		CP_2_RadioButton1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CP_2_RadioButton1+44)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+44)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,407 :: 		CP_2_RadioButton1.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CP_2_RadioButton1+50)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+50)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,408 :: 		CP_2_RadioButton1.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_CP_2_RadioButton1+46)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+46)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,409 :: 		CP_2_RadioButton1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_2_RadioButton1+52)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+52)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,410 :: 		CP_2_RadioButton1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_2_RadioButton1+56)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+56)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,411 :: 		CP_2_RadioButton1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_2_RadioButton1+60)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+60)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,412 :: 		CP_2_RadioButton1.OnPressPtr      = CP_2;
MOVW	R1, #lo_addr(_CP_2+0)
MOVT	R1, #hi_addr(_CP_2+0)
MOVW	R0, #lo_addr(_CP_2_RadioButton1+64)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+64)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,414 :: 		CP_3_RadioButton1.OwnerScreen     = &MainScreen1;
MOVW	R1, #lo_addr(_MainScreen1+0)
MOVT	R1, #hi_addr(_MainScreen1+0)
MOVW	R0, #lo_addr(_CP_3_RadioButton1+0)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+0)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,415 :: 		CP_3_RadioButton1.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_CP_3_RadioButton1+4)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+4)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,416 :: 		CP_3_RadioButton1.Left            = 159;
MOVS	R1, #159
MOVW	R0, #lo_addr(_CP_3_RadioButton1+6)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+6)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,417 :: 		CP_3_RadioButton1.Top             = 140;
MOVS	R1, #140
MOVW	R0, #lo_addr(_CP_3_RadioButton1+8)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+8)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,418 :: 		CP_3_RadioButton1.Width           = 47;
MOVS	R1, #47
MOVW	R0, #lo_addr(_CP_3_RadioButton1+10)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+10)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,419 :: 		CP_3_RadioButton1.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_CP_3_RadioButton1+12)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+12)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,420 :: 		CP_3_RadioButton1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_3_RadioButton1+14)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+14)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,421 :: 		CP_3_RadioButton1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_3_RadioButton1+16)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+16)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,422 :: 		CP_3_RadioButton1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_3_RadioButton1+18)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+18)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,423 :: 		CP_3_RadioButton1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_3_RadioButton1+19)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+19)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,424 :: 		CP_3_RadioButton1.Checked          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_3_RadioButton1+20)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+20)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,425 :: 		CP_3_RadioButton1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_3_RadioButton1+21)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+21)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,426 :: 		CP_3_RadioButton1.Caption         = CP_3_RadioButton1_Caption;
MOVW	R1, #lo_addr(_CP_3_RadioButton1_Caption+0)
MOVT	R1, #hi_addr(_CP_3_RadioButton1_Caption+0)
MOVW	R0, #lo_addr(_CP_3_RadioButton1+24)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+24)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,427 :: 		CP_3_RadioButton1.TextAlign            = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_3_RadioButton1+28)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+28)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,428 :: 		CP_3_RadioButton1.FontName        = Tahoma11x13_Regular;
MOVW	R1, #7391
MOVT	R1, #0
MOVW	R0, #lo_addr(_CP_3_RadioButton1+32)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+32)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,429 :: 		CP_3_RadioButton1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_3_RadioButton1+48)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+48)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,430 :: 		CP_3_RadioButton1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_3_RadioButton1+36)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+36)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,431 :: 		CP_3_RadioButton1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_3_RadioButton1+38)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+38)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,432 :: 		CP_3_RadioButton1.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_3_RadioButton1+39)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+39)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,433 :: 		CP_3_RadioButton1.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_CP_3_RadioButton1+40)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+40)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,434 :: 		CP_3_RadioButton1.Gradient_End_Color      = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CP_3_RadioButton1+42)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+42)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,435 :: 		CP_3_RadioButton1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CP_3_RadioButton1+44)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+44)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,436 :: 		CP_3_RadioButton1.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CP_3_RadioButton1+50)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+50)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,437 :: 		CP_3_RadioButton1.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_CP_3_RadioButton1+46)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+46)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,438 :: 		CP_3_RadioButton1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_3_RadioButton1+52)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+52)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,439 :: 		CP_3_RadioButton1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_3_RadioButton1+56)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+56)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,440 :: 		CP_3_RadioButton1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_3_RadioButton1+60)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+60)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,441 :: 		CP_3_RadioButton1.OnPressPtr      = CP_3;
MOVW	R1, #lo_addr(_CP_3+0)
MOVT	R1, #hi_addr(_CP_3+0)
MOVW	R0, #lo_addr(_CP_3_RadioButton1+64)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+64)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,443 :: 		CP_4_RadioButton1.OwnerScreen     = &MainScreen1;
MOVW	R1, #lo_addr(_MainScreen1+0)
MOVT	R1, #hi_addr(_MainScreen1+0)
MOVW	R0, #lo_addr(_CP_4_RadioButton1+0)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+0)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,444 :: 		CP_4_RadioButton1.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_CP_4_RadioButton1+4)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+4)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,445 :: 		CP_4_RadioButton1.Left            = 158;
MOVS	R1, #158
MOVW	R0, #lo_addr(_CP_4_RadioButton1+6)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+6)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,446 :: 		CP_4_RadioButton1.Top             = 199;
MOVS	R1, #199
MOVW	R0, #lo_addr(_CP_4_RadioButton1+8)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+8)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,447 :: 		CP_4_RadioButton1.Width           = 47;
MOVS	R1, #47
MOVW	R0, #lo_addr(_CP_4_RadioButton1+10)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+10)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,448 :: 		CP_4_RadioButton1.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_CP_4_RadioButton1+12)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+12)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,449 :: 		CP_4_RadioButton1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_4_RadioButton1+14)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+14)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,450 :: 		CP_4_RadioButton1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_4_RadioButton1+16)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+16)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,451 :: 		CP_4_RadioButton1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_4_RadioButton1+18)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+18)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,452 :: 		CP_4_RadioButton1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_4_RadioButton1+19)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+19)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,453 :: 		CP_4_RadioButton1.Checked          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_4_RadioButton1+20)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+20)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,454 :: 		CP_4_RadioButton1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_4_RadioButton1+21)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+21)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,455 :: 		CP_4_RadioButton1.Caption         = CP_4_RadioButton1_Caption;
MOVW	R1, #lo_addr(_CP_4_RadioButton1_Caption+0)
MOVT	R1, #hi_addr(_CP_4_RadioButton1_Caption+0)
MOVW	R0, #lo_addr(_CP_4_RadioButton1+24)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+24)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,456 :: 		CP_4_RadioButton1.TextAlign            = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_4_RadioButton1+28)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+28)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,457 :: 		CP_4_RadioButton1.FontName        = Tahoma11x13_Regular;
MOVW	R1, #7391
MOVT	R1, #0
MOVW	R0, #lo_addr(_CP_4_RadioButton1+32)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+32)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,458 :: 		CP_4_RadioButton1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_4_RadioButton1+48)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+48)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,459 :: 		CP_4_RadioButton1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_4_RadioButton1+36)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+36)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,460 :: 		CP_4_RadioButton1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_4_RadioButton1+38)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+38)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,461 :: 		CP_4_RadioButton1.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_4_RadioButton1+39)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+39)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,462 :: 		CP_4_RadioButton1.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_CP_4_RadioButton1+40)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+40)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,463 :: 		CP_4_RadioButton1.Gradient_End_Color      = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CP_4_RadioButton1+42)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+42)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,464 :: 		CP_4_RadioButton1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CP_4_RadioButton1+44)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+44)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,465 :: 		CP_4_RadioButton1.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CP_4_RadioButton1+50)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+50)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,466 :: 		CP_4_RadioButton1.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_CP_4_RadioButton1+46)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+46)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,467 :: 		CP_4_RadioButton1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_4_RadioButton1+52)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+52)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,468 :: 		CP_4_RadioButton1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_4_RadioButton1+56)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+56)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,469 :: 		CP_4_RadioButton1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_4_RadioButton1+60)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+60)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,470 :: 		CP_4_RadioButton1.OnPressPtr      = CP_4;
MOVW	R1, #lo_addr(_CP_4+0)
MOVT	R1, #hi_addr(_CP_4+0)
MOVW	R0, #lo_addr(_CP_4_RadioButton1+64)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+64)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,472 :: 		CP_5_RadioButton1.OwnerScreen     = &MainScreen1;
MOVW	R1, #lo_addr(_MainScreen1+0)
MOVT	R1, #hi_addr(_MainScreen1+0)
MOVW	R0, #lo_addr(_CP_5_RadioButton1+0)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+0)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,473 :: 		CP_5_RadioButton1.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_CP_5_RadioButton1+4)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+4)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,474 :: 		CP_5_RadioButton1.Left            = 156;
MOVS	R1, #156
MOVW	R0, #lo_addr(_CP_5_RadioButton1+6)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+6)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,475 :: 		CP_5_RadioButton1.Top             = 252;
MOVS	R1, #252
MOVW	R0, #lo_addr(_CP_5_RadioButton1+8)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+8)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,476 :: 		CP_5_RadioButton1.Width           = 47;
MOVS	R1, #47
MOVW	R0, #lo_addr(_CP_5_RadioButton1+10)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+10)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,477 :: 		CP_5_RadioButton1.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_CP_5_RadioButton1+12)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+12)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,478 :: 		CP_5_RadioButton1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_5_RadioButton1+14)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+14)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,479 :: 		CP_5_RadioButton1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_5_RadioButton1+16)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+16)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,480 :: 		CP_5_RadioButton1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_5_RadioButton1+18)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+18)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,481 :: 		CP_5_RadioButton1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_5_RadioButton1+19)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+19)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,482 :: 		CP_5_RadioButton1.Checked          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_5_RadioButton1+20)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+20)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,483 :: 		CP_5_RadioButton1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_5_RadioButton1+21)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+21)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,484 :: 		CP_5_RadioButton1.Caption         = CP_5_RadioButton1_Caption;
MOVW	R1, #lo_addr(_CP_5_RadioButton1_Caption+0)
MOVT	R1, #hi_addr(_CP_5_RadioButton1_Caption+0)
MOVW	R0, #lo_addr(_CP_5_RadioButton1+24)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+24)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,485 :: 		CP_5_RadioButton1.TextAlign            = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_5_RadioButton1+28)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+28)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,486 :: 		CP_5_RadioButton1.FontName        = Tahoma11x13_Regular;
MOVW	R1, #7391
MOVT	R1, #0
MOVW	R0, #lo_addr(_CP_5_RadioButton1+32)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+32)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,487 :: 		CP_5_RadioButton1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_5_RadioButton1+48)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+48)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,488 :: 		CP_5_RadioButton1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_5_RadioButton1+36)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+36)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,489 :: 		CP_5_RadioButton1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_5_RadioButton1+38)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+38)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,490 :: 		CP_5_RadioButton1.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_5_RadioButton1+39)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+39)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,491 :: 		CP_5_RadioButton1.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_CP_5_RadioButton1+40)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+40)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,492 :: 		CP_5_RadioButton1.Gradient_End_Color      = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CP_5_RadioButton1+42)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+42)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,493 :: 		CP_5_RadioButton1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CP_5_RadioButton1+44)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+44)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,494 :: 		CP_5_RadioButton1.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CP_5_RadioButton1+50)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+50)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,495 :: 		CP_5_RadioButton1.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_CP_5_RadioButton1+46)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+46)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,496 :: 		CP_5_RadioButton1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_5_RadioButton1+52)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+52)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,497 :: 		CP_5_RadioButton1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_5_RadioButton1+56)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+56)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,498 :: 		CP_5_RadioButton1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_5_RadioButton1+60)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+60)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,499 :: 		CP_5_RadioButton1.OnPressPtr      = CP_5;
MOVW	R1, #lo_addr(_CP_5+0)
MOVT	R1, #hi_addr(_CP_5+0)
MOVW	R0, #lo_addr(_CP_5_RadioButton1+64)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+64)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,501 :: 		Success_ProgressBar1.OwnerScreen     = &MainScreen1;
MOVW	R1, #lo_addr(_MainScreen1+0)
MOVT	R1, #hi_addr(_MainScreen1+0)
MOVW	R0, #lo_addr(_Success_ProgressBar1+0)
MOVT	R0, #hi_addr(_Success_ProgressBar1+0)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,502 :: 		Success_ProgressBar1.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Success_ProgressBar1+4)
MOVT	R0, #hi_addr(_Success_ProgressBar1+4)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,503 :: 		Success_ProgressBar1.Left            = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Success_ProgressBar1+6)
MOVT	R0, #hi_addr(_Success_ProgressBar1+6)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,504 :: 		Success_ProgressBar1.Top             = 270;
MOVW	R1, #270
MOVW	R0, #lo_addr(_Success_ProgressBar1+8)
MOVT	R0, #hi_addr(_Success_ProgressBar1+8)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,505 :: 		Success_ProgressBar1.Width           = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_Success_ProgressBar1+10)
MOVT	R0, #hi_addr(_Success_ProgressBar1+10)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,506 :: 		Success_ProgressBar1.Height          = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Success_ProgressBar1+12)
MOVT	R0, #hi_addr(_Success_ProgressBar1+12)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,507 :: 		Success_ProgressBar1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Success_ProgressBar1+14)
MOVT	R0, #hi_addr(_Success_ProgressBar1+14)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,508 :: 		Success_ProgressBar1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Success_ProgressBar1+16)
MOVT	R0, #hi_addr(_Success_ProgressBar1+16)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,509 :: 		Success_ProgressBar1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Success_ProgressBar1+18)
MOVT	R0, #hi_addr(_Success_ProgressBar1+18)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,510 :: 		Success_ProgressBar1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Success_ProgressBar1+19)
MOVT	R0, #hi_addr(_Success_ProgressBar1+19)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,511 :: 		Success_ProgressBar1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Success_ProgressBar1+20)
MOVT	R0, #hi_addr(_Success_ProgressBar1+20)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,512 :: 		Success_ProgressBar1.Caption         = Success_ProgressBar1_Caption;
MOVW	R1, #lo_addr(_Success_ProgressBar1_Caption+0)
MOVT	R1, #hi_addr(_Success_ProgressBar1_Caption+0)
MOVW	R0, #lo_addr(_Success_ProgressBar1+24)
MOVT	R0, #hi_addr(_Success_ProgressBar1+24)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,513 :: 		Success_ProgressBar1.FontName        = Tahoma11x13_Regular;
MOVW	R1, #7391
MOVT	R1, #0
MOVW	R0, #lo_addr(_Success_ProgressBar1+28)
MOVT	R0, #hi_addr(_Success_ProgressBar1+28)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,514 :: 		Success_ProgressBar1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Success_ProgressBar1+32)
MOVT	R0, #hi_addr(_Success_ProgressBar1+32)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,515 :: 		Success_ProgressBar1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Success_ProgressBar1+34)
MOVT	R0, #hi_addr(_Success_ProgressBar1+34)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,516 :: 		Success_ProgressBar1.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Success_ProgressBar1+35)
MOVT	R0, #hi_addr(_Success_ProgressBar1+35)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,517 :: 		Success_ProgressBar1.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Success_ProgressBar1+36)
MOVT	R0, #hi_addr(_Success_ProgressBar1+36)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,518 :: 		Success_ProgressBar1.Gradient_End_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_Success_ProgressBar1+38)
MOVT	R0, #hi_addr(_Success_ProgressBar1+38)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,519 :: 		Success_ProgressBar1.Color           = 0xA65E;
MOVW	R1, #42590
MOVW	R0, #lo_addr(_Success_ProgressBar1+40)
MOVT	R0, #hi_addr(_Success_ProgressBar1+40)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,520 :: 		Success_ProgressBar1.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_Success_ProgressBar1+42)
MOVT	R0, #hi_addr(_Success_ProgressBar1+42)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,521 :: 		Success_ProgressBar1.Min             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Success_ProgressBar1+44)
MOVT	R0, #hi_addr(_Success_ProgressBar1+44)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,522 :: 		Success_ProgressBar1.Max             = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_Success_ProgressBar1+46)
MOVT	R0, #hi_addr(_Success_ProgressBar1+46)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,523 :: 		Success_ProgressBar1.Position        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Success_ProgressBar1+48)
MOVT	R0, #hi_addr(_Success_ProgressBar1+48)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,524 :: 		Success_ProgressBar1.Show_Position   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Success_ProgressBar1+50)
MOVT	R0, #hi_addr(_Success_ProgressBar1+50)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,525 :: 		Success_ProgressBar1.Show_Percentage = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Success_ProgressBar1+51)
MOVT	R0, #hi_addr(_Success_ProgressBar1+51)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,526 :: 		Success_ProgressBar1.Smooth          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Success_ProgressBar1+52)
MOVT	R0, #hi_addr(_Success_ProgressBar1+52)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,527 :: 		Success_ProgressBar1.Rounded         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Success_ProgressBar1+53)
MOVT	R0, #hi_addr(_Success_ProgressBar1+53)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,528 :: 		Success_ProgressBar1.Corner_Radius      = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Success_ProgressBar1+54)
MOVT	R0, #hi_addr(_Success_ProgressBar1+54)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,530 :: 		Label2.OwnerScreen     = &MainScreen1;
MOVW	R1, #lo_addr(_MainScreen1+0)
MOVT	R1, #hi_addr(_MainScreen1+0)
MOVW	R0, #lo_addr(_Label2+0)
MOVT	R0, #hi_addr(_Label2+0)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,531 :: 		Label2.Order          = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Label2+4)
MOVT	R0, #hi_addr(_Label2+4)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,532 :: 		Label2.Left           = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_Label2+6)
MOVT	R0, #hi_addr(_Label2+6)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,533 :: 		Label2.Top            = 251;
MOVS	R1, #251
MOVW	R0, #lo_addr(_Label2+8)
MOVT	R0, #hi_addr(_Label2+8)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,534 :: 		Label2.Width          = 66;
MOVS	R1, #66
MOVW	R0, #lo_addr(_Label2+10)
MOVT	R0, #hi_addr(_Label2+10)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,535 :: 		Label2.Height         = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label2+12)
MOVT	R0, #hi_addr(_Label2+12)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,536 :: 		Label2.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label2+26)
MOVT	R0, #hi_addr(_Label2+26)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,537 :: 		Label2.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label2+27)
MOVT	R0, #hi_addr(_Label2+27)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,538 :: 		Label2.Caption        = Label2_Caption;
MOVW	R1, #lo_addr(_Label2_Caption+0)
MOVT	R1, #hi_addr(_Label2_Caption+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,539 :: 		Label2.FontName       = Arial13x16_Italic;
MOVW	R1, #2559
MOVT	R1, #0
MOVW	R0, #lo_addr(_Label2+20)
MOVT	R0, #hi_addr(_Label2+20)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,540 :: 		Label2.Font_Color     = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,541 :: 		Label2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+28)
MOVT	R0, #hi_addr(_Label2+28)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,542 :: 		Label2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+32)
MOVT	R0, #hi_addr(_Label2+32)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,543 :: 		Label2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+36)
MOVT	R0, #hi_addr(_Label2+36)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,544 :: 		Label2.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+40)
MOVT	R0, #hi_addr(_Label2+40)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,546 :: 		Label3.OwnerScreen     = &MainScreen1;
MOVW	R1, #lo_addr(_MainScreen1+0)
MOVT	R1, #hi_addr(_MainScreen1+0)
MOVW	R0, #lo_addr(_Label3+0)
MOVT	R0, #hi_addr(_Label3+0)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,547 :: 		Label3.Order          = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Label3+4)
MOVT	R0, #hi_addr(_Label3+4)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,548 :: 		Label3.Left           = 70;
MOVS	R1, #70
MOVW	R0, #lo_addr(_Label3+6)
MOVT	R0, #hi_addr(_Label3+6)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,549 :: 		Label3.Top            = 45;
MOVS	R1, #45
MOVW	R0, #lo_addr(_Label3+8)
MOVT	R0, #hi_addr(_Label3+8)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,550 :: 		Label3.Width          = 95;
MOVS	R1, #95
MOVW	R0, #lo_addr(_Label3+10)
MOVT	R0, #hi_addr(_Label3+10)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,551 :: 		Label3.Height         = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label3+12)
MOVT	R0, #hi_addr(_Label3+12)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,552 :: 		Label3.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label3+26)
MOVT	R0, #hi_addr(_Label3+26)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,553 :: 		Label3.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label3+27)
MOVT	R0, #hi_addr(_Label3+27)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,554 :: 		Label3.Caption        = Label3_Caption;
MOVW	R1, #lo_addr(_Label3_Caption+0)
MOVT	R1, #hi_addr(_Label3_Caption+0)
MOVW	R0, #lo_addr(_Label3+16)
MOVT	R0, #hi_addr(_Label3+16)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,555 :: 		Label3.FontName       = Arial13x16_Italic;
MOVW	R1, #2559
MOVT	R1, #0
MOVW	R0, #lo_addr(_Label3+20)
MOVT	R0, #hi_addr(_Label3+20)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,556 :: 		Label3.Font_Color     = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label3+24)
MOVT	R0, #hi_addr(_Label3+24)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,557 :: 		Label3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+28)
MOVT	R0, #hi_addr(_Label3+28)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,558 :: 		Label3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+32)
MOVT	R0, #hi_addr(_Label3+32)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,559 :: 		Label3.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+36)
MOVT	R0, #hi_addr(_Label3+36)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,560 :: 		Label3.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+40)
MOVT	R0, #hi_addr(_Label3+40)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,562 :: 		Label4.OwnerScreen     = &DatabaseScreen2;
MOVW	R1, #lo_addr(_DatabaseScreen2+0)
MOVT	R1, #hi_addr(_DatabaseScreen2+0)
MOVW	R0, #lo_addr(_Label4+0)
MOVT	R0, #hi_addr(_Label4+0)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,563 :: 		Label4.Order          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+4)
MOVT	R0, #hi_addr(_Label4+4)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,564 :: 		Label4.Left           = 63;
MOVS	R1, #63
MOVW	R0, #lo_addr(_Label4+6)
MOVT	R0, #hi_addr(_Label4+6)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,565 :: 		Label4.Top            = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Label4+8)
MOVT	R0, #hi_addr(_Label4+8)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,566 :: 		Label4.Width          = 103;
MOVS	R1, #103
MOVW	R0, #lo_addr(_Label4+10)
MOVT	R0, #hi_addr(_Label4+10)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,567 :: 		Label4.Height         = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label4+12)
MOVT	R0, #hi_addr(_Label4+12)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,568 :: 		Label4.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label4+26)
MOVT	R0, #hi_addr(_Label4+26)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,569 :: 		Label4.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label4+27)
MOVT	R0, #hi_addr(_Label4+27)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,570 :: 		Label4.Caption        = Label4_Caption;
MOVW	R1, #lo_addr(_Label4_Caption+0)
MOVT	R1, #hi_addr(_Label4_Caption+0)
MOVW	R0, #lo_addr(_Label4+16)
MOVT	R0, #hi_addr(_Label4+16)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,571 :: 		Label4.FontName       = Arial13x16_Italic;
MOVW	R1, #2559
MOVT	R1, #0
MOVW	R0, #lo_addr(_Label4+20)
MOVT	R0, #hi_addr(_Label4+20)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,572 :: 		Label4.Font_Color     = 0x301F;
MOVW	R1, #12319
MOVW	R0, #lo_addr(_Label4+24)
MOVT	R0, #hi_addr(_Label4+24)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,573 :: 		Label4.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+28)
MOVT	R0, #hi_addr(_Label4+28)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,574 :: 		Label4.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+32)
MOVT	R0, #hi_addr(_Label4+32)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,575 :: 		Label4.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+36)
MOVT	R0, #hi_addr(_Label4+36)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,576 :: 		Label4.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+40)
MOVT	R0, #hi_addr(_Label4+40)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,578 :: 		Image1.OwnerScreen     = &TrainingScreen3;
MOVW	R1, #lo_addr(_TrainingScreen3+0)
MOVT	R1, #hi_addr(_TrainingScreen3+0)
MOVW	R0, #lo_addr(_Image1+0)
MOVT	R0, #hi_addr(_Image1+0)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,579 :: 		Image1.Order          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+4)
MOVT	R0, #hi_addr(_Image1+4)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,580 :: 		Image1.Left           = 169;
MOVS	R1, #169
MOVW	R0, #lo_addr(_Image1+6)
MOVT	R0, #hi_addr(_Image1+6)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,581 :: 		Image1.Top            = 225;
MOVS	R1, #225
MOVW	R0, #lo_addr(_Image1+8)
MOVT	R0, #hi_addr(_Image1+8)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,582 :: 		Image1.Width          = 72;
MOVS	R1, #72
MOVW	R0, #lo_addr(_Image1+10)
MOVT	R0, #hi_addr(_Image1+10)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,583 :: 		Image1.Height         = 93;
MOVS	R1, #93
MOVW	R0, #lo_addr(_Image1+12)
MOVT	R0, #hi_addr(_Image1+12)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,584 :: 		Image1.Picture_Type        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+22)
MOVT	R0, #hi_addr(_Image1+22)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,585 :: 		Image1.Picture_Ratio  = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+23)
MOVT	R0, #hi_addr(_Image1+23)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,586 :: 		Image1.Picture_Name   = amblem_jpg;
MOVW	R1, #9070
MOVT	R1, #0
MOVW	R0, #lo_addr(_Image1+16)
MOVT	R0, #hi_addr(_Image1+16)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,587 :: 		Image1.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+20)
MOVT	R0, #hi_addr(_Image1+20)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,588 :: 		Image1.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+21)
MOVT	R0, #hi_addr(_Image1+21)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,589 :: 		Image1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+24)
MOVT	R0, #hi_addr(_Image1+24)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,590 :: 		Image1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+28)
MOVT	R0, #hi_addr(_Image1+28)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,591 :: 		Image1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+32)
MOVT	R0, #hi_addr(_Image1+32)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,592 :: 		Image1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+36)
MOVT	R0, #hi_addr(_Image1+36)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,594 :: 		Label5.OwnerScreen     = &TrainingScreen3;
MOVW	R1, #lo_addr(_TrainingScreen3+0)
MOVT	R1, #hi_addr(_TrainingScreen3+0)
MOVW	R0, #lo_addr(_Label5+0)
MOVT	R0, #hi_addr(_Label5+0)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,595 :: 		Label5.Order          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label5+4)
MOVT	R0, #hi_addr(_Label5+4)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,596 :: 		Label5.Left           = 49;
MOVS	R1, #49
MOVW	R0, #lo_addr(_Label5+6)
MOVT	R0, #hi_addr(_Label5+6)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,597 :: 		Label5.Top            = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label5+8)
MOVT	R0, #hi_addr(_Label5+8)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,598 :: 		Label5.Width          = 129;
MOVS	R1, #129
MOVW	R0, #lo_addr(_Label5+10)
MOVT	R0, #hi_addr(_Label5+10)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,599 :: 		Label5.Height         = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label5+12)
MOVT	R0, #hi_addr(_Label5+12)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,600 :: 		Label5.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label5+26)
MOVT	R0, #hi_addr(_Label5+26)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,601 :: 		Label5.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label5+27)
MOVT	R0, #hi_addr(_Label5+27)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,602 :: 		Label5.Caption        = Label5_Caption;
MOVW	R1, #lo_addr(_Label5_Caption+0)
MOVT	R1, #hi_addr(_Label5_Caption+0)
MOVW	R0, #lo_addr(_Label5+16)
MOVT	R0, #hi_addr(_Label5+16)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,603 :: 		Label5.FontName       = Tahoma12x16_Italic;
MOVW	R1, #4903
MOVT	R1, #0
MOVW	R0, #lo_addr(_Label5+20)
MOVT	R0, #hi_addr(_Label5+20)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,604 :: 		Label5.Font_Color     = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label5+24)
MOVT	R0, #hi_addr(_Label5+24)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,605 :: 		Label5.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+28)
MOVT	R0, #hi_addr(_Label5+28)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,606 :: 		Label5.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+32)
MOVT	R0, #hi_addr(_Label5+32)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,607 :: 		Label5.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+36)
MOVT	R0, #hi_addr(_Label5+36)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,608 :: 		Label5.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+40)
MOVT	R0, #hi_addr(_Label5+40)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,610 :: 		Label6.OwnerScreen     = &TestScreen4;
MOVW	R1, #lo_addr(_TestScreen4+0)
MOVT	R1, #hi_addr(_TestScreen4+0)
MOVW	R0, #lo_addr(_Label6+0)
MOVT	R0, #hi_addr(_Label6+0)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,611 :: 		Label6.Order          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+4)
MOVT	R0, #hi_addr(_Label6+4)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,612 :: 		Label6.Left           = 91;
MOVS	R1, #91
MOVW	R0, #lo_addr(_Label6+6)
MOVT	R0, #hi_addr(_Label6+6)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,613 :: 		Label6.Top            = 30;
MOVS	R1, #30
MOVW	R0, #lo_addr(_Label6+8)
MOVT	R0, #hi_addr(_Label6+8)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,614 :: 		Label6.Width          = 34;
MOVS	R1, #34
MOVW	R0, #lo_addr(_Label6+10)
MOVT	R0, #hi_addr(_Label6+10)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,615 :: 		Label6.Height         = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label6+12)
MOVT	R0, #hi_addr(_Label6+12)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,616 :: 		Label6.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label6+26)
MOVT	R0, #hi_addr(_Label6+26)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,617 :: 		Label6.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label6+27)
MOVT	R0, #hi_addr(_Label6+27)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,618 :: 		Label6.Caption        = Label6_Caption;
MOVW	R1, #lo_addr(_Label6_Caption+0)
MOVT	R1, #hi_addr(_Label6_Caption+0)
MOVW	R0, #lo_addr(_Label6+16)
MOVT	R0, #hi_addr(_Label6+16)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,619 :: 		Label6.FontName       = Arial13x16_BoldItalic;
MOV	R1, #167
MOVW	R0, #lo_addr(_Label6+20)
MOVT	R0, #hi_addr(_Label6+20)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,620 :: 		Label6.Font_Color     = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label6+24)
MOVT	R0, #hi_addr(_Label6+24)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,621 :: 		Label6.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+28)
MOVT	R0, #hi_addr(_Label6+28)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,622 :: 		Label6.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+32)
MOVT	R0, #hi_addr(_Label6+32)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,623 :: 		Label6.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+36)
MOVT	R0, #hi_addr(_Label6+36)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,624 :: 		Label6.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+40)
MOVT	R0, #hi_addr(_Label6+40)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,625 :: 		}
L_end_InitializeObjects:
ADD	SP, SP, #4
BX	LR
; end of FISHER_GUI_driver_InitializeObjects
FISHER_GUI_driver_IsInsideObject:
;FISHER_GUI_driver.c,627 :: 		static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
; Top start address is: 12 (R3)
; Left start address is: 8 (R2)
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #4
;FISHER_GUI_driver.c,628 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
; Top end address is: 12 (R3)
; Left end address is: 8 (R2)
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
; Left start address is: 8 (R2)
; Top start address is: 12 (R3)
; Width start address is: 20 (R5)
LDRH	R5, [SP, #4]
; Height start address is: 24 (R6)
LDRH	R6, [SP, #8]
CMP	R2, R0
IT	HI
BHI	L_FISHER_GUI_driver_IsInsideObject199
ADDS	R4, R2, R5
UXTH	R4, R4
; Left end address is: 8 (R2)
; Width end address is: 20 (R5)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R0
IT	CC
BCC	L_FISHER_GUI_driver_IsInsideObject198
; X end address is: 0 (R0)
;FISHER_GUI_driver.c,629 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
CMP	R3, R1
IT	HI
BHI	L_FISHER_GUI_driver_IsInsideObject197
ADDS	R4, R3, R6
UXTH	R4, R4
; Top end address is: 12 (R3)
; Height end address is: 24 (R6)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R1
IT	CC
BCC	L_FISHER_GUI_driver_IsInsideObject196
; Y end address is: 4 (R1)
L_FISHER_GUI_driver_IsInsideObject195:
;FISHER_GUI_driver.c,630 :: 		return 1;
MOVS	R0, #1
IT	AL
BAL	L_end_IsInsideObject
;FISHER_GUI_driver.c,628 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
L_FISHER_GUI_driver_IsInsideObject199:
L_FISHER_GUI_driver_IsInsideObject198:
;FISHER_GUI_driver.c,629 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
L_FISHER_GUI_driver_IsInsideObject197:
L_FISHER_GUI_driver_IsInsideObject196:
;FISHER_GUI_driver.c,632 :: 		return 0;
MOVS	R0, #0
;FISHER_GUI_driver.c,633 :: 		}
L_end_IsInsideObject:
ADD	SP, SP, #4
BX	LR
; end of FISHER_GUI_driver_IsInsideObject
_DeleteTrailingSpaces:
;FISHER_GUI_driver.c,642 :: 		void DeleteTrailingSpaces(char* str){
; str start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;FISHER_GUI_driver.c,644 :: 		i = 0;
; str start address is: 0 (R0)
; str end address is: 0 (R0)
MOV	R4, R0
; str end address is: 0 (R0)
;FISHER_GUI_driver.c,645 :: 		while(1) {
L_DeleteTrailingSpaces16:
;FISHER_GUI_driver.c,646 :: 		if(str[0] == ' ') {
; str start address is: 16 (R4)
LDRB	R1, [R4, #0]
CMP	R1, #32
IT	NE
BNE	L_DeleteTrailingSpaces18
;FISHER_GUI_driver.c,647 :: 		for(i = 0; i < strlen(str); i++) {
; i start address is: 20 (R5)
MOVS	R5, #0
; str end address is: 16 (R4)
; i end address is: 20 (R5)
L_DeleteTrailingSpaces19:
; i start address is: 20 (R5)
; str start address is: 16 (R4)
MOV	R0, R4
BL	_strlen+0
CMP	R5, R0
IT	GE
BGE	L_DeleteTrailingSpaces20
;FISHER_GUI_driver.c,648 :: 		str[i] = str[i+1];
ADDS	R2, R4, R5
ADDS	R1, R5, #1
SXTH	R1, R1
ADDS	R1, R4, R1
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;FISHER_GUI_driver.c,647 :: 		for(i = 0; i < strlen(str); i++) {
ADDS	R5, R5, #1
UXTB	R5, R5
;FISHER_GUI_driver.c,649 :: 		}
; i end address is: 20 (R5)
IT	AL
BAL	L_DeleteTrailingSpaces19
L_DeleteTrailingSpaces20:
;FISHER_GUI_driver.c,650 :: 		}
IT	AL
BAL	L_DeleteTrailingSpaces22
; str end address is: 16 (R4)
L_DeleteTrailingSpaces18:
;FISHER_GUI_driver.c,652 :: 		break;
IT	AL
BAL	L_DeleteTrailingSpaces17
L_DeleteTrailingSpaces22:
;FISHER_GUI_driver.c,653 :: 		}
; str start address is: 16 (R4)
; str end address is: 16 (R4)
IT	AL
BAL	L_DeleteTrailingSpaces16
L_DeleteTrailingSpaces17:
;FISHER_GUI_driver.c,654 :: 		}
L_end_DeleteTrailingSpaces:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DeleteTrailingSpaces
_DrawRoundButton:
;FISHER_GUI_driver.c,656 :: 		void DrawRoundButton(TButton_Round *Around_button) {
; Around_button start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
;FISHER_GUI_driver.c,657 :: 		if (Around_button->Visible == 1) {
; Around_button end address is: 0 (R0)
; Around_button start address is: 0 (R0)
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton23
;FISHER_GUI_driver.c,658 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton24
;FISHER_GUI_driver.c,659 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;FISHER_GUI_driver.c,661 :: 		Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R5, R1
;FISHER_GUI_driver.c,660 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #38
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #48
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;FISHER_GUI_driver.c,661 :: 		Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;FISHER_GUI_driver.c,660 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,662 :: 		}
IT	AL
BAL	L_DrawRoundButton25
L_DrawRoundButton24:
;FISHER_GUI_driver.c,665 :: 		Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R5, R1
;FISHER_GUI_driver.c,664 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #38
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;FISHER_GUI_driver.c,665 :: 		Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;FISHER_GUI_driver.c,664 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,666 :: 		}
L_DrawRoundButton25:
;FISHER_GUI_driver.c,667 :: 		TFT_Set_Pen(Around_button->Pen_Color, Around_button->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,668 :: 		if (Around_button->Height > Around_button->Width) {
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
CMP	R2, R1
IT	LS
BLS	L_DrawRoundButton26
;FISHER_GUI_driver.c,671 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
ADDW	R1, R0, #46
LDRB	R1, [R1, #0]
UXTB	R6, R1
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUBS	R5, R1, #2
;FISHER_GUI_driver.c,670 :: 		Around_button->Left + Around_button->Width - 2,
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #2
;FISHER_GUI_driver.c,669 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
ADDS	R2, R2, #1
ADDS	R1, R4, #1
;FISHER_GUI_driver.c,671 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
STR	R0, [SP, #4]
;FISHER_GUI_driver.c,669 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
UXTH	R0, R1
UXTH	R1, R2
;FISHER_GUI_driver.c,670 :: 		Around_button->Left + Around_button->Width - 2,
UXTH	R2, R3
;FISHER_GUI_driver.c,671 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
UXTH	R3, R5
PUSH	(R6)
BL	_TFT_Rectangle_Round_Edges+0
ADD	SP, SP, #4
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,672 :: 		}
IT	AL
BAL	L_DrawRoundButton27
L_DrawRoundButton26:
;FISHER_GUI_driver.c,677 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
ADDW	R1, R0, #46
LDRB	R1, [R1, #0]
UXTB	R6, R1
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUBS	R5, R1, #2
;FISHER_GUI_driver.c,676 :: 		Around_button->Left + Around_button->Width - 2,
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #2
;FISHER_GUI_driver.c,675 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
ADDS	R2, R2, #1
ADDS	R1, R4, #1
;FISHER_GUI_driver.c,677 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
STR	R0, [SP, #4]
;FISHER_GUI_driver.c,675 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
UXTH	R0, R1
UXTH	R1, R2
;FISHER_GUI_driver.c,676 :: 		Around_button->Left + Around_button->Width - 2,
UXTH	R2, R3
;FISHER_GUI_driver.c,677 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
UXTH	R3, R5
PUSH	(R6)
BL	_TFT_Rectangle_Round_Edges+0
ADD	SP, SP, #4
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,678 :: 		}
L_DrawRoundButton27:
;FISHER_GUI_driver.c,679 :: 		TFT_Set_Ext_Font(Around_button->FontName, Around_button->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Ext_Font+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,680 :: 		TFT_Write_Text_Return_Pos(Around_button->Caption, Around_button->Left, Around_button->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text_Return_Pos+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,681 :: 		if (Around_button->TextAlign == _taLeft)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawRoundButton28
;FISHER_GUI_driver.c,682 :: 		TFT_Write_Text(Around_button->Caption, Around_button->Left + 4, (Around_button->Top + ((Around_button->Height - caption_height) / 2)));
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R3, R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R2, R1, #4
ADDW	R1, R0, #24
; Around_button end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text+0
IT	AL
BAL	L_DrawRoundButton29
L_DrawRoundButton28:
;FISHER_GUI_driver.c,683 :: 		else if (Around_button->TextAlign == _taCenter)
; Around_button start address is: 0 (R0)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton30
;FISHER_GUI_driver.c,684 :: 		TFT_Write_Text(Around_button->Caption, (Around_button->Left + (Around_button->Width - caption_length) / 2), (Around_button->Top + ((Around_button->Height - caption_height) / 2)));
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R4, R3, R1
ADDS	R1, R0, #6
LDRH	R3, [R1, #0]
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R2, R3, R1
ADDW	R1, R0, #24
; Around_button end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R4
BL	_TFT_Write_Text+0
IT	AL
BAL	L_DrawRoundButton31
L_DrawRoundButton30:
;FISHER_GUI_driver.c,685 :: 		else if (Around_button->TextAlign == _taRight)
; Around_button start address is: 0 (R0)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawRoundButton32
;FISHER_GUI_driver.c,686 :: 		TFT_Write_Text(Around_button->Caption, Around_button->Left + (Around_button->Width - caption_length - 4), (Around_button->Top + (Around_button->Height - caption_height) / 2));
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R4, R3, R1
ADDS	R1, R0, #6
LDRH	R3, [R1, #0]
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
SUBS	R1, R1, #4
UXTH	R1, R1
ADDS	R2, R3, R1
ADDW	R1, R0, #24
; Around_button end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R4
BL	_TFT_Write_Text+0
L_DrawRoundButton32:
L_DrawRoundButton31:
L_DrawRoundButton29:
;FISHER_GUI_driver.c,687 :: 		}
L_DrawRoundButton23:
;FISHER_GUI_driver.c,688 :: 		}
L_end_DrawRoundButton:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawRoundButton
_DrawLabel:
;FISHER_GUI_driver.c,690 :: 		void DrawLabel(TLabel *ALabel) {
; ALabel start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
;FISHER_GUI_driver.c,691 :: 		if (ALabel->Visible == 1) {
; ALabel end address is: 0 (R0)
; ALabel start address is: 0 (R0)
ADDW	R1, R0, #26
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawLabel33
;FISHER_GUI_driver.c,692 :: 		TFT_Set_Ext_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Ext_Font+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,693 :: 		TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #16
; ALabel end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text+0
;FISHER_GUI_driver.c,694 :: 		}
L_DrawLabel33:
;FISHER_GUI_driver.c,695 :: 		}
L_end_DrawLabel:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawLabel
_DrawImage:
;FISHER_GUI_driver.c,697 :: 		void DrawImage(TImage *AImage) {
; AImage start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;FISHER_GUI_driver.c,698 :: 		if (AImage->Visible) {
; AImage end address is: 0 (R0)
; AImage start address is: 0 (R0)
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawImage34
;FISHER_GUI_driver.c,699 :: 		TFT_Ext_Image(AImage->Left, AImage->Top, AImage->Picture_Name, AImage->Picture_Ratio);
ADDW	R1, R0, #23
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #16
LDR	R1, [R1, #0]
MOV	R3, R1
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDS	R1, R0, #6
; AImage end address is: 0 (R0)
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
MOV	R2, R3
UXTB	R3, R4
BL	_TFT_Ext_Image+0
;FISHER_GUI_driver.c,700 :: 		}
L_DrawImage34:
;FISHER_GUI_driver.c,701 :: 		}
L_end_DrawImage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DrawImage
_DrawRadioButton:
;FISHER_GUI_driver.c,703 :: 		void DrawRadioButton(TRadioButton *ARadioButton) {
; ARadioButton start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
;FISHER_GUI_driver.c,704 :: 		int circleOffset = 0;
; ARadioButton end address is: 0 (R0)
; ARadioButton start address is: 0 (R0)
;FISHER_GUI_driver.c,705 :: 		if (ARadioButton->Visible == 1) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRadioButton35
;FISHER_GUI_driver.c,706 :: 		circleOffset = ARadioButton->Height / 5;
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVS	R1, #5
UDIV	R1, R2, R1
; circleOffset start address is: 28 (R7)
SXTH	R7, R1
;FISHER_GUI_driver.c,707 :: 		TFT_Set_Pen(ARadioButton->Pen_Color, ARadioButton->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,708 :: 		if (ARadioButton->TextAlign == _taLeft) {
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawRadioButton36
;FISHER_GUI_driver.c,709 :: 		TFT_Set_Brush(ARadioButton->Transparent,ARadioButton->Background_Color,0,0,0,0);
MOVS	R4, #0
MOVS	R3, #0
ADDW	R1, R0, #46
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
PUSH	(R4)
PUSH	(R3)
MOVS	R3, #0
UXTB	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,710 :: 		TFT_Circle(ARadioButton->Left + ARadioButton->Height / 2, ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2);
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
LSRS	R3, R1, #1
UXTH	R3, R3
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
ADDS	R2, R1, R3
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R1, R1, R3
STRH	R7, [SP, #4]
STR	R0, [SP, #8]
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
BL	_TFT_Circle+0
LDR	R0, [SP, #8]
LDRSH	R7, [SP, #4]
;FISHER_GUI_driver.c,711 :: 		if (ARadioButton->Checked == 1) {
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRadioButton37
;FISHER_GUI_driver.c,712 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRadioButton38
;FISHER_GUI_driver.c,713 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;FISHER_GUI_driver.c,714 :: 		TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Press_Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_End_Color, ARadioButton->Gradient_Start_Color);
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #38
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #50
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,715 :: 		}
IT	AL
BAL	L_DrawRadioButton39
L_DrawRadioButton38:
;FISHER_GUI_driver.c,717 :: 		TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_Start_Color, ARadioButton->Gradient_End_Color);
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #38
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
L_DrawRadioButton39:
;FISHER_GUI_driver.c,718 :: 		TFT_Circle(ARadioButton->Left + ARadioButton->Height / 2 , ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2 - circleOffset);
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
LSRS	R4, R1, #1
UXTH	R4, R4
SUB	R3, R4, R7
; circleOffset end address is: 28 (R7)
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
ADDS	R2, R1, R4
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R1, R1, R4
STR	R0, [SP, #4]
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
BL	_TFT_Circle+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,719 :: 		}
L_DrawRadioButton37:
;FISHER_GUI_driver.c,720 :: 		TFT_Set_Ext_Font(ARadioButton->FontName, ARadioButton->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Ext_Font+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,721 :: 		TFT_Write_Text_Return_Pos(ARadioButton->Caption, ARadioButton->Left + ARadioButton->Height + 4, ARadioButton->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
ADDS	R2, R1, #4
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text_Return_Pos+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,722 :: 		TFT_Write_Text(ARadioButton->Caption, ARadioButton->Left + ARadioButton->Height + 4, (ARadioButton->Top + ((ARadioButton->Height - caption_height) / 2)));
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R3, R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R1, R1, R2
UXTH	R1, R1
ADDS	R2, R1, #4
ADDW	R1, R0, #24
; ARadioButton end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text+0
;FISHER_GUI_driver.c,723 :: 		}
IT	AL
BAL	L_DrawRadioButton40
L_DrawRadioButton36:
;FISHER_GUI_driver.c,724 :: 		else if (ARadioButton->TextAlign == _taRight) {
; circleOffset start address is: 28 (R7)
; ARadioButton start address is: 0 (R0)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawRadioButton41
;FISHER_GUI_driver.c,725 :: 		TFT_Set_Brush(ARadioButton->Transparent,ARadioButton->Background_Color,0,0,0,0);
MOVS	R4, #0
MOVS	R3, #0
ADDW	R1, R0, #46
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
PUSH	(R4)
PUSH	(R3)
MOVS	R3, #0
UXTB	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,726 :: 		TFT_Circle(ARadioButton->Left  + ARadioButton->Width - ARadioButton->Height / 2, ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2);
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
LSRS	R4, R1, #1
UXTH	R4, R4
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
ADDS	R3, R1, R4
ADDS	R1, R0, #6
LDRH	R2, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUB	R1, R1, R4
STRH	R7, [SP, #4]
STR	R0, [SP, #8]
SXTH	R2, R4
SXTH	R0, R1
SXTH	R1, R3
BL	_TFT_Circle+0
LDR	R0, [SP, #8]
LDRSH	R7, [SP, #4]
;FISHER_GUI_driver.c,727 :: 		if (ARadioButton->Checked == 1) {
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRadioButton42
;FISHER_GUI_driver.c,728 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRadioButton43
;FISHER_GUI_driver.c,729 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;FISHER_GUI_driver.c,730 :: 		TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Press_Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_End_Color, ARadioButton->Gradient_Start_Color);
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #38
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #50
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,731 :: 		}
IT	AL
BAL	L_DrawRadioButton44
L_DrawRadioButton43:
;FISHER_GUI_driver.c,733 :: 		TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_Start_Color, ARadioButton->Gradient_End_Color);
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #38
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
L_DrawRadioButton44:
;FISHER_GUI_driver.c,734 :: 		TFT_Circle(ARadioButton->Left  + ARadioButton->Width - ARadioButton->Height / 2, ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2 - circleOffset);
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
LSRS	R5, R1, #1
UXTH	R5, R5
SUB	R4, R5, R7
; circleOffset end address is: 28 (R7)
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
ADDS	R3, R1, R5
ADDS	R1, R0, #6
LDRH	R2, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUB	R1, R1, R5
STR	R0, [SP, #4]
SXTH	R2, R4
SXTH	R0, R1
SXTH	R1, R3
BL	_TFT_Circle+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,735 :: 		}
L_DrawRadioButton42:
;FISHER_GUI_driver.c,736 :: 		TFT_Set_Ext_Font(ARadioButton->FontName, ARadioButton->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Ext_Font+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,737 :: 		TFT_Write_Text_Return_Pos(ARadioButton->Caption, ARadioButton->Left + 3, ARadioButton->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R2, R1, #3
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text_Return_Pos+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,738 :: 		TFT_Write_Text(ARadioButton->Caption, ARadioButton->Left + 3, ARadioButton->Top + (ARadioButton->Height - caption_height) / 2);
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R3, R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R2, R1, #3
ADDW	R1, R0, #24
; ARadioButton end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text+0
;FISHER_GUI_driver.c,739 :: 		}
L_DrawRadioButton41:
L_DrawRadioButton40:
;FISHER_GUI_driver.c,740 :: 		}
L_DrawRadioButton35:
;FISHER_GUI_driver.c,741 :: 		}
L_end_DrawRadioButton:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DrawRadioButton
_UpdatePBPosition:
;FISHER_GUI_driver.c,743 :: 		void UpdatePBPosition(TProgressBar *AProgressBar) {
; AProgressBar start address is: 0 (R0)
SUB	SP, SP, #28
STR	LR, [SP, #0]
;FISHER_GUI_driver.c,745 :: 		unsigned int locPosition = 0;
; AProgressBar end address is: 0 (R0)
; AProgressBar start address is: 0 (R0)
;FISHER_GUI_driver.c,746 :: 		unsigned cnt = 0;
;FISHER_GUI_driver.c,748 :: 		unsigned int tmpWidth = 0;
;FISHER_GUI_driver.c,749 :: 		unsigned int tmpRound = 0;
;FISHER_GUI_driver.c,750 :: 		move_offset = 10;
; move_offset start address is: 32 (R8)
MOVW	R8, #10
SXTH	R8, R8
;FISHER_GUI_driver.c,751 :: 		locPosition = (float)(AProgressBar->Position - AProgressBar->Min) / (float)(AProgressBar->Max - AProgressBar->Min) * 100;
ADDW	R1, R0, #48
LDRH	R2, [R1, #0]
ADDW	R1, R0, #44
LDRH	R3, [R1, #0]
SUB	R1, R2, R3
UXTH	R1, R1
VMOV	S1, R1
VCVT.F32	#0, S1, S1
ADDW	R1, R0, #46
LDRH	R1, [R1, #0]
SUB	R1, R1, R3
UXTH	R1, R1
VMOV	S0, R1
VCVT.F32	#0, S0, S0
VDIV.F32	S1, S1, S0
MOVW	R1, #0
MOVT	R1, #17096
VMOV	S0, R1
VMUL.F32	S0, S1, S0
VCVT	#1, .F32, S0, S0
VMOV	R7, S0
UXTH	R7, R7
; locPosition start address is: 28 (R7)
;FISHER_GUI_driver.c,752 :: 		if (AProgressBar->Visible == 1) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_UpdatePBPosition45
;FISHER_GUI_driver.c,753 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
MOVS	R4, #0
MOVS	R3, #0
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
PUSH	(R4)
PUSH	(R3)
MOVS	R3, #0
UXTB	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,754 :: 		TFT_Set_Pen(AProgressBar->Background_Color, AProgressBar->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,755 :: 		TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STRH	R7, [SP, #4]
STRH	R8, [SP, #6]
STR	R0, [SP, #8]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text_Return_Pos+0
LDR	R0, [SP, #8]
LDRSH	R8, [SP, #6]
LDRH	R7, [SP, #4]
;FISHER_GUI_driver.c,756 :: 		if (caption_height >  AProgressBar->Height)
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	LS
BLS	L_UpdatePBPosition46
;FISHER_GUI_driver.c,757 :: 		caption_height =  AProgressBar->Height;
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
STRH	R2, [R1, #0]
L_UpdatePBPosition46:
;FISHER_GUI_driver.c,758 :: 		if (caption_length >  AProgressBar->Width)
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	LS
BLS	L_UpdatePBPosition47
;FISHER_GUI_driver.c,759 :: 		caption_length =  AProgressBar->Width;
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
STRH	R2, [R1, #0]
L_UpdatePBPosition47:
;FISHER_GUI_driver.c,760 :: 		if (AProgressBar->Position < (AProgressBar->Left + (AProgressBar->Width - caption_length) / 2)) {
ADDW	R1, R0, #48
LDRH	R4, [R1, #0]
ADDS	R1, R0, #6
LDRH	R3, [R1, #0]
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R1, R3, R1
UXTH	R1, R1
CMP	R4, R1
IT	CS
BCS	L_UpdatePBPosition48
;FISHER_GUI_driver.c,764 :: 		AProgressBar->Top +(AProgressBar->Height - caption_height) / 2 + caption_height);
ADDW	R1, R0, #8
LDRH	R4, [R1, #0]
ADDW	R1, R0, #12
LDRH	R3, [R1, #0]
MOVW	R2, #lo_addr(_caption_height+0)
MOVT	R2, #hi_addr(_caption_height+0)
LDRH	R1, [R2, #0]
SUB	R1, R3, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R6, R4, R1
UXTH	R6, R6
MOV	R1, R2
LDRH	R1, [R1, #0]
ADDS	R5, R6, R1
;FISHER_GUI_driver.c,763 :: 		AProgressBar->Left + (AProgressBar->Width - caption_length) / 2 + caption_length,
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R3, #lo_addr(_caption_length+0)
MOVT	R3, #hi_addr(_caption_length+0)
LDRH	R1, [R3, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R2, R4, R1
UXTH	R2, R2
MOV	R1, R3
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
;FISHER_GUI_driver.c,764 :: 		AProgressBar->Top +(AProgressBar->Height - caption_height) / 2 + caption_height);
STRH	R7, [SP, #4]
STRH	R8, [SP, #6]
STR	R0, [SP, #8]
SXTH	R3, R5
;FISHER_GUI_driver.c,761 :: 		TFT_Rectangle(AProgressBar->Left + (AProgressBar->Width - caption_length) / 2,
SXTH	R0, R2
;FISHER_GUI_driver.c,763 :: 		AProgressBar->Left + (AProgressBar->Width - caption_length) / 2 + caption_length,
SXTH	R2, R1
;FISHER_GUI_driver.c,762 :: 		AProgressBar->Top +(AProgressBar->Height - caption_height) / 2,
SXTH	R1, R6
;FISHER_GUI_driver.c,764 :: 		AProgressBar->Top +(AProgressBar->Height - caption_height) / 2 + caption_height);
BL	_TFT_Rectangle+0
LDR	R0, [SP, #8]
LDRSH	R8, [SP, #6]
LDRH	R7, [SP, #4]
;FISHER_GUI_driver.c,765 :: 		}
L_UpdatePBPosition48:
;FISHER_GUI_driver.c,766 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
ADDW	R1, R0, #38
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #35
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #34
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,767 :: 		TFT_Set_Pen(AProgressBar->Pen_Color, AProgressBar->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,768 :: 		if (AProgressBar->Rounded == 1) {
ADDW	R1, R0, #53
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_UpdatePBPosition49
;FISHER_GUI_driver.c,769 :: 		if (locPosition > 0) {
CMP	R7, #0
IT	LS
BLS	L_UpdatePBPosition50
;FISHER_GUI_driver.c,771 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
ADDW	R1, R0, #38
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #35
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #34
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,772 :: 		TFT_Rectangle(AProgressBar->Left + AProgressBar->Corner_Radius, AProgressBar->Top,  AProgressBar->Left + AProgressBar->Corner_Radius  + locPosition *  (AProgressBar->Width-AProgressBar->Corner_Radius*2) / 100 , AProgressBar->Top + AProgressBar->Height);
ADDW	R1, R0, #8
LDRH	R6, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R5, R6, R1
ADDS	R1, R0, #6
LDRH	R2, [R1, #0]
ADDW	R1, R0, #54
LDRB	R4, [R1, #0]
ADDS	R3, R2, R4
UXTH	R3, R3
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
LSLS	R1, R4, #1
SXTH	R1, R1
SUB	R1, R2, R1
UXTH	R1, R1
MUL	R2, R7, R1
UXTH	R2, R2
MOVS	R1, #100
UDIV	R1, R2, R1
UXTH	R1, R1
ADDS	R2, R3, R1
SXTH	R1, R6
STRH	R7, [SP, #4]
STRH	R8, [SP, #6]
STR	R0, [SP, #8]
SXTH	R2, R2
SXTH	R0, R3
SXTH	R3, R5
BL	_TFT_Rectangle+0
LDR	R0, [SP, #8]
LDRSH	R8, [SP, #6]
LDRH	R7, [SP, #4]
;FISHER_GUI_driver.c,773 :: 		}
L_UpdatePBPosition50:
;FISHER_GUI_driver.c,774 :: 		}
IT	AL
BAL	L_UpdatePBPosition51
L_UpdatePBPosition49:
;FISHER_GUI_driver.c,776 :: 		if (locPosition > 0) {
CMP	R7, #0
IT	LS
BLS	L_UpdatePBPosition52
;FISHER_GUI_driver.c,777 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
ADDW	R1, R0, #38
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #35
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #34
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,778 :: 		TFT_Rectangle(AProgressBar->Left, AProgressBar->Top,  AProgressBar->Left + (locPosition * AProgressBar->Width) / 100, AProgressBar->Top + AProgressBar->Height);
ADDW	R1, R0, #8
LDRH	R6, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R5, R6, R1
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
MUL	R2, R7, R1
UXTH	R2, R2
MOVS	R1, #100
UDIV	R1, R2, R1
UXTH	R1, R1
ADDS	R3, R4, R1
SXTH	R2, R6
SXTH	R1, R4
STRH	R7, [SP, #4]
STRH	R8, [SP, #6]
STR	R0, [SP, #8]
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
SXTH	R3, R5
BL	_TFT_Rectangle+0
LDR	R0, [SP, #8]
LDRSH	R8, [SP, #6]
LDRH	R7, [SP, #4]
;FISHER_GUI_driver.c,779 :: 		}
L_UpdatePBPosition52:
;FISHER_GUI_driver.c,780 :: 		}
L_UpdatePBPosition51:
;FISHER_GUI_driver.c,782 :: 		if (AProgressBar->Smooth != 1) {
ADDW	R1, R0, #52
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	EQ
BEQ	L__UpdatePBPosition200
;FISHER_GUI_driver.c,783 :: 		if(AProgressBar->Rounded == 1) {
ADDW	R1, R0, #53
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_UpdatePBPosition54
;FISHER_GUI_driver.c,784 :: 		tmpRound = AProgressBar->Corner_Radius;
ADDW	R1, R0, #54
LDRB	R3, [R1, #0]
; tmpRound start address is: 16 (R4)
UXTB	R4, R3
;FISHER_GUI_driver.c,785 :: 		cnt = move_offset + tmpRound;
ADD	R10, R8, R4, LSL #0
UXTH	R10, R10
; cnt start address is: 40 (R10)
;FISHER_GUI_driver.c,786 :: 		tmpWidth = AProgressBar->Width - AProgressBar->Corner_Radius * 2;
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
LSLS	R1, R3, #1
SXTH	R1, R1
SUB	R9, R2, R1, LSL #0
UXTH	R9, R9
; tmpWidth start address is: 36 (R9)
;FISHER_GUI_driver.c,787 :: 		}
UXTH	R5, R4
; tmpRound end address is: 16 (R4)
; tmpWidth end address is: 36 (R9)
; cnt end address is: 40 (R10)
IT	AL
BAL	L_UpdatePBPosition55
L_UpdatePBPosition54:
;FISHER_GUI_driver.c,789 :: 		tmpRound = 0;
; tmpRound start address is: 20 (R5)
MOVS	R5, #0
;FISHER_GUI_driver.c,790 :: 		cnt = move_offset;
; cnt start address is: 40 (R10)
UXTH	R10, R8
;FISHER_GUI_driver.c,791 :: 		tmpWidth = AProgressBar->Width;
ADDW	R1, R0, #10
LDRH	R9, [R1, #0]
; tmpWidth start address is: 36 (R9)
; tmpRound end address is: 20 (R5)
; tmpWidth end address is: 36 (R9)
; cnt end address is: 40 (R10)
;FISHER_GUI_driver.c,792 :: 		}
L_UpdatePBPosition55:
;FISHER_GUI_driver.c,793 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
; tmpWidth start address is: 36 (R9)
; cnt start address is: 40 (R10)
; tmpRound start address is: 20 (R5)
MOVS	R4, #0
MOVS	R3, #0
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STRH	R5, [SP, #4]
STR	R0, [SP, #8]
PUSH	(R4)
PUSH	(R3)
MOVS	R3, #0
UXTB	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
; move_offset end address is: 32 (R8)
; tmpRound end address is: 20 (R5)
; tmpWidth end address is: 36 (R9)
; locPosition end address is: 28 (R7)
; cnt end address is: 40 (R10)
; AProgressBar end address is: 0 (R0)
LDR	R0, [SP, #8]
LDRH	R5, [SP, #4]
SXTH	R11, R8
UXTH	R8, R5
;FISHER_GUI_driver.c,794 :: 		while (cnt-tmpRound < (locPosition * tmpWidth) / 100) {
L_UpdatePBPosition56:
; move_offset start address is: 44 (R11)
; tmpRound start address is: 32 (R8)
; cnt start address is: 40 (R10)
; tmpWidth start address is: 36 (R9)
; locPosition start address is: 28 (R7)
; move_offset start address is: 44 (R11)
; move_offset end address is: 44 (R11)
; AProgressBar start address is: 0 (R0)
SUB	R3, R10, R8, LSL #0
UXTH	R3, R3
MUL	R2, R7, R9
UXTH	R2, R2
MOVS	R1, #100
UDIV	R1, R2, R1
UXTH	R1, R1
CMP	R3, R1
IT	CS
BCS	L_UpdatePBPosition57
; move_offset end address is: 44 (R11)
;FISHER_GUI_driver.c,795 :: 		if  (cnt - tmpRound + 3 >=  tmpWidth * locPosition)
; move_offset start address is: 44 (R11)
SUB	R1, R10, R8, LSL #0
UXTH	R1, R1
ADDS	R2, R1, #3
UXTH	R2, R2
MUL	R1, R9, R7
UXTH	R1, R1
CMP	R2, R1
IT	CC
BCC	L_UpdatePBPosition58
;FISHER_GUI_driver.c,796 :: 		TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top, AProgressBar->Left + tmpRound  + tmpWidth * locPosition , AProgressBar->Top + AProgressBar->Height);
ADDW	R1, R0, #8
LDRH	R6, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R5, R6, R1
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADD	R2, R4, R8, LSL #0
UXTH	R2, R2
MUL	R1, R9, R7
UXTH	R1, R1
ADDS	R3, R2, R1
SXTH	R2, R6
ADD	R1, R4, R10, LSL #0
STR	R0, [SP, #4]
STRH	R11, [SP, #8]
STRH	R7, [SP, #10]
STRH	R9, [SP, #12]
STRH	R10, [SP, #14]
STRH	R8, [SP, #16]
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
SXTH	R3, R5
BL	_TFT_Rectangle+0
LDRH	R8, [SP, #16]
LDRH	R10, [SP, #14]
LDRH	R9, [SP, #12]
LDRH	R7, [SP, #10]
LDRSH	R11, [SP, #8]
LDR	R0, [SP, #4]
IT	AL
BAL	L_UpdatePBPosition59
L_UpdatePBPosition58:
;FISHER_GUI_driver.c,798 :: 		TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top,  AProgressBar->Left + cnt + 3, AProgressBar->Top + AProgressBar->Height);
ADDW	R1, R0, #8
LDRH	R5, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R4, R5, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADD	R3, R1, R10, LSL #0
UXTH	R3, R3
ADDS	R2, R3, #3
SXTH	R1, R5
STR	R0, [SP, #4]
STRH	R11, [SP, #8]
STRH	R7, [SP, #10]
STRH	R9, [SP, #12]
STRH	R10, [SP, #14]
STRH	R8, [SP, #16]
SXTH	R2, R2
SXTH	R0, R3
SXTH	R3, R4
BL	_TFT_Rectangle+0
LDRH	R8, [SP, #16]
LDRH	R10, [SP, #14]
LDRH	R9, [SP, #12]
LDRH	R7, [SP, #10]
LDRSH	R11, [SP, #8]
LDR	R0, [SP, #4]
L_UpdatePBPosition59:
;FISHER_GUI_driver.c,799 :: 		cnt = cnt + move_offset + 3;
ADD	R1, R10, R11, LSL #0
UXTH	R1, R1
; cnt end address is: 40 (R10)
ADDS	R1, R1, #3
; cnt start address is: 40 (R10)
UXTH	R10, R1
;FISHER_GUI_driver.c,800 :: 		}
; tmpRound end address is: 32 (R8)
; tmpWidth end address is: 36 (R9)
; move_offset end address is: 44 (R11)
; cnt end address is: 40 (R10)
IT	AL
BAL	L_UpdatePBPosition56
L_UpdatePBPosition57:
;FISHER_GUI_driver.c,801 :: 		}
; AProgressBar end address is: 0 (R0)
UXTH	R2, R7
IT	AL
BAL	L_UpdatePBPosition53
; locPosition end address is: 28 (R7)
L__UpdatePBPosition200:
;FISHER_GUI_driver.c,782 :: 		if (AProgressBar->Smooth != 1) {
UXTH	R2, R7
;FISHER_GUI_driver.c,801 :: 		}
L_UpdatePBPosition53:
;FISHER_GUI_driver.c,803 :: 		if (AProgressBar->Show_Position == 1){
; locPosition start address is: 8 (R2)
; AProgressBar start address is: 0 (R0)
ADDW	R1, R0, #50
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_UpdatePBPosition60
;FISHER_GUI_driver.c,804 :: 		if (AProgressBar->Show_Percentage == 1) {
ADDW	R1, R0, #51
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_UpdatePBPosition61
;FISHER_GUI_driver.c,805 :: 		IntToStr(locPosition , tmpStr);
ADD	R1, SP, #18
STR	R0, [SP, #4]
SXTH	R0, R2
; locPosition end address is: 8 (R2)
BL	_IntToStr+0
;FISHER_GUI_driver.c,806 :: 		DeleteTrailingSpaces(tmpStr);
ADD	R1, SP, #18
MOV	R0, R1
BL	_DeleteTrailingSpaces+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,807 :: 		strcpy(AProgressBar->Caption, tmpStr);
ADD	R2, SP, #18
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
BL	_strcpy+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,808 :: 		strcat(AProgressBar->Caption, "\%");
MOVW	R2, #lo_addr(?lstr5_FISHER_GUI_driver+0)
MOVT	R2, #hi_addr(?lstr5_FISHER_GUI_driver+0)
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,809 :: 		}
IT	AL
BAL	L_UpdatePBPosition62
L_UpdatePBPosition61:
;FISHER_GUI_driver.c,811 :: 		IntToStr(AProgressBar->Position , tmpStr);
ADD	R2, SP, #18
ADDW	R1, R0, #48
LDRH	R1, [R1, #0]
SXTH	R1, R1
STR	R0, [SP, #4]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
;FISHER_GUI_driver.c,812 :: 		DeleteTrailingSpaces(tmpStr);
ADD	R1, SP, #18
MOV	R0, R1
BL	_DeleteTrailingSpaces+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,813 :: 		strcpy(AProgressBar->Caption, tmpStr);
ADD	R2, SP, #18
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
BL	_strcpy+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,814 :: 		}
L_UpdatePBPosition62:
;FISHER_GUI_driver.c,815 :: 		TFT_Set_Ext_Font(AProgressBar->FontName, AProgressBar->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #32
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #28
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Ext_Font+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,816 :: 		TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text_Return_Pos+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,817 :: 		TFT_Write_Text(AProgressBar->Caption, AProgressBar->Left + (AProgressBar->Width - caption_length) / 2, AProgressBar->Top + (AProgressBar->Height - caption_height) / 2);
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R4, R3, R1
ADDS	R1, R0, #6
LDRH	R3, [R1, #0]
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R2, R3, R1
ADDW	R1, R0, #24
; AProgressBar end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R4
BL	_TFT_Write_Text+0
;FISHER_GUI_driver.c,818 :: 		}
L_UpdatePBPosition60:
;FISHER_GUI_driver.c,819 :: 		}
L_UpdatePBPosition45:
;FISHER_GUI_driver.c,820 :: 		}
L_end_UpdatePBPosition:
LDR	LR, [SP, #0]
ADD	SP, SP, #28
BX	LR
; end of _UpdatePBPosition
_DrawProgressBar:
;FISHER_GUI_driver.c,822 :: 		void DrawProgressBar(TProgressBar *AProgressBar) {
; AProgressBar start address is: 0 (R0)
SUB	SP, SP, #28
STR	LR, [SP, #0]
;FISHER_GUI_driver.c,823 :: 		int move_offset = 0;
; AProgressBar end address is: 0 (R0)
; AProgressBar start address is: 0 (R0)
;FISHER_GUI_driver.c,824 :: 		unsigned int locPosition = 0;
;FISHER_GUI_driver.c,825 :: 		unsigned cnt = 0;
;FISHER_GUI_driver.c,827 :: 		unsigned int tmpWidth = 0;
;FISHER_GUI_driver.c,828 :: 		unsigned int tmpRound = 0;
;FISHER_GUI_driver.c,829 :: 		move_offset = 10;
MOVS	R1, #10
SXTH	R1, R1
STRH	R1, [SP, #18]
;FISHER_GUI_driver.c,830 :: 		locPosition = (float)(AProgressBar->Position - AProgressBar->Min) / (float)(AProgressBar->Max - AProgressBar->Min) * 100;
ADDW	R1, R0, #48
LDRH	R2, [R1, #0]
ADDW	R1, R0, #44
LDRH	R3, [R1, #0]
SUB	R1, R2, R3
UXTH	R1, R1
VMOV	S1, R1
VCVT.F32	#0, S1, S1
ADDW	R1, R0, #46
LDRH	R1, [R1, #0]
SUB	R1, R1, R3
UXTH	R1, R1
VMOV	S0, R1
VCVT.F32	#0, S0, S0
VDIV.F32	S1, S1, S0
MOVW	R1, #0
MOVT	R1, #17096
VMOV	S0, R1
VMUL.F32	S0, S1, S0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
UXTH	R1, R1
STRH	R1, [SP, #20]
;FISHER_GUI_driver.c,831 :: 		if (AProgressBar->Visible == 1) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawProgressBar63
;FISHER_GUI_driver.c,832 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
MOVS	R4, #0
MOVS	R3, #0
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
PUSH	(R4)
PUSH	(R3)
MOVS	R3, #0
UXTB	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,833 :: 		TFT_Set_Pen(AProgressBar->Pen_Color, AProgressBar->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,834 :: 		if (AProgressBar->Rounded == 1) {
ADDW	R1, R0, #53
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawProgressBar64
;FISHER_GUI_driver.c,836 :: 		TFT_Rectangle_Round_Edges(AProgressBar->Left, AProgressBar->Top,  AProgressBar->Left + AProgressBar->Width, AProgressBar->Top + AProgressBar->Height, AProgressBar->Corner_Radius);
ADDW	R1, R0, #54
LDRB	R1, [R1, #0]
UXTB	R6, R1
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R5, R2, R1
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R3, R4, R1
UXTH	R1, R4
STR	R0, [SP, #4]
UXTH	R0, R1
UXTH	R1, R2
UXTH	R2, R3
UXTH	R3, R5
PUSH	(R6)
BL	_TFT_Rectangle_Round_Edges+0
ADD	SP, SP, #4
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,837 :: 		if (locPosition > 0) {
LDRH	R1, [SP, #20]
CMP	R1, #0
IT	LS
BLS	L_DrawProgressBar65
;FISHER_GUI_driver.c,839 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
ADDW	R1, R0, #38
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #35
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #34
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,840 :: 		TFT_Rectangle(AProgressBar->Left + AProgressBar->Corner_Radius, AProgressBar->Top,  AProgressBar->Left + AProgressBar->Corner_Radius   + locPosition *  (AProgressBar->Width-AProgressBar->Corner_Radius*2) / 100, AProgressBar->Top + AProgressBar->Height);
ADDW	R1, R0, #8
LDRH	R6, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R5, R6, R1
ADDS	R1, R0, #6
LDRH	R2, [R1, #0]
ADDW	R1, R0, #54
LDRB	R4, [R1, #0]
ADDS	R3, R2, R4
UXTH	R3, R3
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
LSLS	R1, R4, #1
SXTH	R1, R1
SUB	R2, R2, R1
UXTH	R2, R2
LDRH	R1, [SP, #20]
MULS	R2, R1, R2
UXTH	R2, R2
MOVS	R1, #100
UDIV	R1, R2, R1
UXTH	R1, R1
ADDS	R2, R3, R1
SXTH	R1, R6
STR	R0, [SP, #4]
SXTH	R2, R2
SXTH	R0, R3
SXTH	R3, R5
BL	_TFT_Rectangle+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,841 :: 		}
L_DrawProgressBar65:
;FISHER_GUI_driver.c,842 :: 		}
IT	AL
BAL	L_DrawProgressBar66
L_DrawProgressBar64:
;FISHER_GUI_driver.c,845 :: 		TFT_Rectangle(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + AProgressBar->Width, AProgressBar->Top + AProgressBar->Height);
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R5, R2, R1
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R3, R4, R1
SXTH	R2, R2
SXTH	R1, R4
STR	R0, [SP, #4]
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
SXTH	R3, R5
BL	_TFT_Rectangle+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,846 :: 		if (locPosition > 0) {
LDRH	R1, [SP, #20]
CMP	R1, #0
IT	LS
BLS	L_DrawProgressBar67
;FISHER_GUI_driver.c,848 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
ADDW	R1, R0, #38
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #35
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #34
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,849 :: 		TFT_Rectangle(AProgressBar->Left, AProgressBar->Top,  AProgressBar->Left + (locPosition * AProgressBar->Width) / 100, AProgressBar->Top + AProgressBar->Height);
ADDW	R1, R0, #8
LDRH	R6, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R5, R6, R1
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
LDRH	R1, [SP, #20]
MULS	R2, R1, R2
UXTH	R2, R2
MOVS	R1, #100
UDIV	R1, R2, R1
UXTH	R1, R1
ADDS	R3, R4, R1
SXTH	R2, R6
SXTH	R1, R4
STR	R0, [SP, #4]
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
SXTH	R3, R5
BL	_TFT_Rectangle+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,850 :: 		}
L_DrawProgressBar67:
;FISHER_GUI_driver.c,851 :: 		}
L_DrawProgressBar66:
;FISHER_GUI_driver.c,853 :: 		if (AProgressBar->Smooth != 1) {
ADDW	R1, R0, #52
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	EQ
BEQ	L__DrawProgressBar201
;FISHER_GUI_driver.c,854 :: 		if(AProgressBar->Rounded == 1) {
ADDW	R1, R0, #53
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawProgressBar69
;FISHER_GUI_driver.c,855 :: 		tmpRound = AProgressBar->Corner_Radius;
ADDW	R1, R0, #54
LDRB	R3, [R1, #0]
STRH	R3, [SP, #24]
;FISHER_GUI_driver.c,856 :: 		cnt = move_offset + tmpRound;
LDRH	R2, [SP, #24]
LDRSH	R1, [SP, #18]
ADD	R10, R1, R2, LSL #0
UXTH	R10, R10
; cnt start address is: 40 (R10)
;FISHER_GUI_driver.c,857 :: 		tmpWidth = AProgressBar->Width - AProgressBar->Corner_Radius * 2;
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
LSLS	R1, R3, #1
SXTH	R1, R1
SUB	R1, R2, R1
STRH	R1, [SP, #22]
;FISHER_GUI_driver.c,858 :: 		}
; cnt end address is: 40 (R10)
IT	AL
BAL	L_DrawProgressBar70
L_DrawProgressBar69:
;FISHER_GUI_driver.c,860 :: 		tmpRound = 0;
MOVS	R1, #0
STRH	R1, [SP, #24]
;FISHER_GUI_driver.c,861 :: 		cnt = move_offset;
; cnt start address is: 40 (R10)
LDRSH	R10, [SP, #18]
;FISHER_GUI_driver.c,862 :: 		tmpWidth = AProgressBar->Width;
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
STRH	R1, [SP, #22]
; cnt end address is: 40 (R10)
;FISHER_GUI_driver.c,863 :: 		}
L_DrawProgressBar70:
;FISHER_GUI_driver.c,864 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
; cnt start address is: 40 (R10)
MOVS	R4, #0
MOVS	R3, #0
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
PUSH	(R4)
PUSH	(R3)
MOVS	R3, #0
UXTB	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
; cnt end address is: 40 (R10)
; AProgressBar end address is: 0 (R0)
LDR	R0, [SP, #4]
UXTH	R7, R10
;FISHER_GUI_driver.c,865 :: 		while (cnt-tmpRound < (locPosition * tmpWidth) / 100) {
L_DrawProgressBar71:
; cnt start address is: 28 (R7)
; AProgressBar start address is: 0 (R0)
LDRH	R1, [SP, #24]
SUB	R3, R7, R1
UXTH	R3, R3
LDRH	R2, [SP, #22]
LDRH	R1, [SP, #20]
MULS	R2, R1, R2
UXTH	R2, R2
MOVS	R1, #100
UDIV	R1, R2, R1
UXTH	R1, R1
CMP	R3, R1
IT	CS
BCS	L_DrawProgressBar72
;FISHER_GUI_driver.c,866 :: 		if  (cnt - tmpRound + 3 >=  tmpWidth * locPosition)
LDRH	R1, [SP, #24]
SUB	R1, R7, R1
UXTH	R1, R1
ADDS	R3, R1, #3
UXTH	R3, R3
LDRH	R2, [SP, #20]
LDRH	R1, [SP, #22]
MULS	R1, R2, R1
UXTH	R1, R1
CMP	R3, R1
IT	CC
BCC	L_DrawProgressBar73
;FISHER_GUI_driver.c,867 :: 		TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top, AProgressBar->Left + tmpRound  + tmpWidth * locPosition , AProgressBar->Top + AProgressBar->Height);
ADDW	R1, R0, #8
LDRH	R6, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R5, R6, R1
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
LDRH	R1, [SP, #24]
ADDS	R3, R4, R1
UXTH	R3, R3
LDRH	R2, [SP, #20]
LDRH	R1, [SP, #22]
MULS	R1, R2, R1
UXTH	R1, R1
ADDS	R3, R3, R1
SXTH	R2, R6
ADDS	R1, R4, R7
STR	R0, [SP, #4]
STRH	R7, [SP, #8]
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
SXTH	R3, R5
BL	_TFT_Rectangle+0
LDRH	R7, [SP, #8]
LDR	R0, [SP, #4]
IT	AL
BAL	L_DrawProgressBar74
L_DrawProgressBar73:
;FISHER_GUI_driver.c,869 :: 		TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top,  AProgressBar->Left + cnt + 3, AProgressBar->Top + AProgressBar->Height);
ADDW	R1, R0, #8
LDRH	R5, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R4, R5, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R3, R1, R7
UXTH	R3, R3
ADDS	R2, R3, #3
SXTH	R1, R5
STR	R0, [SP, #4]
STRH	R7, [SP, #8]
SXTH	R2, R2
SXTH	R0, R3
SXTH	R3, R4
BL	_TFT_Rectangle+0
LDRH	R7, [SP, #8]
LDR	R0, [SP, #4]
L_DrawProgressBar74:
;FISHER_GUI_driver.c,870 :: 		cnt = cnt + move_offset + 3;
LDRSH	R1, [SP, #18]
ADDS	R1, R7, R1
UXTH	R1, R1
; cnt end address is: 28 (R7)
ADDS	R1, R1, #3
; cnt start address is: 40 (R10)
UXTH	R10, R1
;FISHER_GUI_driver.c,871 :: 		}
; cnt end address is: 40 (R10)
UXTH	R7, R10
IT	AL
BAL	L_DrawProgressBar71
L_DrawProgressBar72:
;FISHER_GUI_driver.c,872 :: 		}
IT	AL
BAL	L_DrawProgressBar68
; AProgressBar end address is: 0 (R0)
L__DrawProgressBar201:
;FISHER_GUI_driver.c,853 :: 		if (AProgressBar->Smooth != 1) {
;FISHER_GUI_driver.c,872 :: 		}
L_DrawProgressBar68:
;FISHER_GUI_driver.c,874 :: 		if (AProgressBar->Show_Position == 1){
; AProgressBar start address is: 0 (R0)
ADDW	R1, R0, #50
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawProgressBar75
;FISHER_GUI_driver.c,875 :: 		if (AProgressBar->Show_Percentage == 1) {
ADDW	R1, R0, #51
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawProgressBar76
;FISHER_GUI_driver.c,876 :: 		IntToStr(locPosition , tmpStr);
ADD	R1, SP, #10
STR	R0, [SP, #4]
LDRH	R0, [SP, #20]
BL	_IntToStr+0
;FISHER_GUI_driver.c,877 :: 		DeleteTrailingSpaces(tmpStr);
ADD	R1, SP, #10
MOV	R0, R1
BL	_DeleteTrailingSpaces+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,878 :: 		strcpy(AProgressBar->Caption, tmpStr);
ADD	R2, SP, #10
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
BL	_strcpy+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,879 :: 		strcat(AProgressBar->Caption, "\%");
MOVW	R2, #lo_addr(?lstr6_FISHER_GUI_driver+0)
MOVT	R2, #hi_addr(?lstr6_FISHER_GUI_driver+0)
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,880 :: 		}
IT	AL
BAL	L_DrawProgressBar77
L_DrawProgressBar76:
;FISHER_GUI_driver.c,882 :: 		IntToStr(AProgressBar->Position , tmpStr);
ADD	R2, SP, #10
ADDW	R1, R0, #48
LDRH	R1, [R1, #0]
SXTH	R1, R1
STR	R0, [SP, #4]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
;FISHER_GUI_driver.c,883 :: 		DeleteTrailingSpaces(tmpStr);
ADD	R1, SP, #10
MOV	R0, R1
BL	_DeleteTrailingSpaces+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,884 :: 		strcpy(AProgressBar->Caption, tmpStr);
ADD	R2, SP, #10
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
BL	_strcpy+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,885 :: 		}
L_DrawProgressBar77:
;FISHER_GUI_driver.c,886 :: 		TFT_Set_Ext_Font(AProgressBar->FontName, AProgressBar->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #32
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #28
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Ext_Font+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,887 :: 		TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text_Return_Pos+0
LDR	R0, [SP, #4]
;FISHER_GUI_driver.c,888 :: 		TFT_Write_Text(AProgressBar->Caption, AProgressBar->Left + (AProgressBar->Width - caption_length) / 2, AProgressBar->Top + (AProgressBar->Height - caption_height) / 2);
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R4, R3, R1
ADDS	R1, R0, #6
LDRH	R3, [R1, #0]
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R2, R3, R1
ADDW	R1, R0, #24
; AProgressBar end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R4
BL	_TFT_Write_Text+0
;FISHER_GUI_driver.c,889 :: 		}
L_DrawProgressBar75:
;FISHER_GUI_driver.c,890 :: 		}
L_DrawProgressBar63:
;FISHER_GUI_driver.c,891 :: 		}
L_end_DrawProgressBar:
LDR	LR, [SP, #0]
ADD	SP, SP, #28
BX	LR
; end of _DrawProgressBar
_DrawScreen:
;FISHER_GUI_driver.c,893 :: 		void DrawScreen(TScreen *aScreen) {
; aScreen start address is: 0 (R0)
SUB	SP, SP, #64
STR	LR, [SP, #0]
;FISHER_GUI_driver.c,907 :: 		object_pressed = 0;
; aScreen end address is: 0 (R0)
; aScreen start address is: 0 (R0)
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;FISHER_GUI_driver.c,908 :: 		order = 0;
MOVS	R1, #0
SXTH	R1, R1
STRH	R1, [SP, #4]
;FISHER_GUI_driver.c,909 :: 		round_button_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #6]
;FISHER_GUI_driver.c,910 :: 		label_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #12]
;FISHER_GUI_driver.c,911 :: 		image_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #20]
;FISHER_GUI_driver.c,912 :: 		radio_button_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #28]
;FISHER_GUI_driver.c,913 :: 		progress_bar_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #36]
;FISHER_GUI_driver.c,914 :: 		CurrentScreen = aScreen;
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
STR	R0, [R1, #0]
;FISHER_GUI_driver.c,916 :: 		if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
ADDS	R1, R0, #2
; aScreen end address is: 0 (R0)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen204
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen203
IT	AL
BAL	L_DrawScreen80
L__DrawScreen204:
L__DrawScreen203:
;FISHER_GUI_driver.c,917 :: 		save_bled = TFT_BLED;
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
STR	R2, [SP, #60]
LDR	R1, [R2, #0]
STRB	R1, [SP, #44]
;FISHER_GUI_driver.c,918 :: 		TFT_BLED           = 0;
MOVS	R1, #0
SXTB	R1, R1
STR	R1, [R2, #0]
;FISHER_GUI_driver.c,919 :: 		TFT_Init(CurrentScreen->Width, CurrentScreen->Height);
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
STR	R3, [SP, #56]
LDR	R1, [R3, #0]
ADDS	R1, R1, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
BL	_TFT_Init+0
;FISHER_GUI_driver.c,920 :: 		TFT_Set_Ext_Buffer(TFT_Get_Data);
MOVW	R1, #lo_addr(_TFT_Get_Data+0)
MOVT	R1, #hi_addr(_TFT_Get_Data+0)
MOV	R0, R1
BL	_TFT_Set_Ext_Buffer+0
;FISHER_GUI_driver.c,921 :: 		TP_TFT_Init(CurrentScreen->Width, CurrentScreen->Height, 8, 9);                                  // Initialize touch panel
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R1, [R1, #0]
MOVS	R3, #9
UXTH	R0, R1
UXTH	R1, R2
MOVS	R2, #8
BL	_TP_TFT_Init+0
;FISHER_GUI_driver.c,922 :: 		TP_TFT_Set_ADC_Threshold(ADC_THRESHOLD);                              // Set touch panel ADC threshold
MOVW	R0, #1500
SXTH	R0, R0
BL	_TP_TFT_Set_ADC_Threshold+0
;FISHER_GUI_driver.c,923 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
;FISHER_GUI_driver.c,924 :: 		display_width = CurrentScreen->Width;
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
STRH	R2, [R1, #0]
;FISHER_GUI_driver.c,925 :: 		display_height = CurrentScreen->Height;
LDR	R1, [SP, #56]
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
STRH	R2, [R1, #0]
;FISHER_GUI_driver.c,926 :: 		TFT_BLED           = save_bled;
LDRB	R2, [SP, #44]
LDR	R1, [SP, #60]
STR	R2, [R1, #0]
;FISHER_GUI_driver.c,927 :: 		}
IT	AL
BAL	L_DrawScreen81
L_DrawScreen80:
;FISHER_GUI_driver.c,929 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
L_DrawScreen81:
;FISHER_GUI_driver.c,932 :: 		while (order < CurrentScreen->ObjectsCount) {
L_DrawScreen82:
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #6
LDRB	R2, [R1, #0]
LDRSH	R1, [SP, #4]
CMP	R1, R2
IT	GE
BGE	L_DrawScreen83
;FISHER_GUI_driver.c,933 :: 		if (round_button_idx < CurrentScreen->Buttons_RoundCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #8
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #6]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen84
;FISHER_GUI_driver.c,934 :: 		local_round_button = GetRoundButton(round_button_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #12
LDR	R2, [R1, #0]
LDRB	R1, [SP, #6]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #8]
;FISHER_GUI_driver.c,935 :: 		if (order == local_round_button->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRSH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen85
;FISHER_GUI_driver.c,936 :: 		order++;
LDRSH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;FISHER_GUI_driver.c,937 :: 		round_button_idx++;
LDRB	R1, [SP, #6]
ADDS	R1, R1, #1
STRB	R1, [SP, #6]
;FISHER_GUI_driver.c,938 :: 		DrawRoundButton(local_round_button);
LDR	R0, [SP, #8]
BL	_DrawRoundButton+0
;FISHER_GUI_driver.c,939 :: 		}
L_DrawScreen85:
;FISHER_GUI_driver.c,940 :: 		}
L_DrawScreen84:
;FISHER_GUI_driver.c,942 :: 		if (label_idx < CurrentScreen->LabelsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #16
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #12]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen86
;FISHER_GUI_driver.c,943 :: 		local_label = GetLabel(label_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #20
LDR	R2, [R1, #0]
LDRB	R1, [SP, #12]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #16]
;FISHER_GUI_driver.c,944 :: 		if (order == local_label->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRSH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen87
;FISHER_GUI_driver.c,945 :: 		label_idx++;
LDRB	R1, [SP, #12]
ADDS	R1, R1, #1
STRB	R1, [SP, #12]
;FISHER_GUI_driver.c,946 :: 		order++;
LDRSH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;FISHER_GUI_driver.c,947 :: 		DrawLabel(local_label);
LDR	R0, [SP, #16]
BL	_DrawLabel+0
;FISHER_GUI_driver.c,948 :: 		}
L_DrawScreen87:
;FISHER_GUI_driver.c,949 :: 		}
L_DrawScreen86:
;FISHER_GUI_driver.c,951 :: 		if (image_idx  < CurrentScreen->ImagesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #24
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #20]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen88
;FISHER_GUI_driver.c,952 :: 		local_image = GetImage(image_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #28
LDR	R2, [R1, #0]
LDRB	R1, [SP, #20]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #24]
;FISHER_GUI_driver.c,953 :: 		if (order == local_image->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRSH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen89
;FISHER_GUI_driver.c,954 :: 		image_idx++;
LDRB	R1, [SP, #20]
ADDS	R1, R1, #1
STRB	R1, [SP, #20]
;FISHER_GUI_driver.c,955 :: 		order++;
LDRSH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;FISHER_GUI_driver.c,956 :: 		DrawImage(local_image);
LDR	R0, [SP, #24]
BL	_DrawImage+0
;FISHER_GUI_driver.c,957 :: 		}
L_DrawScreen89:
;FISHER_GUI_driver.c,958 :: 		}
L_DrawScreen88:
;FISHER_GUI_driver.c,960 :: 		if (radio_button_idx  < CurrentScreen->RadioButtonsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #32
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #28]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen90
;FISHER_GUI_driver.c,961 :: 		local_radio_button = GetRadioButton(radio_button_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #36
LDR	R2, [R1, #0]
LDRB	R1, [SP, #28]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #32]
;FISHER_GUI_driver.c,962 :: 		if (order == local_radio_button->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRSH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen91
;FISHER_GUI_driver.c,963 :: 		radio_button_idx++;
LDRB	R1, [SP, #28]
ADDS	R1, R1, #1
STRB	R1, [SP, #28]
;FISHER_GUI_driver.c,964 :: 		order++;
LDRSH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;FISHER_GUI_driver.c,965 :: 		DrawRadioButton(local_radio_button);
LDR	R0, [SP, #32]
BL	_DrawRadioButton+0
;FISHER_GUI_driver.c,966 :: 		}
L_DrawScreen91:
;FISHER_GUI_driver.c,967 :: 		}
L_DrawScreen90:
;FISHER_GUI_driver.c,969 :: 		if (progress_bar_idx  < CurrentScreen->ProgressBarsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #40
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #36]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen92
;FISHER_GUI_driver.c,970 :: 		local_progress_bar = GetProgressBar(progress_bar_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #44
LDR	R2, [R1, #0]
LDRB	R1, [SP, #36]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #40]
;FISHER_GUI_driver.c,971 :: 		if (order == local_progress_bar->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRSH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen93
;FISHER_GUI_driver.c,972 :: 		progress_bar_idx++;
LDRB	R1, [SP, #36]
ADDS	R1, R1, #1
STRB	R1, [SP, #36]
;FISHER_GUI_driver.c,973 :: 		order++;
LDRSH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;FISHER_GUI_driver.c,974 :: 		DrawProgressBar(local_progress_bar);
LDR	R0, [SP, #40]
BL	_DrawProgressBar+0
;FISHER_GUI_driver.c,975 :: 		}
L_DrawScreen93:
;FISHER_GUI_driver.c,976 :: 		}
L_DrawScreen92:
;FISHER_GUI_driver.c,978 :: 		}
IT	AL
BAL	L_DrawScreen82
L_DrawScreen83:
;FISHER_GUI_driver.c,979 :: 		}
L_end_DrawScreen:
LDR	LR, [SP, #0]
ADD	SP, SP, #64
BX	LR
; end of _DrawScreen
_Get_Object:
;FISHER_GUI_driver.c,981 :: 		void Get_Object(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
;FISHER_GUI_driver.c,982 :: 		round_button_order  = -1;
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
STRH	R3, [R2, #0]
;FISHER_GUI_driver.c,983 :: 		label_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;FISHER_GUI_driver.c,984 :: 		image_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
STRH	R3, [R2, #0]
;FISHER_GUI_driver.c,985 :: 		radio_button_order    = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
STRH	R3, [R2, #0]
;FISHER_GUI_driver.c,986 :: 		progress_bar_order    = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_progress_bar_order+0)
MOVT	R2, #hi_addr(_progress_bar_order+0)
STRH	R3, [R2, #0]
;FISHER_GUI_driver.c,988 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 0 (R0)
; Y end address is: 4 (R1)
UXTH	R8, R0
UXTH	R7, R1
L_Get_Object94:
; Y start address is: 28 (R7)
; X start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object95
;FISHER_GUI_driver.c,989 :: 		local_round_button = GetRoundButton(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #12
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_round_button+0)
MOVT	R2, #hi_addr(_local_round_button+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,990 :: 		if (local_round_button->Active == 1) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object97
;FISHER_GUI_driver.c,992 :: 		local_round_button->Width, local_round_button->Height) == 1) {
MOVW	R6, #lo_addr(_local_round_button+0)
MOVT	R6, #hi_addr(_local_round_button+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;FISHER_GUI_driver.c,991 :: 		if (IsInsideObject(X, Y, local_round_button->Left, local_round_button->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;FISHER_GUI_driver.c,992 :: 		local_round_button->Width, local_round_button->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	FISHER_GUI_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object98
;FISHER_GUI_driver.c,993 :: 		round_button_order = local_round_button->Order;
MOVW	R4, #lo_addr(_local_round_button+0)
MOVT	R4, #hi_addr(_local_round_button+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
STRH	R3, [R2, #0]
;FISHER_GUI_driver.c,994 :: 		exec_round_button = local_round_button;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,995 :: 		}
L_Get_Object98:
;FISHER_GUI_driver.c,996 :: 		}
L_Get_Object97:
;FISHER_GUI_driver.c,988 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;FISHER_GUI_driver.c,997 :: 		}
IT	AL
BAL	L_Get_Object94
L_Get_Object95:
;FISHER_GUI_driver.c,1000 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object99:
; X start address is: 28 (R7)
; Y start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #16
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object100
;FISHER_GUI_driver.c,1001 :: 		local_label = GetLabel(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #20
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_label+0)
MOVT	R2, #hi_addr(_local_label+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1002 :: 		if (local_label->Active == 1) {
ADDW	R2, R3, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object102
;FISHER_GUI_driver.c,1004 :: 		local_label->Width, local_label->Height) == 1) {
MOVW	R6, #lo_addr(_local_label+0)
MOVT	R6, #hi_addr(_local_label+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;FISHER_GUI_driver.c,1003 :: 		if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R8
UXTH	R0, R7
;FISHER_GUI_driver.c,1004 :: 		local_label->Width, local_label->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	FISHER_GUI_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object103
;FISHER_GUI_driver.c,1005 :: 		label_order = local_label->Order;
MOVW	R4, #lo_addr(_local_label+0)
MOVT	R4, #hi_addr(_local_label+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;FISHER_GUI_driver.c,1006 :: 		exec_label = local_label;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1007 :: 		}
L_Get_Object103:
;FISHER_GUI_driver.c,1008 :: 		}
L_Get_Object102:
;FISHER_GUI_driver.c,1000 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;FISHER_GUI_driver.c,1009 :: 		}
IT	AL
BAL	L_Get_Object99
L_Get_Object100:
;FISHER_GUI_driver.c,1012 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object104:
; Y start address is: 28 (R7)
; X start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #24
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object105
;FISHER_GUI_driver.c,1013 :: 		local_image = GetImage(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_image+0)
MOVT	R2, #hi_addr(_local_image+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1014 :: 		if (local_image->Active == 1) {
ADDW	R2, R3, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object107
;FISHER_GUI_driver.c,1016 :: 		local_image->Width, local_image->Height) == 1) {
MOVW	R6, #lo_addr(_local_image+0)
MOVT	R6, #hi_addr(_local_image+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;FISHER_GUI_driver.c,1015 :: 		if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;FISHER_GUI_driver.c,1016 :: 		local_image->Width, local_image->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	FISHER_GUI_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object108
;FISHER_GUI_driver.c,1017 :: 		image_order = local_image->Order;
MOVW	R4, #lo_addr(_local_image+0)
MOVT	R4, #hi_addr(_local_image+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
STRH	R3, [R2, #0]
;FISHER_GUI_driver.c,1018 :: 		exec_image = local_image;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1019 :: 		}
L_Get_Object108:
;FISHER_GUI_driver.c,1020 :: 		}
L_Get_Object107:
;FISHER_GUI_driver.c,1012 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;FISHER_GUI_driver.c,1021 :: 		}
IT	AL
BAL	L_Get_Object104
L_Get_Object105:
;FISHER_GUI_driver.c,1024 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->RadioButtonsCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object109:
; X start address is: 28 (R7)
; Y start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #32
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object110
;FISHER_GUI_driver.c,1025 :: 		local_radio_button = GetRadioButton(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #36
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_radio_button+0)
MOVT	R2, #hi_addr(_local_radio_button+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1026 :: 		if (local_radio_button->Active == 1) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object112
;FISHER_GUI_driver.c,1028 :: 		local_radio_button->Width, local_radio_button->Height) == 1) {
MOVW	R6, #lo_addr(_local_radio_button+0)
MOVT	R6, #hi_addr(_local_radio_button+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;FISHER_GUI_driver.c,1027 :: 		if (IsInsideObject(X, Y, local_radio_button->Left, local_radio_button->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R8
UXTH	R0, R7
;FISHER_GUI_driver.c,1028 :: 		local_radio_button->Width, local_radio_button->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	FISHER_GUI_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object113
;FISHER_GUI_driver.c,1029 :: 		radio_button_order = local_radio_button->Order;
MOVW	R4, #lo_addr(_local_radio_button+0)
MOVT	R4, #hi_addr(_local_radio_button+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
STRH	R3, [R2, #0]
;FISHER_GUI_driver.c,1030 :: 		exec_radio_button = local_radio_button;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1031 :: 		}
L_Get_Object113:
;FISHER_GUI_driver.c,1032 :: 		}
L_Get_Object112:
;FISHER_GUI_driver.c,1024 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->RadioButtonsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;FISHER_GUI_driver.c,1033 :: 		}
IT	AL
BAL	L_Get_Object109
L_Get_Object110:
;FISHER_GUI_driver.c,1036 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ProgressBarsCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object114:
; X start address is: 32 (R8)
; Y start address is: 28 (R7)
; Y start address is: 28 (R7)
; Y end address is: 28 (R7)
; X start address is: 32 (R8)
; X end address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #40
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object115
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
;FISHER_GUI_driver.c,1037 :: 		local_progress_bar = GetProgressBar(_object_count);
; X start address is: 32 (R8)
; Y start address is: 28 (R7)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #44
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_progress_bar+0)
MOVT	R2, #hi_addr(_local_progress_bar+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1038 :: 		if (local_progress_bar->Active == 1) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object117
;FISHER_GUI_driver.c,1040 :: 		local_progress_bar->Width, local_progress_bar->Height) == 1) {
MOVW	R6, #lo_addr(_local_progress_bar+0)
MOVT	R6, #hi_addr(_local_progress_bar+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;FISHER_GUI_driver.c,1039 :: 		if (IsInsideObject(X, Y, local_progress_bar->Left, local_progress_bar->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;FISHER_GUI_driver.c,1040 :: 		local_progress_bar->Width, local_progress_bar->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	FISHER_GUI_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object118
;FISHER_GUI_driver.c,1041 :: 		progress_bar_order = local_progress_bar->Order;
MOVW	R4, #lo_addr(_local_progress_bar+0)
MOVT	R4, #hi_addr(_local_progress_bar+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_progress_bar_order+0)
MOVT	R2, #hi_addr(_progress_bar_order+0)
STRH	R3, [R2, #0]
;FISHER_GUI_driver.c,1042 :: 		exec_progress_bar = local_progress_bar;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_progress_bar+0)
MOVT	R2, #hi_addr(_exec_progress_bar+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1043 :: 		}
L_Get_Object118:
;FISHER_GUI_driver.c,1044 :: 		}
L_Get_Object117:
;FISHER_GUI_driver.c,1036 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ProgressBarsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;FISHER_GUI_driver.c,1045 :: 		}
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
IT	AL
BAL	L_Get_Object114
L_Get_Object115:
;FISHER_GUI_driver.c,1047 :: 		_object_count = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
;FISHER_GUI_driver.c,1048 :: 		if (round_button_order > _object_count)
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	LE
BLE	L_Get_Object119
;FISHER_GUI_driver.c,1049 :: 		_object_count = round_button_order;
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object119:
;FISHER_GUI_driver.c,1050 :: 		if (label_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object120
;FISHER_GUI_driver.c,1051 :: 		_object_count = label_order;
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object120:
;FISHER_GUI_driver.c,1052 :: 		if (image_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object121
;FISHER_GUI_driver.c,1053 :: 		_object_count = image_order;
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object121:
;FISHER_GUI_driver.c,1054 :: 		if (radio_button_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object122
;FISHER_GUI_driver.c,1055 :: 		_object_count = radio_button_order;
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object122:
;FISHER_GUI_driver.c,1056 :: 		if (progress_bar_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_progress_bar_order+0)
MOVT	R2, #hi_addr(_progress_bar_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object123
;FISHER_GUI_driver.c,1057 :: 		_object_count = progress_bar_order;
MOVW	R2, #lo_addr(_progress_bar_order+0)
MOVT	R2, #hi_addr(_progress_bar_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object123:
;FISHER_GUI_driver.c,1058 :: 		}
L_end_Get_Object:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Get_Object
FISHER_GUI_driver_Process_TP_Press:
;FISHER_GUI_driver.c,1061 :: 		static void Process_TP_Press(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;FISHER_GUI_driver.c,1062 :: 		exec_round_button   = 0;
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1063 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1064 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1065 :: 		exec_radio_button     = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1066 :: 		exec_progress_bar     = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_progress_bar+0)
MOVT	R2, #hi_addr(_exec_progress_bar+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1068 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;FISHER_GUI_driver.c,1071 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_FISHER_GUI_driver_Process_TP_Press124
;FISHER_GUI_driver.c,1072 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Press125
;FISHER_GUI_driver.c,1073 :: 		if (exec_round_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Press126
;FISHER_GUI_driver.c,1074 :: 		if (exec_round_button->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_driver_Process_TP_Press127
;FISHER_GUI_driver.c,1075 :: 		exec_round_button->OnPressPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R2, [R4, #0]
BLX	R2
;FISHER_GUI_driver.c,1076 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;FISHER_GUI_driver.c,1077 :: 		}
L_FISHER_GUI_driver_Process_TP_Press127:
;FISHER_GUI_driver.c,1078 :: 		}
L_FISHER_GUI_driver_Process_TP_Press126:
;FISHER_GUI_driver.c,1079 :: 		}
L_FISHER_GUI_driver_Process_TP_Press125:
;FISHER_GUI_driver.c,1081 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Press128
;FISHER_GUI_driver.c,1082 :: 		if (exec_label->Active == 1) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Press129
;FISHER_GUI_driver.c,1083 :: 		if (exec_label->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_driver_Process_TP_Press130
;FISHER_GUI_driver.c,1084 :: 		exec_label->OnPressPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
;FISHER_GUI_driver.c,1085 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;FISHER_GUI_driver.c,1086 :: 		}
L_FISHER_GUI_driver_Process_TP_Press130:
;FISHER_GUI_driver.c,1087 :: 		}
L_FISHER_GUI_driver_Process_TP_Press129:
;FISHER_GUI_driver.c,1088 :: 		}
L_FISHER_GUI_driver_Process_TP_Press128:
;FISHER_GUI_driver.c,1090 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Press131
;FISHER_GUI_driver.c,1091 :: 		if (exec_image->Active == 1) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Press132
;FISHER_GUI_driver.c,1092 :: 		if (exec_image->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_driver_Process_TP_Press133
;FISHER_GUI_driver.c,1093 :: 		exec_image->OnPressPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;FISHER_GUI_driver.c,1094 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;FISHER_GUI_driver.c,1095 :: 		}
L_FISHER_GUI_driver_Process_TP_Press133:
;FISHER_GUI_driver.c,1096 :: 		}
L_FISHER_GUI_driver_Process_TP_Press132:
;FISHER_GUI_driver.c,1097 :: 		}
L_FISHER_GUI_driver_Process_TP_Press131:
;FISHER_GUI_driver.c,1099 :: 		if (_object_count == radio_button_order) {
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Press134
;FISHER_GUI_driver.c,1100 :: 		if (exec_radio_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Press135
;FISHER_GUI_driver.c,1101 :: 		if (exec_radio_button->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_driver_Process_TP_Press136
;FISHER_GUI_driver.c,1102 :: 		exec_radio_button->OnPressPtr();
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R2, [R4, #0]
BLX	R2
;FISHER_GUI_driver.c,1103 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;FISHER_GUI_driver.c,1104 :: 		}
L_FISHER_GUI_driver_Process_TP_Press136:
;FISHER_GUI_driver.c,1105 :: 		}
L_FISHER_GUI_driver_Process_TP_Press135:
;FISHER_GUI_driver.c,1106 :: 		}
L_FISHER_GUI_driver_Process_TP_Press134:
;FISHER_GUI_driver.c,1108 :: 		}
L_FISHER_GUI_driver_Process_TP_Press124:
;FISHER_GUI_driver.c,1109 :: 		}
L_end_Process_TP_Press:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of FISHER_GUI_driver_Process_TP_Press
FISHER_GUI_driver_Process_TP_Up:
;FISHER_GUI_driver.c,1111 :: 		static void Process_TP_Up(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
;FISHER_GUI_driver.c,1113 :: 		switch (PressedObjectType) {
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
IT	AL
BAL	L_FISHER_GUI_driver_Process_TP_Up137
;FISHER_GUI_driver.c,1115 :: 		case 1: {
L_FISHER_GUI_driver_Process_TP_Up139:
;FISHER_GUI_driver.c,1116 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_FISHER_GUI_driver_Process_TP_Up140
;FISHER_GUI_driver.c,1117 :: 		exec_round_button = (TButton_Round*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1118 :: 		if ((exec_round_button->PressColEnabled == 1) && (exec_round_button->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #47
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Up208
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Up207
L_FISHER_GUI_driver_Process_TP_Up206:
;FISHER_GUI_driver.c,1119 :: 		DrawRoundButton(exec_round_button);
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawRoundButton+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;FISHER_GUI_driver.c,1118 :: 		if ((exec_round_button->PressColEnabled == 1) && (exec_round_button->OwnerScreen == CurrentScreen)) {
L_FISHER_GUI_driver_Process_TP_Up208:
L_FISHER_GUI_driver_Process_TP_Up207:
;FISHER_GUI_driver.c,1121 :: 		break;
IT	AL
BAL	L_FISHER_GUI_driver_Process_TP_Up138
;FISHER_GUI_driver.c,1122 :: 		}
L_FISHER_GUI_driver_Process_TP_Up140:
;FISHER_GUI_driver.c,1123 :: 		break;
IT	AL
BAL	L_FISHER_GUI_driver_Process_TP_Up138
;FISHER_GUI_driver.c,1126 :: 		case 17: {
L_FISHER_GUI_driver_Process_TP_Up144:
;FISHER_GUI_driver.c,1127 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_FISHER_GUI_driver_Process_TP_Up145
;FISHER_GUI_driver.c,1128 :: 		exec_radio_button = (TRadioButton*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1129 :: 		if ((exec_radio_button->PressColEnabled == 1) && (exec_radio_button->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #48
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Up210
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Up209
L_FISHER_GUI_driver_Process_TP_Up205:
;FISHER_GUI_driver.c,1130 :: 		DrawRadioButton(exec_radio_button);
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawRadioButton+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;FISHER_GUI_driver.c,1129 :: 		if ((exec_radio_button->PressColEnabled == 1) && (exec_radio_button->OwnerScreen == CurrentScreen)) {
L_FISHER_GUI_driver_Process_TP_Up210:
L_FISHER_GUI_driver_Process_TP_Up209:
;FISHER_GUI_driver.c,1132 :: 		break;
IT	AL
BAL	L_FISHER_GUI_driver_Process_TP_Up138
;FISHER_GUI_driver.c,1133 :: 		}
L_FISHER_GUI_driver_Process_TP_Up145:
;FISHER_GUI_driver.c,1134 :: 		break;
IT	AL
BAL	L_FISHER_GUI_driver_Process_TP_Up138
;FISHER_GUI_driver.c,1136 :: 		}
L_FISHER_GUI_driver_Process_TP_Up137:
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #1
IT	EQ
BEQ	L_FISHER_GUI_driver_Process_TP_Up139
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #17
IT	EQ
BEQ	L_FISHER_GUI_driver_Process_TP_Up144
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
L_FISHER_GUI_driver_Process_TP_Up138:
;FISHER_GUI_driver.c,1138 :: 		exec_label          = 0;
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1139 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1141 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;FISHER_GUI_driver.c,1144 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_FISHER_GUI_driver_Process_TP_Up149
;FISHER_GUI_driver.c,1146 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Up150
;FISHER_GUI_driver.c,1147 :: 		if (exec_round_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Up151
;FISHER_GUI_driver.c,1148 :: 		if (exec_round_button->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_driver_Process_TP_Up152
;FISHER_GUI_driver.c,1149 :: 		exec_round_button->OnUpPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R2, [R4, #0]
BLX	R2
L_FISHER_GUI_driver_Process_TP_Up152:
;FISHER_GUI_driver.c,1150 :: 		if (PressedObject == (void *)exec_round_button)
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Up153
;FISHER_GUI_driver.c,1151 :: 		if (exec_round_button->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_driver_Process_TP_Up154
;FISHER_GUI_driver.c,1152 :: 		exec_round_button->OnClickPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R2, [R4, #0]
BLX	R2
L_FISHER_GUI_driver_Process_TP_Up154:
L_FISHER_GUI_driver_Process_TP_Up153:
;FISHER_GUI_driver.c,1153 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1154 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;FISHER_GUI_driver.c,1155 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;FISHER_GUI_driver.c,1156 :: 		}
L_FISHER_GUI_driver_Process_TP_Up151:
;FISHER_GUI_driver.c,1157 :: 		}
L_FISHER_GUI_driver_Process_TP_Up150:
;FISHER_GUI_driver.c,1160 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Up155
;FISHER_GUI_driver.c,1161 :: 		if (exec_label->Active == 1) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Up156
;FISHER_GUI_driver.c,1162 :: 		if (exec_label->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_driver_Process_TP_Up157
;FISHER_GUI_driver.c,1163 :: 		exec_label->OnUpPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R2, [R4, #0]
BLX	R2
L_FISHER_GUI_driver_Process_TP_Up157:
;FISHER_GUI_driver.c,1164 :: 		if (PressedObject == (void *)exec_label)
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Up158
;FISHER_GUI_driver.c,1165 :: 		if (exec_label->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_driver_Process_TP_Up159
;FISHER_GUI_driver.c,1166 :: 		exec_label->OnClickPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
L_FISHER_GUI_driver_Process_TP_Up159:
L_FISHER_GUI_driver_Process_TP_Up158:
;FISHER_GUI_driver.c,1167 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1168 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;FISHER_GUI_driver.c,1169 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;FISHER_GUI_driver.c,1170 :: 		}
L_FISHER_GUI_driver_Process_TP_Up156:
;FISHER_GUI_driver.c,1171 :: 		}
L_FISHER_GUI_driver_Process_TP_Up155:
;FISHER_GUI_driver.c,1174 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Up160
;FISHER_GUI_driver.c,1175 :: 		if (exec_image->Active == 1) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Up161
;FISHER_GUI_driver.c,1176 :: 		if (exec_image->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_driver_Process_TP_Up162
;FISHER_GUI_driver.c,1177 :: 		exec_image->OnUpPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R2, [R4, #0]
BLX	R2
L_FISHER_GUI_driver_Process_TP_Up162:
;FISHER_GUI_driver.c,1178 :: 		if (PressedObject == (void *)exec_image)
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Up163
;FISHER_GUI_driver.c,1179 :: 		if (exec_image->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_driver_Process_TP_Up164
;FISHER_GUI_driver.c,1180 :: 		exec_image->OnClickPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_FISHER_GUI_driver_Process_TP_Up164:
L_FISHER_GUI_driver_Process_TP_Up163:
;FISHER_GUI_driver.c,1181 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1182 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;FISHER_GUI_driver.c,1183 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;FISHER_GUI_driver.c,1184 :: 		}
L_FISHER_GUI_driver_Process_TP_Up161:
;FISHER_GUI_driver.c,1185 :: 		}
L_FISHER_GUI_driver_Process_TP_Up160:
;FISHER_GUI_driver.c,1188 :: 		if (_object_count == radio_button_order) {
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Up165
;FISHER_GUI_driver.c,1189 :: 		if (exec_radio_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Up166
;FISHER_GUI_driver.c,1190 :: 		if (exec_radio_button->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_driver_Process_TP_Up167
;FISHER_GUI_driver.c,1191 :: 		exec_radio_button->OnUpPtr();
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R2, [R4, #0]
BLX	R2
L_FISHER_GUI_driver_Process_TP_Up167:
;FISHER_GUI_driver.c,1192 :: 		if (PressedObject == (void *)exec_radio_button)
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Up168
;FISHER_GUI_driver.c,1193 :: 		if (exec_radio_button->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_driver_Process_TP_Up169
;FISHER_GUI_driver.c,1194 :: 		exec_radio_button->OnClickPtr();
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R2, [R4, #0]
BLX	R2
L_FISHER_GUI_driver_Process_TP_Up169:
L_FISHER_GUI_driver_Process_TP_Up168:
;FISHER_GUI_driver.c,1195 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1196 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;FISHER_GUI_driver.c,1197 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;FISHER_GUI_driver.c,1198 :: 		}
L_FISHER_GUI_driver_Process_TP_Up166:
;FISHER_GUI_driver.c,1199 :: 		}
L_FISHER_GUI_driver_Process_TP_Up165:
;FISHER_GUI_driver.c,1201 :: 		}
L_FISHER_GUI_driver_Process_TP_Up149:
;FISHER_GUI_driver.c,1202 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1203 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;FISHER_GUI_driver.c,1204 :: 		}
L_end_Process_TP_Up:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of FISHER_GUI_driver_Process_TP_Up
FISHER_GUI_driver_Process_TP_Down:
;FISHER_GUI_driver.c,1206 :: 		static void Process_TP_Down(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;FISHER_GUI_driver.c,1208 :: 		object_pressed      = 0;
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
MOVS	R3, #0
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;FISHER_GUI_driver.c,1209 :: 		exec_round_button   = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1210 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1211 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1212 :: 		exec_radio_button     = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1214 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;FISHER_GUI_driver.c,1216 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_FISHER_GUI_driver_Process_TP_Down170
;FISHER_GUI_driver.c,1217 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Down171
;FISHER_GUI_driver.c,1218 :: 		if (exec_round_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Down172
;FISHER_GUI_driver.c,1219 :: 		if (exec_round_button->PressColEnabled == 1) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #47
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Down173
;FISHER_GUI_driver.c,1220 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;FISHER_GUI_driver.c,1221 :: 		DrawRoundButton(exec_round_button);
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawRoundButton+0
;FISHER_GUI_driver.c,1222 :: 		}
L_FISHER_GUI_driver_Process_TP_Down173:
;FISHER_GUI_driver.c,1223 :: 		PressedObject = (void *)exec_round_button;
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1224 :: 		PressedObjectType = 1;
MOVS	R3, #1
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;FISHER_GUI_driver.c,1225 :: 		if (exec_round_button->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_driver_Process_TP_Down174
;FISHER_GUI_driver.c,1226 :: 		exec_round_button->OnDownPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R2, [R4, #0]
BLX	R2
;FISHER_GUI_driver.c,1227 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;FISHER_GUI_driver.c,1228 :: 		}
L_FISHER_GUI_driver_Process_TP_Down174:
;FISHER_GUI_driver.c,1229 :: 		}
L_FISHER_GUI_driver_Process_TP_Down172:
;FISHER_GUI_driver.c,1230 :: 		}
L_FISHER_GUI_driver_Process_TP_Down171:
;FISHER_GUI_driver.c,1232 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Down175
;FISHER_GUI_driver.c,1233 :: 		if (exec_label->Active == 1) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Down176
;FISHER_GUI_driver.c,1234 :: 		PressedObject = (void *)exec_label;
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1235 :: 		PressedObjectType = 2;
MOVS	R3, #2
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;FISHER_GUI_driver.c,1236 :: 		if (exec_label->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_driver_Process_TP_Down177
;FISHER_GUI_driver.c,1237 :: 		exec_label->OnDownPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
;FISHER_GUI_driver.c,1238 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;FISHER_GUI_driver.c,1239 :: 		}
L_FISHER_GUI_driver_Process_TP_Down177:
;FISHER_GUI_driver.c,1240 :: 		}
L_FISHER_GUI_driver_Process_TP_Down176:
;FISHER_GUI_driver.c,1241 :: 		}
L_FISHER_GUI_driver_Process_TP_Down175:
;FISHER_GUI_driver.c,1243 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Down178
;FISHER_GUI_driver.c,1244 :: 		if (exec_image->Active == 1) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Down179
;FISHER_GUI_driver.c,1245 :: 		PressedObject = (void *)exec_image;
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1246 :: 		PressedObjectType = 3;
MOVS	R3, #3
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;FISHER_GUI_driver.c,1247 :: 		if (exec_image->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_driver_Process_TP_Down180
;FISHER_GUI_driver.c,1248 :: 		exec_image->OnDownPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R2, [R4, #0]
BLX	R2
;FISHER_GUI_driver.c,1249 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;FISHER_GUI_driver.c,1250 :: 		}
L_FISHER_GUI_driver_Process_TP_Down180:
;FISHER_GUI_driver.c,1251 :: 		}
L_FISHER_GUI_driver_Process_TP_Down179:
;FISHER_GUI_driver.c,1252 :: 		}
L_FISHER_GUI_driver_Process_TP_Down178:
;FISHER_GUI_driver.c,1254 :: 		if (_object_count == radio_button_order) {
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Down181
;FISHER_GUI_driver.c,1255 :: 		if (exec_radio_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Down182
;FISHER_GUI_driver.c,1256 :: 		if (exec_radio_button->PressColEnabled == 1) {
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #48
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_driver_Process_TP_Down183
;FISHER_GUI_driver.c,1257 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;FISHER_GUI_driver.c,1258 :: 		DrawRadioButton(exec_radio_button);
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawRadioButton+0
;FISHER_GUI_driver.c,1259 :: 		}
L_FISHER_GUI_driver_Process_TP_Down183:
;FISHER_GUI_driver.c,1260 :: 		PressedObject = (void *)exec_radio_button;
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;FISHER_GUI_driver.c,1261 :: 		PressedObjectType = 17;
MOVS	R3, #17
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;FISHER_GUI_driver.c,1262 :: 		if (exec_radio_button->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_driver_Process_TP_Down184
;FISHER_GUI_driver.c,1263 :: 		exec_radio_button->OnDownPtr();
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R2, [R4, #0]
BLX	R2
;FISHER_GUI_driver.c,1264 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;FISHER_GUI_driver.c,1265 :: 		}
L_FISHER_GUI_driver_Process_TP_Down184:
;FISHER_GUI_driver.c,1266 :: 		}
L_FISHER_GUI_driver_Process_TP_Down182:
;FISHER_GUI_driver.c,1267 :: 		}
L_FISHER_GUI_driver_Process_TP_Down181:
;FISHER_GUI_driver.c,1269 :: 		}
L_FISHER_GUI_driver_Process_TP_Down170:
;FISHER_GUI_driver.c,1270 :: 		}
L_end_Process_TP_Down:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of FISHER_GUI_driver_Process_TP_Down
_Check_TP:
;FISHER_GUI_driver.c,1272 :: 		void Check_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;FISHER_GUI_driver.c,1273 :: 		if (TP_TFT_Press_Detect()) {
BL	_TP_TFT_Press_Detect+0
CMP	R0, #0
IT	EQ
BEQ	L_Check_TP185
;FISHER_GUI_driver.c,1275 :: 		if (TP_TFT_Get_Coordinates(&Xcoord, &Ycoord) == 0) {
MOVW	R1, #lo_addr(_Ycoord+0)
MOVT	R1, #hi_addr(_Ycoord+0)
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
BL	_TP_TFT_Get_Coordinates+0
CMP	R0, #0
IT	NE
BNE	L_Check_TP186
;FISHER_GUI_driver.c,1276 :: 		Process_TP_Press(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	FISHER_GUI_driver_Process_TP_Press+0
;FISHER_GUI_driver.c,1277 :: 		if (PenDown == 0) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Check_TP187
;FISHER_GUI_driver.c,1278 :: 		PenDown = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,1279 :: 		Process_TP_Down(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	FISHER_GUI_driver_Process_TP_Down+0
;FISHER_GUI_driver.c,1280 :: 		}
L_Check_TP187:
;FISHER_GUI_driver.c,1281 :: 		}
L_Check_TP186:
;FISHER_GUI_driver.c,1282 :: 		}
IT	AL
BAL	L_Check_TP188
L_Check_TP185:
;FISHER_GUI_driver.c,1283 :: 		else if (PenDown == 1) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Check_TP189
;FISHER_GUI_driver.c,1284 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;FISHER_GUI_driver.c,1285 :: 		Process_TP_Up(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	FISHER_GUI_driver_Process_TP_Up+0
;FISHER_GUI_driver.c,1286 :: 		}
L_Check_TP189:
L_Check_TP188:
;FISHER_GUI_driver.c,1287 :: 		}
L_end_Check_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Check_TP
_Init_MCU:
;FISHER_GUI_driver.c,1289 :: 		void Init_MCU() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;FISHER_GUI_driver.c,1290 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_9);
MOVW	R1, #512
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;FISHER_GUI_driver.c,1291 :: 		TFT_BLED = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,1292 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;FISHER_GUI_driver.c,1293 :: 		TP_TFT_Set_Default_Mode();
BL	_TP_TFT_Set_Default_Mode+0
;FISHER_GUI_driver.c,1294 :: 		}
L_end_Init_MCU:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_MCU
_Init_Ext_Mem:
;FISHER_GUI_driver.c,1296 :: 		void Init_Ext_Mem() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;FISHER_GUI_driver.c,1301 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
MOVW	R2, #lo_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
;FISHER_GUI_driver.c,1300 :: 		_SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
MOVW	R1, #772
;FISHER_GUI_driver.c,1298 :: 		SPI3_Init_Advanced(_SPI_FPCLK_DIV64, _SPI_MASTER | _SPI_8_BIT |
MOVS	R0, #5
;FISHER_GUI_driver.c,1301 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
BL	_SPI3_Init_Advanced+0
;FISHER_GUI_driver.c,1302 :: 		Delay_ms(10);
MOVW	R7, #7913
MOVT	R7, #7
NOP
NOP
L_Init_Ext_Mem190:
SUBS	R7, R7, #1
BNE	L_Init_Ext_Mem190
NOP
NOP
;FISHER_GUI_driver.c,1304 :: 		if (!Mmc_Fat_Init()) {
BL	_Mmc_Fat_Init+0
CMP	R0, #0
IT	NE
BNE	L_Init_Ext_Mem192
;FISHER_GUI_driver.c,1305 :: 		SPI3_CR1 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(SPI3_CR1+0)
MOVT	R0, #hi_addr(SPI3_CR1+0)
STR	R1, [R0, #0]
;FISHER_GUI_driver.c,1310 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
MOVW	R2, #lo_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
;FISHER_GUI_driver.c,1309 :: 		_SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
MOVW	R1, #772
;FISHER_GUI_driver.c,1307 :: 		SPI3_Init_Advanced(_SPI_FPCLK_DIV2, _SPI_MASTER | _SPI_8_BIT |
MOVS	R0, #0
;FISHER_GUI_driver.c,1310 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
BL	_SPI3_Init_Advanced+0
;FISHER_GUI_driver.c,1312 :: 		Mmc_Fat_Assign("FISHER_G.RES", 0);
MOVW	R0, #lo_addr(?lstr7_FISHER_GUI_driver+0)
MOVT	R0, #hi_addr(?lstr7_FISHER_GUI_driver+0)
MOVS	R1, #0
BL	_Mmc_Fat_Assign+0
;FISHER_GUI_driver.c,1313 :: 		Mmc_Fat_Reset(&res_file_size);
MOVW	R0, #lo_addr(_res_file_size+0)
MOVT	R0, #hi_addr(_res_file_size+0)
BL	_Mmc_Fat_Reset+0
;FISHER_GUI_driver.c,1314 :: 		}
L_Init_Ext_Mem192:
;FISHER_GUI_driver.c,1315 :: 		}
L_end_Init_Ext_Mem:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_Ext_Mem
_Start_TP:
;FISHER_GUI_driver.c,1317 :: 		void Start_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;FISHER_GUI_driver.c,1318 :: 		Init_MCU();
BL	_Init_MCU+0
;FISHER_GUI_driver.c,1320 :: 		Init_Ext_Mem();
BL	_Init_Ext_Mem+0
;FISHER_GUI_driver.c,1322 :: 		InitializeTouchPanel();
BL	FISHER_GUI_driver_InitializeTouchPanel+0
;FISHER_GUI_driver.c,1324 :: 		Delay_ms(1000);
MOVW	R7, #5033
MOVT	R7, #712
NOP
NOP
L_Start_TP193:
SUBS	R7, R7, #1
BNE	L_Start_TP193
NOP
NOP
;FISHER_GUI_driver.c,1325 :: 		TFT_Fill_Screen(0);
MOVS	R0, #0
BL	_TFT_Fill_Screen+0
;FISHER_GUI_driver.c,1326 :: 		Calibrate();
BL	_Calibrate+0
;FISHER_GUI_driver.c,1327 :: 		TFT_Fill_Screen(0);
MOVS	R0, #0
BL	_TFT_Fill_Screen+0
;FISHER_GUI_driver.c,1329 :: 		InitializeObjects();
BL	FISHER_GUI_driver_InitializeObjects+0
;FISHER_GUI_driver.c,1330 :: 		display_width = MainScreen1.Width;
MOVW	R0, #lo_addr(_MainScreen1+2)
MOVT	R0, #hi_addr(_MainScreen1+2)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_width+0)
MOVT	R0, #hi_addr(_display_width+0)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,1331 :: 		display_height = MainScreen1.Height;
MOVW	R0, #lo_addr(_MainScreen1+4)
MOVT	R0, #hi_addr(_MainScreen1+4)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_height+0)
MOVT	R0, #hi_addr(_display_height+0)
STRH	R1, [R0, #0]
;FISHER_GUI_driver.c,1332 :: 		DrawScreen(&MainScreen1);
MOVW	R0, #lo_addr(_MainScreen1+0)
MOVT	R0, #hi_addr(_MainScreen1+0)
BL	_DrawScreen+0
;FISHER_GUI_driver.c,1333 :: 		}
L_end_Start_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Start_TP
FISHER_GUI_driver____?ag:
SUB	SP, SP, #4
L_end_FISHER_GUI_driver___?ag:
ADD	SP, SP, #4
BX	LR
; end of FISHER_GUI_driver____?ag
