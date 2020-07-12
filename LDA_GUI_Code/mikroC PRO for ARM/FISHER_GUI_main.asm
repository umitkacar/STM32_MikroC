_Init_ADC:
;hepsi.h,85 :: 		void Init_ADC() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;hepsi.h,86 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_8 | _ADC_CHANNEL_9);
MOVW	R0, #768
BL	_ADC_Set_Input_Channel+0
;hepsi.h,87 :: 		ADC1_Init();
BL	_ADC1_Init+0
;hepsi.h,88 :: 		Delay_ms(100);
MOVW	R7, #29438
MOVT	R7, #85
NOP
NOP
L_Init_ADC0:
SUBS	R7, R7, #1
BNE	L_Init_ADC0
NOP
NOP
NOP
;hepsi.h,89 :: 		}
L_end_Init_ADC:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_ADC
_TFT_Get_Data:
;hepsi.h,91 :: 		char* TFT_Get_Data(unsigned long offset, unsigned long count, unsigned long *num) {
; offset start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
;hepsi.h,95 :: 		start_sector = Mmc_Get_File_Write_Sector() + offset/512;
STR	R2, [SP, #16]
MOV	R2, R0
STR	R1, [SP, #12]
; offset end address is: 0 (R0)
; offset start address is: 8 (R2)
BL	_Mmc_Get_File_Write_Sector+0
LSRS	R3, R2, #9
ADDS	R4, R0, R3
STR	R4, [SP, #4]
;hepsi.h,96 :: 		pos = (unsigned long)offset%512;
MOVW	R3, #511
AND	R3, R2, R3, LSL #0
; offset end address is: 8 (R2)
STRH	R3, [SP, #8]
;hepsi.h,98 :: 		if(start_sector == currentSector+1) {
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
LDR	R3, [R3, #0]
ADDS	R3, R3, #1
CMP	R4, R3
IT	NE
BNE	L_TFT_Get_Data2
;hepsi.h,99 :: 		Mmc_Multi_Read_Sector(Ext_Data_Buffer);
MOVW	R0, #lo_addr(_Ext_Data_Buffer+0)
MOVT	R0, #hi_addr(_Ext_Data_Buffer+0)
BL	_Mmc_Multi_Read_Sector+0
;hepsi.h,100 :: 		currentSector = start_sector;
LDR	R4, [SP, #4]
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
STR	R4, [R3, #0]
;hepsi.h,101 :: 		} else if (start_sector != currentSector) {
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
;hepsi.h,102 :: 		if(currentSector != -1)
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
LDR	R3, [R3, #0]
CMP	R3, #-1
IT	EQ
BEQ	L_TFT_Get_Data5
;hepsi.h,103 :: 		Mmc_Multi_Read_Stop();
BL	_Mmc_Multi_Read_Stop+0
L_TFT_Get_Data5:
;hepsi.h,104 :: 		Mmc_Multi_Read_Start(start_sector);
LDR	R0, [SP, #4]
BL	_Mmc_Multi_Read_Start+0
;hepsi.h,105 :: 		Mmc_Multi_Read_Sector(Ext_Data_Buffer);
MOVW	R0, #lo_addr(_Ext_Data_Buffer+0)
MOVT	R0, #hi_addr(_Ext_Data_Buffer+0)
BL	_Mmc_Multi_Read_Sector+0
;hepsi.h,106 :: 		currentSector = start_sector;
LDR	R4, [SP, #4]
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
STR	R4, [R3, #0]
;hepsi.h,107 :: 		}
L_TFT_Get_Data4:
L_TFT_Get_Data3:
;hepsi.h,109 :: 		if(count>512-pos)
LDRH	R3, [SP, #8]
RSB	R4, R3, #512
UXTH	R4, R4
LDR	R3, [SP, #12]
CMP	R3, R4
IT	LS
BLS	L_TFT_Get_Data6
;hepsi.h,110 :: 		*num = 512-pos;
LDRH	R3, [SP, #8]
RSB	R4, R3, #512
UXTH	R4, R4
LDR	R3, [SP, #16]
STR	R4, [R3, #0]
IT	AL
BAL	L_TFT_Get_Data7
L_TFT_Get_Data6:
;hepsi.h,112 :: 		*num = count;
LDR	R4, [SP, #12]
LDR	R3, [SP, #16]
STR	R4, [R3, #0]
L_TFT_Get_Data7:
;hepsi.h,114 :: 		return Ext_Data_Buffer+pos;
LDRH	R4, [SP, #8]
MOVW	R3, #lo_addr(_Ext_Data_Buffer+0)
MOVT	R3, #hi_addr(_Ext_Data_Buffer+0)
ADDS	R3, R3, R4
MOV	R0, R3
;hepsi.h,115 :: 		}
L_end_TFT_Get_Data:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _TFT_Get_Data
FISHER_GUI_main_InitializeTouchPanel:
;hepsi.h,116 :: 		static void InitializeTouchPanel() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;hepsi.h,117 :: 		Init_ADC();
BL	_Init_ADC+0
;hepsi.h,118 :: 		TFT_Init(240, 320);
MOVW	R1, #320
MOVS	R0, #240
BL	_TFT_Init+0
;hepsi.h,119 :: 		TFT_Set_Ext_Buffer(TFT_Get_Data);
MOVW	R0, #lo_addr(_TFT_Get_Data+0)
MOVT	R0, #hi_addr(_TFT_Get_Data+0)
BL	_TFT_Set_Ext_Buffer+0
;hepsi.h,121 :: 		TP_TFT_Init(240, 320, 8, 9);                                  // Initialize touch panel
MOVS	R3, #9
MOVS	R2, #8
MOVW	R1, #320
MOVS	R0, #240
BL	_TP_TFT_Init+0
;hepsi.h,122 :: 		TP_TFT_Set_ADC_Threshold(ADC_THRESHOLD);                              // Set touch panel ADC threshold
MOVW	R0, #1500
SXTH	R0, R0
BL	_TP_TFT_Set_ADC_Threshold+0
;hepsi.h,124 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;hepsi.h,125 :: 		PressedObject = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PressedObject+0)
MOVT	R0, #hi_addr(_PressedObject+0)
STR	R1, [R0, #0]
;hepsi.h,126 :: 		PressedObjectType = -1;
MOVW	R1, #65535
SXTH	R1, R1
MOVW	R0, #lo_addr(_PressedObjectType+0)
MOVT	R0, #hi_addr(_PressedObjectType+0)
STRH	R1, [R0, #0]
;hepsi.h,127 :: 		}
L_end_InitializeTouchPanel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of FISHER_GUI_main_InitializeTouchPanel
_Calibrate:
;hepsi.h,129 :: 		void Calibrate() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;hepsi.h,130 :: 		TFT_Set_Pen(CL_WHITE, 3);
MOVS	R1, #3
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;hepsi.h,131 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;hepsi.h,132 :: 		TFT_Write_Text("Touch selected corners for calibration", 1, 150);
MOVW	R0, #lo_addr(?lstr1_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr1_FISHER_GUI_main+0)
MOVS	R2, #150
MOVS	R1, #1
BL	_TFT_Write_Text+0
;hepsi.h,133 :: 		TFT_Line(0, 319, 5, 319);
MOVW	R3, #319
SXTH	R3, R3
MOVS	R2, #5
SXTH	R2, R2
MOVW	R1, #319
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;hepsi.h,134 :: 		TFT_Line(0, 319, 0, 314);
MOVW	R3, #314
SXTH	R3, R3
MOVS	R2, #0
SXTH	R2, R2
MOVW	R1, #319
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;hepsi.h,135 :: 		TFT_Line(0, 319, 10, 309);
MOVW	R3, #309
SXTH	R3, R3
MOVS	R2, #10
SXTH	R2, R2
MOVW	R1, #319
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;hepsi.h,136 :: 		TFT_Write_Text("first here", 20, 290);
MOVW	R0, #lo_addr(?lstr2_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr2_FISHER_GUI_main+0)
MOVW	R2, #290
MOVS	R1, #20
BL	_TFT_Write_Text+0
;hepsi.h,138 :: 		TP_TFT_Calibrate_Min();                      // Calibration of bottom left corner
BL	_TP_TFT_Calibrate_Min+0
;hepsi.h,139 :: 		Delay_ms(500);
MOVW	R7, #16126
MOVT	R7, #427
NOP
NOP
L_Calibrate8:
SUBS	R7, R7, #1
BNE	L_Calibrate8
NOP
NOP
NOP
;hepsi.h,141 :: 		TFT_Set_Pen(CL_BLACK, 3);
MOVS	R1, #3
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;hepsi.h,142 :: 		TFT_Set_Font(TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #0
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;hepsi.h,143 :: 		TFT_Line(0, 319, 5, 319);
MOVW	R3, #319
SXTH	R3, R3
MOVS	R2, #5
SXTH	R2, R2
MOVW	R1, #319
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;hepsi.h,144 :: 		TFT_Line(0, 319, 0, 314);
MOVW	R3, #314
SXTH	R3, R3
MOVS	R2, #0
SXTH	R2, R2
MOVW	R1, #319
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;hepsi.h,145 :: 		TFT_Line(0, 319, 10, 309);
MOVW	R3, #309
SXTH	R3, R3
MOVS	R2, #10
SXTH	R2, R2
MOVW	R1, #319
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;hepsi.h,146 :: 		TFT_Write_Text("first here", 20, 290);
MOVW	R0, #lo_addr(?lstr3_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr3_FISHER_GUI_main+0)
MOVW	R2, #290
MOVS	R1, #20
BL	_TFT_Write_Text+0
;hepsi.h,148 :: 		TFT_Set_Pen(CL_WHITE, 3);
MOVS	R1, #3
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;hepsi.h,149 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;hepsi.h,150 :: 		TFT_Write_Text("now here ", 180, 15);
MOVW	R0, #lo_addr(?lstr4_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr4_FISHER_GUI_main+0)
MOVS	R2, #15
MOVS	R1, #180
BL	_TFT_Write_Text+0
;hepsi.h,151 :: 		TFT_Line(239, 0, 234, 0);
MOVS	R3, #0
SXTH	R3, R3
MOVS	R2, #234
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #239
SXTH	R0, R0
BL	_TFT_Line+0
;hepsi.h,152 :: 		TFT_Line(239, 0, 239, 5);
MOVS	R3, #5
SXTH	R3, R3
MOVS	R2, #239
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #239
SXTH	R0, R0
BL	_TFT_Line+0
;hepsi.h,153 :: 		TFT_Line(239, 0, 229, 10);
MOVS	R3, #10
SXTH	R3, R3
MOVS	R2, #229
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #239
SXTH	R0, R0
BL	_TFT_Line+0
;hepsi.h,155 :: 		TP_TFT_Calibrate_Max();                      // Calibration of bottom left corner
BL	_TP_TFT_Calibrate_Max+0
;hepsi.h,156 :: 		Delay_ms(500);
MOVW	R7, #16126
MOVT	R7, #427
NOP
NOP
L_Calibrate10:
SUBS	R7, R7, #1
BNE	L_Calibrate10
NOP
NOP
NOP
;hepsi.h,157 :: 		}
L_end_Calibrate:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Calibrate
FISHER_GUI_main_InitializeObjects:
;hepsi.h,259 :: 		static void InitializeObjects() {
SUB	SP, SP, #4
;hepsi.h,260 :: 		MainScreen1.Color                     = 0xFFF0;
MOVW	R1, #65520
MOVW	R0, #lo_addr(_MainScreen1+0)
MOVT	R0, #hi_addr(_MainScreen1+0)
STRH	R1, [R0, #0]
;hepsi.h,261 :: 		MainScreen1.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_MainScreen1+2)
MOVT	R0, #hi_addr(_MainScreen1+2)
STRH	R1, [R0, #0]
;hepsi.h,262 :: 		MainScreen1.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_MainScreen1+4)
MOVT	R0, #hi_addr(_MainScreen1+4)
STRH	R1, [R0, #0]
;hepsi.h,263 :: 		MainScreen1.Buttons_RoundCount        = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_MainScreen1+8)
MOVT	R0, #hi_addr(_MainScreen1+8)
STRH	R1, [R0, #0]
;hepsi.h,264 :: 		MainScreen1.Buttons_Round             = Screen1_Buttons_Round;
MOVW	R1, #lo_addr(_Screen1_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen1_Buttons_Round+0)
MOVW	R0, #lo_addr(_MainScreen1+12)
MOVT	R0, #hi_addr(_MainScreen1+12)
STR	R1, [R0, #0]
;hepsi.h,265 :: 		MainScreen1.LabelsCount               = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_MainScreen1+16)
MOVT	R0, #hi_addr(_MainScreen1+16)
STRH	R1, [R0, #0]
;hepsi.h,266 :: 		MainScreen1.Labels                    = Screen1_Labels;
MOVW	R1, #lo_addr(_Screen1_Labels+0)
MOVT	R1, #hi_addr(_Screen1_Labels+0)
MOVW	R0, #lo_addr(_MainScreen1+20)
MOVT	R0, #hi_addr(_MainScreen1+20)
STR	R1, [R0, #0]
;hepsi.h,267 :: 		MainScreen1.ImagesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_MainScreen1+24)
MOVT	R0, #hi_addr(_MainScreen1+24)
STRH	R1, [R0, #0]
;hepsi.h,268 :: 		MainScreen1.RadioButtonsCount           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_MainScreen1+32)
MOVT	R0, #hi_addr(_MainScreen1+32)
STRH	R1, [R0, #0]
;hepsi.h,269 :: 		MainScreen1.RadioButtons                = Screen1_RadioButtons;
MOVW	R1, #lo_addr(_Screen1_RadioButtons+0)
MOVT	R1, #hi_addr(_Screen1_RadioButtons+0)
MOVW	R0, #lo_addr(_MainScreen1+36)
MOVT	R0, #hi_addr(_MainScreen1+36)
STR	R1, [R0, #0]
;hepsi.h,270 :: 		MainScreen1.ProgressBarsCount           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_MainScreen1+40)
MOVT	R0, #hi_addr(_MainScreen1+40)
STRH	R1, [R0, #0]
;hepsi.h,271 :: 		MainScreen1.ProgressBars                = Screen1_ProgressBars;
MOVW	R1, #lo_addr(_Screen1_ProgressBars+0)
MOVT	R1, #hi_addr(_Screen1_ProgressBars+0)
MOVW	R0, #lo_addr(_MainScreen1+44)
MOVT	R0, #hi_addr(_MainScreen1+44)
STR	R1, [R0, #0]
;hepsi.h,272 :: 		MainScreen1.ObjectsCount              = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_MainScreen1+6)
MOVT	R0, #hi_addr(_MainScreen1+6)
STRB	R1, [R0, #0]
;hepsi.h,274 :: 		DatabaseScreen2.Color                     = 0x07FF;
MOVW	R1, #2047
MOVW	R0, #lo_addr(_DatabaseScreen2+0)
MOVT	R0, #hi_addr(_DatabaseScreen2+0)
STRH	R1, [R0, #0]
;hepsi.h,275 :: 		DatabaseScreen2.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_DatabaseScreen2+2)
MOVT	R0, #hi_addr(_DatabaseScreen2+2)
STRH	R1, [R0, #0]
;hepsi.h,276 :: 		DatabaseScreen2.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_DatabaseScreen2+4)
MOVT	R0, #hi_addr(_DatabaseScreen2+4)
STRH	R1, [R0, #0]
;hepsi.h,277 :: 		DatabaseScreen2.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DatabaseScreen2+8)
MOVT	R0, #hi_addr(_DatabaseScreen2+8)
STRH	R1, [R0, #0]
;hepsi.h,278 :: 		DatabaseScreen2.LabelsCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DatabaseScreen2+16)
MOVT	R0, #hi_addr(_DatabaseScreen2+16)
STRH	R1, [R0, #0]
;hepsi.h,279 :: 		DatabaseScreen2.Labels                    = Screen2_Labels;
MOVW	R1, #lo_addr(_Screen2_Labels+0)
MOVT	R1, #hi_addr(_Screen2_Labels+0)
MOVW	R0, #lo_addr(_DatabaseScreen2+20)
MOVT	R0, #hi_addr(_DatabaseScreen2+20)
STR	R1, [R0, #0]
;hepsi.h,280 :: 		DatabaseScreen2.ImagesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DatabaseScreen2+24)
MOVT	R0, #hi_addr(_DatabaseScreen2+24)
STRH	R1, [R0, #0]
;hepsi.h,281 :: 		DatabaseScreen2.RadioButtonsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DatabaseScreen2+32)
MOVT	R0, #hi_addr(_DatabaseScreen2+32)
STRH	R1, [R0, #0]
;hepsi.h,282 :: 		DatabaseScreen2.ProgressBarsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DatabaseScreen2+40)
MOVT	R0, #hi_addr(_DatabaseScreen2+40)
STRH	R1, [R0, #0]
;hepsi.h,283 :: 		DatabaseScreen2.ObjectsCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DatabaseScreen2+6)
MOVT	R0, #hi_addr(_DatabaseScreen2+6)
STRB	R1, [R0, #0]
;hepsi.h,285 :: 		TrainingScreen3.Color                     = 0x07F0;
MOVW	R1, #2032
MOVW	R0, #lo_addr(_TrainingScreen3+0)
MOVT	R0, #hi_addr(_TrainingScreen3+0)
STRH	R1, [R0, #0]
;hepsi.h,286 :: 		TrainingScreen3.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_TrainingScreen3+2)
MOVT	R0, #hi_addr(_TrainingScreen3+2)
STRH	R1, [R0, #0]
;hepsi.h,287 :: 		TrainingScreen3.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_TrainingScreen3+4)
MOVT	R0, #hi_addr(_TrainingScreen3+4)
STRH	R1, [R0, #0]
;hepsi.h,288 :: 		TrainingScreen3.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TrainingScreen3+8)
MOVT	R0, #hi_addr(_TrainingScreen3+8)
STRH	R1, [R0, #0]
;hepsi.h,289 :: 		TrainingScreen3.LabelsCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_TrainingScreen3+16)
MOVT	R0, #hi_addr(_TrainingScreen3+16)
STRH	R1, [R0, #0]
;hepsi.h,290 :: 		TrainingScreen3.Labels                    = Screen3_Labels;
MOVW	R1, #lo_addr(_Screen3_Labels+0)
MOVT	R1, #hi_addr(_Screen3_Labels+0)
MOVW	R0, #lo_addr(_TrainingScreen3+20)
MOVT	R0, #hi_addr(_TrainingScreen3+20)
STR	R1, [R0, #0]
;hepsi.h,291 :: 		TrainingScreen3.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_TrainingScreen3+24)
MOVT	R0, #hi_addr(_TrainingScreen3+24)
STRH	R1, [R0, #0]
;hepsi.h,292 :: 		TrainingScreen3.Images                    = Screen3_Images;
MOVW	R1, #lo_addr(_Screen3_Images+0)
MOVT	R1, #hi_addr(_Screen3_Images+0)
MOVW	R0, #lo_addr(_TrainingScreen3+28)
MOVT	R0, #hi_addr(_TrainingScreen3+28)
STR	R1, [R0, #0]
;hepsi.h,293 :: 		TrainingScreen3.RadioButtonsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TrainingScreen3+32)
MOVT	R0, #hi_addr(_TrainingScreen3+32)
STRH	R1, [R0, #0]
;hepsi.h,294 :: 		TrainingScreen3.ProgressBarsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TrainingScreen3+40)
MOVT	R0, #hi_addr(_TrainingScreen3+40)
STRH	R1, [R0, #0]
;hepsi.h,295 :: 		TrainingScreen3.ObjectsCount              = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_TrainingScreen3+6)
MOVT	R0, #hi_addr(_TrainingScreen3+6)
STRB	R1, [R0, #0]
;hepsi.h,297 :: 		TestScreen4.Color                     = 0x8140;
MOVW	R1, #33088
MOVW	R0, #lo_addr(_TestScreen4+0)
MOVT	R0, #hi_addr(_TestScreen4+0)
STRH	R1, [R0, #0]
;hepsi.h,298 :: 		TestScreen4.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_TestScreen4+2)
MOVT	R0, #hi_addr(_TestScreen4+2)
STRH	R1, [R0, #0]
;hepsi.h,299 :: 		TestScreen4.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_TestScreen4+4)
MOVT	R0, #hi_addr(_TestScreen4+4)
STRH	R1, [R0, #0]
;hepsi.h,300 :: 		TestScreen4.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TestScreen4+8)
MOVT	R0, #hi_addr(_TestScreen4+8)
STRH	R1, [R0, #0]
;hepsi.h,301 :: 		TestScreen4.LabelsCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_TestScreen4+16)
MOVT	R0, #hi_addr(_TestScreen4+16)
STRH	R1, [R0, #0]
;hepsi.h,302 :: 		TestScreen4.Labels                    = Screen4_Labels;
MOVW	R1, #lo_addr(_Screen4_Labels+0)
MOVT	R1, #hi_addr(_Screen4_Labels+0)
MOVW	R0, #lo_addr(_TestScreen4+20)
MOVT	R0, #hi_addr(_TestScreen4+20)
STR	R1, [R0, #0]
;hepsi.h,303 :: 		TestScreen4.ImagesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TestScreen4+24)
MOVT	R0, #hi_addr(_TestScreen4+24)
STRH	R1, [R0, #0]
;hepsi.h,304 :: 		TestScreen4.RadioButtonsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TestScreen4+32)
MOVT	R0, #hi_addr(_TestScreen4+32)
STRH	R1, [R0, #0]
;hepsi.h,305 :: 		TestScreen4.ProgressBarsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TestScreen4+40)
MOVT	R0, #hi_addr(_TestScreen4+40)
STRH	R1, [R0, #0]
;hepsi.h,306 :: 		TestScreen4.ObjectsCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_TestScreen4+6)
MOVT	R0, #hi_addr(_TestScreen4+6)
STRB	R1, [R0, #0]
;hepsi.h,309 :: 		Label1.OwnerScreen     = &MainScreen1;
MOVW	R1, #lo_addr(_MainScreen1+0)
MOVT	R1, #hi_addr(_MainScreen1+0)
MOVW	R0, #lo_addr(_Label1+0)
MOVT	R0, #hi_addr(_Label1+0)
STR	R1, [R0, #0]
;hepsi.h,310 :: 		Label1.Order          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+4)
MOVT	R0, #hi_addr(_Label1+4)
STRB	R1, [R0, #0]
;hepsi.h,311 :: 		Label1.Left           = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label1+6)
MOVT	R0, #hi_addr(_Label1+6)
STRH	R1, [R0, #0]
;hepsi.h,312 :: 		Label1.Top            = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Label1+8)
MOVT	R0, #hi_addr(_Label1+8)
STRH	R1, [R0, #0]
;hepsi.h,313 :: 		Label1.Width          = 168;
MOVS	R1, #168
MOVW	R0, #lo_addr(_Label1+10)
MOVT	R0, #hi_addr(_Label1+10)
STRH	R1, [R0, #0]
;hepsi.h,314 :: 		Label1.Height         = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label1+12)
MOVT	R0, #hi_addr(_Label1+12)
STRH	R1, [R0, #0]
;hepsi.h,315 :: 		Label1.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+26)
MOVT	R0, #hi_addr(_Label1+26)
STRB	R1, [R0, #0]
;hepsi.h,316 :: 		Label1.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+27)
MOVT	R0, #hi_addr(_Label1+27)
STRB	R1, [R0, #0]
;hepsi.h,317 :: 		Label1.Caption        = Label1_Caption;
MOVW	R1, #lo_addr(_Label1_Caption+0)
MOVT	R1, #hi_addr(_Label1_Caption+0)
MOVW	R0, #lo_addr(_Label1+16)
MOVT	R0, #hi_addr(_Label1+16)
STR	R1, [R0, #0]
;hepsi.h,318 :: 		Label1.FontName       = Arial13x16_Italic;
MOVW	R1, #2559
MOVT	R1, #0
MOVW	R0, #lo_addr(_Label1+20)
MOVT	R0, #hi_addr(_Label1+20)
STR	R1, [R0, #0]
;hepsi.h,319 :: 		Label1.Font_Color     = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label1+24)
MOVT	R0, #hi_addr(_Label1+24)
STRH	R1, [R0, #0]
;hepsi.h,320 :: 		Label1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+28)
MOVT	R0, #hi_addr(_Label1+28)
STR	R1, [R0, #0]
;hepsi.h,321 :: 		Label1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+32)
MOVT	R0, #hi_addr(_Label1+32)
STR	R1, [R0, #0]
;hepsi.h,322 :: 		Label1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+36)
MOVT	R0, #hi_addr(_Label1+36)
STR	R1, [R0, #0]
;hepsi.h,323 :: 		Label1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+40)
MOVT	R0, #hi_addr(_Label1+40)
STR	R1, [R0, #0]
;hepsi.h,325 :: 		Test_ButtonRound1.OwnerScreen     = &MainScreen1;
MOVW	R1, #lo_addr(_MainScreen1+0)
MOVT	R1, #hi_addr(_MainScreen1+0)
MOVW	R0, #lo_addr(_Test_ButtonRound1+0)
MOVT	R0, #hi_addr(_Test_ButtonRound1+0)
STR	R1, [R0, #0]
;hepsi.h,326 :: 		Test_ButtonRound1.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Test_ButtonRound1+4)
MOVT	R0, #hi_addr(_Test_ButtonRound1+4)
STRB	R1, [R0, #0]
;hepsi.h,327 :: 		Test_ButtonRound1.Left            = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Test_ButtonRound1+6)
MOVT	R0, #hi_addr(_Test_ButtonRound1+6)
STRH	R1, [R0, #0]
;hepsi.h,328 :: 		Test_ButtonRound1.Top             = 210;
MOVS	R1, #210
MOVW	R0, #lo_addr(_Test_ButtonRound1+8)
MOVT	R0, #hi_addr(_Test_ButtonRound1+8)
STRH	R1, [R0, #0]
;hepsi.h,329 :: 		Test_ButtonRound1.Width           = 77;
MOVS	R1, #77
MOVW	R0, #lo_addr(_Test_ButtonRound1+10)
MOVT	R0, #hi_addr(_Test_ButtonRound1+10)
STRH	R1, [R0, #0]
;hepsi.h,330 :: 		Test_ButtonRound1.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Test_ButtonRound1+12)
MOVT	R0, #hi_addr(_Test_ButtonRound1+12)
STRH	R1, [R0, #0]
;hepsi.h,331 :: 		Test_ButtonRound1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Test_ButtonRound1+14)
MOVT	R0, #hi_addr(_Test_ButtonRound1+14)
STRB	R1, [R0, #0]
;hepsi.h,332 :: 		Test_ButtonRound1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Test_ButtonRound1+16)
MOVT	R0, #hi_addr(_Test_ButtonRound1+16)
STRH	R1, [R0, #0]
;hepsi.h,333 :: 		Test_ButtonRound1.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Test_ButtonRound1+18)
MOVT	R0, #hi_addr(_Test_ButtonRound1+18)
STRB	R1, [R0, #0]
;hepsi.h,334 :: 		Test_ButtonRound1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Test_ButtonRound1+19)
MOVT	R0, #hi_addr(_Test_ButtonRound1+19)
STRB	R1, [R0, #0]
;hepsi.h,335 :: 		Test_ButtonRound1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Test_ButtonRound1+20)
MOVT	R0, #hi_addr(_Test_ButtonRound1+20)
STRB	R1, [R0, #0]
;hepsi.h,336 :: 		Test_ButtonRound1.Caption         = Test_ButtonRound1_Caption;
MOVW	R1, #lo_addr(_Test_ButtonRound1_Caption+0)
MOVT	R1, #hi_addr(_Test_ButtonRound1_Caption+0)
MOVW	R0, #lo_addr(_Test_ButtonRound1+24)
MOVT	R0, #hi_addr(_Test_ButtonRound1+24)
STR	R1, [R0, #0]
;hepsi.h,337 :: 		Test_ButtonRound1.TextAlign             = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Test_ButtonRound1+28)
MOVT	R0, #hi_addr(_Test_ButtonRound1+28)
STRB	R1, [R0, #0]
;hepsi.h,338 :: 		Test_ButtonRound1.FontName        = Tahoma11x13_Regular;
MOVW	R1, #7391
MOVT	R1, #0
MOVW	R0, #lo_addr(_Test_ButtonRound1+32)
MOVT	R0, #hi_addr(_Test_ButtonRound1+32)
STR	R1, [R0, #0]
;hepsi.h,339 :: 		Test_ButtonRound1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Test_ButtonRound1+47)
MOVT	R0, #hi_addr(_Test_ButtonRound1+47)
STRB	R1, [R0, #0]
;hepsi.h,340 :: 		Test_ButtonRound1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Test_ButtonRound1+36)
MOVT	R0, #hi_addr(_Test_ButtonRound1+36)
STRH	R1, [R0, #0]
;hepsi.h,341 :: 		Test_ButtonRound1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Test_ButtonRound1+38)
MOVT	R0, #hi_addr(_Test_ButtonRound1+38)
STRB	R1, [R0, #0]
;hepsi.h,342 :: 		Test_ButtonRound1.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Test_ButtonRound1+39)
MOVT	R0, #hi_addr(_Test_ButtonRound1+39)
STRB	R1, [R0, #0]
;hepsi.h,343 :: 		Test_ButtonRound1.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Test_ButtonRound1+40)
MOVT	R0, #hi_addr(_Test_ButtonRound1+40)
STRH	R1, [R0, #0]
;hepsi.h,344 :: 		Test_ButtonRound1.Gradient_End_Color      = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Test_ButtonRound1+42)
MOVT	R0, #hi_addr(_Test_ButtonRound1+42)
STRH	R1, [R0, #0]
;hepsi.h,345 :: 		Test_ButtonRound1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Test_ButtonRound1+44)
MOVT	R0, #hi_addr(_Test_ButtonRound1+44)
STRH	R1, [R0, #0]
;hepsi.h,346 :: 		Test_ButtonRound1.Press_Color     = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_Test_ButtonRound1+48)
MOVT	R0, #hi_addr(_Test_ButtonRound1+48)
STRH	R1, [R0, #0]
;hepsi.h,347 :: 		Test_ButtonRound1.Corner_Radius      = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Test_ButtonRound1+46)
MOVT	R0, #hi_addr(_Test_ButtonRound1+46)
STRB	R1, [R0, #0]
;hepsi.h,348 :: 		Test_ButtonRound1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Test_ButtonRound1+52)
MOVT	R0, #hi_addr(_Test_ButtonRound1+52)
STR	R1, [R0, #0]
;hepsi.h,349 :: 		Test_ButtonRound1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Test_ButtonRound1+56)
MOVT	R0, #hi_addr(_Test_ButtonRound1+56)
STR	R1, [R0, #0]
;hepsi.h,350 :: 		Test_ButtonRound1.OnClickPtr      = Test;
MOVW	R1, #lo_addr(_Test+0)
MOVT	R1, #hi_addr(_Test+0)
MOVW	R0, #lo_addr(_Test_ButtonRound1+60)
MOVT	R0, #hi_addr(_Test_ButtonRound1+60)
STR	R1, [R0, #0]
;hepsi.h,351 :: 		Test_ButtonRound1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Test_ButtonRound1+64)
MOVT	R0, #hi_addr(_Test_ButtonRound1+64)
STR	R1, [R0, #0]
;hepsi.h,353 :: 		Training_ButtonRound1.OwnerScreen     = &MainScreen1;
MOVW	R1, #lo_addr(_MainScreen1+0)
MOVT	R1, #hi_addr(_MainScreen1+0)
MOVW	R0, #lo_addr(_Training_ButtonRound1+0)
MOVT	R0, #hi_addr(_Training_ButtonRound1+0)
STR	R1, [R0, #0]
;hepsi.h,354 :: 		Training_ButtonRound1.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Training_ButtonRound1+4)
MOVT	R0, #hi_addr(_Training_ButtonRound1+4)
STRB	R1, [R0, #0]
;hepsi.h,355 :: 		Training_ButtonRound1.Left            = 30;
MOVS	R1, #30
MOVW	R0, #lo_addr(_Training_ButtonRound1+6)
MOVT	R0, #hi_addr(_Training_ButtonRound1+6)
STRH	R1, [R0, #0]
;hepsi.h,356 :: 		Training_ButtonRound1.Top             = 145;
MOVS	R1, #145
MOVW	R0, #lo_addr(_Training_ButtonRound1+8)
MOVT	R0, #hi_addr(_Training_ButtonRound1+8)
STRH	R1, [R0, #0]
;hepsi.h,357 :: 		Training_ButtonRound1.Width           = 75;
MOVS	R1, #75
MOVW	R0, #lo_addr(_Training_ButtonRound1+10)
MOVT	R0, #hi_addr(_Training_ButtonRound1+10)
STRH	R1, [R0, #0]
;hepsi.h,358 :: 		Training_ButtonRound1.Height          = 34;
MOVS	R1, #34
MOVW	R0, #lo_addr(_Training_ButtonRound1+12)
MOVT	R0, #hi_addr(_Training_ButtonRound1+12)
STRH	R1, [R0, #0]
;hepsi.h,359 :: 		Training_ButtonRound1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Training_ButtonRound1+14)
MOVT	R0, #hi_addr(_Training_ButtonRound1+14)
STRB	R1, [R0, #0]
;hepsi.h,360 :: 		Training_ButtonRound1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Training_ButtonRound1+16)
MOVT	R0, #hi_addr(_Training_ButtonRound1+16)
STRH	R1, [R0, #0]
;hepsi.h,361 :: 		Training_ButtonRound1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Training_ButtonRound1+18)
MOVT	R0, #hi_addr(_Training_ButtonRound1+18)
STRB	R1, [R0, #0]
;hepsi.h,362 :: 		Training_ButtonRound1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Training_ButtonRound1+19)
MOVT	R0, #hi_addr(_Training_ButtonRound1+19)
STRB	R1, [R0, #0]
;hepsi.h,363 :: 		Training_ButtonRound1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Training_ButtonRound1+20)
MOVT	R0, #hi_addr(_Training_ButtonRound1+20)
STRB	R1, [R0, #0]
;hepsi.h,364 :: 		Training_ButtonRound1.Caption         = Training_ButtonRound1_Caption;
MOVW	R1, #lo_addr(_Training_ButtonRound1_Caption+0)
MOVT	R1, #hi_addr(_Training_ButtonRound1_Caption+0)
MOVW	R0, #lo_addr(_Training_ButtonRound1+24)
MOVT	R0, #hi_addr(_Training_ButtonRound1+24)
STR	R1, [R0, #0]
;hepsi.h,365 :: 		Training_ButtonRound1.TextAlign             = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Training_ButtonRound1+28)
MOVT	R0, #hi_addr(_Training_ButtonRound1+28)
STRB	R1, [R0, #0]
;hepsi.h,366 :: 		Training_ButtonRound1.FontName        = Tahoma11x13_Regular;
MOVW	R1, #7391
MOVT	R1, #0
MOVW	R0, #lo_addr(_Training_ButtonRound1+32)
MOVT	R0, #hi_addr(_Training_ButtonRound1+32)
STR	R1, [R0, #0]
;hepsi.h,367 :: 		Training_ButtonRound1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Training_ButtonRound1+47)
MOVT	R0, #hi_addr(_Training_ButtonRound1+47)
STRB	R1, [R0, #0]
;hepsi.h,368 :: 		Training_ButtonRound1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Training_ButtonRound1+36)
MOVT	R0, #hi_addr(_Training_ButtonRound1+36)
STRH	R1, [R0, #0]
;hepsi.h,369 :: 		Training_ButtonRound1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Training_ButtonRound1+38)
MOVT	R0, #hi_addr(_Training_ButtonRound1+38)
STRB	R1, [R0, #0]
;hepsi.h,370 :: 		Training_ButtonRound1.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Training_ButtonRound1+39)
MOVT	R0, #hi_addr(_Training_ButtonRound1+39)
STRB	R1, [R0, #0]
;hepsi.h,371 :: 		Training_ButtonRound1.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Training_ButtonRound1+40)
MOVT	R0, #hi_addr(_Training_ButtonRound1+40)
STRH	R1, [R0, #0]
;hepsi.h,372 :: 		Training_ButtonRound1.Gradient_End_Color      = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Training_ButtonRound1+42)
MOVT	R0, #hi_addr(_Training_ButtonRound1+42)
STRH	R1, [R0, #0]
;hepsi.h,373 :: 		Training_ButtonRound1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Training_ButtonRound1+44)
MOVT	R0, #hi_addr(_Training_ButtonRound1+44)
STRH	R1, [R0, #0]
;hepsi.h,374 :: 		Training_ButtonRound1.Press_Color     = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_Training_ButtonRound1+48)
MOVT	R0, #hi_addr(_Training_ButtonRound1+48)
STRH	R1, [R0, #0]
;hepsi.h,375 :: 		Training_ButtonRound1.Corner_Radius      = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Training_ButtonRound1+46)
MOVT	R0, #hi_addr(_Training_ButtonRound1+46)
STRB	R1, [R0, #0]
;hepsi.h,376 :: 		Training_ButtonRound1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Training_ButtonRound1+52)
MOVT	R0, #hi_addr(_Training_ButtonRound1+52)
STR	R1, [R0, #0]
;hepsi.h,377 :: 		Training_ButtonRound1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Training_ButtonRound1+56)
MOVT	R0, #hi_addr(_Training_ButtonRound1+56)
STR	R1, [R0, #0]
;hepsi.h,378 :: 		Training_ButtonRound1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Training_ButtonRound1+60)
MOVT	R0, #hi_addr(_Training_ButtonRound1+60)
STR	R1, [R0, #0]
;hepsi.h,379 :: 		Training_ButtonRound1.OnPressPtr      = Training;
MOVW	R1, #lo_addr(_Training+0)
MOVT	R1, #hi_addr(_Training+0)
MOVW	R0, #lo_addr(_Training_ButtonRound1+64)
MOVT	R0, #hi_addr(_Training_ButtonRound1+64)
STR	R1, [R0, #0]
;hepsi.h,381 :: 		Database_Show_ButtonRound1.OwnerScreen     = &MainScreen1;
MOVW	R1, #lo_addr(_MainScreen1+0)
MOVT	R1, #hi_addr(_MainScreen1+0)
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+0)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+0)
STR	R1, [R0, #0]
;hepsi.h,382 :: 		Database_Show_ButtonRound1.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+4)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+4)
STRB	R1, [R0, #0]
;hepsi.h,383 :: 		Database_Show_ButtonRound1.Left            = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+6)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+6)
STRH	R1, [R0, #0]
;hepsi.h,384 :: 		Database_Show_ButtonRound1.Top             = 83;
MOVS	R1, #83
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+8)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+8)
STRH	R1, [R0, #0]
;hepsi.h,385 :: 		Database_Show_ButtonRound1.Width           = 89;
MOVS	R1, #89
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+10)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+10)
STRH	R1, [R0, #0]
;hepsi.h,386 :: 		Database_Show_ButtonRound1.Height          = 35;
MOVS	R1, #35
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+12)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+12)
STRH	R1, [R0, #0]
;hepsi.h,387 :: 		Database_Show_ButtonRound1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+14)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+14)
STRB	R1, [R0, #0]
;hepsi.h,388 :: 		Database_Show_ButtonRound1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+16)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+16)
STRH	R1, [R0, #0]
;hepsi.h,389 :: 		Database_Show_ButtonRound1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+18)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+18)
STRB	R1, [R0, #0]
;hepsi.h,390 :: 		Database_Show_ButtonRound1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+19)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+19)
STRB	R1, [R0, #0]
;hepsi.h,391 :: 		Database_Show_ButtonRound1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+20)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+20)
STRB	R1, [R0, #0]
;hepsi.h,392 :: 		Database_Show_ButtonRound1.Caption         = Database_Show_ButtonRound1_Caption;
MOVW	R1, #lo_addr(_Database_Show_ButtonRound1_Caption+0)
MOVT	R1, #hi_addr(_Database_Show_ButtonRound1_Caption+0)
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+24)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+24)
STR	R1, [R0, #0]
;hepsi.h,393 :: 		Database_Show_ButtonRound1.TextAlign             = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+28)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+28)
STRB	R1, [R0, #0]
;hepsi.h,394 :: 		Database_Show_ButtonRound1.FontName        = Tahoma11x13_Regular;
MOVW	R1, #7391
MOVT	R1, #0
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+32)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+32)
STR	R1, [R0, #0]
;hepsi.h,395 :: 		Database_Show_ButtonRound1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+47)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+47)
STRB	R1, [R0, #0]
;hepsi.h,396 :: 		Database_Show_ButtonRound1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+36)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+36)
STRH	R1, [R0, #0]
;hepsi.h,397 :: 		Database_Show_ButtonRound1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+38)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+38)
STRB	R1, [R0, #0]
;hepsi.h,398 :: 		Database_Show_ButtonRound1.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+39)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+39)
STRB	R1, [R0, #0]
;hepsi.h,399 :: 		Database_Show_ButtonRound1.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+40)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+40)
STRH	R1, [R0, #0]
;hepsi.h,400 :: 		Database_Show_ButtonRound1.Gradient_End_Color      = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+42)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+42)
STRH	R1, [R0, #0]
;hepsi.h,401 :: 		Database_Show_ButtonRound1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+44)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+44)
STRH	R1, [R0, #0]
;hepsi.h,402 :: 		Database_Show_ButtonRound1.Press_Color     = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+48)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+48)
STRH	R1, [R0, #0]
;hepsi.h,403 :: 		Database_Show_ButtonRound1.Corner_Radius      = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+46)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+46)
STRB	R1, [R0, #0]
;hepsi.h,404 :: 		Database_Show_ButtonRound1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+52)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+52)
STR	R1, [R0, #0]
;hepsi.h,405 :: 		Database_Show_ButtonRound1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+56)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+56)
STR	R1, [R0, #0]
;hepsi.h,406 :: 		Database_Show_ButtonRound1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+60)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+60)
STR	R1, [R0, #0]
;hepsi.h,407 :: 		Database_Show_ButtonRound1.OnPressPtr      = Database_Show;
MOVW	R1, #lo_addr(_Database_Show+0)
MOVT	R1, #hi_addr(_Database_Show+0)
MOVW	R0, #lo_addr(_Database_Show_ButtonRound1+64)
MOVT	R0, #hi_addr(_Database_Show_ButtonRound1+64)
STR	R1, [R0, #0]
;hepsi.h,409 :: 		CP_2_RadioButton1.OwnerScreen     = &MainScreen1;
MOVW	R1, #lo_addr(_MainScreen1+0)
MOVT	R1, #hi_addr(_MainScreen1+0)
MOVW	R0, #lo_addr(_CP_2_RadioButton1+0)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+0)
STR	R1, [R0, #0]
;hepsi.h,410 :: 		CP_2_RadioButton1.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_CP_2_RadioButton1+4)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+4)
STRB	R1, [R0, #0]
;hepsi.h,411 :: 		CP_2_RadioButton1.Left            = 160;
MOVS	R1, #160
MOVW	R0, #lo_addr(_CP_2_RadioButton1+6)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+6)
STRH	R1, [R0, #0]
;hepsi.h,412 :: 		CP_2_RadioButton1.Top             = 90;
MOVS	R1, #90
MOVW	R0, #lo_addr(_CP_2_RadioButton1+8)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+8)
STRH	R1, [R0, #0]
;hepsi.h,413 :: 		CP_2_RadioButton1.Width           = 47;
MOVS	R1, #47
MOVW	R0, #lo_addr(_CP_2_RadioButton1+10)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+10)
STRH	R1, [R0, #0]
;hepsi.h,414 :: 		CP_2_RadioButton1.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_CP_2_RadioButton1+12)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+12)
STRH	R1, [R0, #0]
;hepsi.h,415 :: 		CP_2_RadioButton1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_2_RadioButton1+14)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+14)
STRB	R1, [R0, #0]
;hepsi.h,416 :: 		CP_2_RadioButton1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_2_RadioButton1+16)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+16)
STRH	R1, [R0, #0]
;hepsi.h,417 :: 		CP_2_RadioButton1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_2_RadioButton1+18)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+18)
STRB	R1, [R0, #0]
;hepsi.h,418 :: 		CP_2_RadioButton1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_2_RadioButton1+19)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+19)
STRB	R1, [R0, #0]
;hepsi.h,419 :: 		CP_2_RadioButton1.Checked          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_2_RadioButton1+20)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+20)
STRB	R1, [R0, #0]
;hepsi.h,420 :: 		CP_2_RadioButton1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_2_RadioButton1+21)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+21)
STRB	R1, [R0, #0]
;hepsi.h,421 :: 		CP_2_RadioButton1.Caption         = CP_2_RadioButton1_Caption;
MOVW	R1, #lo_addr(_CP_2_RadioButton1_Caption+0)
MOVT	R1, #hi_addr(_CP_2_RadioButton1_Caption+0)
MOVW	R0, #lo_addr(_CP_2_RadioButton1+24)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+24)
STR	R1, [R0, #0]
;hepsi.h,422 :: 		CP_2_RadioButton1.TextAlign            = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_2_RadioButton1+28)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+28)
STRB	R1, [R0, #0]
;hepsi.h,423 :: 		CP_2_RadioButton1.FontName        = Tahoma11x13_Regular;
MOVW	R1, #7391
MOVT	R1, #0
MOVW	R0, #lo_addr(_CP_2_RadioButton1+32)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+32)
STR	R1, [R0, #0]
;hepsi.h,424 :: 		CP_2_RadioButton1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_2_RadioButton1+48)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+48)
STRB	R1, [R0, #0]
;hepsi.h,425 :: 		CP_2_RadioButton1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_2_RadioButton1+36)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+36)
STRH	R1, [R0, #0]
;hepsi.h,426 :: 		CP_2_RadioButton1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_2_RadioButton1+38)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+38)
STRB	R1, [R0, #0]
;hepsi.h,427 :: 		CP_2_RadioButton1.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_2_RadioButton1+39)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+39)
STRB	R1, [R0, #0]
;hepsi.h,428 :: 		CP_2_RadioButton1.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_CP_2_RadioButton1+40)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+40)
STRH	R1, [R0, #0]
;hepsi.h,429 :: 		CP_2_RadioButton1.Gradient_End_Color      = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CP_2_RadioButton1+42)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+42)
STRH	R1, [R0, #0]
;hepsi.h,430 :: 		CP_2_RadioButton1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CP_2_RadioButton1+44)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+44)
STRH	R1, [R0, #0]
;hepsi.h,431 :: 		CP_2_RadioButton1.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CP_2_RadioButton1+50)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+50)
STRH	R1, [R0, #0]
;hepsi.h,432 :: 		CP_2_RadioButton1.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_CP_2_RadioButton1+46)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+46)
STRH	R1, [R0, #0]
;hepsi.h,433 :: 		CP_2_RadioButton1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_2_RadioButton1+52)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+52)
STR	R1, [R0, #0]
;hepsi.h,434 :: 		CP_2_RadioButton1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_2_RadioButton1+56)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+56)
STR	R1, [R0, #0]
;hepsi.h,435 :: 		CP_2_RadioButton1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_2_RadioButton1+60)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+60)
STR	R1, [R0, #0]
;hepsi.h,436 :: 		CP_2_RadioButton1.OnPressPtr      = CP_2;
MOVW	R1, #lo_addr(_CP_2+0)
MOVT	R1, #hi_addr(_CP_2+0)
MOVW	R0, #lo_addr(_CP_2_RadioButton1+64)
MOVT	R0, #hi_addr(_CP_2_RadioButton1+64)
STR	R1, [R0, #0]
;hepsi.h,438 :: 		CP_3_RadioButton1.OwnerScreen     = &MainScreen1;
MOVW	R1, #lo_addr(_MainScreen1+0)
MOVT	R1, #hi_addr(_MainScreen1+0)
MOVW	R0, #lo_addr(_CP_3_RadioButton1+0)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+0)
STR	R1, [R0, #0]
;hepsi.h,439 :: 		CP_3_RadioButton1.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_CP_3_RadioButton1+4)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+4)
STRB	R1, [R0, #0]
;hepsi.h,440 :: 		CP_3_RadioButton1.Left            = 160;
MOVS	R1, #160
MOVW	R0, #lo_addr(_CP_3_RadioButton1+6)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+6)
STRH	R1, [R0, #0]
;hepsi.h,441 :: 		CP_3_RadioButton1.Top             = 140;
MOVS	R1, #140
MOVW	R0, #lo_addr(_CP_3_RadioButton1+8)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+8)
STRH	R1, [R0, #0]
;hepsi.h,442 :: 		CP_3_RadioButton1.Width           = 47;
MOVS	R1, #47
MOVW	R0, #lo_addr(_CP_3_RadioButton1+10)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+10)
STRH	R1, [R0, #0]
;hepsi.h,443 :: 		CP_3_RadioButton1.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_CP_3_RadioButton1+12)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+12)
STRH	R1, [R0, #0]
;hepsi.h,444 :: 		CP_3_RadioButton1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_3_RadioButton1+14)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+14)
STRB	R1, [R0, #0]
;hepsi.h,445 :: 		CP_3_RadioButton1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_3_RadioButton1+16)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+16)
STRH	R1, [R0, #0]
;hepsi.h,446 :: 		CP_3_RadioButton1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_3_RadioButton1+18)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+18)
STRB	R1, [R0, #0]
;hepsi.h,447 :: 		CP_3_RadioButton1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_3_RadioButton1+19)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+19)
STRB	R1, [R0, #0]
;hepsi.h,448 :: 		CP_3_RadioButton1.Checked          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_3_RadioButton1+20)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+20)
STRB	R1, [R0, #0]
;hepsi.h,449 :: 		CP_3_RadioButton1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_3_RadioButton1+21)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+21)
STRB	R1, [R0, #0]
;hepsi.h,450 :: 		CP_3_RadioButton1.Caption         = CP_3_RadioButton1_Caption;
MOVW	R1, #lo_addr(_CP_3_RadioButton1_Caption+0)
MOVT	R1, #hi_addr(_CP_3_RadioButton1_Caption+0)
MOVW	R0, #lo_addr(_CP_3_RadioButton1+24)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+24)
STR	R1, [R0, #0]
;hepsi.h,451 :: 		CP_3_RadioButton1.TextAlign            = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_3_RadioButton1+28)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+28)
STRB	R1, [R0, #0]
;hepsi.h,452 :: 		CP_3_RadioButton1.FontName        = Tahoma11x13_Regular;
MOVW	R1, #7391
MOVT	R1, #0
MOVW	R0, #lo_addr(_CP_3_RadioButton1+32)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+32)
STR	R1, [R0, #0]
;hepsi.h,453 :: 		CP_3_RadioButton1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_3_RadioButton1+48)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+48)
STRB	R1, [R0, #0]
;hepsi.h,454 :: 		CP_3_RadioButton1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_3_RadioButton1+36)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+36)
STRH	R1, [R0, #0]
;hepsi.h,455 :: 		CP_3_RadioButton1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_3_RadioButton1+38)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+38)
STRB	R1, [R0, #0]
;hepsi.h,456 :: 		CP_3_RadioButton1.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_3_RadioButton1+39)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+39)
STRB	R1, [R0, #0]
;hepsi.h,457 :: 		CP_3_RadioButton1.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_CP_3_RadioButton1+40)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+40)
STRH	R1, [R0, #0]
;hepsi.h,458 :: 		CP_3_RadioButton1.Gradient_End_Color      = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CP_3_RadioButton1+42)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+42)
STRH	R1, [R0, #0]
;hepsi.h,459 :: 		CP_3_RadioButton1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CP_3_RadioButton1+44)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+44)
STRH	R1, [R0, #0]
;hepsi.h,460 :: 		CP_3_RadioButton1.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CP_3_RadioButton1+50)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+50)
STRH	R1, [R0, #0]
;hepsi.h,461 :: 		CP_3_RadioButton1.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_CP_3_RadioButton1+46)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+46)
STRH	R1, [R0, #0]
;hepsi.h,462 :: 		CP_3_RadioButton1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_3_RadioButton1+52)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+52)
STR	R1, [R0, #0]
;hepsi.h,463 :: 		CP_3_RadioButton1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_3_RadioButton1+56)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+56)
STR	R1, [R0, #0]
;hepsi.h,464 :: 		CP_3_RadioButton1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_3_RadioButton1+60)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+60)
STR	R1, [R0, #0]
;hepsi.h,465 :: 		CP_3_RadioButton1.OnPressPtr      = CP_3;
MOVW	R1, #lo_addr(_CP_3+0)
MOVT	R1, #hi_addr(_CP_3+0)
MOVW	R0, #lo_addr(_CP_3_RadioButton1+64)
MOVT	R0, #hi_addr(_CP_3_RadioButton1+64)
STR	R1, [R0, #0]
;hepsi.h,467 :: 		CP_4_RadioButton1.OwnerScreen     = &MainScreen1;
MOVW	R1, #lo_addr(_MainScreen1+0)
MOVT	R1, #hi_addr(_MainScreen1+0)
MOVW	R0, #lo_addr(_CP_4_RadioButton1+0)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+0)
STR	R1, [R0, #0]
;hepsi.h,468 :: 		CP_4_RadioButton1.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_CP_4_RadioButton1+4)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+4)
STRB	R1, [R0, #0]
;hepsi.h,469 :: 		CP_4_RadioButton1.Left            = 160;
MOVS	R1, #160
MOVW	R0, #lo_addr(_CP_4_RadioButton1+6)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+6)
STRH	R1, [R0, #0]
;hepsi.h,470 :: 		CP_4_RadioButton1.Top             = 190;
MOVS	R1, #190
MOVW	R0, #lo_addr(_CP_4_RadioButton1+8)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+8)
STRH	R1, [R0, #0]
;hepsi.h,471 :: 		CP_4_RadioButton1.Width           = 47;
MOVS	R1, #47
MOVW	R0, #lo_addr(_CP_4_RadioButton1+10)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+10)
STRH	R1, [R0, #0]
;hepsi.h,472 :: 		CP_4_RadioButton1.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_CP_4_RadioButton1+12)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+12)
STRH	R1, [R0, #0]
;hepsi.h,473 :: 		CP_4_RadioButton1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_4_RadioButton1+14)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+14)
STRB	R1, [R0, #0]
;hepsi.h,474 :: 		CP_4_RadioButton1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_4_RadioButton1+16)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+16)
STRH	R1, [R0, #0]
;hepsi.h,475 :: 		CP_4_RadioButton1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_4_RadioButton1+18)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+18)
STRB	R1, [R0, #0]
;hepsi.h,476 :: 		CP_4_RadioButton1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_4_RadioButton1+19)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+19)
STRB	R1, [R0, #0]
;hepsi.h,477 :: 		CP_4_RadioButton1.Checked          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_4_RadioButton1+20)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+20)
STRB	R1, [R0, #0]
;hepsi.h,478 :: 		CP_4_RadioButton1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_4_RadioButton1+21)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+21)
STRB	R1, [R0, #0]
;hepsi.h,479 :: 		CP_4_RadioButton1.Caption         = CP_4_RadioButton1_Caption;
MOVW	R1, #lo_addr(_CP_4_RadioButton1_Caption+0)
MOVT	R1, #hi_addr(_CP_4_RadioButton1_Caption+0)
MOVW	R0, #lo_addr(_CP_4_RadioButton1+24)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+24)
STR	R1, [R0, #0]
;hepsi.h,480 :: 		CP_4_RadioButton1.TextAlign            = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_4_RadioButton1+28)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+28)
STRB	R1, [R0, #0]
;hepsi.h,481 :: 		CP_4_RadioButton1.FontName        = Tahoma11x13_Regular;
MOVW	R1, #7391
MOVT	R1, #0
MOVW	R0, #lo_addr(_CP_4_RadioButton1+32)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+32)
STR	R1, [R0, #0]
;hepsi.h,482 :: 		CP_4_RadioButton1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_4_RadioButton1+48)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+48)
STRB	R1, [R0, #0]
;hepsi.h,483 :: 		CP_4_RadioButton1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_4_RadioButton1+36)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+36)
STRH	R1, [R0, #0]
;hepsi.h,484 :: 		CP_4_RadioButton1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_4_RadioButton1+38)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+38)
STRB	R1, [R0, #0]
;hepsi.h,485 :: 		CP_4_RadioButton1.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_4_RadioButton1+39)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+39)
STRB	R1, [R0, #0]
;hepsi.h,486 :: 		CP_4_RadioButton1.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_CP_4_RadioButton1+40)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+40)
STRH	R1, [R0, #0]
;hepsi.h,487 :: 		CP_4_RadioButton1.Gradient_End_Color      = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CP_4_RadioButton1+42)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+42)
STRH	R1, [R0, #0]
;hepsi.h,488 :: 		CP_4_RadioButton1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CP_4_RadioButton1+44)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+44)
STRH	R1, [R0, #0]
;hepsi.h,489 :: 		CP_4_RadioButton1.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CP_4_RadioButton1+50)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+50)
STRH	R1, [R0, #0]
;hepsi.h,490 :: 		CP_4_RadioButton1.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_CP_4_RadioButton1+46)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+46)
STRH	R1, [R0, #0]
;hepsi.h,491 :: 		CP_4_RadioButton1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_4_RadioButton1+52)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+52)
STR	R1, [R0, #0]
;hepsi.h,492 :: 		CP_4_RadioButton1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_4_RadioButton1+56)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+56)
STR	R1, [R0, #0]
;hepsi.h,493 :: 		CP_4_RadioButton1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_4_RadioButton1+60)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+60)
STR	R1, [R0, #0]
;hepsi.h,494 :: 		CP_4_RadioButton1.OnPressPtr      = CP_4;
MOVW	R1, #lo_addr(_CP_4+0)
MOVT	R1, #hi_addr(_CP_4+0)
MOVW	R0, #lo_addr(_CP_4_RadioButton1+64)
MOVT	R0, #hi_addr(_CP_4_RadioButton1+64)
STR	R1, [R0, #0]
;hepsi.h,496 :: 		CP_5_RadioButton1.OwnerScreen     = &MainScreen1;
MOVW	R1, #lo_addr(_MainScreen1+0)
MOVT	R1, #hi_addr(_MainScreen1+0)
MOVW	R0, #lo_addr(_CP_5_RadioButton1+0)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+0)
STR	R1, [R0, #0]
;hepsi.h,497 :: 		CP_5_RadioButton1.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_CP_5_RadioButton1+4)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+4)
STRB	R1, [R0, #0]
;hepsi.h,498 :: 		CP_5_RadioButton1.Left            = 160;
MOVS	R1, #160
MOVW	R0, #lo_addr(_CP_5_RadioButton1+6)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+6)
STRH	R1, [R0, #0]
;hepsi.h,499 :: 		CP_5_RadioButton1.Top             = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_CP_5_RadioButton1+8)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+8)
STRH	R1, [R0, #0]
;hepsi.h,500 :: 		CP_5_RadioButton1.Width           = 47;
MOVS	R1, #47
MOVW	R0, #lo_addr(_CP_5_RadioButton1+10)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+10)
STRH	R1, [R0, #0]
;hepsi.h,501 :: 		CP_5_RadioButton1.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_CP_5_RadioButton1+12)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+12)
STRH	R1, [R0, #0]
;hepsi.h,502 :: 		CP_5_RadioButton1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_5_RadioButton1+14)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+14)
STRB	R1, [R0, #0]
;hepsi.h,503 :: 		CP_5_RadioButton1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_5_RadioButton1+16)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+16)
STRH	R1, [R0, #0]
;hepsi.h,504 :: 		CP_5_RadioButton1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_5_RadioButton1+18)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+18)
STRB	R1, [R0, #0]
;hepsi.h,505 :: 		CP_5_RadioButton1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_5_RadioButton1+19)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+19)
STRB	R1, [R0, #0]
;hepsi.h,506 :: 		CP_5_RadioButton1.Checked          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_5_RadioButton1+20)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+20)
STRB	R1, [R0, #0]
;hepsi.h,507 :: 		CP_5_RadioButton1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_5_RadioButton1+21)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+21)
STRB	R1, [R0, #0]
;hepsi.h,508 :: 		CP_5_RadioButton1.Caption         = CP_5_RadioButton1_Caption;
MOVW	R1, #lo_addr(_CP_5_RadioButton1_Caption+0)
MOVT	R1, #hi_addr(_CP_5_RadioButton1_Caption+0)
MOVW	R0, #lo_addr(_CP_5_RadioButton1+24)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+24)
STR	R1, [R0, #0]
;hepsi.h,509 :: 		CP_5_RadioButton1.TextAlign            = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_5_RadioButton1+28)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+28)
STRB	R1, [R0, #0]
;hepsi.h,510 :: 		CP_5_RadioButton1.FontName        = Tahoma11x13_Regular;
MOVW	R1, #7391
MOVT	R1, #0
MOVW	R0, #lo_addr(_CP_5_RadioButton1+32)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+32)
STR	R1, [R0, #0]
;hepsi.h,511 :: 		CP_5_RadioButton1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_5_RadioButton1+48)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+48)
STRB	R1, [R0, #0]
;hepsi.h,512 :: 		CP_5_RadioButton1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_5_RadioButton1+36)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+36)
STRH	R1, [R0, #0]
;hepsi.h,513 :: 		CP_5_RadioButton1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CP_5_RadioButton1+38)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+38)
STRB	R1, [R0, #0]
;hepsi.h,514 :: 		CP_5_RadioButton1.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_5_RadioButton1+39)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+39)
STRB	R1, [R0, #0]
;hepsi.h,515 :: 		CP_5_RadioButton1.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_CP_5_RadioButton1+40)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+40)
STRH	R1, [R0, #0]
;hepsi.h,516 :: 		CP_5_RadioButton1.Gradient_End_Color      = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CP_5_RadioButton1+42)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+42)
STRH	R1, [R0, #0]
;hepsi.h,517 :: 		CP_5_RadioButton1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CP_5_RadioButton1+44)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+44)
STRH	R1, [R0, #0]
;hepsi.h,518 :: 		CP_5_RadioButton1.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CP_5_RadioButton1+50)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+50)
STRH	R1, [R0, #0]
;hepsi.h,519 :: 		CP_5_RadioButton1.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_CP_5_RadioButton1+46)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+46)
STRH	R1, [R0, #0]
;hepsi.h,520 :: 		CP_5_RadioButton1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_5_RadioButton1+52)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+52)
STR	R1, [R0, #0]
;hepsi.h,521 :: 		CP_5_RadioButton1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_5_RadioButton1+56)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+56)
STR	R1, [R0, #0]
;hepsi.h,522 :: 		CP_5_RadioButton1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CP_5_RadioButton1+60)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+60)
STR	R1, [R0, #0]
;hepsi.h,523 :: 		CP_5_RadioButton1.OnPressPtr      = CP_5;
MOVW	R1, #lo_addr(_CP_5+0)
MOVT	R1, #hi_addr(_CP_5+0)
MOVW	R0, #lo_addr(_CP_5_RadioButton1+64)
MOVT	R0, #hi_addr(_CP_5_RadioButton1+64)
STR	R1, [R0, #0]
;hepsi.h,525 :: 		Success_ProgressBar1.OwnerScreen     = &MainScreen1;
MOVW	R1, #lo_addr(_MainScreen1+0)
MOVT	R1, #hi_addr(_MainScreen1+0)
MOVW	R0, #lo_addr(_Success_ProgressBar1+0)
MOVT	R0, #hi_addr(_Success_ProgressBar1+0)
STR	R1, [R0, #0]
;hepsi.h,526 :: 		Success_ProgressBar1.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Success_ProgressBar1+4)
MOVT	R0, #hi_addr(_Success_ProgressBar1+4)
STRB	R1, [R0, #0]
;hepsi.h,527 :: 		Success_ProgressBar1.Left            = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Success_ProgressBar1+6)
MOVT	R0, #hi_addr(_Success_ProgressBar1+6)
STRH	R1, [R0, #0]
;hepsi.h,528 :: 		Success_ProgressBar1.Top             = 270;
MOVW	R1, #270
MOVW	R0, #lo_addr(_Success_ProgressBar1+8)
MOVT	R0, #hi_addr(_Success_ProgressBar1+8)
STRH	R1, [R0, #0]
;hepsi.h,529 :: 		Success_ProgressBar1.Width           = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_Success_ProgressBar1+10)
MOVT	R0, #hi_addr(_Success_ProgressBar1+10)
STRH	R1, [R0, #0]
;hepsi.h,530 :: 		Success_ProgressBar1.Height          = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Success_ProgressBar1+12)
MOVT	R0, #hi_addr(_Success_ProgressBar1+12)
STRH	R1, [R0, #0]
;hepsi.h,531 :: 		Success_ProgressBar1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Success_ProgressBar1+14)
MOVT	R0, #hi_addr(_Success_ProgressBar1+14)
STRB	R1, [R0, #0]
;hepsi.h,532 :: 		Success_ProgressBar1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Success_ProgressBar1+16)
MOVT	R0, #hi_addr(_Success_ProgressBar1+16)
STRH	R1, [R0, #0]
;hepsi.h,533 :: 		Success_ProgressBar1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Success_ProgressBar1+18)
MOVT	R0, #hi_addr(_Success_ProgressBar1+18)
STRB	R1, [R0, #0]
;hepsi.h,534 :: 		Success_ProgressBar1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Success_ProgressBar1+19)
MOVT	R0, #hi_addr(_Success_ProgressBar1+19)
STRB	R1, [R0, #0]
;hepsi.h,535 :: 		Success_ProgressBar1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Success_ProgressBar1+20)
MOVT	R0, #hi_addr(_Success_ProgressBar1+20)
STRB	R1, [R0, #0]
;hepsi.h,536 :: 		Success_ProgressBar1.Caption         = Success_ProgressBar1_Caption;
MOVW	R1, #lo_addr(_Success_ProgressBar1_Caption+0)
MOVT	R1, #hi_addr(_Success_ProgressBar1_Caption+0)
MOVW	R0, #lo_addr(_Success_ProgressBar1+24)
MOVT	R0, #hi_addr(_Success_ProgressBar1+24)
STR	R1, [R0, #0]
;hepsi.h,537 :: 		Success_ProgressBar1.FontName        = Tahoma11x13_Regular;
MOVW	R1, #7391
MOVT	R1, #0
MOVW	R0, #lo_addr(_Success_ProgressBar1+28)
MOVT	R0, #hi_addr(_Success_ProgressBar1+28)
STR	R1, [R0, #0]
;hepsi.h,538 :: 		Success_ProgressBar1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Success_ProgressBar1+32)
MOVT	R0, #hi_addr(_Success_ProgressBar1+32)
STRH	R1, [R0, #0]
;hepsi.h,539 :: 		Success_ProgressBar1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Success_ProgressBar1+34)
MOVT	R0, #hi_addr(_Success_ProgressBar1+34)
STRB	R1, [R0, #0]
;hepsi.h,540 :: 		Success_ProgressBar1.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Success_ProgressBar1+35)
MOVT	R0, #hi_addr(_Success_ProgressBar1+35)
STRB	R1, [R0, #0]
;hepsi.h,541 :: 		Success_ProgressBar1.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Success_ProgressBar1+36)
MOVT	R0, #hi_addr(_Success_ProgressBar1+36)
STRH	R1, [R0, #0]
;hepsi.h,542 :: 		Success_ProgressBar1.Gradient_End_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_Success_ProgressBar1+38)
MOVT	R0, #hi_addr(_Success_ProgressBar1+38)
STRH	R1, [R0, #0]
;hepsi.h,543 :: 		Success_ProgressBar1.Color           = 0xA65E;
MOVW	R1, #42590
MOVW	R0, #lo_addr(_Success_ProgressBar1+40)
MOVT	R0, #hi_addr(_Success_ProgressBar1+40)
STRH	R1, [R0, #0]
;hepsi.h,544 :: 		Success_ProgressBar1.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_Success_ProgressBar1+42)
MOVT	R0, #hi_addr(_Success_ProgressBar1+42)
STRH	R1, [R0, #0]
;hepsi.h,545 :: 		Success_ProgressBar1.Min             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Success_ProgressBar1+44)
MOVT	R0, #hi_addr(_Success_ProgressBar1+44)
STRH	R1, [R0, #0]
;hepsi.h,546 :: 		Success_ProgressBar1.Max             = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_Success_ProgressBar1+46)
MOVT	R0, #hi_addr(_Success_ProgressBar1+46)
STRH	R1, [R0, #0]
;hepsi.h,547 :: 		Success_ProgressBar1.Position        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Success_ProgressBar1+48)
MOVT	R0, #hi_addr(_Success_ProgressBar1+48)
STRH	R1, [R0, #0]
;hepsi.h,548 :: 		Success_ProgressBar1.Show_Position   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Success_ProgressBar1+50)
MOVT	R0, #hi_addr(_Success_ProgressBar1+50)
STRB	R1, [R0, #0]
;hepsi.h,549 :: 		Success_ProgressBar1.Show_Percentage = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Success_ProgressBar1+51)
MOVT	R0, #hi_addr(_Success_ProgressBar1+51)
STRB	R1, [R0, #0]
;hepsi.h,550 :: 		Success_ProgressBar1.Smooth          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Success_ProgressBar1+52)
MOVT	R0, #hi_addr(_Success_ProgressBar1+52)
STRB	R1, [R0, #0]
;hepsi.h,551 :: 		Success_ProgressBar1.Rounded         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Success_ProgressBar1+53)
MOVT	R0, #hi_addr(_Success_ProgressBar1+53)
STRB	R1, [R0, #0]
;hepsi.h,552 :: 		Success_ProgressBar1.Corner_Radius      = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Success_ProgressBar1+54)
MOVT	R0, #hi_addr(_Success_ProgressBar1+54)
STRB	R1, [R0, #0]
;hepsi.h,554 :: 		Label2.OwnerScreen     = &MainScreen1;
MOVW	R1, #lo_addr(_MainScreen1+0)
MOVT	R1, #hi_addr(_MainScreen1+0)
MOVW	R0, #lo_addr(_Label2+0)
MOVT	R0, #hi_addr(_Label2+0)
STR	R1, [R0, #0]
;hepsi.h,555 :: 		Label2.Order          = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Label2+4)
MOVT	R0, #hi_addr(_Label2+4)
STRB	R1, [R0, #0]
;hepsi.h,556 :: 		Label2.Left           = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_Label2+6)
MOVT	R0, #hi_addr(_Label2+6)
STRH	R1, [R0, #0]
;hepsi.h,557 :: 		Label2.Top            = 251;
MOVS	R1, #251
MOVW	R0, #lo_addr(_Label2+8)
MOVT	R0, #hi_addr(_Label2+8)
STRH	R1, [R0, #0]
;hepsi.h,558 :: 		Label2.Width          = 66;
MOVS	R1, #66
MOVW	R0, #lo_addr(_Label2+10)
MOVT	R0, #hi_addr(_Label2+10)
STRH	R1, [R0, #0]
;hepsi.h,559 :: 		Label2.Height         = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label2+12)
MOVT	R0, #hi_addr(_Label2+12)
STRH	R1, [R0, #0]
;hepsi.h,560 :: 		Label2.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label2+26)
MOVT	R0, #hi_addr(_Label2+26)
STRB	R1, [R0, #0]
;hepsi.h,561 :: 		Label2.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label2+27)
MOVT	R0, #hi_addr(_Label2+27)
STRB	R1, [R0, #0]
;hepsi.h,562 :: 		Label2.Caption        = Label2_Caption;
MOVW	R1, #lo_addr(_Label2_Caption+0)
MOVT	R1, #hi_addr(_Label2_Caption+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
STR	R1, [R0, #0]
;hepsi.h,563 :: 		Label2.FontName       = Arial13x16_Italic;
MOVW	R1, #2559
MOVT	R1, #0
MOVW	R0, #lo_addr(_Label2+20)
MOVT	R0, #hi_addr(_Label2+20)
STR	R1, [R0, #0]
;hepsi.h,564 :: 		Label2.Font_Color     = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;hepsi.h,565 :: 		Label2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+28)
MOVT	R0, #hi_addr(_Label2+28)
STR	R1, [R0, #0]
;hepsi.h,566 :: 		Label2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+32)
MOVT	R0, #hi_addr(_Label2+32)
STR	R1, [R0, #0]
;hepsi.h,567 :: 		Label2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+36)
MOVT	R0, #hi_addr(_Label2+36)
STR	R1, [R0, #0]
;hepsi.h,568 :: 		Label2.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+40)
MOVT	R0, #hi_addr(_Label2+40)
STR	R1, [R0, #0]
;hepsi.h,570 :: 		Label3.OwnerScreen     = &MainScreen1;
MOVW	R1, #lo_addr(_MainScreen1+0)
MOVT	R1, #hi_addr(_MainScreen1+0)
MOVW	R0, #lo_addr(_Label3+0)
MOVT	R0, #hi_addr(_Label3+0)
STR	R1, [R0, #0]
;hepsi.h,571 :: 		Label3.Order          = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Label3+4)
MOVT	R0, #hi_addr(_Label3+4)
STRB	R1, [R0, #0]
;hepsi.h,572 :: 		Label3.Left           = 70;
MOVS	R1, #70
MOVW	R0, #lo_addr(_Label3+6)
MOVT	R0, #hi_addr(_Label3+6)
STRH	R1, [R0, #0]
;hepsi.h,573 :: 		Label3.Top            = 45;
MOVS	R1, #45
MOVW	R0, #lo_addr(_Label3+8)
MOVT	R0, #hi_addr(_Label3+8)
STRH	R1, [R0, #0]
;hepsi.h,574 :: 		Label3.Width          = 95;
MOVS	R1, #95
MOVW	R0, #lo_addr(_Label3+10)
MOVT	R0, #hi_addr(_Label3+10)
STRH	R1, [R0, #0]
;hepsi.h,575 :: 		Label3.Height         = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label3+12)
MOVT	R0, #hi_addr(_Label3+12)
STRH	R1, [R0, #0]
;hepsi.h,576 :: 		Label3.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label3+26)
MOVT	R0, #hi_addr(_Label3+26)
STRB	R1, [R0, #0]
;hepsi.h,577 :: 		Label3.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label3+27)
MOVT	R0, #hi_addr(_Label3+27)
STRB	R1, [R0, #0]
;hepsi.h,578 :: 		Label3.Caption        = Label3_Caption;
MOVW	R1, #lo_addr(_Label3_Caption+0)
MOVT	R1, #hi_addr(_Label3_Caption+0)
MOVW	R0, #lo_addr(_Label3+16)
MOVT	R0, #hi_addr(_Label3+16)
STR	R1, [R0, #0]
;hepsi.h,579 :: 		Label3.FontName       = Arial13x16_Italic;
MOVW	R1, #2559
MOVT	R1, #0
MOVW	R0, #lo_addr(_Label3+20)
MOVT	R0, #hi_addr(_Label3+20)
STR	R1, [R0, #0]
;hepsi.h,580 :: 		Label3.Font_Color     = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label3+24)
MOVT	R0, #hi_addr(_Label3+24)
STRH	R1, [R0, #0]
;hepsi.h,581 :: 		Label3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+28)
MOVT	R0, #hi_addr(_Label3+28)
STR	R1, [R0, #0]
;hepsi.h,582 :: 		Label3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+32)
MOVT	R0, #hi_addr(_Label3+32)
STR	R1, [R0, #0]
;hepsi.h,583 :: 		Label3.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+36)
MOVT	R0, #hi_addr(_Label3+36)
STR	R1, [R0, #0]
;hepsi.h,584 :: 		Label3.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+40)
MOVT	R0, #hi_addr(_Label3+40)
STR	R1, [R0, #0]
;hepsi.h,586 :: 		Label4.OwnerScreen     = &DatabaseScreen2;
MOVW	R1, #lo_addr(_DatabaseScreen2+0)
MOVT	R1, #hi_addr(_DatabaseScreen2+0)
MOVW	R0, #lo_addr(_Label4+0)
MOVT	R0, #hi_addr(_Label4+0)
STR	R1, [R0, #0]
;hepsi.h,587 :: 		Label4.Order          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+4)
MOVT	R0, #hi_addr(_Label4+4)
STRB	R1, [R0, #0]
;hepsi.h,588 :: 		Label4.Left           = 63;
MOVS	R1, #63
MOVW	R0, #lo_addr(_Label4+6)
MOVT	R0, #hi_addr(_Label4+6)
STRH	R1, [R0, #0]
;hepsi.h,589 :: 		Label4.Top            = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Label4+8)
MOVT	R0, #hi_addr(_Label4+8)
STRH	R1, [R0, #0]
;hepsi.h,590 :: 		Label4.Width          = 103;
MOVS	R1, #103
MOVW	R0, #lo_addr(_Label4+10)
MOVT	R0, #hi_addr(_Label4+10)
STRH	R1, [R0, #0]
;hepsi.h,591 :: 		Label4.Height         = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label4+12)
MOVT	R0, #hi_addr(_Label4+12)
STRH	R1, [R0, #0]
;hepsi.h,592 :: 		Label4.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label4+26)
MOVT	R0, #hi_addr(_Label4+26)
STRB	R1, [R0, #0]
;hepsi.h,593 :: 		Label4.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label4+27)
MOVT	R0, #hi_addr(_Label4+27)
STRB	R1, [R0, #0]
;hepsi.h,594 :: 		Label4.Caption        = Label4_Caption;
MOVW	R1, #lo_addr(_Label4_Caption+0)
MOVT	R1, #hi_addr(_Label4_Caption+0)
MOVW	R0, #lo_addr(_Label4+16)
MOVT	R0, #hi_addr(_Label4+16)
STR	R1, [R0, #0]
;hepsi.h,595 :: 		Label4.FontName       = Arial13x16_Italic;
MOVW	R1, #2559
MOVT	R1, #0
MOVW	R0, #lo_addr(_Label4+20)
MOVT	R0, #hi_addr(_Label4+20)
STR	R1, [R0, #0]
;hepsi.h,596 :: 		Label4.Font_Color     = 0x301F;
MOVW	R1, #12319
MOVW	R0, #lo_addr(_Label4+24)
MOVT	R0, #hi_addr(_Label4+24)
STRH	R1, [R0, #0]
;hepsi.h,597 :: 		Label4.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+28)
MOVT	R0, #hi_addr(_Label4+28)
STR	R1, [R0, #0]
;hepsi.h,598 :: 		Label4.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+32)
MOVT	R0, #hi_addr(_Label4+32)
STR	R1, [R0, #0]
;hepsi.h,599 :: 		Label4.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+36)
MOVT	R0, #hi_addr(_Label4+36)
STR	R1, [R0, #0]
;hepsi.h,600 :: 		Label4.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+40)
MOVT	R0, #hi_addr(_Label4+40)
STR	R1, [R0, #0]
;hepsi.h,602 :: 		Image1.OwnerScreen     = &TrainingScreen3;
MOVW	R1, #lo_addr(_TrainingScreen3+0)
MOVT	R1, #hi_addr(_TrainingScreen3+0)
MOVW	R0, #lo_addr(_Image1+0)
MOVT	R0, #hi_addr(_Image1+0)
STR	R1, [R0, #0]
;hepsi.h,603 :: 		Image1.Order          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+4)
MOVT	R0, #hi_addr(_Image1+4)
STRB	R1, [R0, #0]
;hepsi.h,604 :: 		Image1.Left           = 169;
MOVS	R1, #169
MOVW	R0, #lo_addr(_Image1+6)
MOVT	R0, #hi_addr(_Image1+6)
STRH	R1, [R0, #0]
;hepsi.h,605 :: 		Image1.Top            = 225;
MOVS	R1, #225
MOVW	R0, #lo_addr(_Image1+8)
MOVT	R0, #hi_addr(_Image1+8)
STRH	R1, [R0, #0]
;hepsi.h,606 :: 		Image1.Width          = 72;
MOVS	R1, #72
MOVW	R0, #lo_addr(_Image1+10)
MOVT	R0, #hi_addr(_Image1+10)
STRH	R1, [R0, #0]
;hepsi.h,607 :: 		Image1.Height         = 93;
MOVS	R1, #93
MOVW	R0, #lo_addr(_Image1+12)
MOVT	R0, #hi_addr(_Image1+12)
STRH	R1, [R0, #0]
;hepsi.h,608 :: 		Image1.Picture_Type        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+22)
MOVT	R0, #hi_addr(_Image1+22)
STRB	R1, [R0, #0]
;hepsi.h,609 :: 		Image1.Picture_Ratio  = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+23)
MOVT	R0, #hi_addr(_Image1+23)
STRB	R1, [R0, #0]
;hepsi.h,610 :: 		Image1.Picture_Name   = amblem_jpg;
MOVW	R1, #9070
MOVT	R1, #0
MOVW	R0, #lo_addr(_Image1+16)
MOVT	R0, #hi_addr(_Image1+16)
STR	R1, [R0, #0]
;hepsi.h,611 :: 		Image1.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+20)
MOVT	R0, #hi_addr(_Image1+20)
STRB	R1, [R0, #0]
;hepsi.h,612 :: 		Image1.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+21)
MOVT	R0, #hi_addr(_Image1+21)
STRB	R1, [R0, #0]
;hepsi.h,613 :: 		Image1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+24)
MOVT	R0, #hi_addr(_Image1+24)
STR	R1, [R0, #0]
;hepsi.h,614 :: 		Image1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+28)
MOVT	R0, #hi_addr(_Image1+28)
STR	R1, [R0, #0]
;hepsi.h,615 :: 		Image1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+32)
MOVT	R0, #hi_addr(_Image1+32)
STR	R1, [R0, #0]
;hepsi.h,616 :: 		Image1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+36)
MOVT	R0, #hi_addr(_Image1+36)
STR	R1, [R0, #0]
;hepsi.h,618 :: 		Label5.OwnerScreen     = &TrainingScreen3;
MOVW	R1, #lo_addr(_TrainingScreen3+0)
MOVT	R1, #hi_addr(_TrainingScreen3+0)
MOVW	R0, #lo_addr(_Label5+0)
MOVT	R0, #hi_addr(_Label5+0)
STR	R1, [R0, #0]
;hepsi.h,619 :: 		Label5.Order          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label5+4)
MOVT	R0, #hi_addr(_Label5+4)
STRB	R1, [R0, #0]
;hepsi.h,620 :: 		Label5.Left           = 49;
MOVS	R1, #49
MOVW	R0, #lo_addr(_Label5+6)
MOVT	R0, #hi_addr(_Label5+6)
STRH	R1, [R0, #0]
;hepsi.h,621 :: 		Label5.Top            = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Label5+8)
MOVT	R0, #hi_addr(_Label5+8)
STRH	R1, [R0, #0]
;hepsi.h,622 :: 		Label5.Width          = 129;
MOVS	R1, #129
MOVW	R0, #lo_addr(_Label5+10)
MOVT	R0, #hi_addr(_Label5+10)
STRH	R1, [R0, #0]
;hepsi.h,623 :: 		Label5.Height         = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label5+12)
MOVT	R0, #hi_addr(_Label5+12)
STRH	R1, [R0, #0]
;hepsi.h,624 :: 		Label5.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label5+26)
MOVT	R0, #hi_addr(_Label5+26)
STRB	R1, [R0, #0]
;hepsi.h,625 :: 		Label5.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label5+27)
MOVT	R0, #hi_addr(_Label5+27)
STRB	R1, [R0, #0]
;hepsi.h,626 :: 		Label5.Caption        = Label5_Caption;
MOVW	R1, #lo_addr(_Label5_Caption+0)
MOVT	R1, #hi_addr(_Label5_Caption+0)
MOVW	R0, #lo_addr(_Label5+16)
MOVT	R0, #hi_addr(_Label5+16)
STR	R1, [R0, #0]
;hepsi.h,627 :: 		Label5.FontName       = Arial13x16_Italic; //Tahoma12x16_Italic;
MOVW	R1, #2559
MOVT	R1, #0
MOVW	R0, #lo_addr(_Label5+20)
MOVT	R0, #hi_addr(_Label5+20)
STR	R1, [R0, #0]
;hepsi.h,628 :: 		Label5.Font_Color     = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label5+24)
MOVT	R0, #hi_addr(_Label5+24)
STRH	R1, [R0, #0]
;hepsi.h,629 :: 		Label5.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+28)
MOVT	R0, #hi_addr(_Label5+28)
STR	R1, [R0, #0]
;hepsi.h,630 :: 		Label5.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+32)
MOVT	R0, #hi_addr(_Label5+32)
STR	R1, [R0, #0]
;hepsi.h,631 :: 		Label5.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+36)
MOVT	R0, #hi_addr(_Label5+36)
STR	R1, [R0, #0]
;hepsi.h,632 :: 		Label5.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+40)
MOVT	R0, #hi_addr(_Label5+40)
STR	R1, [R0, #0]
;hepsi.h,634 :: 		Label6.OwnerScreen     = &TestScreen4;
MOVW	R1, #lo_addr(_TestScreen4+0)
MOVT	R1, #hi_addr(_TestScreen4+0)
MOVW	R0, #lo_addr(_Label6+0)
MOVT	R0, #hi_addr(_Label6+0)
STR	R1, [R0, #0]
;hepsi.h,635 :: 		Label6.Order          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+4)
MOVT	R0, #hi_addr(_Label6+4)
STRB	R1, [R0, #0]
;hepsi.h,636 :: 		Label6.Left           = 91;
MOVS	R1, #91
MOVW	R0, #lo_addr(_Label6+6)
MOVT	R0, #hi_addr(_Label6+6)
STRH	R1, [R0, #0]
;hepsi.h,637 :: 		Label6.Top            = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label6+8)
MOVT	R0, #hi_addr(_Label6+8)
STRH	R1, [R0, #0]
;hepsi.h,638 :: 		Label6.Width          = 34;
MOVS	R1, #34
MOVW	R0, #lo_addr(_Label6+10)
MOVT	R0, #hi_addr(_Label6+10)
STRH	R1, [R0, #0]
;hepsi.h,639 :: 		Label6.Height         = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label6+12)
MOVT	R0, #hi_addr(_Label6+12)
STRH	R1, [R0, #0]
;hepsi.h,640 :: 		Label6.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label6+26)
MOVT	R0, #hi_addr(_Label6+26)
STRB	R1, [R0, #0]
;hepsi.h,641 :: 		Label6.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label6+27)
MOVT	R0, #hi_addr(_Label6+27)
STRB	R1, [R0, #0]
;hepsi.h,642 :: 		Label6.Caption        = Label6_Caption;
MOVW	R1, #lo_addr(_Label6_Caption+0)
MOVT	R1, #hi_addr(_Label6_Caption+0)
MOVW	R0, #lo_addr(_Label6+16)
MOVT	R0, #hi_addr(_Label6+16)
STR	R1, [R0, #0]
;hepsi.h,643 :: 		Label6.FontName       = Arial13x16_BoldItalic;
MOV	R1, #167
MOVW	R0, #lo_addr(_Label6+20)
MOVT	R0, #hi_addr(_Label6+20)
STR	R1, [R0, #0]
;hepsi.h,644 :: 		Label6.Font_Color     = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label6+24)
MOVT	R0, #hi_addr(_Label6+24)
STRH	R1, [R0, #0]
;hepsi.h,645 :: 		Label6.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+28)
MOVT	R0, #hi_addr(_Label6+28)
STR	R1, [R0, #0]
;hepsi.h,646 :: 		Label6.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+32)
MOVT	R0, #hi_addr(_Label6+32)
STR	R1, [R0, #0]
;hepsi.h,647 :: 		Label6.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+36)
MOVT	R0, #hi_addr(_Label6+36)
STR	R1, [R0, #0]
;hepsi.h,648 :: 		Label6.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+40)
MOVT	R0, #hi_addr(_Label6+40)
STR	R1, [R0, #0]
;hepsi.h,649 :: 		}
L_end_InitializeObjects:
ADD	SP, SP, #4
BX	LR
; end of FISHER_GUI_main_InitializeObjects
FISHER_GUI_main_IsInsideObject:
;hepsi.h,651 :: 		static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
; Top start address is: 12 (R3)
; Left start address is: 8 (R2)
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #4
;hepsi.h,652 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
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
BHI	L_FISHER_GUI_main_IsInsideObject766
ADDS	R4, R2, R5
UXTH	R4, R4
; Left end address is: 8 (R2)
; Width end address is: 20 (R5)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R0
IT	CC
BCC	L_FISHER_GUI_main_IsInsideObject765
; X end address is: 0 (R0)
;hepsi.h,653 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
CMP	R3, R1
IT	HI
BHI	L_FISHER_GUI_main_IsInsideObject764
ADDS	R4, R3, R6
UXTH	R4, R4
; Top end address is: 12 (R3)
; Height end address is: 24 (R6)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R1
IT	CC
BCC	L_FISHER_GUI_main_IsInsideObject763
; Y end address is: 4 (R1)
L_FISHER_GUI_main_IsInsideObject762:
;hepsi.h,654 :: 		return 1;
MOVS	R0, #1
IT	AL
BAL	L_end_IsInsideObject
;hepsi.h,652 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
L_FISHER_GUI_main_IsInsideObject766:
L_FISHER_GUI_main_IsInsideObject765:
;hepsi.h,653 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
L_FISHER_GUI_main_IsInsideObject764:
L_FISHER_GUI_main_IsInsideObject763:
;hepsi.h,656 :: 		return 0;
MOVS	R0, #0
;hepsi.h,657 :: 		}
L_end_IsInsideObject:
ADD	SP, SP, #4
BX	LR
; end of FISHER_GUI_main_IsInsideObject
_DeleteTrailingSpaces:
;hepsi.h,666 :: 		void DeleteTrailingSpaces(char* str){
; str start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;hepsi.h,668 :: 		i = 0;
; str start address is: 0 (R0)
; str end address is: 0 (R0)
MOV	R4, R0
; str end address is: 0 (R0)
;hepsi.h,669 :: 		while(1) {
L_DeleteTrailingSpaces16:
;hepsi.h,670 :: 		if(str[0] == ' ') {
; str start address is: 16 (R4)
LDRB	R1, [R4, #0]
CMP	R1, #32
IT	NE
BNE	L_DeleteTrailingSpaces18
;hepsi.h,671 :: 		for(i = 0; i < strlen(str); i++) {
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
;hepsi.h,672 :: 		str[i] = str[i+1];
ADDS	R2, R4, R5
ADDS	R1, R5, #1
SXTH	R1, R1
ADDS	R1, R4, R1
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;hepsi.h,671 :: 		for(i = 0; i < strlen(str); i++) {
ADDS	R5, R5, #1
UXTB	R5, R5
;hepsi.h,673 :: 		}
; i end address is: 20 (R5)
IT	AL
BAL	L_DeleteTrailingSpaces19
L_DeleteTrailingSpaces20:
;hepsi.h,674 :: 		}
IT	AL
BAL	L_DeleteTrailingSpaces22
; str end address is: 16 (R4)
L_DeleteTrailingSpaces18:
;hepsi.h,676 :: 		break;
IT	AL
BAL	L_DeleteTrailingSpaces17
L_DeleteTrailingSpaces22:
;hepsi.h,677 :: 		}
; str start address is: 16 (R4)
; str end address is: 16 (R4)
IT	AL
BAL	L_DeleteTrailingSpaces16
L_DeleteTrailingSpaces17:
;hepsi.h,678 :: 		}
L_end_DeleteTrailingSpaces:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DeleteTrailingSpaces
_DrawRoundButton:
;hepsi.h,680 :: 		void DrawRoundButton(TButton_Round *Around_button) {
; Around_button start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
;hepsi.h,681 :: 		if (Around_button->Visible == 1) {
; Around_button end address is: 0 (R0)
; Around_button start address is: 0 (R0)
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton23
;hepsi.h,682 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton24
;hepsi.h,683 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;hepsi.h,685 :: 		Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R5, R1
;hepsi.h,684 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
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
;hepsi.h,685 :: 		Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;hepsi.h,684 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;hepsi.h,686 :: 		}
IT	AL
BAL	L_DrawRoundButton25
L_DrawRoundButton24:
;hepsi.h,689 :: 		Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R5, R1
;hepsi.h,688 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
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
;hepsi.h,689 :: 		Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;hepsi.h,688 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;hepsi.h,690 :: 		}
L_DrawRoundButton25:
;hepsi.h,691 :: 		TFT_Set_Pen(Around_button->Pen_Color, Around_button->Pen_Width);
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
;hepsi.h,692 :: 		if (Around_button->Height > Around_button->Width) {
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
CMP	R2, R1
IT	LS
BLS	L_DrawRoundButton26
;hepsi.h,695 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
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
;hepsi.h,694 :: 		Around_button->Left + Around_button->Width - 2,
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #2
;hepsi.h,693 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
ADDS	R2, R2, #1
ADDS	R1, R4, #1
;hepsi.h,695 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
STR	R0, [SP, #4]
;hepsi.h,693 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
UXTH	R0, R1
UXTH	R1, R2
;hepsi.h,694 :: 		Around_button->Left + Around_button->Width - 2,
UXTH	R2, R3
;hepsi.h,695 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
UXTH	R3, R5
PUSH	(R6)
BL	_TFT_Rectangle_Round_Edges+0
ADD	SP, SP, #4
LDR	R0, [SP, #4]
;hepsi.h,696 :: 		}
IT	AL
BAL	L_DrawRoundButton27
L_DrawRoundButton26:
;hepsi.h,701 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
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
;hepsi.h,700 :: 		Around_button->Left + Around_button->Width - 2,
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #2
;hepsi.h,699 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
ADDS	R2, R2, #1
ADDS	R1, R4, #1
;hepsi.h,701 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
STR	R0, [SP, #4]
;hepsi.h,699 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
UXTH	R0, R1
UXTH	R1, R2
;hepsi.h,700 :: 		Around_button->Left + Around_button->Width - 2,
UXTH	R2, R3
;hepsi.h,701 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
UXTH	R3, R5
PUSH	(R6)
BL	_TFT_Rectangle_Round_Edges+0
ADD	SP, SP, #4
LDR	R0, [SP, #4]
;hepsi.h,702 :: 		}
L_DrawRoundButton27:
;hepsi.h,703 :: 		TFT_Set_Ext_Font(Around_button->FontName, Around_button->Font_Color, FO_HORIZONTAL);
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
;hepsi.h,704 :: 		TFT_Write_Text_Return_Pos(Around_button->Caption, Around_button->Left, Around_button->Top);
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
;hepsi.h,705 :: 		if (Around_button->TextAlign == _taLeft)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawRoundButton28
;hepsi.h,706 :: 		TFT_Write_Text(Around_button->Caption, Around_button->Left + 4, (Around_button->Top + ((Around_button->Height - caption_height) / 2)));
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
;hepsi.h,707 :: 		else if (Around_button->TextAlign == _taCenter)
; Around_button start address is: 0 (R0)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton30
;hepsi.h,708 :: 		TFT_Write_Text(Around_button->Caption, (Around_button->Left + (Around_button->Width - caption_length) / 2), (Around_button->Top + ((Around_button->Height - caption_height) / 2)));
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
;hepsi.h,709 :: 		else if (Around_button->TextAlign == _taRight)
; Around_button start address is: 0 (R0)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawRoundButton32
;hepsi.h,710 :: 		TFT_Write_Text(Around_button->Caption, Around_button->Left + (Around_button->Width - caption_length - 4), (Around_button->Top + (Around_button->Height - caption_height) / 2));
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
;hepsi.h,711 :: 		}
L_DrawRoundButton23:
;hepsi.h,712 :: 		}
L_end_DrawRoundButton:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawRoundButton
_DrawLabel:
;hepsi.h,714 :: 		void DrawLabel(TLabel *ALabel) {
; ALabel start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
;hepsi.h,715 :: 		if (ALabel->Visible == 1) {
; ALabel end address is: 0 (R0)
; ALabel start address is: 0 (R0)
ADDW	R1, R0, #26
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawLabel33
;hepsi.h,716 :: 		TFT_Set_Ext_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
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
;hepsi.h,717 :: 		TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
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
;hepsi.h,718 :: 		}
L_DrawLabel33:
;hepsi.h,719 :: 		}
L_end_DrawLabel:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawLabel
_DrawImage:
;hepsi.h,721 :: 		void DrawImage(TImage *AImage) {
; AImage start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;hepsi.h,722 :: 		if (AImage->Visible) {
; AImage end address is: 0 (R0)
; AImage start address is: 0 (R0)
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawImage34
;hepsi.h,723 :: 		TFT_Ext_Image(AImage->Left, AImage->Top, AImage->Picture_Name, AImage->Picture_Ratio);
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
;hepsi.h,724 :: 		}
L_DrawImage34:
;hepsi.h,725 :: 		}
L_end_DrawImage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DrawImage
_DrawRadioButton:
;hepsi.h,727 :: 		void DrawRadioButton(TRadioButton *ARadioButton) {
; ARadioButton start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
;hepsi.h,728 :: 		int circleOffset = 0;
; ARadioButton end address is: 0 (R0)
; ARadioButton start address is: 0 (R0)
;hepsi.h,729 :: 		if (ARadioButton->Visible == 1) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRadioButton35
;hepsi.h,730 :: 		circleOffset = ARadioButton->Height / 5;
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVS	R1, #5
UDIV	R1, R2, R1
; circleOffset start address is: 28 (R7)
SXTH	R7, R1
;hepsi.h,731 :: 		TFT_Set_Pen(ARadioButton->Pen_Color, ARadioButton->Pen_Width);
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
;hepsi.h,732 :: 		if (ARadioButton->TextAlign == _taLeft) {
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawRadioButton36
;hepsi.h,733 :: 		TFT_Set_Brush(ARadioButton->Transparent,ARadioButton->Background_Color,0,0,0,0);
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
;hepsi.h,734 :: 		TFT_Circle(ARadioButton->Left + ARadioButton->Height / 2, ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2);
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
;hepsi.h,735 :: 		if (ARadioButton->Checked == 1) {
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRadioButton37
;hepsi.h,736 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRadioButton38
;hepsi.h,737 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;hepsi.h,738 :: 		TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Press_Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_End_Color, ARadioButton->Gradient_Start_Color);
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
;hepsi.h,739 :: 		}
IT	AL
BAL	L_DrawRadioButton39
L_DrawRadioButton38:
;hepsi.h,741 :: 		TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_Start_Color, ARadioButton->Gradient_End_Color);
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
;hepsi.h,742 :: 		TFT_Circle(ARadioButton->Left + ARadioButton->Height / 2 , ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2 - circleOffset);
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
;hepsi.h,743 :: 		}
L_DrawRadioButton37:
;hepsi.h,744 :: 		TFT_Set_Ext_Font(ARadioButton->FontName, ARadioButton->Font_Color, FO_HORIZONTAL);
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
;hepsi.h,745 :: 		TFT_Write_Text_Return_Pos(ARadioButton->Caption, ARadioButton->Left + ARadioButton->Height + 4, ARadioButton->Top);
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
;hepsi.h,746 :: 		TFT_Write_Text(ARadioButton->Caption, ARadioButton->Left + ARadioButton->Height + 4, (ARadioButton->Top + ((ARadioButton->Height - caption_height) / 2)));
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
;hepsi.h,747 :: 		}
IT	AL
BAL	L_DrawRadioButton40
L_DrawRadioButton36:
;hepsi.h,748 :: 		else if (ARadioButton->TextAlign == _taRight) {
; circleOffset start address is: 28 (R7)
; ARadioButton start address is: 0 (R0)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawRadioButton41
;hepsi.h,749 :: 		TFT_Set_Brush(ARadioButton->Transparent,ARadioButton->Background_Color,0,0,0,0);
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
;hepsi.h,750 :: 		TFT_Circle(ARadioButton->Left  + ARadioButton->Width - ARadioButton->Height / 2, ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2);
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
;hepsi.h,751 :: 		if (ARadioButton->Checked == 1) {
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRadioButton42
;hepsi.h,752 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRadioButton43
;hepsi.h,753 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;hepsi.h,754 :: 		TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Press_Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_End_Color, ARadioButton->Gradient_Start_Color);
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
;hepsi.h,755 :: 		}
IT	AL
BAL	L_DrawRadioButton44
L_DrawRadioButton43:
;hepsi.h,757 :: 		TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_Start_Color, ARadioButton->Gradient_End_Color);
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
;hepsi.h,758 :: 		TFT_Circle(ARadioButton->Left  + ARadioButton->Width - ARadioButton->Height / 2, ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2 - circleOffset);
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
;hepsi.h,759 :: 		}
L_DrawRadioButton42:
;hepsi.h,760 :: 		TFT_Set_Ext_Font(ARadioButton->FontName, ARadioButton->Font_Color, FO_HORIZONTAL);
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
;hepsi.h,761 :: 		TFT_Write_Text_Return_Pos(ARadioButton->Caption, ARadioButton->Left + 3, ARadioButton->Top);
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
;hepsi.h,762 :: 		TFT_Write_Text(ARadioButton->Caption, ARadioButton->Left + 3, ARadioButton->Top + (ARadioButton->Height - caption_height) / 2);
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
;hepsi.h,763 :: 		}
L_DrawRadioButton41:
L_DrawRadioButton40:
;hepsi.h,764 :: 		}
L_DrawRadioButton35:
;hepsi.h,765 :: 		}
L_end_DrawRadioButton:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DrawRadioButton
_UpdatePBPosition:
;hepsi.h,767 :: 		void UpdatePBPosition(TProgressBar *AProgressBar) {
; AProgressBar start address is: 0 (R0)
SUB	SP, SP, #28
STR	LR, [SP, #0]
;hepsi.h,769 :: 		unsigned int locPosition = 0;
; AProgressBar end address is: 0 (R0)
; AProgressBar start address is: 0 (R0)
;hepsi.h,770 :: 		unsigned cnt = 0;
;hepsi.h,772 :: 		unsigned int tmpWidth = 0;
;hepsi.h,773 :: 		unsigned int tmpRound = 0;
;hepsi.h,774 :: 		move_offset = 10;
; move_offset start address is: 32 (R8)
MOVW	R8, #10
SXTH	R8, R8
;hepsi.h,775 :: 		locPosition = (float)(AProgressBar->Position - AProgressBar->Min) / (float)(AProgressBar->Max - AProgressBar->Min) * 100;
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
;hepsi.h,776 :: 		if (AProgressBar->Visible == 1) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_UpdatePBPosition45
;hepsi.h,777 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
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
;hepsi.h,778 :: 		TFT_Set_Pen(AProgressBar->Background_Color, AProgressBar->Pen_Width);
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
;hepsi.h,779 :: 		TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
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
;hepsi.h,780 :: 		if (caption_height >  AProgressBar->Height)
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	LS
BLS	L_UpdatePBPosition46
;hepsi.h,781 :: 		caption_height =  AProgressBar->Height;
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
STRH	R2, [R1, #0]
L_UpdatePBPosition46:
;hepsi.h,782 :: 		if (caption_length >  AProgressBar->Width)
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	LS
BLS	L_UpdatePBPosition47
;hepsi.h,783 :: 		caption_length =  AProgressBar->Width;
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
STRH	R2, [R1, #0]
L_UpdatePBPosition47:
;hepsi.h,784 :: 		if (AProgressBar->Position < (AProgressBar->Left + (AProgressBar->Width - caption_length) / 2)) {
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
;hepsi.h,788 :: 		AProgressBar->Top +(AProgressBar->Height - caption_height) / 2 + caption_height);
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
;hepsi.h,787 :: 		AProgressBar->Left + (AProgressBar->Width - caption_length) / 2 + caption_length,
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
;hepsi.h,788 :: 		AProgressBar->Top +(AProgressBar->Height - caption_height) / 2 + caption_height);
STRH	R7, [SP, #4]
STRH	R8, [SP, #6]
STR	R0, [SP, #8]
SXTH	R3, R5
;hepsi.h,785 :: 		TFT_Rectangle(AProgressBar->Left + (AProgressBar->Width - caption_length) / 2,
SXTH	R0, R2
;hepsi.h,787 :: 		AProgressBar->Left + (AProgressBar->Width - caption_length) / 2 + caption_length,
SXTH	R2, R1
;hepsi.h,786 :: 		AProgressBar->Top +(AProgressBar->Height - caption_height) / 2,
SXTH	R1, R6
;hepsi.h,788 :: 		AProgressBar->Top +(AProgressBar->Height - caption_height) / 2 + caption_height);
BL	_TFT_Rectangle+0
LDR	R0, [SP, #8]
LDRSH	R8, [SP, #6]
LDRH	R7, [SP, #4]
;hepsi.h,789 :: 		}
L_UpdatePBPosition48:
;hepsi.h,790 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
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
;hepsi.h,791 :: 		TFT_Set_Pen(AProgressBar->Pen_Color, AProgressBar->Pen_Width);
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
;hepsi.h,792 :: 		if (AProgressBar->Rounded == 1) {
ADDW	R1, R0, #53
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_UpdatePBPosition49
;hepsi.h,793 :: 		if (locPosition > 0) {
CMP	R7, #0
IT	LS
BLS	L_UpdatePBPosition50
;hepsi.h,795 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
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
;hepsi.h,796 :: 		TFT_Rectangle(AProgressBar->Left + AProgressBar->Corner_Radius, AProgressBar->Top,  AProgressBar->Left + AProgressBar->Corner_Radius  + locPosition *  (AProgressBar->Width-AProgressBar->Corner_Radius*2) / 100 , AProgressBar->Top + AProgressBar->Height);
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
;hepsi.h,797 :: 		}
L_UpdatePBPosition50:
;hepsi.h,798 :: 		}
IT	AL
BAL	L_UpdatePBPosition51
L_UpdatePBPosition49:
;hepsi.h,800 :: 		if (locPosition > 0) {
CMP	R7, #0
IT	LS
BLS	L_UpdatePBPosition52
;hepsi.h,801 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
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
;hepsi.h,802 :: 		TFT_Rectangle(AProgressBar->Left, AProgressBar->Top,  AProgressBar->Left + (locPosition * AProgressBar->Width) / 100, AProgressBar->Top + AProgressBar->Height);
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
;hepsi.h,803 :: 		}
L_UpdatePBPosition52:
;hepsi.h,804 :: 		}
L_UpdatePBPosition51:
;hepsi.h,806 :: 		if (AProgressBar->Smooth != 1) {
ADDW	R1, R0, #52
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	EQ
BEQ	L__UpdatePBPosition767
;hepsi.h,807 :: 		if(AProgressBar->Rounded == 1) {
ADDW	R1, R0, #53
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_UpdatePBPosition54
;hepsi.h,808 :: 		tmpRound = AProgressBar->Corner_Radius;
ADDW	R1, R0, #54
LDRB	R3, [R1, #0]
; tmpRound start address is: 16 (R4)
UXTB	R4, R3
;hepsi.h,809 :: 		cnt = move_offset + tmpRound;
ADD	R10, R8, R4, LSL #0
UXTH	R10, R10
; cnt start address is: 40 (R10)
;hepsi.h,810 :: 		tmpWidth = AProgressBar->Width - AProgressBar->Corner_Radius * 2;
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
LSLS	R1, R3, #1
SXTH	R1, R1
SUB	R9, R2, R1, LSL #0
UXTH	R9, R9
; tmpWidth start address is: 36 (R9)
;hepsi.h,811 :: 		}
UXTH	R5, R4
; tmpRound end address is: 16 (R4)
; tmpWidth end address is: 36 (R9)
; cnt end address is: 40 (R10)
IT	AL
BAL	L_UpdatePBPosition55
L_UpdatePBPosition54:
;hepsi.h,813 :: 		tmpRound = 0;
; tmpRound start address is: 20 (R5)
MOVS	R5, #0
;hepsi.h,814 :: 		cnt = move_offset;
; cnt start address is: 40 (R10)
UXTH	R10, R8
;hepsi.h,815 :: 		tmpWidth = AProgressBar->Width;
ADDW	R1, R0, #10
LDRH	R9, [R1, #0]
; tmpWidth start address is: 36 (R9)
; tmpRound end address is: 20 (R5)
; tmpWidth end address is: 36 (R9)
; cnt end address is: 40 (R10)
;hepsi.h,816 :: 		}
L_UpdatePBPosition55:
;hepsi.h,817 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
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
;hepsi.h,818 :: 		while (cnt-tmpRound < (locPosition * tmpWidth) / 100) {
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
;hepsi.h,819 :: 		if  (cnt - tmpRound + 3 >=  tmpWidth * locPosition)
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
;hepsi.h,820 :: 		TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top, AProgressBar->Left + tmpRound  + tmpWidth * locPosition , AProgressBar->Top + AProgressBar->Height);
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
;hepsi.h,822 :: 		TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top,  AProgressBar->Left + cnt + 3, AProgressBar->Top + AProgressBar->Height);
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
;hepsi.h,823 :: 		cnt = cnt + move_offset + 3;
ADD	R1, R10, R11, LSL #0
UXTH	R1, R1
; cnt end address is: 40 (R10)
ADDS	R1, R1, #3
; cnt start address is: 40 (R10)
UXTH	R10, R1
;hepsi.h,824 :: 		}
; tmpRound end address is: 32 (R8)
; tmpWidth end address is: 36 (R9)
; move_offset end address is: 44 (R11)
; cnt end address is: 40 (R10)
IT	AL
BAL	L_UpdatePBPosition56
L_UpdatePBPosition57:
;hepsi.h,825 :: 		}
; AProgressBar end address is: 0 (R0)
UXTH	R2, R7
IT	AL
BAL	L_UpdatePBPosition53
; locPosition end address is: 28 (R7)
L__UpdatePBPosition767:
;hepsi.h,806 :: 		if (AProgressBar->Smooth != 1) {
UXTH	R2, R7
;hepsi.h,825 :: 		}
L_UpdatePBPosition53:
;hepsi.h,827 :: 		if (AProgressBar->Show_Position == 1){
; locPosition start address is: 8 (R2)
; AProgressBar start address is: 0 (R0)
ADDW	R1, R0, #50
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_UpdatePBPosition60
;hepsi.h,828 :: 		if (AProgressBar->Show_Percentage == 1) {
ADDW	R1, R0, #51
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_UpdatePBPosition61
;hepsi.h,829 :: 		IntToStr(locPosition , tmpStr);
ADD	R1, SP, #18
STR	R0, [SP, #4]
SXTH	R0, R2
; locPosition end address is: 8 (R2)
BL	_IntToStr+0
;hepsi.h,830 :: 		DeleteTrailingSpaces(tmpStr);
ADD	R1, SP, #18
MOV	R0, R1
BL	_DeleteTrailingSpaces+0
LDR	R0, [SP, #4]
;hepsi.h,831 :: 		strcpy(AProgressBar->Caption, tmpStr);
ADD	R2, SP, #18
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
BL	_strcpy+0
LDR	R0, [SP, #4]
;hepsi.h,832 :: 		strcat(AProgressBar->Caption, "\%");
MOVW	R2, #lo_addr(?lstr5_FISHER_GUI_main+0)
MOVT	R2, #hi_addr(?lstr5_FISHER_GUI_main+0)
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
LDR	R0, [SP, #4]
;hepsi.h,833 :: 		}
IT	AL
BAL	L_UpdatePBPosition62
L_UpdatePBPosition61:
;hepsi.h,835 :: 		IntToStr(AProgressBar->Position , tmpStr);
ADD	R2, SP, #18
ADDW	R1, R0, #48
LDRH	R1, [R1, #0]
SXTH	R1, R1
STR	R0, [SP, #4]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
;hepsi.h,836 :: 		DeleteTrailingSpaces(tmpStr);
ADD	R1, SP, #18
MOV	R0, R1
BL	_DeleteTrailingSpaces+0
LDR	R0, [SP, #4]
;hepsi.h,837 :: 		strcpy(AProgressBar->Caption, tmpStr);
ADD	R2, SP, #18
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
BL	_strcpy+0
LDR	R0, [SP, #4]
;hepsi.h,838 :: 		}
L_UpdatePBPosition62:
;hepsi.h,839 :: 		TFT_Set_Ext_Font(AProgressBar->FontName, AProgressBar->Font_Color, FO_HORIZONTAL);
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
;hepsi.h,840 :: 		TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
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
;hepsi.h,841 :: 		TFT_Write_Text(AProgressBar->Caption, AProgressBar->Left + (AProgressBar->Width - caption_length) / 2, AProgressBar->Top + (AProgressBar->Height - caption_height) / 2);
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
;hepsi.h,842 :: 		}
L_UpdatePBPosition60:
;hepsi.h,843 :: 		}
L_UpdatePBPosition45:
;hepsi.h,844 :: 		}
L_end_UpdatePBPosition:
LDR	LR, [SP, #0]
ADD	SP, SP, #28
BX	LR
; end of _UpdatePBPosition
_DrawProgressBar:
;hepsi.h,846 :: 		void DrawProgressBar(TProgressBar *AProgressBar) {
; AProgressBar start address is: 0 (R0)
SUB	SP, SP, #28
STR	LR, [SP, #0]
;hepsi.h,847 :: 		int move_offset = 0;
; AProgressBar end address is: 0 (R0)
; AProgressBar start address is: 0 (R0)
;hepsi.h,848 :: 		unsigned int locPosition = 0;
;hepsi.h,849 :: 		unsigned cnt = 0;
;hepsi.h,851 :: 		unsigned int tmpWidth = 0;
;hepsi.h,852 :: 		unsigned int tmpRound = 0;
;hepsi.h,853 :: 		move_offset = 10;
MOVS	R1, #10
SXTH	R1, R1
STRH	R1, [SP, #18]
;hepsi.h,854 :: 		locPosition = (float)(AProgressBar->Position - AProgressBar->Min) / (float)(AProgressBar->Max - AProgressBar->Min) * 100;
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
;hepsi.h,855 :: 		if (AProgressBar->Visible == 1) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawProgressBar63
;hepsi.h,856 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
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
;hepsi.h,857 :: 		TFT_Set_Pen(AProgressBar->Pen_Color, AProgressBar->Pen_Width);
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
;hepsi.h,858 :: 		if (AProgressBar->Rounded == 1) {
ADDW	R1, R0, #53
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawProgressBar64
;hepsi.h,860 :: 		TFT_Rectangle_Round_Edges(AProgressBar->Left, AProgressBar->Top,  AProgressBar->Left + AProgressBar->Width, AProgressBar->Top + AProgressBar->Height, AProgressBar->Corner_Radius);
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
;hepsi.h,861 :: 		if (locPosition > 0) {
LDRH	R1, [SP, #20]
CMP	R1, #0
IT	LS
BLS	L_DrawProgressBar65
;hepsi.h,863 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
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
;hepsi.h,864 :: 		TFT_Rectangle(AProgressBar->Left + AProgressBar->Corner_Radius, AProgressBar->Top,  AProgressBar->Left + AProgressBar->Corner_Radius   + locPosition *  (AProgressBar->Width-AProgressBar->Corner_Radius*2) / 100, AProgressBar->Top + AProgressBar->Height);
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
;hepsi.h,865 :: 		}
L_DrawProgressBar65:
;hepsi.h,866 :: 		}
IT	AL
BAL	L_DrawProgressBar66
L_DrawProgressBar64:
;hepsi.h,869 :: 		TFT_Rectangle(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + AProgressBar->Width, AProgressBar->Top + AProgressBar->Height);
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
;hepsi.h,870 :: 		if (locPosition > 0) {
LDRH	R1, [SP, #20]
CMP	R1, #0
IT	LS
BLS	L_DrawProgressBar67
;hepsi.h,872 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
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
;hepsi.h,873 :: 		TFT_Rectangle(AProgressBar->Left, AProgressBar->Top,  AProgressBar->Left + (locPosition * AProgressBar->Width) / 100, AProgressBar->Top + AProgressBar->Height);
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
;hepsi.h,874 :: 		}
L_DrawProgressBar67:
;hepsi.h,875 :: 		}
L_DrawProgressBar66:
;hepsi.h,877 :: 		if (AProgressBar->Smooth != 1) {
ADDW	R1, R0, #52
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	EQ
BEQ	L__DrawProgressBar768
;hepsi.h,878 :: 		if(AProgressBar->Rounded == 1) {
ADDW	R1, R0, #53
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawProgressBar69
;hepsi.h,879 :: 		tmpRound = AProgressBar->Corner_Radius;
ADDW	R1, R0, #54
LDRB	R3, [R1, #0]
STRH	R3, [SP, #24]
;hepsi.h,880 :: 		cnt = move_offset + tmpRound;
LDRH	R2, [SP, #24]
LDRSH	R1, [SP, #18]
ADD	R10, R1, R2, LSL #0
UXTH	R10, R10
; cnt start address is: 40 (R10)
;hepsi.h,881 :: 		tmpWidth = AProgressBar->Width - AProgressBar->Corner_Radius * 2;
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
LSLS	R1, R3, #1
SXTH	R1, R1
SUB	R1, R2, R1
STRH	R1, [SP, #22]
;hepsi.h,882 :: 		}
; cnt end address is: 40 (R10)
IT	AL
BAL	L_DrawProgressBar70
L_DrawProgressBar69:
;hepsi.h,884 :: 		tmpRound = 0;
MOVS	R1, #0
STRH	R1, [SP, #24]
;hepsi.h,885 :: 		cnt = move_offset;
; cnt start address is: 40 (R10)
LDRSH	R10, [SP, #18]
;hepsi.h,886 :: 		tmpWidth = AProgressBar->Width;
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
STRH	R1, [SP, #22]
; cnt end address is: 40 (R10)
;hepsi.h,887 :: 		}
L_DrawProgressBar70:
;hepsi.h,888 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
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
;hepsi.h,889 :: 		while (cnt-tmpRound < (locPosition * tmpWidth) / 100) {
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
;hepsi.h,890 :: 		if  (cnt - tmpRound + 3 >=  tmpWidth * locPosition)
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
;hepsi.h,891 :: 		TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top, AProgressBar->Left + tmpRound  + tmpWidth * locPosition , AProgressBar->Top + AProgressBar->Height);
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
;hepsi.h,893 :: 		TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top,  AProgressBar->Left + cnt + 3, AProgressBar->Top + AProgressBar->Height);
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
;hepsi.h,894 :: 		cnt = cnt + move_offset + 3;
LDRSH	R1, [SP, #18]
ADDS	R1, R7, R1
UXTH	R1, R1
; cnt end address is: 28 (R7)
ADDS	R1, R1, #3
; cnt start address is: 40 (R10)
UXTH	R10, R1
;hepsi.h,895 :: 		}
; cnt end address is: 40 (R10)
UXTH	R7, R10
IT	AL
BAL	L_DrawProgressBar71
L_DrawProgressBar72:
;hepsi.h,896 :: 		}
IT	AL
BAL	L_DrawProgressBar68
; AProgressBar end address is: 0 (R0)
L__DrawProgressBar768:
;hepsi.h,877 :: 		if (AProgressBar->Smooth != 1) {
;hepsi.h,896 :: 		}
L_DrawProgressBar68:
;hepsi.h,898 :: 		if (AProgressBar->Show_Position == 1){
; AProgressBar start address is: 0 (R0)
ADDW	R1, R0, #50
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawProgressBar75
;hepsi.h,899 :: 		if (AProgressBar->Show_Percentage == 1) {
ADDW	R1, R0, #51
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawProgressBar76
;hepsi.h,900 :: 		IntToStr(locPosition , tmpStr);
ADD	R1, SP, #10
STR	R0, [SP, #4]
LDRH	R0, [SP, #20]
BL	_IntToStr+0
;hepsi.h,901 :: 		DeleteTrailingSpaces(tmpStr);
ADD	R1, SP, #10
MOV	R0, R1
BL	_DeleteTrailingSpaces+0
LDR	R0, [SP, #4]
;hepsi.h,902 :: 		strcpy(AProgressBar->Caption, tmpStr);
ADD	R2, SP, #10
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
BL	_strcpy+0
LDR	R0, [SP, #4]
;hepsi.h,903 :: 		strcat(AProgressBar->Caption, "\%");
MOVW	R2, #lo_addr(?lstr6_FISHER_GUI_main+0)
MOVT	R2, #hi_addr(?lstr6_FISHER_GUI_main+0)
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
LDR	R0, [SP, #4]
;hepsi.h,904 :: 		}
IT	AL
BAL	L_DrawProgressBar77
L_DrawProgressBar76:
;hepsi.h,906 :: 		IntToStr(AProgressBar->Position , tmpStr);
ADD	R2, SP, #10
ADDW	R1, R0, #48
LDRH	R1, [R1, #0]
SXTH	R1, R1
STR	R0, [SP, #4]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
;hepsi.h,907 :: 		DeleteTrailingSpaces(tmpStr);
ADD	R1, SP, #10
MOV	R0, R1
BL	_DeleteTrailingSpaces+0
LDR	R0, [SP, #4]
;hepsi.h,908 :: 		strcpy(AProgressBar->Caption, tmpStr);
ADD	R2, SP, #10
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
BL	_strcpy+0
LDR	R0, [SP, #4]
;hepsi.h,909 :: 		}
L_DrawProgressBar77:
;hepsi.h,910 :: 		TFT_Set_Ext_Font(AProgressBar->FontName, AProgressBar->Font_Color, FO_HORIZONTAL);
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
;hepsi.h,911 :: 		TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
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
;hepsi.h,912 :: 		TFT_Write_Text(AProgressBar->Caption, AProgressBar->Left + (AProgressBar->Width - caption_length) / 2, AProgressBar->Top + (AProgressBar->Height - caption_height) / 2);
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
;hepsi.h,913 :: 		}
L_DrawProgressBar75:
;hepsi.h,914 :: 		}
L_DrawProgressBar63:
;hepsi.h,915 :: 		}
L_end_DrawProgressBar:
LDR	LR, [SP, #0]
ADD	SP, SP, #28
BX	LR
; end of _DrawProgressBar
_DrawScreen:
;hepsi.h,917 :: 		void DrawScreen(TScreen *aScreen) {
; aScreen start address is: 0 (R0)
SUB	SP, SP, #64
STR	LR, [SP, #0]
;hepsi.h,931 :: 		object_pressed = 0;
; aScreen end address is: 0 (R0)
; aScreen start address is: 0 (R0)
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;hepsi.h,932 :: 		order = 0;
MOVS	R1, #0
SXTH	R1, R1
STRH	R1, [SP, #4]
;hepsi.h,933 :: 		round_button_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #6]
;hepsi.h,934 :: 		label_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #12]
;hepsi.h,935 :: 		image_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #20]
;hepsi.h,936 :: 		radio_button_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #28]
;hepsi.h,937 :: 		progress_bar_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #36]
;hepsi.h,938 :: 		CurrentScreen = aScreen;
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
STR	R0, [R1, #0]
;hepsi.h,940 :: 		if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
ADDS	R1, R0, #2
; aScreen end address is: 0 (R0)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen771
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
BNE	L__DrawScreen770
IT	AL
BAL	L_DrawScreen80
L__DrawScreen771:
L__DrawScreen770:
;hepsi.h,941 :: 		save_bled = TFT_BLED;
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
STR	R2, [SP, #60]
LDR	R1, [R2, #0]
STRB	R1, [SP, #44]
;hepsi.h,942 :: 		TFT_BLED           = 0;
MOVS	R1, #0
SXTB	R1, R1
STR	R1, [R2, #0]
;hepsi.h,943 :: 		TFT_Init(CurrentScreen->Width, CurrentScreen->Height);
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
;hepsi.h,944 :: 		TFT_Set_Ext_Buffer(TFT_Get_Data);
MOVW	R1, #lo_addr(_TFT_Get_Data+0)
MOVT	R1, #hi_addr(_TFT_Get_Data+0)
MOV	R0, R1
BL	_TFT_Set_Ext_Buffer+0
;hepsi.h,945 :: 		TP_TFT_Init(CurrentScreen->Width, CurrentScreen->Height, 8, 9);                                  // Initialize touch panel
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
;hepsi.h,946 :: 		TP_TFT_Set_ADC_Threshold(ADC_THRESHOLD);                              // Set touch panel ADC threshold
MOVW	R0, #1500
SXTH	R0, R0
BL	_TP_TFT_Set_ADC_Threshold+0
;hepsi.h,947 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
;hepsi.h,948 :: 		display_width = CurrentScreen->Width;
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
STRH	R2, [R1, #0]
;hepsi.h,949 :: 		display_height = CurrentScreen->Height;
LDR	R1, [SP, #56]
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
STRH	R2, [R1, #0]
;hepsi.h,950 :: 		TFT_BLED           = save_bled;
LDRB	R2, [SP, #44]
LDR	R1, [SP, #60]
STR	R2, [R1, #0]
;hepsi.h,951 :: 		}
IT	AL
BAL	L_DrawScreen81
L_DrawScreen80:
;hepsi.h,953 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
L_DrawScreen81:
;hepsi.h,956 :: 		while (order < CurrentScreen->ObjectsCount) {
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
;hepsi.h,957 :: 		if (round_button_idx < CurrentScreen->Buttons_RoundCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #8
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #6]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen84
;hepsi.h,958 :: 		local_round_button = GetRoundButton(round_button_idx);
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
;hepsi.h,959 :: 		if (order == local_round_button->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRSH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen85
;hepsi.h,960 :: 		order++;
LDRSH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;hepsi.h,961 :: 		round_button_idx++;
LDRB	R1, [SP, #6]
ADDS	R1, R1, #1
STRB	R1, [SP, #6]
;hepsi.h,962 :: 		DrawRoundButton(local_round_button);
LDR	R0, [SP, #8]
BL	_DrawRoundButton+0
;hepsi.h,963 :: 		}
L_DrawScreen85:
;hepsi.h,964 :: 		}
L_DrawScreen84:
;hepsi.h,966 :: 		if (label_idx < CurrentScreen->LabelsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #16
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #12]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen86
;hepsi.h,967 :: 		local_label = GetLabel(label_idx);
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
;hepsi.h,968 :: 		if (order == local_label->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRSH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen87
;hepsi.h,969 :: 		label_idx++;
LDRB	R1, [SP, #12]
ADDS	R1, R1, #1
STRB	R1, [SP, #12]
;hepsi.h,970 :: 		order++;
LDRSH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;hepsi.h,971 :: 		DrawLabel(local_label);
LDR	R0, [SP, #16]
BL	_DrawLabel+0
;hepsi.h,972 :: 		}
L_DrawScreen87:
;hepsi.h,973 :: 		}
L_DrawScreen86:
;hepsi.h,975 :: 		if (image_idx  < CurrentScreen->ImagesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #24
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #20]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen88
;hepsi.h,976 :: 		local_image = GetImage(image_idx);
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
;hepsi.h,977 :: 		if (order == local_image->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRSH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen89
;hepsi.h,978 :: 		image_idx++;
LDRB	R1, [SP, #20]
ADDS	R1, R1, #1
STRB	R1, [SP, #20]
;hepsi.h,979 :: 		order++;
LDRSH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;hepsi.h,980 :: 		DrawImage(local_image);
LDR	R0, [SP, #24]
BL	_DrawImage+0
;hepsi.h,981 :: 		}
L_DrawScreen89:
;hepsi.h,982 :: 		}
L_DrawScreen88:
;hepsi.h,984 :: 		if (radio_button_idx  < CurrentScreen->RadioButtonsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #32
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #28]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen90
;hepsi.h,985 :: 		local_radio_button = GetRadioButton(radio_button_idx);
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
;hepsi.h,986 :: 		if (order == local_radio_button->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRSH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen91
;hepsi.h,987 :: 		radio_button_idx++;
LDRB	R1, [SP, #28]
ADDS	R1, R1, #1
STRB	R1, [SP, #28]
;hepsi.h,988 :: 		order++;
LDRSH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;hepsi.h,989 :: 		DrawRadioButton(local_radio_button);
LDR	R0, [SP, #32]
BL	_DrawRadioButton+0
;hepsi.h,990 :: 		}
L_DrawScreen91:
;hepsi.h,991 :: 		}
L_DrawScreen90:
;hepsi.h,993 :: 		if (progress_bar_idx  < CurrentScreen->ProgressBarsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #40
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #36]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen92
;hepsi.h,994 :: 		local_progress_bar = GetProgressBar(progress_bar_idx);
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
;hepsi.h,995 :: 		if (order == local_progress_bar->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRSH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen93
;hepsi.h,996 :: 		progress_bar_idx++;
LDRB	R1, [SP, #36]
ADDS	R1, R1, #1
STRB	R1, [SP, #36]
;hepsi.h,997 :: 		order++;
LDRSH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;hepsi.h,998 :: 		DrawProgressBar(local_progress_bar);
LDR	R0, [SP, #40]
BL	_DrawProgressBar+0
;hepsi.h,999 :: 		}
L_DrawScreen93:
;hepsi.h,1000 :: 		}
L_DrawScreen92:
;hepsi.h,1002 :: 		}
IT	AL
BAL	L_DrawScreen82
L_DrawScreen83:
;hepsi.h,1003 :: 		}
L_end_DrawScreen:
LDR	LR, [SP, #0]
ADD	SP, SP, #64
BX	LR
; end of _DrawScreen
_Get_Object:
;hepsi.h,1005 :: 		void Get_Object(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
;hepsi.h,1006 :: 		round_button_order  = -1;
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
STRH	R3, [R2, #0]
;hepsi.h,1007 :: 		label_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;hepsi.h,1008 :: 		image_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
STRH	R3, [R2, #0]
;hepsi.h,1009 :: 		radio_button_order    = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
STRH	R3, [R2, #0]
;hepsi.h,1010 :: 		progress_bar_order    = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_progress_bar_order+0)
MOVT	R2, #hi_addr(_progress_bar_order+0)
STRH	R3, [R2, #0]
;hepsi.h,1012 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
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
;hepsi.h,1013 :: 		local_round_button = GetRoundButton(_object_count);
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
;hepsi.h,1014 :: 		if (local_round_button->Active == 1) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object97
;hepsi.h,1016 :: 		local_round_button->Width, local_round_button->Height) == 1) {
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
;hepsi.h,1015 :: 		if (IsInsideObject(X, Y, local_round_button->Left, local_round_button->Top,
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
;hepsi.h,1016 :: 		local_round_button->Width, local_round_button->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	FISHER_GUI_main_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object98
;hepsi.h,1017 :: 		round_button_order = local_round_button->Order;
MOVW	R4, #lo_addr(_local_round_button+0)
MOVT	R4, #hi_addr(_local_round_button+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
STRH	R3, [R2, #0]
;hepsi.h,1018 :: 		exec_round_button = local_round_button;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;hepsi.h,1019 :: 		}
L_Get_Object98:
;hepsi.h,1020 :: 		}
L_Get_Object97:
;hepsi.h,1012 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;hepsi.h,1021 :: 		}
IT	AL
BAL	L_Get_Object94
L_Get_Object95:
;hepsi.h,1024 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
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
;hepsi.h,1025 :: 		local_label = GetLabel(_object_count);
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
;hepsi.h,1026 :: 		if (local_label->Active == 1) {
ADDW	R2, R3, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object102
;hepsi.h,1028 :: 		local_label->Width, local_label->Height) == 1) {
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
;hepsi.h,1027 :: 		if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
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
;hepsi.h,1028 :: 		local_label->Width, local_label->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	FISHER_GUI_main_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object103
;hepsi.h,1029 :: 		label_order = local_label->Order;
MOVW	R4, #lo_addr(_local_label+0)
MOVT	R4, #hi_addr(_local_label+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;hepsi.h,1030 :: 		exec_label = local_label;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;hepsi.h,1031 :: 		}
L_Get_Object103:
;hepsi.h,1032 :: 		}
L_Get_Object102:
;hepsi.h,1024 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;hepsi.h,1033 :: 		}
IT	AL
BAL	L_Get_Object99
L_Get_Object100:
;hepsi.h,1036 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
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
;hepsi.h,1037 :: 		local_image = GetImage(_object_count);
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
;hepsi.h,1038 :: 		if (local_image->Active == 1) {
ADDW	R2, R3, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object107
;hepsi.h,1040 :: 		local_image->Width, local_image->Height) == 1) {
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
;hepsi.h,1039 :: 		if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
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
;hepsi.h,1040 :: 		local_image->Width, local_image->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	FISHER_GUI_main_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object108
;hepsi.h,1041 :: 		image_order = local_image->Order;
MOVW	R4, #lo_addr(_local_image+0)
MOVT	R4, #hi_addr(_local_image+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
STRH	R3, [R2, #0]
;hepsi.h,1042 :: 		exec_image = local_image;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;hepsi.h,1043 :: 		}
L_Get_Object108:
;hepsi.h,1044 :: 		}
L_Get_Object107:
;hepsi.h,1036 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;hepsi.h,1045 :: 		}
IT	AL
BAL	L_Get_Object104
L_Get_Object105:
;hepsi.h,1048 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->RadioButtonsCount ; _object_count++ ) {
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
;hepsi.h,1049 :: 		local_radio_button = GetRadioButton(_object_count);
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
;hepsi.h,1050 :: 		if (local_radio_button->Active == 1) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object112
;hepsi.h,1052 :: 		local_radio_button->Width, local_radio_button->Height) == 1) {
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
;hepsi.h,1051 :: 		if (IsInsideObject(X, Y, local_radio_button->Left, local_radio_button->Top,
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
;hepsi.h,1052 :: 		local_radio_button->Width, local_radio_button->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	FISHER_GUI_main_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object113
;hepsi.h,1053 :: 		radio_button_order = local_radio_button->Order;
MOVW	R4, #lo_addr(_local_radio_button+0)
MOVT	R4, #hi_addr(_local_radio_button+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
STRH	R3, [R2, #0]
;hepsi.h,1054 :: 		exec_radio_button = local_radio_button;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
STR	R3, [R2, #0]
;hepsi.h,1055 :: 		}
L_Get_Object113:
;hepsi.h,1056 :: 		}
L_Get_Object112:
;hepsi.h,1048 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->RadioButtonsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;hepsi.h,1057 :: 		}
IT	AL
BAL	L_Get_Object109
L_Get_Object110:
;hepsi.h,1060 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ProgressBarsCount ; _object_count++ ) {
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
;hepsi.h,1061 :: 		local_progress_bar = GetProgressBar(_object_count);
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
;hepsi.h,1062 :: 		if (local_progress_bar->Active == 1) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object117
;hepsi.h,1064 :: 		local_progress_bar->Width, local_progress_bar->Height) == 1) {
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
;hepsi.h,1063 :: 		if (IsInsideObject(X, Y, local_progress_bar->Left, local_progress_bar->Top,
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
;hepsi.h,1064 :: 		local_progress_bar->Width, local_progress_bar->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	FISHER_GUI_main_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object118
;hepsi.h,1065 :: 		progress_bar_order = local_progress_bar->Order;
MOVW	R4, #lo_addr(_local_progress_bar+0)
MOVT	R4, #hi_addr(_local_progress_bar+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_progress_bar_order+0)
MOVT	R2, #hi_addr(_progress_bar_order+0)
STRH	R3, [R2, #0]
;hepsi.h,1066 :: 		exec_progress_bar = local_progress_bar;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_progress_bar+0)
MOVT	R2, #hi_addr(_exec_progress_bar+0)
STR	R3, [R2, #0]
;hepsi.h,1067 :: 		}
L_Get_Object118:
;hepsi.h,1068 :: 		}
L_Get_Object117:
;hepsi.h,1060 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ProgressBarsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;hepsi.h,1069 :: 		}
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
IT	AL
BAL	L_Get_Object114
L_Get_Object115:
;hepsi.h,1071 :: 		_object_count = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
;hepsi.h,1072 :: 		if (round_button_order > _object_count)
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	LE
BLE	L_Get_Object119
;hepsi.h,1073 :: 		_object_count = round_button_order;
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object119:
;hepsi.h,1074 :: 		if (label_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object120
;hepsi.h,1075 :: 		_object_count = label_order;
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object120:
;hepsi.h,1076 :: 		if (image_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object121
;hepsi.h,1077 :: 		_object_count = image_order;
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object121:
;hepsi.h,1078 :: 		if (radio_button_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object122
;hepsi.h,1079 :: 		_object_count = radio_button_order;
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object122:
;hepsi.h,1080 :: 		if (progress_bar_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_progress_bar_order+0)
MOVT	R2, #hi_addr(_progress_bar_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object123
;hepsi.h,1081 :: 		_object_count = progress_bar_order;
MOVW	R2, #lo_addr(_progress_bar_order+0)
MOVT	R2, #hi_addr(_progress_bar_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object123:
;hepsi.h,1082 :: 		}
L_end_Get_Object:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Get_Object
FISHER_GUI_main_Process_TP_Press:
;hepsi.h,1085 :: 		static void Process_TP_Press(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;hepsi.h,1086 :: 		exec_round_button   = 0;
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;hepsi.h,1087 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;hepsi.h,1088 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;hepsi.h,1089 :: 		exec_radio_button     = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
STR	R3, [R2, #0]
;hepsi.h,1090 :: 		exec_progress_bar     = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_progress_bar+0)
MOVT	R2, #hi_addr(_exec_progress_bar+0)
STR	R3, [R2, #0]
;hepsi.h,1092 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;hepsi.h,1095 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_FISHER_GUI_main_Process_TP_Press124
;hepsi.h,1096 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Press125
;hepsi.h,1097 :: 		if (exec_round_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Press126
;hepsi.h,1098 :: 		if (exec_round_button->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_main_Process_TP_Press127
;hepsi.h,1099 :: 		exec_round_button->OnPressPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R2, [R4, #0]
BLX	R2
;hepsi.h,1100 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;hepsi.h,1101 :: 		}
L_FISHER_GUI_main_Process_TP_Press127:
;hepsi.h,1102 :: 		}
L_FISHER_GUI_main_Process_TP_Press126:
;hepsi.h,1103 :: 		}
L_FISHER_GUI_main_Process_TP_Press125:
;hepsi.h,1105 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Press128
;hepsi.h,1106 :: 		if (exec_label->Active == 1) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Press129
;hepsi.h,1107 :: 		if (exec_label->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_main_Process_TP_Press130
;hepsi.h,1108 :: 		exec_label->OnPressPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
;hepsi.h,1109 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;hepsi.h,1110 :: 		}
L_FISHER_GUI_main_Process_TP_Press130:
;hepsi.h,1111 :: 		}
L_FISHER_GUI_main_Process_TP_Press129:
;hepsi.h,1112 :: 		}
L_FISHER_GUI_main_Process_TP_Press128:
;hepsi.h,1114 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Press131
;hepsi.h,1115 :: 		if (exec_image->Active == 1) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Press132
;hepsi.h,1116 :: 		if (exec_image->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_main_Process_TP_Press133
;hepsi.h,1117 :: 		exec_image->OnPressPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;hepsi.h,1118 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;hepsi.h,1119 :: 		}
L_FISHER_GUI_main_Process_TP_Press133:
;hepsi.h,1120 :: 		}
L_FISHER_GUI_main_Process_TP_Press132:
;hepsi.h,1121 :: 		}
L_FISHER_GUI_main_Process_TP_Press131:
;hepsi.h,1123 :: 		if (_object_count == radio_button_order) {
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Press134
;hepsi.h,1124 :: 		if (exec_radio_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Press135
;hepsi.h,1125 :: 		if (exec_radio_button->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_main_Process_TP_Press136
;hepsi.h,1126 :: 		exec_radio_button->OnPressPtr();
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R2, [R4, #0]
BLX	R2
;hepsi.h,1127 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;hepsi.h,1128 :: 		}
L_FISHER_GUI_main_Process_TP_Press136:
;hepsi.h,1129 :: 		}
L_FISHER_GUI_main_Process_TP_Press135:
;hepsi.h,1130 :: 		}
L_FISHER_GUI_main_Process_TP_Press134:
;hepsi.h,1132 :: 		}
L_FISHER_GUI_main_Process_TP_Press124:
;hepsi.h,1133 :: 		}
L_end_Process_TP_Press:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of FISHER_GUI_main_Process_TP_Press
FISHER_GUI_main_Process_TP_Up:
;hepsi.h,1135 :: 		static void Process_TP_Up(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
;hepsi.h,1137 :: 		switch (PressedObjectType) {
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
IT	AL
BAL	L_FISHER_GUI_main_Process_TP_Up137
;hepsi.h,1139 :: 		case 1: {
L_FISHER_GUI_main_Process_TP_Up139:
;hepsi.h,1140 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_FISHER_GUI_main_Process_TP_Up140
;hepsi.h,1141 :: 		exec_round_button = (TButton_Round*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;hepsi.h,1142 :: 		if ((exec_round_button->PressColEnabled == 1) && (exec_round_button->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #47
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Up775
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Up774
L_FISHER_GUI_main_Process_TP_Up773:
;hepsi.h,1143 :: 		DrawRoundButton(exec_round_button);
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawRoundButton+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;hepsi.h,1142 :: 		if ((exec_round_button->PressColEnabled == 1) && (exec_round_button->OwnerScreen == CurrentScreen)) {
L_FISHER_GUI_main_Process_TP_Up775:
L_FISHER_GUI_main_Process_TP_Up774:
;hepsi.h,1145 :: 		break;
IT	AL
BAL	L_FISHER_GUI_main_Process_TP_Up138
;hepsi.h,1146 :: 		}
L_FISHER_GUI_main_Process_TP_Up140:
;hepsi.h,1147 :: 		break;
IT	AL
BAL	L_FISHER_GUI_main_Process_TP_Up138
;hepsi.h,1150 :: 		case 17: {
L_FISHER_GUI_main_Process_TP_Up144:
;hepsi.h,1151 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_FISHER_GUI_main_Process_TP_Up145
;hepsi.h,1152 :: 		exec_radio_button = (TRadioButton*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
STR	R3, [R2, #0]
;hepsi.h,1153 :: 		if ((exec_radio_button->PressColEnabled == 1) && (exec_radio_button->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #48
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Up777
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Up776
L_FISHER_GUI_main_Process_TP_Up772:
;hepsi.h,1154 :: 		DrawRadioButton(exec_radio_button);
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawRadioButton+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;hepsi.h,1153 :: 		if ((exec_radio_button->PressColEnabled == 1) && (exec_radio_button->OwnerScreen == CurrentScreen)) {
L_FISHER_GUI_main_Process_TP_Up777:
L_FISHER_GUI_main_Process_TP_Up776:
;hepsi.h,1156 :: 		break;
IT	AL
BAL	L_FISHER_GUI_main_Process_TP_Up138
;hepsi.h,1157 :: 		}
L_FISHER_GUI_main_Process_TP_Up145:
;hepsi.h,1158 :: 		break;
IT	AL
BAL	L_FISHER_GUI_main_Process_TP_Up138
;hepsi.h,1160 :: 		}
L_FISHER_GUI_main_Process_TP_Up137:
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #1
IT	EQ
BEQ	L_FISHER_GUI_main_Process_TP_Up139
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #17
IT	EQ
BEQ	L_FISHER_GUI_main_Process_TP_Up144
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
L_FISHER_GUI_main_Process_TP_Up138:
;hepsi.h,1162 :: 		exec_label          = 0;
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;hepsi.h,1163 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;hepsi.h,1165 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;hepsi.h,1168 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_FISHER_GUI_main_Process_TP_Up149
;hepsi.h,1170 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Up150
;hepsi.h,1171 :: 		if (exec_round_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Up151
;hepsi.h,1172 :: 		if (exec_round_button->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_main_Process_TP_Up152
;hepsi.h,1173 :: 		exec_round_button->OnUpPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R2, [R4, #0]
BLX	R2
L_FISHER_GUI_main_Process_TP_Up152:
;hepsi.h,1174 :: 		if (PressedObject == (void *)exec_round_button)
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Up153
;hepsi.h,1175 :: 		if (exec_round_button->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_main_Process_TP_Up154
;hepsi.h,1176 :: 		exec_round_button->OnClickPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R2, [R4, #0]
BLX	R2
L_FISHER_GUI_main_Process_TP_Up154:
L_FISHER_GUI_main_Process_TP_Up153:
;hepsi.h,1177 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;hepsi.h,1178 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;hepsi.h,1179 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;hepsi.h,1180 :: 		}
L_FISHER_GUI_main_Process_TP_Up151:
;hepsi.h,1181 :: 		}
L_FISHER_GUI_main_Process_TP_Up150:
;hepsi.h,1184 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Up155
;hepsi.h,1185 :: 		if (exec_label->Active == 1) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Up156
;hepsi.h,1186 :: 		if (exec_label->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_main_Process_TP_Up157
;hepsi.h,1187 :: 		exec_label->OnUpPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R2, [R4, #0]
BLX	R2
L_FISHER_GUI_main_Process_TP_Up157:
;hepsi.h,1188 :: 		if (PressedObject == (void *)exec_label)
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Up158
;hepsi.h,1189 :: 		if (exec_label->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_main_Process_TP_Up159
;hepsi.h,1190 :: 		exec_label->OnClickPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
L_FISHER_GUI_main_Process_TP_Up159:
L_FISHER_GUI_main_Process_TP_Up158:
;hepsi.h,1191 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;hepsi.h,1192 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;hepsi.h,1193 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;hepsi.h,1194 :: 		}
L_FISHER_GUI_main_Process_TP_Up156:
;hepsi.h,1195 :: 		}
L_FISHER_GUI_main_Process_TP_Up155:
;hepsi.h,1198 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Up160
;hepsi.h,1199 :: 		if (exec_image->Active == 1) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Up161
;hepsi.h,1200 :: 		if (exec_image->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_main_Process_TP_Up162
;hepsi.h,1201 :: 		exec_image->OnUpPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R2, [R4, #0]
BLX	R2
L_FISHER_GUI_main_Process_TP_Up162:
;hepsi.h,1202 :: 		if (PressedObject == (void *)exec_image)
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Up163
;hepsi.h,1203 :: 		if (exec_image->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_main_Process_TP_Up164
;hepsi.h,1204 :: 		exec_image->OnClickPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_FISHER_GUI_main_Process_TP_Up164:
L_FISHER_GUI_main_Process_TP_Up163:
;hepsi.h,1205 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;hepsi.h,1206 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;hepsi.h,1207 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;hepsi.h,1208 :: 		}
L_FISHER_GUI_main_Process_TP_Up161:
;hepsi.h,1209 :: 		}
L_FISHER_GUI_main_Process_TP_Up160:
;hepsi.h,1212 :: 		if (_object_count == radio_button_order) {
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Up165
;hepsi.h,1213 :: 		if (exec_radio_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Up166
;hepsi.h,1214 :: 		if (exec_radio_button->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_main_Process_TP_Up167
;hepsi.h,1215 :: 		exec_radio_button->OnUpPtr();
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R2, [R4, #0]
BLX	R2
L_FISHER_GUI_main_Process_TP_Up167:
;hepsi.h,1216 :: 		if (PressedObject == (void *)exec_radio_button)
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Up168
;hepsi.h,1217 :: 		if (exec_radio_button->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_main_Process_TP_Up169
;hepsi.h,1218 :: 		exec_radio_button->OnClickPtr();
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R2, [R4, #0]
BLX	R2
L_FISHER_GUI_main_Process_TP_Up169:
L_FISHER_GUI_main_Process_TP_Up168:
;hepsi.h,1219 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;hepsi.h,1220 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;hepsi.h,1221 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;hepsi.h,1222 :: 		}
L_FISHER_GUI_main_Process_TP_Up166:
;hepsi.h,1223 :: 		}
L_FISHER_GUI_main_Process_TP_Up165:
;hepsi.h,1225 :: 		}
L_FISHER_GUI_main_Process_TP_Up149:
;hepsi.h,1226 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;hepsi.h,1227 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;hepsi.h,1228 :: 		}
L_end_Process_TP_Up:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of FISHER_GUI_main_Process_TP_Up
FISHER_GUI_main_Process_TP_Down:
;hepsi.h,1230 :: 		static void Process_TP_Down(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;hepsi.h,1232 :: 		object_pressed      = 0;
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
MOVS	R3, #0
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;hepsi.h,1233 :: 		exec_round_button   = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;hepsi.h,1234 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;hepsi.h,1235 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;hepsi.h,1236 :: 		exec_radio_button     = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
STR	R3, [R2, #0]
;hepsi.h,1238 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;hepsi.h,1240 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_FISHER_GUI_main_Process_TP_Down170
;hepsi.h,1241 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Down171
;hepsi.h,1242 :: 		if (exec_round_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Down172
;hepsi.h,1243 :: 		if (exec_round_button->PressColEnabled == 1) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #47
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Down173
;hepsi.h,1244 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;hepsi.h,1245 :: 		DrawRoundButton(exec_round_button);
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawRoundButton+0
;hepsi.h,1246 :: 		}
L_FISHER_GUI_main_Process_TP_Down173:
;hepsi.h,1247 :: 		PressedObject = (void *)exec_round_button;
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;hepsi.h,1248 :: 		PressedObjectType = 1;
MOVS	R3, #1
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;hepsi.h,1249 :: 		if (exec_round_button->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_main_Process_TP_Down174
;hepsi.h,1250 :: 		exec_round_button->OnDownPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R2, [R4, #0]
BLX	R2
;hepsi.h,1251 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;hepsi.h,1252 :: 		}
L_FISHER_GUI_main_Process_TP_Down174:
;hepsi.h,1253 :: 		}
L_FISHER_GUI_main_Process_TP_Down172:
;hepsi.h,1254 :: 		}
L_FISHER_GUI_main_Process_TP_Down171:
;hepsi.h,1256 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Down175
;hepsi.h,1257 :: 		if (exec_label->Active == 1) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Down176
;hepsi.h,1258 :: 		PressedObject = (void *)exec_label;
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;hepsi.h,1259 :: 		PressedObjectType = 2;
MOVS	R3, #2
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;hepsi.h,1260 :: 		if (exec_label->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_main_Process_TP_Down177
;hepsi.h,1261 :: 		exec_label->OnDownPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
;hepsi.h,1262 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;hepsi.h,1263 :: 		}
L_FISHER_GUI_main_Process_TP_Down177:
;hepsi.h,1264 :: 		}
L_FISHER_GUI_main_Process_TP_Down176:
;hepsi.h,1265 :: 		}
L_FISHER_GUI_main_Process_TP_Down175:
;hepsi.h,1267 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Down178
;hepsi.h,1268 :: 		if (exec_image->Active == 1) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Down179
;hepsi.h,1269 :: 		PressedObject = (void *)exec_image;
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;hepsi.h,1270 :: 		PressedObjectType = 3;
MOVS	R3, #3
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;hepsi.h,1271 :: 		if (exec_image->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_main_Process_TP_Down180
;hepsi.h,1272 :: 		exec_image->OnDownPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R2, [R4, #0]
BLX	R2
;hepsi.h,1273 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;hepsi.h,1274 :: 		}
L_FISHER_GUI_main_Process_TP_Down180:
;hepsi.h,1275 :: 		}
L_FISHER_GUI_main_Process_TP_Down179:
;hepsi.h,1276 :: 		}
L_FISHER_GUI_main_Process_TP_Down178:
;hepsi.h,1278 :: 		if (_object_count == radio_button_order) {
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Down181
;hepsi.h,1279 :: 		if (exec_radio_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Down182
;hepsi.h,1280 :: 		if (exec_radio_button->PressColEnabled == 1) {
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #48
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_FISHER_GUI_main_Process_TP_Down183
;hepsi.h,1281 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;hepsi.h,1282 :: 		DrawRadioButton(exec_radio_button);
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawRadioButton+0
;hepsi.h,1283 :: 		}
L_FISHER_GUI_main_Process_TP_Down183:
;hepsi.h,1284 :: 		PressedObject = (void *)exec_radio_button;
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;hepsi.h,1285 :: 		PressedObjectType = 17;
MOVS	R3, #17
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;hepsi.h,1286 :: 		if (exec_radio_button->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_FISHER_GUI_main_Process_TP_Down184
;hepsi.h,1287 :: 		exec_radio_button->OnDownPtr();
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R2, [R4, #0]
BLX	R2
;hepsi.h,1288 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;hepsi.h,1289 :: 		}
L_FISHER_GUI_main_Process_TP_Down184:
;hepsi.h,1290 :: 		}
L_FISHER_GUI_main_Process_TP_Down182:
;hepsi.h,1291 :: 		}
L_FISHER_GUI_main_Process_TP_Down181:
;hepsi.h,1293 :: 		}
L_FISHER_GUI_main_Process_TP_Down170:
;hepsi.h,1294 :: 		}
L_end_Process_TP_Down:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of FISHER_GUI_main_Process_TP_Down
_Check_TP:
;hepsi.h,1296 :: 		void Check_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;hepsi.h,1297 :: 		if (TP_TFT_Press_Detect()) {
BL	_TP_TFT_Press_Detect+0
CMP	R0, #0
IT	EQ
BEQ	L_Check_TP185
;hepsi.h,1299 :: 		if (TP_TFT_Get_Coordinates(&Xcoord, &Ycoord) == 0) {
MOVW	R1, #lo_addr(_Ycoord+0)
MOVT	R1, #hi_addr(_Ycoord+0)
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
BL	_TP_TFT_Get_Coordinates+0
CMP	R0, #0
IT	NE
BNE	L_Check_TP186
;hepsi.h,1300 :: 		Process_TP_Press(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	FISHER_GUI_main_Process_TP_Press+0
;hepsi.h,1301 :: 		if (PenDown == 0) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Check_TP187
;hepsi.h,1302 :: 		PenDown = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;hepsi.h,1303 :: 		Process_TP_Down(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	FISHER_GUI_main_Process_TP_Down+0
;hepsi.h,1304 :: 		}
L_Check_TP187:
;hepsi.h,1305 :: 		}
L_Check_TP186:
;hepsi.h,1306 :: 		}
IT	AL
BAL	L_Check_TP188
L_Check_TP185:
;hepsi.h,1307 :: 		else if (PenDown == 1) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Check_TP189
;hepsi.h,1308 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;hepsi.h,1309 :: 		Process_TP_Up(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	FISHER_GUI_main_Process_TP_Up+0
;hepsi.h,1310 :: 		}
L_Check_TP189:
L_Check_TP188:
;hepsi.h,1311 :: 		}
L_end_Check_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Check_TP
_Init_MCU:
;hepsi.h,1313 :: 		void Init_MCU() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;hepsi.h,1314 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_9);
MOVW	R1, #512
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;hepsi.h,1315 :: 		TFT_BLED = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;hepsi.h,1316 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;hepsi.h,1317 :: 		TP_TFT_Set_Default_Mode();
BL	_TP_TFT_Set_Default_Mode+0
;hepsi.h,1318 :: 		}
L_end_Init_MCU:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_MCU
_Init_Ext_Mem:
;hepsi.h,1320 :: 		void Init_Ext_Mem() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;hepsi.h,1325 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
MOVW	R2, #lo_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
;hepsi.h,1324 :: 		_SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
MOVW	R1, #772
;hepsi.h,1322 :: 		SPI3_Init_Advanced(_SPI_FPCLK_DIV64, _SPI_MASTER | _SPI_8_BIT |
MOVS	R0, #5
;hepsi.h,1325 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
BL	_SPI3_Init_Advanced+0
;hepsi.h,1326 :: 		Delay_ms(10);
MOVW	R7, #35710
MOVT	R7, #8
NOP
NOP
L_Init_Ext_Mem190:
SUBS	R7, R7, #1
BNE	L_Init_Ext_Mem190
NOP
NOP
NOP
;hepsi.h,1328 :: 		if (!Mmc_Fat_Init()) {
BL	_Mmc_Fat_Init+0
CMP	R0, #0
IT	NE
BNE	L_Init_Ext_Mem192
;hepsi.h,1329 :: 		SPI3_CR1 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(SPI3_CR1+0)
MOVT	R0, #hi_addr(SPI3_CR1+0)
STR	R1, [R0, #0]
;hepsi.h,1334 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
MOVW	R2, #lo_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
;hepsi.h,1333 :: 		_SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
MOVW	R1, #772
;hepsi.h,1331 :: 		SPI3_Init_Advanced(_SPI_FPCLK_DIV2, _SPI_MASTER | _SPI_8_BIT |
MOVS	R0, #0
;hepsi.h,1334 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
BL	_SPI3_Init_Advanced+0
;hepsi.h,1336 :: 		Mmc_Fat_Assign("FISHER_G.RES", 0);
MOVW	R0, #lo_addr(?lstr7_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr7_FISHER_GUI_main+0)
MOVS	R1, #0
BL	_Mmc_Fat_Assign+0
;hepsi.h,1337 :: 		Mmc_Fat_Reset(&res_file_size);
MOVW	R0, #lo_addr(_res_file_size+0)
MOVT	R0, #hi_addr(_res_file_size+0)
BL	_Mmc_Fat_Reset+0
;hepsi.h,1338 :: 		}
L_Init_Ext_Mem192:
;hepsi.h,1339 :: 		}
L_end_Init_Ext_Mem:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_Ext_Mem
_Start_TP:
;hepsi.h,1341 :: 		void Start_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;hepsi.h,1342 :: 		Init_MCU();
BL	_Init_MCU+0
;hepsi.h,1344 :: 		Init_Ext_Mem();
BL	_Init_Ext_Mem+0
;hepsi.h,1346 :: 		InitializeTouchPanel();
BL	FISHER_GUI_main_InitializeTouchPanel+0
;hepsi.h,1348 :: 		Delay_ms(1000);
MOVW	R7, #32254
MOVT	R7, #854
NOP
NOP
L_Start_TP193:
SUBS	R7, R7, #1
BNE	L_Start_TP193
NOP
NOP
NOP
;hepsi.h,1349 :: 		TFT_Fill_Screen(0);
MOVS	R0, #0
BL	_TFT_Fill_Screen+0
;hepsi.h,1350 :: 		Calibrate();
BL	_Calibrate+0
;hepsi.h,1351 :: 		TFT_Fill_Screen(0);
MOVS	R0, #0
BL	_TFT_Fill_Screen+0
;hepsi.h,1353 :: 		InitializeObjects();
BL	FISHER_GUI_main_InitializeObjects+0
;hepsi.h,1354 :: 		display_width = MainScreen1.Width;
MOVW	R0, #lo_addr(_MainScreen1+2)
MOVT	R0, #hi_addr(_MainScreen1+2)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_width+0)
MOVT	R0, #hi_addr(_display_width+0)
STRH	R1, [R0, #0]
;hepsi.h,1355 :: 		display_height = MainScreen1.Height;
MOVW	R0, #lo_addr(_MainScreen1+4)
MOVT	R0, #hi_addr(_MainScreen1+4)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_height+0)
MOVT	R0, #hi_addr(_display_height+0)
STRH	R1, [R0, #0]
;hepsi.h,1356 :: 		DrawScreen(&MainScreen1);
MOVW	R0, #lo_addr(_MainScreen1+0)
MOVT	R0, #hi_addr(_MainScreen1+0)
BL	_DrawScreen+0
;hepsi.h,1357 :: 		}
L_end_Start_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Start_TP
_reset:
;hepsi.h,1359 :: 		void reset(){
SUB	SP, SP, #4
;hepsi.h,1361 :: 		ii=0;jj=0;kk=0;mm=0;
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
;hepsi.h,1362 :: 		x1=0;y1=0;z1=0;p=0;q=0;row=60;col=80;k1=0;q1=50;q2=60;a1=0;
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
;hepsi.h,1363 :: 		temp1=0;temp2=0;temp3=0;temp4=0;temp5=0;t=0;c=0;s=0;diag_toplam=0;
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
;hepsi.h,1364 :: 		WhoseEar = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_WhoseEar+0)
MOVT	R0, #hi_addr(_WhoseEar+0)
STR	R1, [R0, #0]
;hepsi.h,1365 :: 		accuracy = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_accuracy+0)
MOVT	R0, #hi_addr(_accuracy+0)
STRH	R1, [R0, #0]
;hepsi.h,1366 :: 		ClassNumber = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
STR	R1, [R0, #0]
;hepsi.h,1367 :: 		Epsilon=0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_Epsilon+0)
MOVT	R0, #hi_addr(_Epsilon+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1369 :: 		for(ii=0;ii<(ClassNumber-1);ii++) ProjectedTestImage[ii]=0;
MOVS	R0, #0
STR	R0, [R2, #0]
L_reset195:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_reset196
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
BAL	L_reset195
L_reset196:
;hepsi.h,1370 :: 		for(ii=0;ii<row*col;ii++) m_ort[ii]=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_reset198:
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
BCS	L_reset199
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
BAL	L_reset198
L_reset199:
;hepsi.h,1371 :: 		for(ii=0;ii<N;ii++) BTemp[ii] = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_reset201:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_reset202
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
BAL	L_reset201
L_reset202:
;hepsi.h,1372 :: 		for(ii=0;ii<N;ii++) RTemp[ii] = ii;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_reset204:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_reset205
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
BAL	L_reset204
L_reset205:
;hepsi.h,1373 :: 		for(ii=0;ii<TrainPicture;ii++) {GTemp[ii]=0;  MTemp[ii]=0; }
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_reset207:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_reset208
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
BAL	L_reset207
L_reset208:
;hepsi.h,1374 :: 		for(ii=0;ii<N;ii++) KTemp[ii]=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_reset210:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_reset211
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
BAL	L_reset210
L_reset211:
;hepsi.h,1376 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_reset213:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_reset214
;hepsi.h,1377 :: 		for(x1=0;x1<TrainPicture;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_reset216:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_reset217
;hepsi.h,1378 :: 		L[x1][y1] = 0;}
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
;hepsi.h,1377 :: 		for(x1=0;x1<TrainPicture;x1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;hepsi.h,1378 :: 		L[x1][y1] = 0;}
IT	AL
BAL	L_reset216
L_reset217:
;hepsi.h,1376 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1378 :: 		L[x1][y1] = 0;}
IT	AL
BAL	L_reset213
L_reset214:
;hepsi.h,1380 :: 		for(y1=0;y1<(ClassNumber-1);y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_reset219:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_reset220
;hepsi.h,1381 :: 		for(x1=0;x1<N;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_reset222:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_reset223
;hepsi.h,1382 :: 		Fisher[x1][y1]=0;}
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
;hepsi.h,1381 :: 		for(x1=0;x1<N;x1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;hepsi.h,1382 :: 		Fisher[x1][y1]=0;}
IT	AL
BAL	L_reset222
L_reset223:
;hepsi.h,1380 :: 		for(y1=0;y1<(ClassNumber-1);y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1382 :: 		Fisher[x1][y1]=0;}
IT	AL
BAL	L_reset219
L_reset220:
;hepsi.h,1384 :: 		for(y1=0;y1<N;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_reset225:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_reset226
;hepsi.h,1385 :: 		for(x1=0;x1<N;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_reset228:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_reset229
;hepsi.h,1386 :: 		SS[x1][y1] = 0;
MOVW	R3, #lo_addr(_x1+0)
MOVT	R3, #hi_addr(_x1+0)
LDR	R1, [R3, #0]
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
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
;hepsi.h,1387 :: 		QV[x1][y1] = 0;}}
MOV	R0, R3
LDR	R1, [R0, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_QV+0)
MOVT	R0, #hi_addr(_QV+0)
ADDS	R1, R0, R1
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
;hepsi.h,1385 :: 		for(x1=0;x1<N;x1++){
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1387 :: 		QV[x1][y1] = 0;}}
IT	AL
BAL	L_reset228
L_reset229:
;hepsi.h,1384 :: 		for(y1=0;y1<N;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1387 :: 		QV[x1][y1] = 0;}}
IT	AL
BAL	L_reset225
L_reset226:
;hepsi.h,1389 :: 		for(y1=0;y1<TrainPicture;y1++){       //V ilk deðer atama eye(n) birim matris
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_reset231:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_reset232
;hepsi.h,1390 :: 		for(x1=0;x1<TrainPicture;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_reset234:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_reset235
;hepsi.h,1391 :: 		if (x1==y1) V[x1][y1] = 1;
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_reset237
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
BAL	L_reset238
L_reset237:
;hepsi.h,1392 :: 		else        V[x1][y1] = 0;}}
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
L_reset238:
;hepsi.h,1390 :: 		for(x1=0;x1<TrainPicture;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1392 :: 		else        V[x1][y1] = 0;}}
IT	AL
BAL	L_reset234
L_reset235:
;hepsi.h,1389 :: 		for(y1=0;y1<TrainPicture;y1++){       //V ilk deðer atama eye(n) birim matris
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1392 :: 		else        V[x1][y1] = 0;}}
IT	AL
BAL	L_reset231
L_reset232:
;hepsi.h,1394 :: 		}
L_end_reset:
ADD	SP, SP, #4
BX	LR
; end of _reset
_Database_Show:
;hepsi.h,1395 :: 		void Database_Show() {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;hepsi.h,1396 :: 		DrawScreen(&DatabaseScreen2);
MOVW	R0, #lo_addr(_DatabaseScreen2+0)
MOVT	R0, #hi_addr(_DatabaseScreen2+0)
BL	_DrawScreen+0
;hepsi.h,1397 :: 		k1=0;a1=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_k1+0)
MOVT	R0, #hi_addr(_k1+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(_a1+0)
MOVT	R0, #hi_addr(_a1+0)
STR	R1, [R0, #0]
;hepsi.h,1398 :: 		for(jj=0;jj<TrainPicture;jj++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
STR	R1, [R0, #0]
L_Database_Show239:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Database_Show240
;hepsi.h,1399 :: 		if (a1==(3*k1))    {q1 = 50; q2 = 60;}
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
BNE	L_Database_Show242
MOVS	R1, #50
MOVW	R0, #lo_addr(_q1+0)
MOVT	R0, #hi_addr(_q1+0)
STR	R1, [R0, #0]
MOVS	R1, #60
MOVW	R0, #lo_addr(_q2+0)
MOVT	R0, #hi_addr(_q2+0)
STR	R1, [R0, #0]
L_Database_Show242:
;hepsi.h,1400 :: 		if (a1==(3*k1+1))   q1 = 130;
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
BNE	L_Database_Show243
MOVS	R1, #130
MOVW	R0, #lo_addr(_q1+0)
MOVT	R0, #hi_addr(_q1+0)
STR	R1, [R0, #0]
L_Database_Show243:
;hepsi.h,1401 :: 		if (a1==(3*k1+2))  {q1 = 90; q2 = 180; k1 = k1 + 1;}
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
BNE	L_Database_Show244
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
L_Database_Show244:
;hepsi.h,1402 :: 		Delay_ms(100);
MOVW	R7, #29438
MOVT	R7, #85
NOP
NOP
L_Database_Show245:
SUBS	R7, R7, #1
BNE	L_Database_Show245
NOP
NOP
NOP
;hepsi.h,1403 :: 		ii=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
;hepsi.h,1404 :: 		for(y1=0;y1<col;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Database_Show247:
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Database_Show248
;hepsi.h,1405 :: 		for(x1=0;x1<row;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Database_Show250:
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Database_Show251
;hepsi.h,1406 :: 		temp1 = TFT_RGBToColor16bit(Ear[jj*row*col+ii], Ear[jj*row*col+ii], Ear[jj*row*col+ii]);
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
;hepsi.h,1407 :: 		TFT_Dot(x1+q1,y1+q2,temp1);
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
;hepsi.h,1408 :: 		ii=ii+1;}}
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1405 :: 		for(x1=0;x1<row;x1++){
LDR	R1, [SP, #4]
MOV	R0, R1
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1408 :: 		ii=ii+1;}}
IT	AL
BAL	L_Database_Show250
L_Database_Show251:
;hepsi.h,1404 :: 		for(y1=0;y1<col;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1408 :: 		ii=ii+1;}}
IT	AL
BAL	L_Database_Show247
L_Database_Show248:
;hepsi.h,1409 :: 		a1 = a1 + 1;}
MOVW	R1, #lo_addr(_a1+0)
MOVT	R1, #hi_addr(_a1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1398 :: 		for(jj=0;jj<TrainPicture;jj++){
MOVW	R1, #lo_addr(_jj+0)
MOVT	R1, #hi_addr(_jj+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1409 :: 		a1 = a1 + 1;}
IT	AL
BAL	L_Database_Show239
L_Database_Show240:
;hepsi.h,1410 :: 		Delay_ms(1000);
MOVW	R7, #32254
MOVT	R7, #854
NOP
NOP
L_Database_Show253:
SUBS	R7, R7, #1
BNE	L_Database_Show253
NOP
NOP
NOP
;hepsi.h,1411 :: 		DrawScreen(&MainScreen1);
MOVW	R0, #lo_addr(_MainScreen1+0)
MOVT	R0, #hi_addr(_MainScreen1+0)
BL	_DrawScreen+0
;hepsi.h,1412 :: 		}
L_end_Database_Show:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Database_Show
_Test:
;hepsi.h,1413 :: 		void Test() {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;hepsi.h,1414 :: 		DrawScreen(&TestScreen4);
MOVW	R0, #lo_addr(_TestScreen4+0)
MOVT	R0, #hi_addr(_TestScreen4+0)
BL	_DrawScreen+0
;hepsi.h,1415 :: 		iteration = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_iteration+0)
MOVT	R0, #hi_addr(_iteration+0)
STRH	R1, [R0, #0]
;hepsi.h,1416 :: 		accuracy = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_accuracy+0)
MOVT	R0, #hi_addr(_accuracy+0)
STRH	R1, [R0, #0]
;hepsi.h,1417 :: 		for(jj=100;jj<150;jj++) {      //TestPicture  = jj
MOVS	R1, #100
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
STR	R1, [R0, #0]
L_Test255:
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
CMP	R0, #150
IT	CS
BCS	L_Test256
;hepsi.h,1419 :: 		iteration = iteration + 1;
MOVW	R1, #lo_addr(_iteration+0)
MOVT	R1, #hi_addr(_iteration+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;hepsi.h,1420 :: 		IntToStr(iteration,txt1);
SXTH	R0, R0
MOVW	R1, #lo_addr(_txt1+0)
MOVT	R1, #hi_addr(_txt1+0)
BL	_IntToStr+0
;hepsi.h,1421 :: 		TFT_Write_Text(txt1,30,40);
MOVS	R2, #40
MOVS	R1, #30
MOVW	R0, #lo_addr(_txt1+0)
MOVT	R0, #hi_addr(_txt1+0)
BL	_TFT_Write_Text+0
;hepsi.h,1422 :: 		TFT_Write_Text("TEST IMAGE", 60, 40);
MOVW	R0, #lo_addr(?lstr8_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr8_FISHER_GUI_main+0)
MOVS	R2, #40
MOVS	R1, #60
BL	_TFT_Write_Text+0
;hepsi.h,1424 :: 		ii = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
;hepsi.h,1425 :: 		for(y1=0;y1<col;y1++){  // "TestPicture" siyah beyaz yazdýrma
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Test258:
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Test259
;hepsi.h,1426 :: 		for(x1=0;x1<row;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Test261:
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Test262
;hepsi.h,1427 :: 		temp5 = TFT_RGBToColor16bit(Ear[jj*row*col+ii], Ear[jj*row*col+ii], Ear[jj*row*col+ii]);
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
;hepsi.h,1428 :: 		TFT_Dot(x1+50, y1+60, temp5);
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
;hepsi.h,1429 :: 		ii = ii + 1;}}
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1426 :: 		for(x1=0;x1<row;x1++){
LDR	R1, [SP, #4]
MOV	R0, R1
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1429 :: 		ii = ii + 1;}}
IT	AL
BAL	L_Test261
L_Test262:
;hepsi.h,1425 :: 		for(y1=0;y1<col;y1++){  // "TestPicture" siyah beyaz yazdýrma
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1429 :: 		ii = ii + 1;}}
IT	AL
BAL	L_Test258
L_Test259:
;hepsi.h,1431 :: 		for(x1=0;x1<ClassNumber;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Test264:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Test265
;hepsi.h,1432 :: 		for(z1=5*x1;z1<5*x1+ClassPopulation;z1++){    //  MTemp (100x1) = (A)'*(TestPicture - m_ort)
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVS	R0, #5
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_Test267:
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVS	R0, #5
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_ClassPopulation+0)
MOVT	R0, #hi_addr(_ClassPopulation+0)
LDR	R0, [R0, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Test268
;hepsi.h,1433 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1434 :: 		for(ii=0;ii<row*col;ii++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_Test270:
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
BCS	L_Test271
;hepsi.h,1435 :: 		temp1 = temp1 + (Ear[row*col*z1 + ii] - m_ort[ii])*(Ear[row*col*jj + ii] - m_ort[ii]);
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R0, [R0, #0]
MUL	R4, R0, R1
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
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
MOV	R0, R3
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
;hepsi.h,1434 :: 		for(ii=0;ii<row*col;ii++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1435 :: 		temp1 = temp1 + (Ear[row*col*z1 + ii] - m_ort[ii])*(Ear[row*col*jj + ii] - m_ort[ii]);
IT	AL
BAL	L_Test270
L_Test271:
;hepsi.h,1436 :: 		MTemp[z1-x1*(5-ClassPopulation)] = temp1;}}   //100x1
MOVW	R0, #lo_addr(_ClassPopulation+0)
MOVT	R0, #hi_addr(_ClassPopulation+0)
LDR	R0, [R0, #0]
RSB	R1, R0, #5
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
MULS	R1, R0, R1
MOVW	R2, #lo_addr(_z1+0)
MOVT	R2, #hi_addr(_z1+0)
LDR	R0, [R2, #0]
SUB	R0, R0, R1
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_MTemp+0)
MOVT	R0, #hi_addr(_MTemp+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;hepsi.h,1432 :: 		for(z1=5*x1;z1<5*x1+ClassPopulation;z1++){    //  MTemp (100x1) = (A)'*(TestPicture - m_ort)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;hepsi.h,1436 :: 		MTemp[z1-x1*(5-ClassPopulation)] = temp1;}}   //100x1
IT	AL
BAL	L_Test267
L_Test268:
;hepsi.h,1431 :: 		for(x1=0;x1<ClassNumber;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1436 :: 		MTemp[z1-x1*(5-ClassPopulation)] = temp1;}}   //100x1
IT	AL
BAL	L_Test264
L_Test265:
;hepsi.h,1438 :: 		for(y1=0;y1<N;y1++){      // GTemp (50x1) = (V)' * MTemp
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Test273:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Test274
;hepsi.h,1439 :: 		temp2 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp2+0)
MOVT	R0, #hi_addr(_temp2+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1440 :: 		for(x1=0;x1<TrainPicture;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Test276:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Test277
;hepsi.h,1441 :: 		temp2 = temp2 + V[x1][y1]*MTemp[x1];
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
;hepsi.h,1440 :: 		for(x1=0;x1<TrainPicture;x1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1441 :: 		temp2 = temp2 + V[x1][y1]*MTemp[x1];
IT	AL
BAL	L_Test276
L_Test277:
;hepsi.h,1442 :: 		GTemp[y1] = temp2;}
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
;hepsi.h,1438 :: 		for(y1=0;y1<N;y1++){      // GTemp (50x1) = (V)' * MTemp
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;hepsi.h,1442 :: 		GTemp[y1] = temp2;}
IT	AL
BAL	L_Test273
L_Test274:
;hepsi.h,1444 :: 		for(y1=0;y1<(ClassNumber-1);y1++){      // ProjectedTestImage (19x1) = (Fisher)' * GTemp
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Test279:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Test280
;hepsi.h,1445 :: 		temp3 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1446 :: 		for(x1=0;x1<N;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Test282:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Test283
;hepsi.h,1447 :: 		temp3 = temp3 + Fisher[x1][y1]*GTemp[x1];
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
;hepsi.h,1446 :: 		for(x1=0;x1<N;x1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1447 :: 		temp3 = temp3 + Fisher[x1][y1]*GTemp[x1];
IT	AL
BAL	L_Test282
L_Test283:
;hepsi.h,1448 :: 		ProjectedTestImage[y1] = temp3;}
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
;hepsi.h,1444 :: 		for(y1=0;y1<(ClassNumber-1);y1++){      // ProjectedTestImage (19x1) = (Fisher)' * GTemp
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;hepsi.h,1448 :: 		ProjectedTestImage[y1] = temp3;}
IT	AL
BAL	L_Test279
L_Test280:
;hepsi.h,1450 :: 		Epsilon = 100000;             //ClassNorm bulunmasý
MOVW	R0, #20480
MOVT	R0, #18371
VMOV	S0, R0
MOVW	R0, #lo_addr(_Epsilon+0)
MOVT	R0, #hi_addr(_Epsilon+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1451 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Test285:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Test286
;hepsi.h,1452 :: 		temp4 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1453 :: 		for(x1=0;x1<(ClassNumber-1);x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Test288:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Test289
;hepsi.h,1454 :: 		temp4 = temp4 + (L[x1+50][y1] - ProjectedTestImage[x1])*(L[x1+50][y1] - ProjectedTestImage[x1]);
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
;hepsi.h,1453 :: 		for(x1=0;x1<(ClassNumber-1);x1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;hepsi.h,1454 :: 		temp4 = temp4 + (L[x1+50][y1] - ProjectedTestImage[x1])*(L[x1+50][y1] - ProjectedTestImage[x1]);
IT	AL
BAL	L_Test288
L_Test289:
;hepsi.h,1455 :: 		temp4 = sqrt(temp4);
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1456 :: 		if (temp4 < Epsilon) {
MOVW	R0, #lo_addr(_Epsilon+0)
MOVT	R0, #hi_addr(_Epsilon+0)
VLDR	#1, S1, [R0, #0]
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	GE
BGE	L_Test291
;hepsi.h,1457 :: 		Epsilon = temp4;
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_Epsilon+0)
MOVT	R0, #hi_addr(_Epsilon+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1458 :: 		WhoseEar = y1;}}
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_WhoseEar+0)
MOVT	R0, #hi_addr(_WhoseEar+0)
STR	R1, [R0, #0]
L_Test291:
;hepsi.h,1451 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1458 :: 		WhoseEar = y1;}}
IT	AL
BAL	L_Test285
L_Test286:
;hepsi.h,1460 :: 		whose = div(WhoseEar,ClassPopulation);
MOVW	R0, #lo_addr(_ClassPopulation+0)
MOVT	R0, #hi_addr(_ClassPopulation+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_WhoseEar+0)
MOVT	R0, #hi_addr(_WhoseEar+0)
LDR	R0, [R0, #0]
ADD	R12, SP, #4
BL	_div+0
MOVS	R3, #4
MOVW	R2, #lo_addr(_whose+0)
MOVT	R2, #hi_addr(_whose+0)
ADD	R1, SP, #4
L_Test292:
LDRB	R0, [R1, #0]
STRB	R0, [R2, #0]
SUBS	R3, R3, #1
UXTB	R3, R3
ADDS	R1, R1, #1
ADDS	R2, R2, #1
CMP	R3, #0
IT	NE
BNE	L_Test292
;hepsi.h,1461 :: 		WhoseEar =5*whose.quot + whose.rem;
MOVW	R0, #lo_addr(_whose+0)
MOVT	R0, #hi_addr(_whose+0)
LDRSH	R1, [R0, #0]
MOVS	R0, #5
SXTH	R0, R0
MULS	R1, R0, R1
SXTH	R1, R1
MOVW	R0, #lo_addr(_whose+2)
MOVT	R0, #hi_addr(_whose+2)
LDRSH	R0, [R0, #0]
ADDS	R1, R1, R0
SXTH	R1, R1
MOVW	R0, #lo_addr(_WhoseEar+0)
MOVT	R0, #hi_addr(_WhoseEar+0)
STR	R1, [R0, #0]
;hepsi.h,1463 :: 		if ((jj<120)&&(Epsilon<TetaC))  accuracy += 2;
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
CMP	R0, #120
IT	CS
BCS	L__Test781
MOVW	R0, #lo_addr(_TetaC+0)
MOVT	R0, #hi_addr(_TetaC+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_Epsilon+0)
MOVT	R0, #hi_addr(_Epsilon+0)
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	GE
BGE	L__Test780
L__Test779:
MOVW	R1, #lo_addr(_accuracy+0)
MOVT	R1, #hi_addr(_accuracy+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #2
STRH	R0, [R1, #0]
L__Test781:
L__Test780:
;hepsi.h,1464 :: 		if ((jj>=120)&&(Epsilon>TetaC)) accuracy += 2;
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
CMP	R0, #120
IT	CC
BCC	L__Test783
MOVW	R0, #lo_addr(_TetaC+0)
MOVT	R0, #hi_addr(_TetaC+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_Epsilon+0)
MOVT	R0, #hi_addr(_Epsilon+0)
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	LE
BLE	L__Test782
L__Test778:
MOVW	R1, #lo_addr(_accuracy+0)
MOVT	R1, #hi_addr(_accuracy+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #2
STRH	R0, [R1, #0]
L__Test783:
L__Test782:
;hepsi.h,1467 :: 		if (Epsilon < TetaC) {
MOVW	R0, #lo_addr(_TetaC+0)
MOVT	R0, #hi_addr(_TetaC+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_Epsilon+0)
MOVT	R0, #hi_addr(_Epsilon+0)
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	GE
BGE	L_Test299
;hepsi.h,1468 :: 		TFT_Write_Text("This picture is ear", 30, 160);
MOVW	R0, #lo_addr(?lstr9_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr9_FISHER_GUI_main+0)
MOVS	R2, #160
MOVS	R1, #30
BL	_TFT_Write_Text+0
;hepsi.h,1469 :: 		TFT_Write_Text("The ear is in the database", 30, 180);
MOVW	R0, #lo_addr(?lstr10_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr10_FISHER_GUI_main+0)
MOVS	R2, #180
MOVS	R1, #30
BL	_TFT_Write_Text+0
;hepsi.h,1470 :: 		TFT_Write_Text("E_k", 30, 220);
MOVW	R0, #lo_addr(?lstr11_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr11_FISHER_GUI_main+0)
MOVS	R2, #220
MOVS	R1, #30
BL	_TFT_Write_Text+0
;hepsi.h,1471 :: 		FloatToStr(Epsilon ,txt2);
MOVW	R0, #lo_addr(_Epsilon+0)
MOVT	R0, #hi_addr(_Epsilon+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_txt2+0)
MOVT	R0, #hi_addr(_txt2+0)
BL	_FloatToStr+0
;hepsi.h,1472 :: 		TFT_Write_Text(txt2,100,220);
MOVS	R2, #220
MOVS	R1, #100
MOVW	R0, #lo_addr(_txt2+0)
MOVT	R0, #hi_addr(_txt2+0)
BL	_TFT_Write_Text+0
;hepsi.h,1473 :: 		ii = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
;hepsi.h,1474 :: 		for(y1=0;y1<col;y1++){  // "WhoseEar" siyah beyaz yazdýrma
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Test300:
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Test301
;hepsi.h,1475 :: 		for(x1=0;x1<row;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Test303:
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Test304
;hepsi.h,1476 :: 		temp5 = TFT_RGBToColor16bit(Ear[WhoseEar*row*col+ii], Ear[WhoseEar*row*col+ii], Ear[WhoseEar*row*col+ii]);
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
;hepsi.h,1477 :: 		TFT_Dot(x1+130, y1+60, temp5);
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
;hepsi.h,1478 :: 		ii = ii + 1;}}
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1475 :: 		for(x1=0;x1<row;x1++){
LDR	R1, [SP, #4]
MOV	R0, R1
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1478 :: 		ii = ii + 1;}}
IT	AL
BAL	L_Test303
L_Test304:
;hepsi.h,1474 :: 		for(y1=0;y1<col;y1++){  // "WhoseEar" siyah beyaz yazdýrma
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1478 :: 		ii = ii + 1;}}
IT	AL
BAL	L_Test300
L_Test301:
;hepsi.h,1479 :: 		}
IT	AL
BAL	L_Test306
L_Test299:
;hepsi.h,1481 :: 		TFT_Write_Text("This is not in the database", 30, 180);
MOVW	R0, #lo_addr(?lstr12_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr12_FISHER_GUI_main+0)
MOVS	R2, #180
MOVS	R1, #30
BL	_TFT_Write_Text+0
;hepsi.h,1482 :: 		TFT_Write_Text("E_k", 30, 220);
MOVW	R0, #lo_addr(?lstr13_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr13_FISHER_GUI_main+0)
MOVS	R2, #220
MOVS	R1, #30
BL	_TFT_Write_Text+0
;hepsi.h,1483 :: 		FloatToStr(Epsilon ,txt2);
MOVW	R0, #lo_addr(_Epsilon+0)
MOVT	R0, #hi_addr(_Epsilon+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_txt2+0)
MOVT	R0, #hi_addr(_txt2+0)
BL	_FloatToStr+0
;hepsi.h,1484 :: 		TFT_Write_Text(txt2,100,220);
MOVS	R2, #220
MOVS	R1, #100
MOVW	R0, #lo_addr(_txt2+0)
MOVT	R0, #hi_addr(_txt2+0)
BL	_TFT_Write_Text+0
;hepsi.h,1485 :: 		}
L_Test306:
;hepsi.h,1486 :: 		Delay_ms(2000);
MOVW	R7, #64510
MOVT	R7, #1708
NOP
NOP
L_Test307:
SUBS	R7, R7, #1
BNE	L_Test307
NOP
NOP
NOP
;hepsi.h,1487 :: 		DrawScreen(&TestScreen4);
MOVW	R0, #lo_addr(_TestScreen4+0)
MOVT	R0, #hi_addr(_TestScreen4+0)
BL	_DrawScreen+0
;hepsi.h,1417 :: 		for(jj=100;jj<150;jj++) {      //TestPicture  = jj
MOVW	R1, #lo_addr(_jj+0)
MOVT	R1, #hi_addr(_jj+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1488 :: 		}
IT	AL
BAL	L_Test255
L_Test256:
;hepsi.h,1489 :: 		Success_ProgressBar1.Position = accuracy+1;
MOVW	R0, #lo_addr(_accuracy+0)
MOVT	R0, #hi_addr(_accuracy+0)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_Success_ProgressBar1+48)
MOVT	R0, #hi_addr(_Success_ProgressBar1+48)
STRH	R1, [R0, #0]
;hepsi.h,1490 :: 		DrawScreen(&MainScreen1);
MOVW	R0, #lo_addr(_MainScreen1+0)
MOVT	R0, #hi_addr(_MainScreen1+0)
BL	_DrawScreen+0
;hepsi.h,1491 :: 		}
L_end_Test:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Test
_Training:
;hepsi.h,1492 :: 		void Training() {
SUB	SP, SP, #16
STR	LR, [SP, #0]
;hepsi.h,1493 :: 		DrawScreen(&TrainingScreen3);
MOVW	R0, #lo_addr(_TrainingScreen3+0)
MOVT	R0, #hi_addr(_TrainingScreen3+0)
BL	_DrawScreen+0
;hepsi.h,1494 :: 		reset();
BL	_reset+0
;hepsi.h,1495 :: 		TFT_Write_Text("ORTALAMA ?", 30, 20);
MOVW	R0, #lo_addr(?lstr14_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr14_FISHER_GUI_main+0)
MOVS	R2, #20
MOVS	R1, #30
BL	_TFT_Write_Text+0
;hepsi.h,1497 :: 		for(ii=0;ii<row*col;ii++){ // m_ort = row*col x 1
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_Training309:
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
BCS	L_Training310
;hepsi.h,1498 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1499 :: 		for(x1=0;x1<ClassNumber;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training312:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training313
;hepsi.h,1500 :: 		for(z1=5*x1;z1<5*x1+ClassPopulation;z1++)
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVS	R0, #5
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_Training315:
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVS	R0, #5
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_ClassPopulation+0)
MOVT	R0, #hi_addr(_ClassPopulation+0)
LDR	R0, [R0, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training316
;hepsi.h,1501 :: 		temp1 =  temp1 + Ear[row*col*z1+ii];}
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
;hepsi.h,1500 :: 		for(z1=5*x1;z1<5*x1+ClassPopulation;z1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;hepsi.h,1501 :: 		temp1 =  temp1 + Ear[row*col*z1+ii];}
IT	AL
BAL	L_Training315
L_Training316:
;hepsi.h,1499 :: 		for(x1=0;x1<ClassNumber;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1501 :: 		temp1 =  temp1 + Ear[row*col*z1+ii];}
IT	AL
BAL	L_Training312
L_Training313:
;hepsi.h,1502 :: 		m_ort[ii] = temp1/TrainPicture;}
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
;hepsi.h,1497 :: 		for(ii=0;ii<row*col;ii++){ // m_ort = row*col x 1
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1502 :: 		m_ort[ii] = temp1/TrainPicture;}
IT	AL
BAL	L_Training309
L_Training310:
;hepsi.h,1504 :: 		TFT_Write_Text("ORTALAMA OK", 30, 30);
MOVW	R0, #lo_addr(?lstr15_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr15_FISHER_GUI_main+0)
MOVS	R2, #30
MOVS	R1, #30
BL	_TFT_Write_Text+0
;hepsi.h,1505 :: 		TFT_Write_Text("L=A'*A ?", 30, 40);
MOVW	R0, #lo_addr(?lstr16_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr16_FISHER_GUI_main+0)
MOVS	R2, #40
MOVS	R1, #30
BL	_TFT_Write_Text+0
;hepsi.h,1509 :: 		for(x1=0;x1<ClassNumber;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training318:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training319
;hepsi.h,1510 :: 		for(z1=5*x1;z1<5*x1+ClassPopulation;z1++){
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVS	R0, #5
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_Training321:
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVS	R0, #5
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_ClassPopulation+0)
MOVT	R0, #hi_addr(_ClassPopulation+0)
LDR	R0, [R0, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training322
;hepsi.h,1511 :: 		for(y1=0;y1<ClassNumber;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Training324:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training325
;hepsi.h,1512 :: 		for(jj=5*y1;jj<5*y1+ClassPopulation;jj++){
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVS	R0, #5
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
STR	R1, [R0, #0]
L_Training327:
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVS	R0, #5
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_ClassPopulation+0)
MOVT	R0, #hi_addr(_ClassPopulation+0)
LDR	R0, [R0, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training328
;hepsi.h,1513 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1514 :: 		for(ii=0;ii<row*col;ii++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_Training330:
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
BCS	L_Training331
;hepsi.h,1515 :: 		temp1 = temp1 + (ear[row*col*z1 + ii] - m_ort[ii])*(ear[row*col*jj + ii] - m_ort[ii]);
MOVW	R0, #lo_addr(_col+0)
MOVT	R0, #hi_addr(_col+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R0, [R0, #0]
MUL	R4, R0, R1
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
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
MOV	R0, R3
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
;hepsi.h,1514 :: 		for(ii=0;ii<row*col;ii++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1515 :: 		temp1 = temp1 + (ear[row*col*z1 + ii] - m_ort[ii])*(ear[row*col*jj + ii] - m_ort[ii]);
IT	AL
BAL	L_Training330
L_Training331:
;hepsi.h,1516 :: 		L[z1-x1*(5-ClassPopulation)][jj-y1*(5-ClassPopulation)] = temp1;}}}}
MOVW	R0, #lo_addr(_ClassPopulation+0)
MOVT	R0, #hi_addr(_ClassPopulation+0)
LDR	R0, [R0, #0]
RSB	R2, R0, #5
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
SUB	R1, R0, R1
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R3, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
MUL	R1, R0, R2
MOVW	R2, #lo_addr(_jj+0)
MOVT	R2, #hi_addr(_jj+0)
LDR	R0, [R2, #0]
SUB	R0, R0, R1
LSLS	R0, R0, #2
ADDS	R1, R3, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;hepsi.h,1512 :: 		for(jj=5*y1;jj<5*y1+ClassPopulation;jj++){
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;hepsi.h,1516 :: 		L[z1-x1*(5-ClassPopulation)][jj-y1*(5-ClassPopulation)] = temp1;}}}}
IT	AL
BAL	L_Training327
L_Training328:
;hepsi.h,1511 :: 		for(y1=0;y1<ClassNumber;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1516 :: 		L[z1-x1*(5-ClassPopulation)][jj-y1*(5-ClassPopulation)] = temp1;}}}}
IT	AL
BAL	L_Training324
L_Training325:
;hepsi.h,1510 :: 		for(z1=5*x1;z1<5*x1+ClassPopulation;z1++){
MOVW	R1, #lo_addr(_z1+0)
MOVT	R1, #hi_addr(_z1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1516 :: 		L[z1-x1*(5-ClassPopulation)][jj-y1*(5-ClassPopulation)] = temp1;}}}}
IT	AL
BAL	L_Training321
L_Training322:
;hepsi.h,1509 :: 		for(x1=0;x1<ClassNumber;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1516 :: 		L[z1-x1*(5-ClassPopulation)][jj-y1*(5-ClassPopulation)] = temp1;}}}}
IT	AL
BAL	L_Training318
L_Training319:
;hepsi.h,1518 :: 		TFT_Write_Text("L=A'*A OK", 30, 50);
MOVW	R0, #lo_addr(?lstr17_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr17_FISHER_GUI_main+0)
MOVS	R2, #50
MOVS	R1, #30
BL	_TFT_Write_Text+0
;hepsi.h,1519 :: 		TFT_Write_Text("JACOBI ITERATION ?", 30, 60);
MOVW	R0, #lo_addr(?lstr18_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr18_FISHER_GUI_main+0)
MOVS	R2, #60
MOVS	R1, #30
BL	_TFT_Write_Text+0
;hepsi.h,1521 :: 		temp1 = 0;      //en büyük deðer bulma
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1522 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Training333:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training334
;hepsi.h,1523 :: 		for(x1=0;x1<TrainPicture;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training336:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training337
;hepsi.h,1524 :: 		if ((fabs(L[x1][y1]) > temp1) && (x1 != y1)) {
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
BLE	L__Training787
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__Training786
L__Training785:
;hepsi.h,1525 :: 		temp1 = fabs(L[x1][y1]);
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
;hepsi.h,1526 :: 		p=x1;
LDR	R0, [SP, #8]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
STR	R1, [R0, #0]
;hepsi.h,1527 :: 		q=y1;}}}
LDR	R0, [SP, #4]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_q+0)
MOVT	R0, #hi_addr(_q+0)
STR	R1, [R0, #0]
;hepsi.h,1524 :: 		if ((fabs(L[x1][y1]) > temp1) && (x1 != y1)) {
L__Training787:
L__Training786:
;hepsi.h,1523 :: 		for(x1=0;x1<TrainPicture;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1527 :: 		q=y1;}}}
IT	AL
BAL	L_Training336
L_Training337:
;hepsi.h,1522 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1527 :: 		q=y1;}}}
IT	AL
BAL	L_Training333
L_Training334:
;hepsi.h,1529 :: 		iteration = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_iteration+0)
MOVT	R0, #hi_addr(_iteration+0)
STRH	R1, [R0, #0]
;hepsi.h,1530 :: 		basla = 1;                              // jacobi iteration döngü baþangýcý
MOVS	R1, #1
MOVW	R0, #lo_addr(_basla+0)
MOVT	R0, #hi_addr(_basla+0)
STRH	R1, [R0, #0]
;hepsi.h,1531 :: 		while (basla==1){
L_Training342:
MOVW	R0, #lo_addr(_basla+0)
MOVT	R0, #hi_addr(_basla+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Training343
;hepsi.h,1536 :: 		t = (L[p][q])/((L[q][q])-(L[p][p]));
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
;hepsi.h,1537 :: 		c = 1/(sqrt(t*t+1));
VMUL.F32	S1, S0, S0
VMOV.F32	S0, #1
VADD.F32	S0, S1, S0
BL	_sqrt+0
VMOV.F32	S1, #1
VDIV.F32	S1, S1, S0
MOVW	R0, #lo_addr(_c+0)
MOVT	R0, #hi_addr(_c+0)
VSTR	#1, S1, [R0, #0]
;hepsi.h,1538 :: 		s = t*c;
LDR	R0, [SP, #4]
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_s+0)
MOVT	R0, #hi_addr(_s+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1540 :: 		for(y1=0;y1<TrainPicture;y1++){ //matris çarpýmý D([p q],:) = R'*D([p q],:);
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Training344:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training345
;hepsi.h,1541 :: 		temp1 = L[p][y1];
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
;hepsi.h,1542 :: 		temp2 = L[q][y1];
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
;hepsi.h,1543 :: 		temp3 = temp1*c + temp2*(-s);
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
;hepsi.h,1544 :: 		temp4 = temp1*s + temp2*c;
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
;hepsi.h,1545 :: 		L[p][y1] = temp3;
MOV	R0, R3
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R7, #0]
;hepsi.h,1546 :: 		L[q][y1] = temp4;}
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
;hepsi.h,1540 :: 		for(y1=0;y1<TrainPicture;y1++){ //matris çarpýmý D([p q],:) = R'*D([p q],:);
MOV	R0, R8
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R8, #0]
;hepsi.h,1546 :: 		L[q][y1] = temp4;}
IT	AL
BAL	L_Training344
L_Training345:
;hepsi.h,1548 :: 		for(x1=0;x1<TrainPicture;x1++){ //matris çarpýmý D(:,[p q]) = D(:,[p q])*R;
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training347:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training348
;hepsi.h,1549 :: 		temp1 = L[x1][p];
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
;hepsi.h,1550 :: 		temp2 = L[x1][q];
MOVW	R5, #lo_addr(_q+0)
MOVT	R5, #hi_addr(_q+0)
LDR	R0, [R5, #0]
LSLS	R0, R0, #2
ADDS	R0, R2, R0
VLDR	#1, S0, [R0, #0]
MOVW	R4, #lo_addr(_temp2+0)
MOVT	R4, #hi_addr(_temp2+0)
VSTR	#1, S0, [R4, #0]
;hepsi.h,1551 :: 		temp3 = temp1*c + temp2*(-s);
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
;hepsi.h,1552 :: 		temp4 = temp1*s + temp2*c;
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
;hepsi.h,1553 :: 		L[x1][p] = temp3;
MOV	R0, R3
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R7, #0]
;hepsi.h,1554 :: 		L[x1][q] = temp4;}
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
;hepsi.h,1548 :: 		for(x1=0;x1<TrainPicture;x1++){ //matris çarpýmý D(:,[p q]) = D(:,[p q])*R;
MOV	R0, R8
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R8, #0]
;hepsi.h,1554 :: 		L[x1][q] = temp4;}
IT	AL
BAL	L_Training347
L_Training348:
;hepsi.h,1556 :: 		for(x1=0;x1<TrainPicture;x1++){  //matris çarpýmý V(:,[p q]) = V(:,[p q])*R;
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training350:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training351
;hepsi.h,1557 :: 		temp1 = V[x1][p];
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
;hepsi.h,1558 :: 		temp2 = V[x1][q];
MOVW	R5, #lo_addr(_q+0)
MOVT	R5, #hi_addr(_q+0)
LDR	R0, [R5, #0]
LSLS	R0, R0, #2
ADDS	R0, R2, R0
VLDR	#1, S0, [R0, #0]
MOVW	R4, #lo_addr(_temp2+0)
MOVT	R4, #hi_addr(_temp2+0)
VSTR	#1, S0, [R4, #0]
;hepsi.h,1559 :: 		temp3 = temp1*c + temp2*(-s);
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
;hepsi.h,1560 :: 		temp4 = temp1*s + temp2*c;
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
;hepsi.h,1561 :: 		V[x1][p] = temp3;
MOV	R0, R3
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R7, #0]
;hepsi.h,1562 :: 		V[x1][q] = temp4;}
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
;hepsi.h,1556 :: 		for(x1=0;x1<TrainPicture;x1++){  //matris çarpýmý V(:,[p q]) = V(:,[p q])*R;
MOV	R0, R8
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R8, #0]
;hepsi.h,1562 :: 		V[x1][q] = temp4;}
IT	AL
BAL	L_Training350
L_Training351:
;hepsi.h,1564 :: 		temp1 = 0;      //en büyük deðer bulma
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1565 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Training353:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training354
;hepsi.h,1566 :: 		for(x1=0;x1<TrainPicture;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training356:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training357
;hepsi.h,1567 :: 		if ((fabs(L[x1][y1]) > temp1) && (x1 != y1)) {
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
BLE	L__Training789
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__Training788
L__Training784:
;hepsi.h,1568 :: 		temp1 = fabs(L[x1][y1]);
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
;hepsi.h,1569 :: 		p=x1;
LDR	R0, [SP, #8]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
STR	R1, [R0, #0]
;hepsi.h,1570 :: 		q=y1;}}}
LDR	R0, [SP, #4]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_q+0)
MOVT	R0, #hi_addr(_q+0)
STR	R1, [R0, #0]
;hepsi.h,1567 :: 		if ((fabs(L[x1][y1]) > temp1) && (x1 != y1)) {
L__Training789:
L__Training788:
;hepsi.h,1566 :: 		for(x1=0;x1<TrainPicture;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1570 :: 		q=y1;}}}
IT	AL
BAL	L_Training356
L_Training357:
;hepsi.h,1565 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1570 :: 		q=y1;}}}
IT	AL
BAL	L_Training353
L_Training354:
;hepsi.h,1572 :: 		diag_toplam=0;            // döngüden çýkma eþik deðeri
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_diag_toplam+0)
MOVT	R0, #hi_addr(_diag_toplam+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1573 :: 		for(x1=0;x1<TrainPicture;x1++)  diag_toplam = diag_toplam + L[x1][x1]*L[x1][x1];
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training362:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training363
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
BAL	L_Training362
L_Training363:
;hepsi.h,1574 :: 		if (fabs(L[p][q]) < 0.00001*sqrt(diag_toplam/TrainPicture)) basla = 0; //e-5 yaptý e-7 yapmadý
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
MOVW	R0, #50604
MOVT	R0, #14119
VMOV	S1, R0
VMUL.F32	S1, S1, S0
VLDR	#1, S0, [SP, #4]
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	GE
BGE	L_Training365
MOVS	R1, #0
MOVW	R0, #lo_addr(_basla+0)
MOVT	R0, #hi_addr(_basla+0)
STRH	R1, [R0, #0]
L_Training365:
;hepsi.h,1580 :: 		}
IT	AL
BAL	L_Training342
L_Training343:
;hepsi.h,1582 :: 		TFT_Write_Text("JACOBI ITERATION OK", 30, 70);
MOVW	R0, #lo_addr(?lstr19_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr19_FISHER_GUI_main+0)
MOVS	R2, #70
MOVS	R1, #30
BL	_TFT_Write_Text+0
;hepsi.h,1583 :: 		TFT_Write_Text("OZVEKTORLER ?", 30, 80);
MOVW	R0, #lo_addr(?lstr20_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr20_FISHER_GUI_main+0)
MOVS	R2, #80
MOVS	R1, #30
BL	_TFT_Write_Text+0
;hepsi.h,1587 :: 		temp1 = -10;
VMOV.F32	S0, #-10
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1588 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Training366:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training367
;hepsi.h,1589 :: 		for(x1=y1;x1<TrainPicture;x1++){
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training369:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training370
;hepsi.h,1590 :: 		if (L[x1][x1] > temp1) {
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
BLE	L_Training372
;hepsi.h,1591 :: 		temp1 =  L[x1][x1];
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
;hepsi.h,1592 :: 		ii = x1;}}
MOV	R0, R2
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_Training372:
;hepsi.h,1589 :: 		for(x1=y1;x1<TrainPicture;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1592 :: 		ii = x1;}}
IT	AL
BAL	L_Training369
L_Training370:
;hepsi.h,1593 :: 		L[ii][ii] =  L[y1][y1];
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
;hepsi.h,1594 :: 		L[y1][y1] = temp1;
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
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R2, #0]
;hepsi.h,1595 :: 		temp1 = -10;
VMOV.F32	S0, #-10
VSTR	#1, S0, [R0, #0]
;hepsi.h,1596 :: 		for(x1=0;x1<TrainPicture;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training373:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training374
;hepsi.h,1597 :: 		GTemp[x1] = V[x1][ii];
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
;hepsi.h,1598 :: 		V[x1][ii] = V[x1][y1];
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
;hepsi.h,1599 :: 		V[x1][y1] = GTemp[x1];}}  // Özdeðerler büyükten küçüðe numarasý tutuluyor (özvektörler için)
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
;hepsi.h,1596 :: 		for(x1=0;x1<TrainPicture;x1++){
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;hepsi.h,1599 :: 		V[x1][y1] = GTemp[x1];}}  // Özdeðerler büyükten küçüðe numarasý tutuluyor (özvektörler için)
IT	AL
BAL	L_Training373
L_Training374:
;hepsi.h,1588 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1599 :: 		V[x1][y1] = GTemp[x1];}}  // Özdeðerler büyükten küçüðe numarasý tutuluyor (özvektörler için)
IT	AL
BAL	L_Training366
L_Training367:
;hepsi.h,1601 :: 		TFT_Write_Text("OZVEKTORLER OK", 30, 90);
MOVW	R0, #lo_addr(?lstr21_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr21_FISHER_GUI_main+0)
MOVS	R2, #90
MOVS	R1, #30
BL	_TFT_Write_Text+0
;hepsi.h,1602 :: 		TFT_Write_Text("L=> ProjectedImages", 30, 100);
MOVW	R0, #lo_addr(?lstr22_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr22_FISHER_GUI_main+0)
MOVS	R2, #100
MOVS	R1, #30
BL	_TFT_Write_Text+0
;hepsi.h,1604 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Training376:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training377
;hepsi.h,1605 :: 		for(x1=0;x1<TrainPicture;x1++) L[x1][y1] = 0;}
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training379:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training380
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
BAL	L_Training379
L_Training380:
;hepsi.h,1604 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1605 :: 		for(x1=0;x1<TrainPicture;x1++) L[x1][y1] = 0;}
IT	AL
BAL	L_Training376
L_Training377:
;hepsi.h,1606 :: 		TFT_Write_Text("ProjectedImages ?", 30, 110);
MOVW	R0, #lo_addr(?lstr23_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr23_FISHER_GUI_main+0)
MOVS	R2, #110
MOVS	R1, #30
BL	_TFT_Write_Text+0
;hepsi.h,1608 :: 		for(y1=0;y1<N;y1++){   // V[100][50]
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Training382:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training383
;hepsi.h,1609 :: 		for(ii=0;ii<row*col;ii++){        //(row*col x picture)(picture x picture - ClassNumber)
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_Training385:
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
BCS	L_Training386
;hepsi.h,1610 :: 		temp1 = 0;                    // KTemp => norm tutucu
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1611 :: 		for(x1=0;x1<ClassNumber;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training388:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training389
;hepsi.h,1612 :: 		for(z1=5*x1;z1<5*x1+ClassPopulation;z1++)
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVS	R0, #5
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_Training391:
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVS	R0, #5
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_ClassPopulation+0)
MOVT	R0, #hi_addr(_ClassPopulation+0)
LDR	R0, [R0, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training392
;hepsi.h,1613 :: 		temp1 = temp1 + (Ear[z1*row*col + ii] - m_ort[ii])*V[z1-x1*(5-ClassPopulation)][y1];} //A*V
MOVW	R0, #lo_addr(_row+0)
MOVT	R0, #hi_addr(_row+0)
LDR	R1, [R0, #0]
MOVW	R4, #lo_addr(_z1+0)
MOVT	R4, #hi_addr(_z1+0)
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
MOVW	R0, #lo_addr(_ClassPopulation+0)
MOVT	R0, #hi_addr(_ClassPopulation+0)
LDR	R0, [R0, #0]
RSB	R1, R0, #5
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
MULS	R1, R0, R1
MOV	R0, R4
LDR	R0, [R0, #0]
SUB	R1, R0, R1
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
;hepsi.h,1612 :: 		for(z1=5*x1;z1<5*x1+ClassPopulation;z1++)
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;hepsi.h,1613 :: 		temp1 = temp1 + (Ear[z1*row*col + ii] - m_ort[ii])*V[z1-x1*(5-ClassPopulation)][y1];} //A*V
IT	AL
BAL	L_Training391
L_Training392:
;hepsi.h,1611 :: 		for(x1=0;x1<ClassNumber;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1613 :: 		temp1 = temp1 + (Ear[z1*row*col + ii] - m_ort[ii])*V[z1-x1*(5-ClassPopulation)][y1];} //A*V
IT	AL
BAL	L_Training388
L_Training389:
;hepsi.h,1614 :: 		KTemp[y1] =  KTemp[y1] + temp1*temp1;}}
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
;hepsi.h,1609 :: 		for(ii=0;ii<row*col;ii++){        //(row*col x picture)(picture x picture - ClassNumber)
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1614 :: 		KTemp[y1] =  KTemp[y1] + temp1*temp1;}}
IT	AL
BAL	L_Training385
L_Training386:
;hepsi.h,1608 :: 		for(y1=0;y1<N;y1++){   // V[100][50]
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1614 :: 		KTemp[y1] =  KTemp[y1] + temp1*temp1;}}
IT	AL
BAL	L_Training382
L_Training383:
;hepsi.h,1616 :: 		TFT_Write_Text("norm tutucu OK", 30, 120);
MOVW	R0, #lo_addr(?lstr24_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr24_FISHER_GUI_main+0)
MOVS	R2, #120
MOVS	R1, #30
BL	_TFT_Write_Text+0
;hepsi.h,1618 :: 		for(y1=0;y1<N;y1++){        // V=V/norm_tutucu       100x50
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Training394:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training395
;hepsi.h,1619 :: 		for(x1=0;x1<TrainPicture;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training397:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training398
;hepsi.h,1620 :: 		V[x1][y1] = (V[x1][y1])/(sqrt(KTemp[y1]));}
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
;hepsi.h,1619 :: 		for(x1=0;x1<TrainPicture;x1++)
LDR	R1, [SP, #12]
MOV	R0, R1
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1620 :: 		V[x1][y1] = (V[x1][y1])/(sqrt(KTemp[y1]));}
IT	AL
BAL	L_Training397
L_Training398:
;hepsi.h,1618 :: 		for(y1=0;y1<N;y1++){        // V=V/norm_tutucu       100x50
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1620 :: 		V[x1][y1] = (V[x1][y1])/(sqrt(KTemp[y1]));}
IT	AL
BAL	L_Training394
L_Training395:
;hepsi.h,1622 :: 		TFT_Write_Text("V=V/norm_tutucu OK", 30, 130);
MOVW	R0, #lo_addr(?lstr25_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr25_FISHER_GUI_main+0)
MOVS	R2, #130
MOVS	R1, #30
BL	_TFT_Write_Text+0
;hepsi.h,1624 :: 		for(ii=0;ii<TrainPicture;ii++) GTemp[ii]=0;   // GTemp sýfýrlandý
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_Training400:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training401
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
BAL	L_Training400
L_Training401:
;hepsi.h,1626 :: 		for(y1=0;y1<ClassNumber;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Training403:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training404
;hepsi.h,1627 :: 		for(jj=5*y1;jj<5*y1+ClassPopulation;jj++){
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVS	R0, #5
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
STR	R1, [R0, #0]
L_Training406:
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVS	R0, #5
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_ClassPopulation+0)
MOVT	R0, #hi_addr(_ClassPopulation+0)
LDR	R0, [R0, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training407
;hepsi.h,1628 :: 		for(x1=0;x1<ClassNumber;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training409:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training410
;hepsi.h,1629 :: 		for(z1=5*x1;z1<5*x1+ClassPopulation;z1++){        //(picture x row*col)(row*col x 1)
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVS	R0, #5
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_Training412:
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVS	R0, #5
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_ClassPopulation+0)
MOVT	R0, #hi_addr(_ClassPopulation+0)
LDR	R0, [R0, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training413
;hepsi.h,1630 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1631 :: 		for(ii=0;ii<row*col;ii++)     // Gtemp = A' * (EarNumber-m_ort)
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_Training415:
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
BCS	L_Training416
;hepsi.h,1632 :: 		temp1 = temp1 + (Ear[z1*row*col+ii] - m_ort[ii])*(Ear[jj*row*col+ii] - m_ort[ii]);
MOVW	R5, #lo_addr(_row+0)
MOVT	R5, #hi_addr(_row+0)
LDR	R1, [R5, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
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
MOV	R0, R3
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_m_ort+0)
MOVT	R0, #hi_addr(_m_ort+0)
ADDS	R1, R0, R1
VMOV	S0, R2
VCVT.F32	#0, S0, S0
VLDR	#1, S2, [R1, #0]
VSUB.F32	S1, S0, S2
MOV	R0, R5
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
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
;hepsi.h,1631 :: 		for(ii=0;ii<row*col;ii++)     // Gtemp = A' * (EarNumber-m_ort)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1632 :: 		temp1 = temp1 + (Ear[z1*row*col+ii] - m_ort[ii])*(Ear[jj*row*col+ii] - m_ort[ii]);
IT	AL
BAL	L_Training415
L_Training416:
;hepsi.h,1633 :: 		GTemp[z1-x1*(5-ClassPopulation)] =  temp1;}}
MOVW	R0, #lo_addr(_ClassPopulation+0)
MOVT	R0, #hi_addr(_ClassPopulation+0)
LDR	R0, [R0, #0]
RSB	R1, R0, #5
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
MULS	R1, R0, R1
MOVW	R2, #lo_addr(_z1+0)
MOVT	R2, #hi_addr(_z1+0)
LDR	R0, [R2, #0]
SUB	R0, R0, R1
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;hepsi.h,1629 :: 		for(z1=5*x1;z1<5*x1+ClassPopulation;z1++){        //(picture x row*col)(row*col x 1)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;hepsi.h,1633 :: 		GTemp[z1-x1*(5-ClassPopulation)] =  temp1;}}
IT	AL
BAL	L_Training412
L_Training413:
;hepsi.h,1628 :: 		for(x1=0;x1<ClassNumber;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1633 :: 		GTemp[z1-x1*(5-ClassPopulation)] =  temp1;}}
IT	AL
BAL	L_Training409
L_Training410:
;hepsi.h,1634 :: 		for(x1=0;x1<N;x1++){   // ProjectedImages = V' *  GTemp = V' * A' * (EarNumber-m_ort)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training418:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training419
;hepsi.h,1635 :: 		temp2 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp2+0)
MOVT	R0, #hi_addr(_temp2+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1636 :: 		for(z1=0;z1<TrainPicture;z1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_Training421:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training422
;hepsi.h,1637 :: 		temp2 = temp2 + V[z1][x1]*GTemp[z1]; // L'=L[y1][x1]; L= L[x1][y1]
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
;hepsi.h,1636 :: 		for(z1=0;z1<TrainPicture;z1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1637 :: 		temp2 = temp2 + V[z1][x1]*GTemp[z1]; // L'=L[y1][x1]; L= L[x1][y1]
IT	AL
BAL	L_Training421
L_Training422:
;hepsi.h,1638 :: 		L[x1][jj-y1*(5-ClassPopulation)] = temp2;}}} //L[x1][y1] => ProjectedImages[x1][y1]
MOVW	R3, #lo_addr(_x1+0)
MOVT	R3, #hi_addr(_x1+0)
LDR	R1, [R3, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R2, R0, R1
MOVW	R0, #lo_addr(_ClassPopulation+0)
MOVT	R0, #hi_addr(_ClassPopulation+0)
LDR	R0, [R0, #0]
RSB	R1, R0, #5
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
SUB	R0, R0, R1
LSLS	R0, R0, #2
ADDS	R1, R2, R0
MOVW	R0, #lo_addr(_temp2+0)
MOVT	R0, #hi_addr(_temp2+0)
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;hepsi.h,1634 :: 		for(x1=0;x1<N;x1++){   // ProjectedImages = V' *  GTemp = V' * A' * (EarNumber-m_ort)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1638 :: 		L[x1][jj-y1*(5-ClassPopulation)] = temp2;}}} //L[x1][y1] => ProjectedImages[x1][y1]
IT	AL
BAL	L_Training418
L_Training419:
;hepsi.h,1627 :: 		for(jj=5*y1;jj<5*y1+ClassPopulation;jj++){
MOVW	R1, #lo_addr(_jj+0)
MOVT	R1, #hi_addr(_jj+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1638 :: 		L[x1][jj-y1*(5-ClassPopulation)] = temp2;}}} //L[x1][y1] => ProjectedImages[x1][y1]
IT	AL
BAL	L_Training406
L_Training407:
;hepsi.h,1626 :: 		for(y1=0;y1<ClassNumber;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1638 :: 		L[x1][jj-y1*(5-ClassPopulation)] = temp2;}}} //L[x1][y1] => ProjectedImages[x1][y1]
IT	AL
BAL	L_Training403
L_Training404:
;hepsi.h,1640 :: 		TFT_Write_Text("ProjectedImages OK",30, 140);
MOVW	R0, #lo_addr(?lstr26_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr26_FISHER_GUI_main+0)
MOVS	R2, #140
MOVS	R1, #30
BL	_TFT_Write_Text+0
;hepsi.h,1642 :: 		TFT_Write_Text("Sw ?", 30, 150);
MOVW	R0, #lo_addr(?lstr27_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr27_FISHER_GUI_main+0)
MOVS	R2, #150
MOVS	R1, #30
BL	_TFT_Write_Text+0
;hepsi.h,1644 :: 		for(ii=0;ii<ClassNumber;ii++){ // m_ort = row*col x 1
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_Training424:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training425
;hepsi.h,1646 :: 		for(x1=0;x1<N;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training427:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training428
;hepsi.h,1647 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1648 :: 		for(y1=ii*ClassPopulation;y1<(ii+1)*ClassPopulation;y1++)
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
L_Training430:
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
BCS	L_Training431
;hepsi.h,1649 :: 		temp1 = temp1 + L[x1][y1];
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
;hepsi.h,1648 :: 		for(y1=ii*ClassPopulation;y1<(ii+1)*ClassPopulation;y1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;hepsi.h,1649 :: 		temp1 = temp1 + L[x1][y1];
IT	AL
BAL	L_Training430
L_Training431:
;hepsi.h,1650 :: 		GTemp[x1] = temp1/ClassPopulation;}
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
;hepsi.h,1646 :: 		for(x1=0;x1<N;x1++){
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1650 :: 		GTemp[x1] = temp1/ClassPopulation;}
IT	AL
BAL	L_Training427
L_Training428:
;hepsi.h,1652 :: 		for(y1=0;y1<N;y1++)      //  QV sýfýrlandý
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Training433:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training434
;hepsi.h,1653 :: 		for(x1=0;x1<N;x1++) QV[x1][y1] = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training436:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training437
MOVW	R2, #lo_addr(_x1+0)
MOVT	R2, #hi_addr(_x1+0)
LDR	R1, [R2, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_QV+0)
MOVT	R0, #hi_addr(_QV+0)
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
BAL	L_Training436
L_Training437:
;hepsi.h,1652 :: 		for(y1=0;y1<N;y1++)      //  QV sýfýrlandý
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1653 :: 		for(x1=0;x1<N;x1++) QV[x1][y1] = 0;
IT	AL
BAL	L_Training433
L_Training434:
;hepsi.h,1655 :: 		for(y1=ii*ClassPopulation;y1<(ii+1)*ClassPopulation;y1++){
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
L_Training439:
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
BCS	L_Training440
;hepsi.h,1656 :: 		for(z1=0;z1<N;z1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_Training442:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training443
;hepsi.h,1657 :: 		for(x1=0;x1<N;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training445:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training446
;hepsi.h,1658 :: 		QV[x1][z1] =  QV[x1][z1]  + (L[x1][y1]-GTemp[x1])*(L[z1][y1]-GTemp[x1]); }}
MOVW	R5, #lo_addr(_x1+0)
MOVT	R5, #hi_addr(_x1+0)
LDR	R1, [R5, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_QV+0)
MOVT	R0, #hi_addr(_QV+0)
ADDS	R1, R0, R1
MOVW	R4, #lo_addr(_z1+0)
MOVT	R4, #hi_addr(_z1+0)
LDR	R0, [R4, #0]
LSLS	R0, R0, #2
ADDS	R3, R1, R0
VLDR	#1, S3, [R3, #0]
MOV	R0, R5
LDR	R1, [R0, #0]
MOVW	R0, #400
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_L+0)
MOVT	R0, #hi_addr(_L+0)
ADDS	R1, R0, R1
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
;hepsi.h,1657 :: 		for(x1=0;x1<N;x1++)
MOV	R0, R5
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R5, #0]
;hepsi.h,1658 :: 		QV[x1][z1] =  QV[x1][z1]  + (L[x1][y1]-GTemp[x1])*(L[z1][y1]-GTemp[x1]); }}
IT	AL
BAL	L_Training445
L_Training446:
;hepsi.h,1656 :: 		for(z1=0;z1<N;z1++){
MOVW	R1, #lo_addr(_z1+0)
MOVT	R1, #hi_addr(_z1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1658 :: 		QV[x1][z1] =  QV[x1][z1]  + (L[x1][y1]-GTemp[x1])*(L[z1][y1]-GTemp[x1]); }}
IT	AL
BAL	L_Training442
L_Training443:
;hepsi.h,1655 :: 		for(y1=ii*ClassPopulation;y1<(ii+1)*ClassPopulation;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1658 :: 		QV[x1][z1] =  QV[x1][z1]  + (L[x1][y1]-GTemp[x1])*(L[z1][y1]-GTemp[x1]); }}
IT	AL
BAL	L_Training439
L_Training440:
;hepsi.h,1660 :: 		for(y1=0;y1<N;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Training448:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training449
;hepsi.h,1661 :: 		for(x1=0;x1<N;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training451:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training452
;hepsi.h,1662 :: 		SS[x1][y1] = SS[x1][y1] + QV[x1][y1];}  }     // Sw 50x50
MOVW	R5, #lo_addr(_x1+0)
MOVT	R5, #hi_addr(_x1+0)
LDR	R1, [R5, #0]
MOVS	R0, #200
MUL	R4, R0, R1
MOVW	R0, #lo_addr(_SS+0)
MOVT	R0, #hi_addr(_SS+0)
ADDS	R1, R0, R4
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R3, R0, #2
ADDS	R2, R1, R3
VLDR	#1, S1, [R2, #0]
MOVW	R0, #lo_addr(_QV+0)
MOVT	R0, #hi_addr(_QV+0)
ADDS	R0, R0, R4
ADDS	R0, R0, R3
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;hepsi.h,1661 :: 		for(x1=0;x1<N;x1++)
MOV	R0, R5
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R5, #0]
;hepsi.h,1662 :: 		SS[x1][y1] = SS[x1][y1] + QV[x1][y1];}  }     // Sw 50x50
IT	AL
BAL	L_Training451
L_Training452:
;hepsi.h,1660 :: 		for(y1=0;y1<N;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1662 :: 		SS[x1][y1] = SS[x1][y1] + QV[x1][y1];}  }     // Sw 50x50
IT	AL
BAL	L_Training448
L_Training449:
;hepsi.h,1644 :: 		for(ii=0;ii<ClassNumber;ii++){ // m_ort = row*col x 1
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1662 :: 		SS[x1][y1] = SS[x1][y1] + QV[x1][y1];}  }     // Sw 50x50
IT	AL
BAL	L_Training424
L_Training425:
;hepsi.h,1664 :: 		TFT_Write_Text("Sw OK", 30, 160);
MOVW	R0, #lo_addr(?lstr28_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr28_FISHER_GUI_main+0)
MOVS	R2, #160
MOVS	R1, #30
BL	_TFT_Write_Text+0
;hepsi.h,1665 :: 		TFT_Write_Text("inv(Sw) ?", 30, 170);
MOVW	R0, #lo_addr(?lstr29_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr29_FISHER_GUI_main+0)
MOVS	R2, #170
MOVS	R1, #30
BL	_TFT_Write_Text+0
;hepsi.h,1667 :: 		for(ii=0;ii<TrainPicture;ii++)   {GTemp[ii]= 0;  MTemp[ii] = 0; }
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_Training454:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training455
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
BAL	L_Training454
L_Training455:
;hepsi.h,1668 :: 		for(ii=0;ii<N;ii++) BTemp[ii] = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_Training457:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training458
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
BAL	L_Training457
L_Training458:
;hepsi.h,1669 :: 		for(ii=0;ii<N;ii++) RTemp[ii] = ii;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_Training460:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training461
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
BAL	L_Training460
L_Training461:
;hepsi.h,1671 :: 		for(p=0;p<(N-1);p++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
STR	R1, [R0, #0]
L_Training463:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training464
;hepsi.h,1673 :: 		temp1 = 0;      //en büyük deðer bulma pivot
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1674 :: 		for(x1=p;x1<N;x1++){
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training466:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training467
;hepsi.h,1675 :: 		if (fabs(SS[x1][p]) > temp1) {
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
BLE	L_Training469
;hepsi.h,1676 :: 		temp1 = fabs(SS[x1][p]);
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
;hepsi.h,1677 :: 		jj=x1;}}
LDR	R0, [SP, #4]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
STR	R1, [R0, #0]
L_Training469:
;hepsi.h,1674 :: 		for(x1=p;x1<N;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1677 :: 		jj=x1;}}
IT	AL
BAL	L_Training466
L_Training467:
;hepsi.h,1679 :: 		for(ii=0;ii<N;ii++){   //row changing
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_Training470:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training471
;hepsi.h,1680 :: 		temp2 = SS[p][ii];
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
;hepsi.h,1681 :: 		SS[p][ii] = SS[jj][ii];
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
;hepsi.h,1682 :: 		SS[jj][ii] = temp2;}
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
;hepsi.h,1679 :: 		for(ii=0;ii<N;ii++){   //row changing
MOV	R0, R6
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R6, #0]
;hepsi.h,1682 :: 		SS[jj][ii] = temp2;}
IT	AL
BAL	L_Training470
L_Training471:
;hepsi.h,1684 :: 		mm = RTemp[p];
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
;hepsi.h,1685 :: 		RTemp[p] = RTemp[jj];
MOVW	R2, #lo_addr(_jj+0)
MOVT	R2, #hi_addr(_jj+0)
LDR	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_RTemp+0)
MOVT	R0, #hi_addr(_RTemp+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
STR	R0, [R4, #0]
;hepsi.h,1686 :: 		RTemp[jj] = mm;
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_RTemp+0)
MOVT	R0, #hi_addr(_RTemp+0)
ADDS	R1, R0, R1
MOV	R0, R3
LDR	R0, [R0, #0]
STR	R0, [R1, #0]
;hepsi.h,1688 :: 		for (kk=(p+1);kk<N;kk++){
MOV	R0, R5
LDR	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
STR	R1, [R0, #0]
L_Training473:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training474
;hepsi.h,1689 :: 		temp3 = SS[kk][p]/SS[p][p];
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
;hepsi.h,1690 :: 		SS[kk][p] = temp3;
VSTR	#1, S0, [R2, #0]
;hepsi.h,1691 :: 		for(ii=(p+1);ii<N;ii++)
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_Training476:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training477
;hepsi.h,1692 :: 		SS[kk][ii] = SS[kk][ii] - temp3*SS[p][ii]; }
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
;hepsi.h,1691 :: 		for(ii=(p+1);ii<N;ii++)
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;hepsi.h,1692 :: 		SS[kk][ii] = SS[kk][ii] - temp3*SS[p][ii]; }
IT	AL
BAL	L_Training476
L_Training477:
;hepsi.h,1688 :: 		for (kk=(p+1);kk<N;kk++){
MOVW	R1, #lo_addr(_kk+0)
MOVT	R1, #hi_addr(_kk+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1692 :: 		SS[kk][ii] = SS[kk][ii] - temp3*SS[p][ii]; }
IT	AL
BAL	L_Training473
L_Training474:
;hepsi.h,1671 :: 		for(p=0;p<(N-1);p++){
MOVW	R1, #lo_addr(_p+0)
MOVT	R1, #hi_addr(_p+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1693 :: 		}
IT	AL
BAL	L_Training463
L_Training464:
;hepsi.h,1694 :: 		x1 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
;hepsi.h,1695 :: 		for(jj=0;jj<N;jj++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
STR	R1, [R0, #0]
L_Training479:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training480
;hepsi.h,1697 :: 		for(ii=0;ii<TrainPicture;ii++) {GTemp[ii]= 0;  MTemp[ii] = 0;}
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_Training482:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training483
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
BAL	L_Training482
L_Training483:
;hepsi.h,1699 :: 		for(ii=0;ii<N;ii++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_Training485:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training486
;hepsi.h,1700 :: 		if (x1 == ii) BTemp[ii] = 1;
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_Training488
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
BAL	L_Training489
L_Training488:
;hepsi.h,1701 :: 		else  BTemp[ii] = 0;}
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_BTemp+0)
MOVT	R0, #hi_addr(_BTemp+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STR	R0, [R1, #0]
L_Training489:
;hepsi.h,1699 :: 		for(ii=0;ii<N;ii++){
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1701 :: 		else  BTemp[ii] = 0;}
IT	AL
BAL	L_Training485
L_Training486:
;hepsi.h,1704 :: 		mm = RTemp[0];
MOVW	R2, #lo_addr(_RTemp+0)
MOVT	R2, #hi_addr(_RTemp+0)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_mm+0)
MOVT	R0, #hi_addr(_mm+0)
STR	R1, [R0, #0]
;hepsi.h,1705 :: 		MTemp[0] =  BTemp[mm];
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
;hepsi.h,1706 :: 		for (kk=1;kk<N;kk++){
MOVS	R1, #1
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
STR	R1, [R0, #0]
L_Training490:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training491
;hepsi.h,1707 :: 		temp4 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1708 :: 		for (z1=0;z1<(kk);z1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_Training493:
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training494
;hepsi.h,1709 :: 		temp4 = temp4 + SS[kk][z1]*MTemp[z1];
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
;hepsi.h,1708 :: 		for (z1=0;z1<(kk);z1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1709 :: 		temp4 = temp4 + SS[kk][z1]*MTemp[z1];
IT	AL
BAL	L_Training493
L_Training494:
;hepsi.h,1710 :: 		mm = RTemp[kk];
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
;hepsi.h,1711 :: 		MTemp[kk] =  BTemp[mm] - temp4;}
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
;hepsi.h,1706 :: 		for (kk=1;kk<N;kk++){
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1711 :: 		MTemp[kk] =  BTemp[mm] - temp4;}
IT	AL
BAL	L_Training490
L_Training491:
;hepsi.h,1714 :: 		GTemp[N-1] = MTemp[N-1]/SS[N-1][N-1];
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
;hepsi.h,1715 :: 		for (kk=0;kk<(N-1);kk++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
STR	R1, [R0, #0]
L_Training496:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training497
;hepsi.h,1716 :: 		temp5 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp5+0)
MOVT	R0, #hi_addr(_temp5+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1717 :: 		for (z1=(N-1-kk);z1<N;z1++)
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
L_Training499:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training500
;hepsi.h,1718 :: 		temp5 = temp5 + SS[N-2-kk][z1]*GTemp[z1];
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
;hepsi.h,1717 :: 		for (z1=(N-1-kk);z1<N;z1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1718 :: 		temp5 = temp5 + SS[N-2-kk][z1]*GTemp[z1];
IT	AL
BAL	L_Training499
L_Training500:
;hepsi.h,1719 :: 		GTemp[N-2-kk] =  (MTemp[N-2-kk] - temp5)/SS[N-2-kk][N-2-kk];}
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
;hepsi.h,1715 :: 		for (kk=0;kk<(N-1);kk++){
MOV	R0, R5
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R5, #0]
;hepsi.h,1719 :: 		GTemp[N-2-kk] =  (MTemp[N-2-kk] - temp5)/SS[N-2-kk][N-2-kk];}
IT	AL
BAL	L_Training496
L_Training497:
;hepsi.h,1721 :: 		for(kk=0;kk<N;kk++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
STR	R1, [R0, #0]
L_Training502:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training503
;hepsi.h,1722 :: 		QV[kk][jj] = GTemp[kk]; // inv(Sw) = V[50][50] ;
MOVW	R3, #lo_addr(_kk+0)
MOVT	R3, #hi_addr(_kk+0)
LDR	R1, [R3, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_QV+0)
MOVT	R0, #hi_addr(_QV+0)
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
;hepsi.h,1721 :: 		for(kk=0;kk<N;kk++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1722 :: 		QV[kk][jj] = GTemp[kk]; // inv(Sw) = V[50][50] ;
IT	AL
BAL	L_Training502
L_Training503:
;hepsi.h,1723 :: 		x1 = x1 + 1;
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1695 :: 		for(jj=0;jj<N;jj++){
MOVW	R1, #lo_addr(_jj+0)
MOVT	R1, #hi_addr(_jj+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1724 :: 		}
IT	AL
BAL	L_Training479
L_Training480:
;hepsi.h,1726 :: 		TFT_Write_Text("inv(Sw) OK",30, 180);
MOVW	R0, #lo_addr(?lstr30_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr30_FISHER_GUI_main+0)
MOVS	R2, #180
MOVS	R1, #30
BL	_TFT_Write_Text+0
;hepsi.h,1727 :: 		TFT_Write_Text("Sb ?",  30, 190);
MOVW	R0, #lo_addr(?lstr31_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr31_FISHER_GUI_main+0)
MOVS	R2, #190
MOVS	R1, #30
BL	_TFT_Write_Text+0
;hepsi.h,1729 :: 		for(x1=0;x1<N;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training505:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training506
;hepsi.h,1730 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1731 :: 		for(y1=0;y1<TrainPicture;y1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Training508:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training509
;hepsi.h,1732 :: 		temp1 =  temp1 + L[x1][y1];    //L => projectedimages 50x100
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
;hepsi.h,1731 :: 		for(y1=0;y1<TrainPicture;y1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;hepsi.h,1732 :: 		temp1 =  temp1 + L[x1][y1];    //L => projectedimages 50x100
IT	AL
BAL	L_Training508
L_Training509:
;hepsi.h,1733 :: 		Mtemp[x1] = temp1/TrainPicture;}  //Mtemp toplam ortalama 50x1
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
;hepsi.h,1729 :: 		for(x1=0;x1<N;x1++){
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1733 :: 		Mtemp[x1] = temp1/TrainPicture;}  //Mtemp toplam ortalama 50x1
IT	AL
BAL	L_Training505
L_Training506:
;hepsi.h,1735 :: 		for(x1=0;x1<N;x1++)      //  L[50-99][0-49]   50x50 => Sb
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training511:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training512
;hepsi.h,1736 :: 		for(y1=0;y1<N;y1++) L[x1+50][y1] = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Training514:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training515
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
BAL	L_Training514
L_Training515:
;hepsi.h,1735 :: 		for(x1=0;x1<N;x1++)      //  L[50-99][0-49]   50x50 => Sb
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1736 :: 		for(y1=0;y1<N;y1++) L[x1+50][y1] = 0;
IT	AL
BAL	L_Training511
L_Training512:
;hepsi.h,1738 :: 		for(ii=0;ii<ClassNumber;ii++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_Training517:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training518
;hepsi.h,1740 :: 		for(x1=0;x1<N;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training520:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training521
;hepsi.h,1741 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1742 :: 		for(y1=ii*ClassPopulation;y1<(ii+1)*ClassPopulation;y1++)
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
L_Training523:
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
BCS	L_Training524
;hepsi.h,1743 :: 		temp1 = temp1 + L[x1][y1];
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
;hepsi.h,1742 :: 		for(y1=ii*ClassPopulation;y1<(ii+1)*ClassPopulation;y1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;hepsi.h,1743 :: 		temp1 = temp1 + L[x1][y1];
IT	AL
BAL	L_Training523
L_Training524:
;hepsi.h,1744 :: 		GTemp[x1] = temp1/ClassPopulation;}     // GTemp = sýnýf ortalamasý
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
;hepsi.h,1740 :: 		for(x1=0;x1<N;x1++){
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1744 :: 		GTemp[x1] = temp1/ClassPopulation;}     // GTemp = sýnýf ortalamasý
IT	AL
BAL	L_Training520
L_Training521:
;hepsi.h,1746 :: 		for(x1=0;x1<N;x1++){       // Sb = Sb + (m_sýnýf - m_ort_toplam)*(m_sýnýf - m_ort_toplam)';
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training526:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training527
;hepsi.h,1747 :: 		for(y1=0;y1<N;y1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Training529:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training530
;hepsi.h,1748 :: 		L[x1+50][y1] = L[x1+50][y1] + (GTemp[x1]-Mtemp[x1])*(GTemp[y1]-Mtemp[y1]);}
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
;hepsi.h,1747 :: 		for(y1=0;y1<N;y1++)
MOV	R0, R5
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R5, #0]
;hepsi.h,1748 :: 		L[x1+50][y1] = L[x1+50][y1] + (GTemp[x1]-Mtemp[x1])*(GTemp[y1]-Mtemp[y1]);}
IT	AL
BAL	L_Training529
L_Training530:
;hepsi.h,1746 :: 		for(x1=0;x1<N;x1++){       // Sb = Sb + (m_sýnýf - m_ort_toplam)*(m_sýnýf - m_ort_toplam)';
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1748 :: 		L[x1+50][y1] = L[x1+50][y1] + (GTemp[x1]-Mtemp[x1])*(GTemp[y1]-Mtemp[y1]);}
IT	AL
BAL	L_Training526
L_Training527:
;hepsi.h,1738 :: 		for(ii=0;ii<ClassNumber;ii++){
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1749 :: 		}
IT	AL
BAL	L_Training517
L_Training518:
;hepsi.h,1750 :: 		TFT_Write_Text("Sb OK",  30, 200);
MOVW	R0, #lo_addr(?lstr32_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr32_FISHER_GUI_main+0)
MOVS	R2, #200
MOVS	R1, #30
BL	_TFT_Write_Text+0
;hepsi.h,1752 :: 		for(x1=0;x1<N;x1++){       // S =inv(Sw)*Sb 50x50
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training532:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training533
;hepsi.h,1753 :: 		for(y1=0;y1<N;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Training535:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training536
;hepsi.h,1754 :: 		temp3 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1755 :: 		for(z1=0;z1<N;z1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_Training538:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training539
;hepsi.h,1756 :: 		temp3 = temp3 + QV[x1][z1]*L[z1+50][y1];
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_QV+0)
MOVT	R0, #hi_addr(_QV+0)
ADDS	R1, R0, R1
MOVW	R3, #lo_addr(_z1+0)
MOVT	R3, #hi_addr(_z1+0)
LDR	R0, [R3, #0]
LSLS	R0, R0, #2
ADDS	R2, R1, R0
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
;hepsi.h,1755 :: 		for(z1=0;z1<N;z1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1756 :: 		temp3 = temp3 + QV[x1][z1]*L[z1+50][y1];
IT	AL
BAL	L_Training538
L_Training539:
;hepsi.h,1757 :: 		SS[x1][y1] = temp3;}}
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
;hepsi.h,1753 :: 		for(y1=0;y1<N;y1++){
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;hepsi.h,1757 :: 		SS[x1][y1] = temp3;}}
IT	AL
BAL	L_Training535
L_Training536:
;hepsi.h,1752 :: 		for(x1=0;x1<N;x1++){       // S =inv(Sw)*Sb 50x50
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1757 :: 		SS[x1][y1] = temp3;}}
IT	AL
BAL	L_Training532
L_Training533:
;hepsi.h,1759 :: 		TFT_Write_Text("S OK",  30, 210);
MOVW	R0, #lo_addr(?lstr33_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr33_FISHER_GUI_main+0)
MOVS	R2, #210
MOVS	R1, #30
BL	_TFT_Write_Text+0
;hepsi.h,1760 :: 		TFT_Write_Text("QR Algorithm Start",  30, 220);
MOVW	R0, #lo_addr(?lstr34_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr34_FISHER_GUI_main+0)
MOVS	R2, #220
MOVS	R1, #30
BL	_TFT_Write_Text+0
;hepsi.h,1761 :: 		for(x1=0;x1<N;x1++){        // Q matrisi  Q=SS;
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training541:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training542
;hepsi.h,1762 :: 		for(y1=0;y1<N;y1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Training544:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training545
;hepsi.h,1763 :: 		L[50+x1][y1] = SS[x1][y1];}
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
;hepsi.h,1762 :: 		for(y1=0;y1<N;y1++)
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;hepsi.h,1763 :: 		L[50+x1][y1] = SS[x1][y1];}
IT	AL
BAL	L_Training544
L_Training545:
;hepsi.h,1761 :: 		for(x1=0;x1<N;x1++){        // Q matrisi  Q=SS;
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1763 :: 		L[50+x1][y1] = SS[x1][y1];}
IT	AL
BAL	L_Training541
L_Training542:
;hepsi.h,1765 :: 		for(y1=0;y1<N;y1++){       //V birim matris 50x50
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Training547:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training548
;hepsi.h,1766 :: 		for(x1=0;x1<N;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training550:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training551
;hepsi.h,1767 :: 		if (x1==y1) QV[x1][y1] = 1;
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_Training553
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_QV+0)
MOVT	R0, #hi_addr(_QV+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
VMOV.F32	S0, #1
VSTR	#1, S0, [R1, #0]
IT	AL
BAL	L_Training554
L_Training553:
;hepsi.h,1768 :: 		else        QV[x1][y1] = 0;}}
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_QV+0)
MOVT	R0, #hi_addr(_QV+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
L_Training554:
;hepsi.h,1766 :: 		for(x1=0;x1<N;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1768 :: 		else        QV[x1][y1] = 0;}}
IT	AL
BAL	L_Training550
L_Training551:
;hepsi.h,1765 :: 		for(y1=0;y1<N;y1++){       //V birim matris 50x50
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1768 :: 		else        QV[x1][y1] = 0;}}
IT	AL
BAL	L_Training547
L_Training548:
;hepsi.h,1770 :: 		for(ii=0;ii<10;ii++){  //QR büyük dongu-1  eigenvalue
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_Training555:
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, #10
IT	CS
BCS	L_Training556
;hepsi.h,1772 :: 		for(x1=0;x1<N;x1++){                   // R matrisi
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training558:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training559
;hepsi.h,1773 :: 		for(y1=0;y1<N;y1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Training561:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training562
;hepsi.h,1774 :: 		L[50+x1][50+y1] = 0;}
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
;hepsi.h,1773 :: 		for(y1=0;y1<N;y1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;hepsi.h,1774 :: 		L[50+x1][50+y1] = 0;}
IT	AL
BAL	L_Training561
L_Training562:
;hepsi.h,1772 :: 		for(x1=0;x1<N;x1++){                   // R matrisi
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1774 :: 		L[50+x1][50+y1] = 0;}
IT	AL
BAL	L_Training558
L_Training559:
;hepsi.h,1776 :: 		for(kk=0;kk<N;kk++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
STR	R1, [R0, #0]
L_Training564:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training565
;hepsi.h,1777 :: 		for(jj=0;jj<kk;jj++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
STR	R1, [R0, #0]
L_Training567:
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training568
;hepsi.h,1778 :: 		temp3 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1779 :: 		for(x1=0;x1<N;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training570:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training571
;hepsi.h,1780 :: 		temp3 = temp3 + L[50+x1][jj]*L[50+x1][kk];  //R = Q'*Q
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
;hepsi.h,1779 :: 		for(x1=0;x1<N;x1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1780 :: 		temp3 = temp3 + L[50+x1][jj]*L[50+x1][kk];  //R = Q'*Q
IT	AL
BAL	L_Training570
L_Training571:
;hepsi.h,1781 :: 		L[50+jj][50+kk] = temp3;
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
;hepsi.h,1782 :: 		for(x1=0;x1<N;x1++)      // R*Q =  MTemp[x1]
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training573:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training574
;hepsi.h,1783 :: 		MTemp[x1] =  L[50+jj][50+kk]*L[50+x1][jj];
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
;hepsi.h,1782 :: 		for(x1=0;x1<N;x1++)      // R*Q =  MTemp[x1]
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;hepsi.h,1783 :: 		MTemp[x1] =  L[50+jj][50+kk]*L[50+x1][jj];
IT	AL
BAL	L_Training573
L_Training574:
;hepsi.h,1784 :: 		for(x1=0;x1<N;x1++)   //Q=Q-RQ
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training576:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training577
;hepsi.h,1785 :: 		GTemp[x1]   = L[50+x1][kk] - MTemp[x1] ;
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
;hepsi.h,1784 :: 		for(x1=0;x1<N;x1++)   //Q=Q-RQ
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;hepsi.h,1785 :: 		GTemp[x1]   = L[50+x1][kk] - MTemp[x1] ;
IT	AL
BAL	L_Training576
L_Training577:
;hepsi.h,1786 :: 		for(x1=0;x1<N;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training579:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training580
;hepsi.h,1787 :: 		L[50+x1][kk] = GTemp[x1];  }
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
;hepsi.h,1786 :: 		for(x1=0;x1<N;x1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1787 :: 		L[50+x1][kk] = GTemp[x1];  }
IT	AL
BAL	L_Training579
L_Training580:
;hepsi.h,1777 :: 		for(jj=0;jj<kk;jj++){
MOVW	R1, #lo_addr(_jj+0)
MOVT	R1, #hi_addr(_jj+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1787 :: 		L[50+x1][kk] = GTemp[x1];  }
IT	AL
BAL	L_Training567
L_Training568:
;hepsi.h,1789 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1790 :: 		for(x1=0;x1<N;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training582:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training583
;hepsi.h,1791 :: 		temp1 = temp1 + L[50+x1][kk]*L[50+x1][kk];
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
;hepsi.h,1790 :: 		for(x1=0;x1<N;x1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;hepsi.h,1791 :: 		temp1 = temp1 + L[50+x1][kk]*L[50+x1][kk];
IT	AL
BAL	L_Training582
L_Training583:
;hepsi.h,1792 :: 		L[50+kk][50+kk] = sqrt(temp1);  //norm (Q)
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
;hepsi.h,1794 :: 		for(x1=0;x1<N;x1++)  // Q =Q/R
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training585:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training586
;hepsi.h,1795 :: 		L[50+x1][kk] = L[50+x1][kk]/L[50+kk][50+kk];
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
;hepsi.h,1794 :: 		for(x1=0;x1<N;x1++)  // Q =Q/R
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;hepsi.h,1795 :: 		L[50+x1][kk] = L[50+x1][kk]/L[50+kk][50+kk];
IT	AL
BAL	L_Training585
L_Training586:
;hepsi.h,1776 :: 		for(kk=0;kk<N;kk++){
MOVW	R1, #lo_addr(_kk+0)
MOVT	R1, #hi_addr(_kk+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1796 :: 		}
IT	AL
BAL	L_Training564
L_Training565:
;hepsi.h,1798 :: 		for(x1=0;x1<N;x1++){        // V[50][50] =V[50][50]*Q[50][50]
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training588:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training589
;hepsi.h,1799 :: 		for(m1=0;m1<N;m1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_m1+0)
MOVT	R0, #hi_addr(_m1+0)
STR	R1, [R0, #0]
L_Training591:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_m1+0)
MOVT	R0, #hi_addr(_m1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training592
;hepsi.h,1800 :: 		GTemp[m1] = QV[x1][m1];
MOVW	R4, #lo_addr(_m1+0)
MOVT	R4, #hi_addr(_m1+0)
LDR	R0, [R4, #0]
LSLS	R3, R0, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R2, R0, R3
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_QV+0)
MOVT	R0, #hi_addr(_QV+0)
ADDS	R0, R0, R1
ADDS	R0, R0, R3
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R2, #0]
;hepsi.h,1799 :: 		for(m1=0;m1<N;m1++)
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;hepsi.h,1800 :: 		GTemp[m1] = QV[x1][m1];
IT	AL
BAL	L_Training591
L_Training592:
;hepsi.h,1801 :: 		for(y1=0;y1<N;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Training594:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training595
;hepsi.h,1802 :: 		temp3 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1803 :: 		for(z1=0;z1<N;z1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_Training597:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training598
;hepsi.h,1804 :: 		temp3 = temp3 + GTemp[z1]*L[z1+50][y1];
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
;hepsi.h,1803 :: 		for(z1=0;z1<N;z1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1804 :: 		temp3 = temp3 + GTemp[z1]*L[z1+50][y1];
IT	AL
BAL	L_Training597
L_Training598:
;hepsi.h,1805 :: 		QV[x1][y1] = temp3;}}
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_QV+0)
MOVT	R0, #hi_addr(_QV+0)
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
;hepsi.h,1801 :: 		for(y1=0;y1<N;y1++){
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;hepsi.h,1805 :: 		QV[x1][y1] = temp3;}}
IT	AL
BAL	L_Training594
L_Training595:
;hepsi.h,1798 :: 		for(x1=0;x1<N;x1++){        // V[50][50] =V[50][50]*Q[50][50]
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1805 :: 		QV[x1][y1] = temp3;}}
IT	AL
BAL	L_Training588
L_Training589:
;hepsi.h,1807 :: 		for(y1=0;y1<N;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Training600:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training601
;hepsi.h,1808 :: 		for(m1=0;m1<N;m1++)            // Q atanýyor
MOVS	R1, #0
MOVW	R0, #lo_addr(_m1+0)
MOVT	R0, #hi_addr(_m1+0)
STR	R1, [R0, #0]
L_Training603:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_m1+0)
MOVT	R0, #hi_addr(_m1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training604
;hepsi.h,1809 :: 		GTemp[m1] = L[50+m1][y1];
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
;hepsi.h,1808 :: 		for(m1=0;m1<N;m1++)            // Q atanýyor
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1809 :: 		GTemp[m1] = L[50+m1][y1];
IT	AL
BAL	L_Training603
L_Training604:
;hepsi.h,1810 :: 		for(x1=0;x1<N;x1++){       // Q[50][50]= R[50][50]*Q[50][50]
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training606:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training607
;hepsi.h,1811 :: 		temp3 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1812 :: 		for(z1=0;z1<N;z1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_Training609:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training610
;hepsi.h,1813 :: 		temp3 = temp3 + L[x1+50][z1+50]*GTemp[z1];
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
;hepsi.h,1812 :: 		for(z1=0;z1<N;z1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1813 :: 		temp3 = temp3 + L[x1+50][z1+50]*GTemp[z1];
IT	AL
BAL	L_Training609
L_Training610:
;hepsi.h,1814 :: 		L[50+x1][y1] = temp3;}}
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
;hepsi.h,1810 :: 		for(x1=0;x1<N;x1++){       // Q[50][50]= R[50][50]*Q[50][50]
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;hepsi.h,1814 :: 		L[50+x1][y1] = temp3;}}
IT	AL
BAL	L_Training606
L_Training607:
;hepsi.h,1807 :: 		for(y1=0;y1<N;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1814 :: 		L[50+x1][y1] = temp3;}}
IT	AL
BAL	L_Training600
L_Training601:
;hepsi.h,1770 :: 		for(ii=0;ii<10;ii++){  //QR büyük dongu-1  eigenvalue
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1815 :: 		}
IT	AL
BAL	L_Training555
L_Training556:
;hepsi.h,1818 :: 		for(x1=0;x1<N;x1++)              //eigenvalue => KTemp
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training612:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training613
;hepsi.h,1819 :: 		KTemp[x1] = L[50+x1][x1];
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
;hepsi.h,1818 :: 		for(x1=0;x1<N;x1++)              //eigenvalue => KTemp
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;hepsi.h,1819 :: 		KTemp[x1] = L[50+x1][x1];
IT	AL
BAL	L_Training612
L_Training613:
;hepsi.h,1821 :: 		for(x1=0;x1<N;x1++)   // (ClassNumber-1) özvektor V_Fisher ilk özvektor
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training615:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training616
;hepsi.h,1822 :: 		Fisher[x1][0] = QV[x1][0];
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
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_QV+0)
MOVT	R0, #hi_addr(_QV+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R2, #0]
;hepsi.h,1821 :: 		for(x1=0;x1<N;x1++)   // (ClassNumber-1) özvektor V_Fisher ilk özvektor
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1822 :: 		Fisher[x1][0] = QV[x1][0];
IT	AL
BAL	L_Training615
L_Training616:
;hepsi.h,1824 :: 		for(tt=1;tt<ClassNumber-1;tt++) {
MOVS	R1, #1
MOVW	R0, #lo_addr(_tt+0)
MOVT	R0, #hi_addr(_tt+0)
STR	R1, [R0, #0]
L_Training618:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_tt+0)
MOVT	R0, #hi_addr(_tt+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training619
;hepsi.h,1826 :: 		for(x1=0;x1<N;x1++){        // V[50+x1][y1]=SS;
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training621:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training622
;hepsi.h,1827 :: 		for(y1=0;y1<N;y1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Training624:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training625
;hepsi.h,1828 :: 		V[50+x1][y1+50] = SS[x1][y1];}
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
;hepsi.h,1827 :: 		for(y1=0;y1<N;y1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1828 :: 		V[50+x1][y1+50] = SS[x1][y1];}
IT	AL
BAL	L_Training624
L_Training625:
;hepsi.h,1826 :: 		for(x1=0;x1<N;x1++){        // V[50+x1][y1]=SS;
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1828 :: 		V[50+x1][y1+50] = SS[x1][y1];}
IT	AL
BAL	L_Training621
L_Training622:
;hepsi.h,1830 :: 		for(x1=0;x1<N;x1++)                            // eigenvalue çýkartýlmýþ vektor
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training627:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training628
;hepsi.h,1831 :: 		V[50+x1][x1+50] = SS[x1][x1] - KTemp[tt];
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
;hepsi.h,1830 :: 		for(x1=0;x1<N;x1++)                            // eigenvalue çýkartýlmýþ vektor
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1831 :: 		V[50+x1][x1+50] = SS[x1][x1] - KTemp[tt];
IT	AL
BAL	L_Training627
L_Training628:
;hepsi.h,1833 :: 		for(ii=0;ii<TrainPicture;ii++)   {GTemp[ii]= 0;  MTemp[ii] = 0; }
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_Training630:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training631
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
BAL	L_Training630
L_Training631:
;hepsi.h,1834 :: 		for(ii=0;ii<N;ii++) BTemp[ii] = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_Training633:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training634
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
BAL	L_Training633
L_Training634:
;hepsi.h,1835 :: 		for(ii=0;ii<N;ii++) RTemp[ii] = ii;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_Training636:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training637
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
BAL	L_Training636
L_Training637:
;hepsi.h,1837 :: 		for(p=0;p<(N-1);p++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
STR	R1, [R0, #0]
L_Training639:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training640
;hepsi.h,1839 :: 		temp1 = 0;      //en büyük deðer bulma pivot
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1840 :: 		for(x1=p;x1<N;x1++){
MOVW	R0, #lo_addr(_p+0)
MOVT	R0, #hi_addr(_p+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training642:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training643
;hepsi.h,1841 :: 		if (fabs(V[x1+50][p+50]) > temp1) {
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
BLE	L_Training645
;hepsi.h,1842 :: 		temp1 = fabs(V[x1+50][p+50]);
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
;hepsi.h,1843 :: 		jj=x1;}}
LDR	R0, [SP, #4]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
STR	R1, [R0, #0]
L_Training645:
;hepsi.h,1840 :: 		for(x1=p;x1<N;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1843 :: 		jj=x1;}}
IT	AL
BAL	L_Training642
L_Training643:
;hepsi.h,1845 :: 		for(ii=0;ii<N;ii++){   //row changing
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_Training646:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training647
;hepsi.h,1846 :: 		temp2 = V[p+50][ii+50];
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
;hepsi.h,1847 :: 		V[p+50][ii+50] = V[jj+50][ii+50];
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
;hepsi.h,1848 :: 		V[jj+50][ii+50] = temp2;}
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
;hepsi.h,1845 :: 		for(ii=0;ii<N;ii++){   //row changing
MOV	R0, R6
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R6, #0]
;hepsi.h,1848 :: 		V[jj+50][ii+50] = temp2;}
IT	AL
BAL	L_Training646
L_Training647:
;hepsi.h,1850 :: 		mm = RTemp[p];
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
;hepsi.h,1851 :: 		RTemp[p] = RTemp[jj];
MOVW	R2, #lo_addr(_jj+0)
MOVT	R2, #hi_addr(_jj+0)
LDR	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_RTemp+0)
MOVT	R0, #hi_addr(_RTemp+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
STR	R0, [R4, #0]
;hepsi.h,1852 :: 		RTemp[jj] = mm;
MOV	R0, R2
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_RTemp+0)
MOVT	R0, #hi_addr(_RTemp+0)
ADDS	R1, R0, R1
MOV	R0, R3
LDR	R0, [R0, #0]
STR	R0, [R1, #0]
;hepsi.h,1854 :: 		for (kk=(p+1);kk<N;kk++){
MOV	R0, R5
LDR	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
STR	R1, [R0, #0]
L_Training649:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training650
;hepsi.h,1855 :: 		temp3 = V[kk+50][p+50]/V[p+50][p+50];
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
;hepsi.h,1856 :: 		V[kk+50][p+50] = temp3;
VSTR	#1, S0, [R3, #0]
;hepsi.h,1857 :: 		for(ii=(p+1);ii<N;ii++)
MOV	R0, R5
LDR	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_Training652:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training653
;hepsi.h,1858 :: 		V[kk+50][ii+50] = V[kk+50][ii+50] - temp3*V[p+50][ii+50]; }
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
;hepsi.h,1857 :: 		for(ii=(p+1);ii<N;ii++)
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;hepsi.h,1858 :: 		V[kk+50][ii+50] = V[kk+50][ii+50] - temp3*V[p+50][ii+50]; }
IT	AL
BAL	L_Training652
L_Training653:
;hepsi.h,1854 :: 		for (kk=(p+1);kk<N;kk++){
MOVW	R1, #lo_addr(_kk+0)
MOVT	R1, #hi_addr(_kk+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1858 :: 		V[kk+50][ii+50] = V[kk+50][ii+50] - temp3*V[p+50][ii+50]; }
IT	AL
BAL	L_Training649
L_Training650:
;hepsi.h,1837 :: 		for(p=0;p<(N-1);p++){
MOVW	R1, #lo_addr(_p+0)
MOVT	R1, #hi_addr(_p+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1859 :: 		}
IT	AL
BAL	L_Training639
L_Training640:
;hepsi.h,1860 :: 		x1 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
;hepsi.h,1861 :: 		for(jj=0;jj<N;jj++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
STR	R1, [R0, #0]
L_Training655:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training656
;hepsi.h,1863 :: 		for(ii=0;ii<TrainPicture;ii++) {GTemp[ii]= 0;  MTemp[ii] = 0;}
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_Training658:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training659
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
BAL	L_Training658
L_Training659:
;hepsi.h,1865 :: 		for(ii=0;ii<N;ii++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_Training661:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training662
;hepsi.h,1866 :: 		if (x1 == ii) BTemp[ii] = 1;
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_Training664
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
BAL	L_Training665
L_Training664:
;hepsi.h,1867 :: 		else  BTemp[ii] = 0;}
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_BTemp+0)
MOVT	R0, #hi_addr(_BTemp+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STR	R0, [R1, #0]
L_Training665:
;hepsi.h,1865 :: 		for(ii=0;ii<N;ii++){
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1867 :: 		else  BTemp[ii] = 0;}
IT	AL
BAL	L_Training661
L_Training662:
;hepsi.h,1870 :: 		mm = RTemp[0];
MOVW	R2, #lo_addr(_RTemp+0)
MOVT	R2, #hi_addr(_RTemp+0)
LDR	R1, [R2, #0]
MOVW	R0, #lo_addr(_mm+0)
MOVT	R0, #hi_addr(_mm+0)
STR	R1, [R0, #0]
;hepsi.h,1871 :: 		MTemp[0] =  BTemp[mm];
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
;hepsi.h,1872 :: 		for (kk=1;kk<N;kk++){
MOVS	R1, #1
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
STR	R1, [R0, #0]
L_Training666:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training667
;hepsi.h,1873 :: 		temp4 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1874 :: 		for (z1=0;z1<(kk);z1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_Training669:
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training670
;hepsi.h,1875 :: 		temp4 = temp4 + V[kk+50][z1+50]*MTemp[z1];
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
;hepsi.h,1874 :: 		for (z1=0;z1<(kk);z1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1875 :: 		temp4 = temp4 + V[kk+50][z1+50]*MTemp[z1];
IT	AL
BAL	L_Training669
L_Training670:
;hepsi.h,1876 :: 		mm = RTemp[kk];
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
;hepsi.h,1877 :: 		MTemp[kk] =  BTemp[mm] - temp4;}
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
;hepsi.h,1872 :: 		for (kk=1;kk<N;kk++){
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1877 :: 		MTemp[kk] =  BTemp[mm] - temp4;}
IT	AL
BAL	L_Training666
L_Training667:
;hepsi.h,1880 :: 		GTemp[N-1] = MTemp[N-1]/V[N-1+50][N-1+50];
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
;hepsi.h,1881 :: 		for (kk=0;kk<(N-1);kk++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
STR	R1, [R0, #0]
L_Training672:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training673
;hepsi.h,1882 :: 		temp5 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp5+0)
MOVT	R0, #hi_addr(_temp5+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1883 :: 		for (z1=(N-1-kk);z1<N;z1++)
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
L_Training675:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training676
;hepsi.h,1884 :: 		temp5 = temp5 + V[N-2-kk+50][z1+50]*GTemp[z1];
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
;hepsi.h,1883 :: 		for (z1=(N-1-kk);z1<N;z1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1884 :: 		temp5 = temp5 + V[N-2-kk+50][z1+50]*GTemp[z1];
IT	AL
BAL	L_Training675
L_Training676:
;hepsi.h,1885 :: 		GTemp[N-2-kk] =  (MTemp[N-2-kk] - temp5)/V[N-2-kk+50][N-2-kk+50];}
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
;hepsi.h,1881 :: 		for (kk=0;kk<(N-1);kk++){
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;hepsi.h,1885 :: 		GTemp[N-2-kk] =  (MTemp[N-2-kk] - temp5)/V[N-2-kk+50][N-2-kk+50];}
IT	AL
BAL	L_Training672
L_Training673:
;hepsi.h,1887 :: 		for(kk=0;kk<N;kk++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
STR	R1, [R0, #0]
L_Training678:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training679
;hepsi.h,1888 :: 		L[50+kk][jj] = GTemp[kk]; // inv(Sw) = V[50][50] ;
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
;hepsi.h,1887 :: 		for(kk=0;kk<N;kk++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1888 :: 		L[50+kk][jj] = GTemp[kk]; // inv(Sw) = V[50][50] ;
IT	AL
BAL	L_Training678
L_Training679:
;hepsi.h,1889 :: 		x1 = x1 + 1;
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1861 :: 		for(jj=0;jj<N;jj++){
MOVW	R1, #lo_addr(_jj+0)
MOVT	R1, #hi_addr(_jj+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1890 :: 		}
IT	AL
BAL	L_Training655
L_Training656:
;hepsi.h,1893 :: 		for(y1=0;y1<N;y1++){       //V birim matris 50x50
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Training681:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training682
;hepsi.h,1894 :: 		for(x1=0;x1<N;x1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training684:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training685
;hepsi.h,1895 :: 		if (x1==y1) QV[x1][y1] = 1;
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_Training687
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_QV+0)
MOVT	R0, #hi_addr(_QV+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
VMOV.F32	S0, #1
VSTR	#1, S0, [R1, #0]
IT	AL
BAL	L_Training688
L_Training687:
;hepsi.h,1896 :: 		else        QV[x1][y1] = 0;}}
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_QV+0)
MOVT	R0, #hi_addr(_QV+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R1, R1, R0
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
L_Training688:
;hepsi.h,1894 :: 		for(x1=0;x1<N;x1++){
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1896 :: 		else        QV[x1][y1] = 0;}}
IT	AL
BAL	L_Training684
L_Training685:
;hepsi.h,1893 :: 		for(y1=0;y1<N;y1++){       //V birim matris 50x50
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1896 :: 		else        QV[x1][y1] = 0;}}
IT	AL
BAL	L_Training681
L_Training682:
;hepsi.h,1898 :: 		for(ii=0;ii<10;ii++){  //QR büyük dongu-2    (özvektörler)
MOVS	R1, #0
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
STR	R1, [R0, #0]
L_Training689:
MOVW	R0, #lo_addr(_ii+0)
MOVT	R0, #hi_addr(_ii+0)
LDR	R0, [R0, #0]
CMP	R0, #10
IT	CS
BCS	L_Training690
;hepsi.h,1900 :: 		for(x1=0;x1<N;x1++){                   // R matrisi
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training692:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training693
;hepsi.h,1901 :: 		for(y1=0;y1<N;y1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Training695:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training696
;hepsi.h,1902 :: 		L[50+x1][50+y1] = 0;}
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
;hepsi.h,1901 :: 		for(y1=0;y1<N;y1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;hepsi.h,1902 :: 		L[50+x1][50+y1] = 0;}
IT	AL
BAL	L_Training695
L_Training696:
;hepsi.h,1900 :: 		for(x1=0;x1<N;x1++){                   // R matrisi
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1902 :: 		L[50+x1][50+y1] = 0;}
IT	AL
BAL	L_Training692
L_Training693:
;hepsi.h,1904 :: 		for(kk=0;kk<N;kk++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
STR	R1, [R0, #0]
L_Training698:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training699
;hepsi.h,1905 :: 		for(jj=0;jj<kk;jj++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
STR	R1, [R0, #0]
L_Training701:
MOVW	R0, #lo_addr(_kk+0)
MOVT	R0, #hi_addr(_kk+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_jj+0)
MOVT	R0, #hi_addr(_jj+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training702
;hepsi.h,1906 :: 		temp3 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1907 :: 		for(x1=0;x1<N;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training704:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training705
;hepsi.h,1908 :: 		temp3 = temp3 + L[50+x1][jj]*L[50+x1][kk];  //R = Q'*Q
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
;hepsi.h,1907 :: 		for(x1=0;x1<N;x1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1908 :: 		temp3 = temp3 + L[50+x1][jj]*L[50+x1][kk];  //R = Q'*Q
IT	AL
BAL	L_Training704
L_Training705:
;hepsi.h,1909 :: 		L[50+jj][50+kk] = temp3;
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
;hepsi.h,1910 :: 		for(x1=0;x1<N;x1++)      // R*Q =  MTemp[x1]
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training707:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training708
;hepsi.h,1911 :: 		MTemp[x1] =  L[50+jj][50+kk]*L[50+x1][jj];
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
;hepsi.h,1910 :: 		for(x1=0;x1<N;x1++)      // R*Q =  MTemp[x1]
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;hepsi.h,1911 :: 		MTemp[x1] =  L[50+jj][50+kk]*L[50+x1][jj];
IT	AL
BAL	L_Training707
L_Training708:
;hepsi.h,1912 :: 		for(x1=0;x1<N;x1++)   //Q=Q-RQ
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training710:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training711
;hepsi.h,1913 :: 		GTemp[x1]   = L[50+x1][kk] - MTemp[x1] ;
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
;hepsi.h,1912 :: 		for(x1=0;x1<N;x1++)   //Q=Q-RQ
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;hepsi.h,1913 :: 		GTemp[x1]   = L[50+x1][kk] - MTemp[x1] ;
IT	AL
BAL	L_Training710
L_Training711:
;hepsi.h,1914 :: 		for(x1=0;x1<N;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training713:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training714
;hepsi.h,1915 :: 		L[50+x1][kk] = GTemp[x1];  }
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
;hepsi.h,1914 :: 		for(x1=0;x1<N;x1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1915 :: 		L[50+x1][kk] = GTemp[x1];  }
IT	AL
BAL	L_Training713
L_Training714:
;hepsi.h,1905 :: 		for(jj=0;jj<kk;jj++){
MOVW	R1, #lo_addr(_jj+0)
MOVT	R1, #hi_addr(_jj+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1915 :: 		L[50+x1][kk] = GTemp[x1];  }
IT	AL
BAL	L_Training701
L_Training702:
;hepsi.h,1917 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1918 :: 		for(x1=0;x1<N;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training716:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training717
;hepsi.h,1919 :: 		temp1 = temp1 + L[50+x1][kk]*L[50+x1][kk];
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
;hepsi.h,1918 :: 		for(x1=0;x1<N;x1++)
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;hepsi.h,1919 :: 		temp1 = temp1 + L[50+x1][kk]*L[50+x1][kk];
IT	AL
BAL	L_Training716
L_Training717:
;hepsi.h,1920 :: 		L[50+kk][50+kk] = sqrt(temp1);  //norm (Q)
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
;hepsi.h,1922 :: 		for(x1=0;x1<N;x1++)  // Q =Q/R
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training719:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training720
;hepsi.h,1923 :: 		L[50+x1][kk] = L[50+x1][kk]/L[50+kk][50+kk];
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
;hepsi.h,1922 :: 		for(x1=0;x1<N;x1++)  // Q =Q/R
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;hepsi.h,1923 :: 		L[50+x1][kk] = L[50+x1][kk]/L[50+kk][50+kk];
IT	AL
BAL	L_Training719
L_Training720:
;hepsi.h,1904 :: 		for(kk=0;kk<N;kk++){
MOVW	R1, #lo_addr(_kk+0)
MOVT	R1, #hi_addr(_kk+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1924 :: 		}
IT	AL
BAL	L_Training698
L_Training699:
;hepsi.h,1926 :: 		for(x1=0;x1<N;x1++){        // V[50][50] =V[50][50]*Q[50][50]
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training722:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training723
;hepsi.h,1927 :: 		for(m1=0;m1<N;m1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_m1+0)
MOVT	R0, #hi_addr(_m1+0)
STR	R1, [R0, #0]
L_Training725:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_m1+0)
MOVT	R0, #hi_addr(_m1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training726
;hepsi.h,1928 :: 		GTemp[m1] = QV[x1][m1];
MOVW	R4, #lo_addr(_m1+0)
MOVT	R4, #hi_addr(_m1+0)
LDR	R0, [R4, #0]
LSLS	R3, R0, #2
MOVW	R0, #lo_addr(_GTemp+0)
MOVT	R0, #hi_addr(_GTemp+0)
ADDS	R2, R0, R3
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_QV+0)
MOVT	R0, #hi_addr(_QV+0)
ADDS	R0, R0, R1
ADDS	R0, R0, R3
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R2, #0]
;hepsi.h,1927 :: 		for(m1=0;m1<N;m1++)
MOV	R0, R4
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R4, #0]
;hepsi.h,1928 :: 		GTemp[m1] = QV[x1][m1];
IT	AL
BAL	L_Training725
L_Training726:
;hepsi.h,1929 :: 		for(y1=0;y1<N;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Training728:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training729
;hepsi.h,1930 :: 		temp3 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1931 :: 		for(z1=0;z1<N;z1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_Training731:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training732
;hepsi.h,1932 :: 		temp3 = temp3 + GTemp[z1]*L[z1+50][y1];
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
;hepsi.h,1931 :: 		for(z1=0;z1<N;z1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1932 :: 		temp3 = temp3 + GTemp[z1]*L[z1+50][y1];
IT	AL
BAL	L_Training731
L_Training732:
;hepsi.h,1933 :: 		QV[x1][y1] = temp3;}}
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R1, [R0, #0]
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_QV+0)
MOVT	R0, #hi_addr(_QV+0)
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
;hepsi.h,1929 :: 		for(y1=0;y1<N;y1++){
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;hepsi.h,1933 :: 		QV[x1][y1] = temp3;}}
IT	AL
BAL	L_Training728
L_Training729:
;hepsi.h,1926 :: 		for(x1=0;x1<N;x1++){        // V[50][50] =V[50][50]*Q[50][50]
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1933 :: 		QV[x1][y1] = temp3;}}
IT	AL
BAL	L_Training722
L_Training723:
;hepsi.h,1935 :: 		for(y1=0;y1<N;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Training734:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training735
;hepsi.h,1936 :: 		for(m1=0;m1<N;m1++)            // Q atanýyor
MOVS	R1, #0
MOVW	R0, #lo_addr(_m1+0)
MOVT	R0, #hi_addr(_m1+0)
STR	R1, [R0, #0]
L_Training737:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_m1+0)
MOVT	R0, #hi_addr(_m1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training738
;hepsi.h,1937 :: 		GTemp[m1] = L[50+m1][y1];
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
;hepsi.h,1936 :: 		for(m1=0;m1<N;m1++)            // Q atanýyor
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1937 :: 		GTemp[m1] = L[50+m1][y1];
IT	AL
BAL	L_Training737
L_Training738:
;hepsi.h,1938 :: 		for(x1=0;x1<N;x1++){       // Q[50][50]= R[50][50]*Q[50][50]
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training740:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training741
;hepsi.h,1939 :: 		temp3 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1940 :: 		for(z1=0;z1<N;z1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_Training743:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training744
;hepsi.h,1941 :: 		temp3 = temp3 + L[x1+50][z1+50]*GTemp[z1];
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
;hepsi.h,1940 :: 		for(z1=0;z1<N;z1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1941 :: 		temp3 = temp3 + L[x1+50][z1+50]*GTemp[z1];
IT	AL
BAL	L_Training743
L_Training744:
;hepsi.h,1942 :: 		L[50+x1][y1] = temp3;}}
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
;hepsi.h,1938 :: 		for(x1=0;x1<N;x1++){       // Q[50][50]= R[50][50]*Q[50][50]
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;hepsi.h,1942 :: 		L[50+x1][y1] = temp3;}}
IT	AL
BAL	L_Training740
L_Training741:
;hepsi.h,1935 :: 		for(y1=0;y1<N;y1++){
MOVW	R1, #lo_addr(_y1+0)
MOVT	R1, #hi_addr(_y1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1942 :: 		L[50+x1][y1] = temp3;}}
IT	AL
BAL	L_Training734
L_Training735:
;hepsi.h,1898 :: 		for(ii=0;ii<10;ii++){  //QR büyük dongu-2    (özvektörler)
MOVW	R1, #lo_addr(_ii+0)
MOVT	R1, #hi_addr(_ii+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1946 :: 		}
IT	AL
BAL	L_Training689
L_Training690:
;hepsi.h,1948 :: 		for(x1=0;x1<N;x1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training746:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training747
;hepsi.h,1949 :: 		Fisher[x1][tt] = QV[x1][0];
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
MOVS	R0, #200
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_QV+0)
MOVT	R0, #hi_addr(_QV+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R2, #0]
;hepsi.h,1948 :: 		for(x1=0;x1<N;x1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1949 :: 		Fisher[x1][tt] = QV[x1][0];
IT	AL
BAL	L_Training746
L_Training747:
;hepsi.h,1824 :: 		for(tt=1;tt<ClassNumber-1;tt++) {
MOVW	R1, #lo_addr(_tt+0)
MOVT	R1, #hi_addr(_tt+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1951 :: 		}
IT	AL
BAL	L_Training618
L_Training619:
;hepsi.h,1953 :: 		for(x1=0;x1<(ClassNumber-1);x1++){       // ProjectedImages_Fisher(:,i)=V_Fisher'*ProjectedImages(:,i)
MOVS	R1, #0
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
STR	R1, [R0, #0]
L_Training749:
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(_x1+0)
MOVT	R0, #hi_addr(_x1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training750
;hepsi.h,1954 :: 		for(y1=0;y1<TrainPicture;y1++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
STR	R1, [R0, #0]
L_Training752:
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training753
;hepsi.h,1955 :: 		temp3 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp3+0)
MOVT	R0, #hi_addr(_temp3+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1956 :: 		for(z1=0;z1<N;z1++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
STR	R1, [R0, #0]
L_Training755:
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_z1+0)
MOVT	R0, #hi_addr(_z1+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Training756
;hepsi.h,1957 :: 		temp3 = temp3 + Fisher[z1][x1]*L[z1][y1];
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
;hepsi.h,1956 :: 		for(z1=0;z1<N;z1++)
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;hepsi.h,1957 :: 		temp3 = temp3 + Fisher[z1][x1]*L[z1][y1];
IT	AL
BAL	L_Training755
L_Training756:
;hepsi.h,1958 :: 		L[x1+50][y1] = temp3;}}
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
;hepsi.h,1954 :: 		for(y1=0;y1<TrainPicture;y1++){
MOV	R0, R2
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
STR	R0, [R2, #0]
;hepsi.h,1958 :: 		L[x1+50][y1] = temp3;}}
IT	AL
BAL	L_Training752
L_Training753:
;hepsi.h,1953 :: 		for(x1=0;x1<(ClassNumber-1);x1++){       // ProjectedImages_Fisher(:,i)=V_Fisher'*ProjectedImages(:,i)
MOVW	R1, #lo_addr(_x1+0)
MOVT	R1, #hi_addr(_x1+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;hepsi.h,1958 :: 		L[x1+50][y1] = temp3;}}
IT	AL
BAL	L_Training749
L_Training750:
;hepsi.h,1959 :: 		TFT_Write_Text("QR Algorithm Finish",  30, 230);
MOVW	R0, #lo_addr(?lstr35_FISHER_GUI_main+0)
MOVT	R0, #hi_addr(?lstr35_FISHER_GUI_main+0)
MOVS	R2, #230
MOVS	R1, #30
BL	_TFT_Write_Text+0
;hepsi.h,1960 :: 		Delay_ms(1000);
MOVW	R7, #32254
MOVT	R7, #854
NOP
NOP
L_Training758:
SUBS	R7, R7, #1
BNE	L_Training758
NOP
NOP
NOP
;hepsi.h,1961 :: 		Test_ButtonRound1.Visible = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Test_ButtonRound1+18)
MOVT	R0, #hi_addr(_Test_ButtonRound1+18)
STRB	R1, [R0, #0]
;hepsi.h,1962 :: 		DrawScreen(&MainScreen1);
MOVW	R0, #lo_addr(_MainScreen1+0)
MOVT	R0, #hi_addr(_MainScreen1+0)
BL	_DrawScreen+0
;hepsi.h,1963 :: 		}
L_end_Training:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _Training
_CP_2:
;hepsi.h,1965 :: 		void CP_2() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;hepsi.h,1966 :: 		DrawScreen(&MainScreen1);
MOVW	R0, #lo_addr(_MainScreen1+0)
MOVT	R0, #hi_addr(_MainScreen1+0)
BL	_DrawScreen+0
;hepsi.h,1967 :: 		TetaC=750;
MOVW	R0, #32768
MOVT	R0, #17467
VMOV	S0, R0
MOVW	R0, #lo_addr(_TetaC+0)
MOVT	R0, #hi_addr(_TetaC+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1968 :: 		ClassPopulation = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_ClassPopulation+0)
MOVT	R0, #hi_addr(_ClassPopulation+0)
STR	R1, [R0, #0]
;hepsi.h,1969 :: 		TrainPicture = ClassNumber * ClassPopulation;
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
STR	R1, [R0, #0]
;hepsi.h,1970 :: 		N=TrainPicture/2;
LSRS	R1, R1, #1
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
STR	R1, [R0, #0]
;hepsi.h,1971 :: 		LongToStr(N,txt1);
MOV	R0, R1
MOVW	R1, #lo_addr(_txt1+0)
MOVT	R1, #hi_addr(_txt1+0)
BL	_LongToStr+0
;hepsi.h,1972 :: 		TFT_Write_Text(txt1,100,90);
MOVS	R2, #90
MOVS	R1, #100
MOVW	R0, #lo_addr(_txt1+0)
MOVT	R0, #hi_addr(_txt1+0)
BL	_TFT_Write_Text+0
;hepsi.h,1973 :: 		Test_ButtonRound1.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Test_ButtonRound1+18)
MOVT	R0, #hi_addr(_Test_ButtonRound1+18)
STRB	R1, [R0, #0]
;hepsi.h,1974 :: 		DrawScreen(&MainScreen1);
MOVW	R0, #lo_addr(_MainScreen1+0)
MOVT	R0, #hi_addr(_MainScreen1+0)
BL	_DrawScreen+0
;hepsi.h,1977 :: 		}
L_end_CP_2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _CP_2
_CP_3:
;hepsi.h,1979 :: 		void CP_3() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;hepsi.h,1980 :: 		DrawScreen(&MainScreen1);
MOVW	R0, #lo_addr(_MainScreen1+0)
MOVT	R0, #hi_addr(_MainScreen1+0)
BL	_DrawScreen+0
;hepsi.h,1981 :: 		TetaC=605;
MOVW	R0, #16384
MOVT	R0, #17431
VMOV	S0, R0
MOVW	R0, #lo_addr(_TetaC+0)
MOVT	R0, #hi_addr(_TetaC+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1982 :: 		ClassPopulation = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ClassPopulation+0)
MOVT	R0, #hi_addr(_ClassPopulation+0)
STR	R1, [R0, #0]
;hepsi.h,1983 :: 		TrainPicture = ClassNumber * ClassPopulation;
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOV	R0, #3
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
STR	R1, [R0, #0]
;hepsi.h,1984 :: 		N=TrainPicture/2;
LSRS	R1, R1, #1
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
STR	R1, [R0, #0]
;hepsi.h,1985 :: 		LongToStr(N,txt1);
MOV	R0, R1
MOVW	R1, #lo_addr(_txt1+0)
MOVT	R1, #hi_addr(_txt1+0)
BL	_LongToStr+0
;hepsi.h,1986 :: 		TFT_Write_Text(txt1,100,140);
MOVS	R2, #140
MOVS	R1, #100
MOVW	R0, #lo_addr(_txt1+0)
MOVT	R0, #hi_addr(_txt1+0)
BL	_TFT_Write_Text+0
;hepsi.h,1987 :: 		Test_ButtonRound1.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Test_ButtonRound1+18)
MOVT	R0, #hi_addr(_Test_ButtonRound1+18)
STRB	R1, [R0, #0]
;hepsi.h,1988 :: 		DrawScreen(&MainScreen1);
MOVW	R0, #lo_addr(_MainScreen1+0)
MOVT	R0, #hi_addr(_MainScreen1+0)
BL	_DrawScreen+0
;hepsi.h,1990 :: 		}
L_end_CP_3:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _CP_3
_CP_4:
;hepsi.h,1992 :: 		void CP_4() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;hepsi.h,1993 :: 		DrawScreen(&MainScreen1);
MOVW	R0, #lo_addr(_MainScreen1+0)
MOVT	R0, #hi_addr(_MainScreen1+0)
BL	_DrawScreen+0
;hepsi.h,1994 :: 		TetaC=400;
MOVW	R0, #0
MOVT	R0, #17352
VMOV	S0, R0
MOVW	R0, #lo_addr(_TetaC+0)
MOVT	R0, #hi_addr(_TetaC+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,1995 :: 		ClassPopulation = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_ClassPopulation+0)
MOVT	R0, #hi_addr(_ClassPopulation+0)
STR	R1, [R0, #0]
;hepsi.h,1996 :: 		TrainPicture = ClassNumber * ClassPopulation;
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
STR	R1, [R0, #0]
;hepsi.h,1997 :: 		N=TrainPicture/2;
LSRS	R1, R1, #1
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
STR	R1, [R0, #0]
;hepsi.h,1998 :: 		LongToStr(N,txt1);
MOV	R0, R1
MOVW	R1, #lo_addr(_txt1+0)
MOVT	R1, #hi_addr(_txt1+0)
BL	_LongToStr+0
;hepsi.h,1999 :: 		TFT_Write_Text(txt1,100,190);
MOVS	R2, #190
MOVS	R1, #100
MOVW	R0, #lo_addr(_txt1+0)
MOVT	R0, #hi_addr(_txt1+0)
BL	_TFT_Write_Text+0
;hepsi.h,2000 :: 		Test_ButtonRound1.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Test_ButtonRound1+18)
MOVT	R0, #hi_addr(_Test_ButtonRound1+18)
STRB	R1, [R0, #0]
;hepsi.h,2001 :: 		DrawScreen(&MainScreen1);
MOVW	R0, #lo_addr(_MainScreen1+0)
MOVT	R0, #hi_addr(_MainScreen1+0)
BL	_DrawScreen+0
;hepsi.h,2003 :: 		}
L_end_CP_4:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _CP_4
_CP_5:
;hepsi.h,2005 :: 		void CP_5() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;hepsi.h,2006 :: 		DrawScreen(&MainScreen1);
MOVW	R0, #lo_addr(_MainScreen1+0)
MOVT	R0, #hi_addr(_MainScreen1+0)
BL	_DrawScreen+0
;hepsi.h,2007 :: 		TetaC=400;
MOVW	R0, #0
MOVT	R0, #17352
VMOV	S0, R0
MOVW	R0, #lo_addr(_TetaC+0)
MOVT	R0, #hi_addr(_TetaC+0)
VSTR	#1, S0, [R0, #0]
;hepsi.h,2008 :: 		ClassPopulation = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_ClassPopulation+0)
MOVT	R0, #hi_addr(_ClassPopulation+0)
STR	R1, [R0, #0]
;hepsi.h,2009 :: 		TrainPicture = ClassNumber * ClassPopulation;
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOV	R0, #5
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
STR	R1, [R0, #0]
;hepsi.h,2010 :: 		N=TrainPicture/2;
LSRS	R1, R1, #1
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
STR	R1, [R0, #0]
;hepsi.h,2011 :: 		LongToStr(N,txt1);
MOV	R0, R1
MOVW	R1, #lo_addr(_txt1+0)
MOVT	R1, #hi_addr(_txt1+0)
BL	_LongToStr+0
;hepsi.h,2012 :: 		TFT_Write_Text(txt1,100,240);
MOVS	R2, #240
MOVS	R1, #100
MOVW	R0, #lo_addr(_txt1+0)
MOVT	R0, #hi_addr(_txt1+0)
BL	_TFT_Write_Text+0
;hepsi.h,2013 :: 		Test_ButtonRound1.Visible = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Test_ButtonRound1+18)
MOVT	R0, #hi_addr(_Test_ButtonRound1+18)
STRB	R1, [R0, #0]
;hepsi.h,2014 :: 		DrawScreen(&MainScreen1);
MOVW	R0, #lo_addr(_MainScreen1+0)
MOVT	R0, #hi_addr(_MainScreen1+0)
BL	_DrawScreen+0
;hepsi.h,2016 :: 		}
L_end_CP_5:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _CP_5
_main:
;FISHER_GUI_main.c,22 :: 		void main() {
SUB	SP, SP, #4
;FISHER_GUI_main.c,24 :: 		Start_TP();
BL	_Start_TP+0
;FISHER_GUI_main.c,26 :: 		reset();
BL	_reset+0
;FISHER_GUI_main.c,27 :: 		ClassPopulation = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_ClassPopulation+0)
MOVT	R0, #hi_addr(_ClassPopulation+0)
STR	R1, [R0, #0]
;FISHER_GUI_main.c,28 :: 		TrainPicture = ClassNumber * ClassPopulation;
MOVW	R0, #lo_addr(_ClassNumber+0)
MOVT	R0, #hi_addr(_ClassNumber+0)
LDR	R1, [R0, #0]
MOV	R0, #5
MUL	R2, R1, R0
MOVW	R0, #lo_addr(_TrainPicture+0)
MOVT	R0, #hi_addr(_TrainPicture+0)
STR	R2, [R0, #0]
;FISHER_GUI_main.c,29 :: 		TestPicture=50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_TestPicture+0)
MOVT	R0, #hi_addr(_TestPicture+0)
STR	R1, [R0, #0]
;FISHER_GUI_main.c,30 :: 		N=TrainPicture/2;
LSRS	R1, R2, #1
MOVW	R0, #lo_addr(_N+0)
MOVT	R0, #hi_addr(_N+0)
STR	R1, [R0, #0]
;FISHER_GUI_main.c,31 :: 		TetaC=400;
MOVW	R0, #0
MOVT	R0, #17352
VMOV	S0, R0
MOVW	R0, #lo_addr(_TetaC+0)
MOVT	R0, #hi_addr(_TetaC+0)
VSTR	#1, S0, [R0, #0]
;FISHER_GUI_main.c,33 :: 		while (1) {
L_main760:
;FISHER_GUI_main.c,34 :: 		Check_TP();
BL	_Check_TP+0
;FISHER_GUI_main.c,36 :: 		}
IT	AL
BAL	L_main760
;FISHER_GUI_main.c,38 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
