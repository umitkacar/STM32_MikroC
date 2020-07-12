_Init_ADC:
;DCVA_GUI_driver.c,67 :: 		void Init_ADC() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DCVA_GUI_driver.c,68 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_8 | _ADC_CHANNEL_9);
MOVW	R0, #768
BL	_ADC_Set_Input_Channel+0
;DCVA_GUI_driver.c,69 :: 		ADC1_Init();
BL	_ADC1_Init+0
;DCVA_GUI_driver.c,70 :: 		Delay_ms(100);
MOVW	R7, #13609
MOVT	R7, #71
NOP
NOP
L_Init_ADC0:
SUBS	R7, R7, #1
BNE	L_Init_ADC0
NOP
NOP
;DCVA_GUI_driver.c,71 :: 		}
L_end_Init_ADC:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_ADC
_TFT_Get_Data:
;DCVA_GUI_driver.c,73 :: 		char* TFT_Get_Data(unsigned long offset, unsigned long count, unsigned long *num) {
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R2, [SP, #16]
MOV	R2, R0
STR	R1, [SP, #12]
; offset start address is: 8 (R2)
;DCVA_GUI_driver.c,77 :: 		start_sector = Mmc_Get_File_Write_Sector() + offset/512;
BL	_Mmc_Get_File_Write_Sector+0
LSRS	R3, R2, #9
ADDS	R4, R0, R3
STR	R4, [SP, #4]
;DCVA_GUI_driver.c,78 :: 		pos = (unsigned long)offset%512;
MOVW	R3, #511
AND	R3, R2, R3, LSL #0
; offset end address is: 8 (R2)
STRH	R3, [SP, #8]
;DCVA_GUI_driver.c,80 :: 		if(start_sector == currentSector+1) {
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
LDR	R3, [R3, #0]
ADDS	R3, R3, #1
CMP	R4, R3
IT	NE
BNE	L_TFT_Get_Data2
;DCVA_GUI_driver.c,81 :: 		Mmc_Multi_Read_Sector(Ext_Data_Buffer);
MOVW	R0, #lo_addr(_Ext_Data_Buffer+0)
MOVT	R0, #hi_addr(_Ext_Data_Buffer+0)
BL	_Mmc_Multi_Read_Sector+0
;DCVA_GUI_driver.c,82 :: 		currentSector = start_sector;
LDR	R4, [SP, #4]
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
STR	R4, [R3, #0]
;DCVA_GUI_driver.c,83 :: 		} else if (start_sector != currentSector) {
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
;DCVA_GUI_driver.c,84 :: 		if(currentSector != -1)
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
LDR	R3, [R3, #0]
CMP	R3, #-1
IT	EQ
BEQ	L_TFT_Get_Data5
;DCVA_GUI_driver.c,85 :: 		Mmc_Multi_Read_Stop();
BL	_Mmc_Multi_Read_Stop+0
L_TFT_Get_Data5:
;DCVA_GUI_driver.c,86 :: 		Mmc_Multi_Read_Start(start_sector);
LDR	R0, [SP, #4]
BL	_Mmc_Multi_Read_Start+0
;DCVA_GUI_driver.c,87 :: 		Mmc_Multi_Read_Sector(Ext_Data_Buffer);
MOVW	R0, #lo_addr(_Ext_Data_Buffer+0)
MOVT	R0, #hi_addr(_Ext_Data_Buffer+0)
BL	_Mmc_Multi_Read_Sector+0
;DCVA_GUI_driver.c,88 :: 		currentSector = start_sector;
LDR	R4, [SP, #4]
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
STR	R4, [R3, #0]
;DCVA_GUI_driver.c,89 :: 		}
L_TFT_Get_Data4:
L_TFT_Get_Data3:
;DCVA_GUI_driver.c,91 :: 		if(count>512-pos)
LDRH	R3, [SP, #8]
RSB	R4, R3, #512
UXTH	R4, R4
LDR	R3, [SP, #12]
CMP	R3, R4
IT	LS
BLS	L_TFT_Get_Data6
;DCVA_GUI_driver.c,92 :: 		*num = 512-pos;
LDRH	R3, [SP, #8]
RSB	R4, R3, #512
UXTH	R4, R4
LDR	R3, [SP, #16]
STR	R4, [R3, #0]
IT	AL
BAL	L_TFT_Get_Data7
L_TFT_Get_Data6:
;DCVA_GUI_driver.c,94 :: 		*num = count;
LDR	R4, [SP, #12]
LDR	R3, [SP, #16]
STR	R4, [R3, #0]
L_TFT_Get_Data7:
;DCVA_GUI_driver.c,96 :: 		return Ext_Data_Buffer+pos;
LDRH	R4, [SP, #8]
MOVW	R3, #lo_addr(_Ext_Data_Buffer+0)
MOVT	R3, #hi_addr(_Ext_Data_Buffer+0)
ADDS	R3, R3, R4
MOV	R0, R3
;DCVA_GUI_driver.c,97 :: 		}
L_end_TFT_Get_Data:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _TFT_Get_Data
DCVA_GUI_driver_InitializeTouchPanel:
;DCVA_GUI_driver.c,98 :: 		static void InitializeTouchPanel() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DCVA_GUI_driver.c,99 :: 		Init_ADC();
BL	_Init_ADC+0
;DCVA_GUI_driver.c,100 :: 		TFT_Init(240, 320);
MOVW	R1, #320
MOVS	R0, #240
BL	_TFT_Init+0
;DCVA_GUI_driver.c,101 :: 		TFT_Set_Ext_Buffer(TFT_Get_Data);
MOVW	R0, #lo_addr(_TFT_Get_Data+0)
MOVT	R0, #hi_addr(_TFT_Get_Data+0)
BL	_TFT_Set_Ext_Buffer+0
;DCVA_GUI_driver.c,103 :: 		TP_TFT_Init(240, 320, 8, 9);                                  // Initialize touch panel
MOVS	R3, #9
MOVS	R2, #8
MOVW	R1, #320
MOVS	R0, #240
BL	_TP_TFT_Init+0
;DCVA_GUI_driver.c,104 :: 		TP_TFT_Set_ADC_Threshold(ADC_THRESHOLD);                              // Set touch panel ADC threshold
MOVW	R0, #1500
SXTH	R0, R0
BL	_TP_TFT_Set_ADC_Threshold+0
;DCVA_GUI_driver.c,106 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,107 :: 		PressedObject = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PressedObject+0)
MOVT	R0, #hi_addr(_PressedObject+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,108 :: 		PressedObjectType = -1;
MOVW	R1, #65535
SXTH	R1, R1
MOVW	R0, #lo_addr(_PressedObjectType+0)
MOVT	R0, #hi_addr(_PressedObjectType+0)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,109 :: 		}
L_end_InitializeTouchPanel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of DCVA_GUI_driver_InitializeTouchPanel
_Calibrate:
;DCVA_GUI_driver.c,111 :: 		void Calibrate() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DCVA_GUI_driver.c,112 :: 		TFT_Set_Pen(CL_WHITE, 3);
MOVS	R1, #3
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;DCVA_GUI_driver.c,113 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;DCVA_GUI_driver.c,114 :: 		TFT_Write_Text("Touch selected corners for calibration", 1, 120);
MOVW	R0, #lo_addr(?lstr1_DCVA_GUI_driver+0)
MOVT	R0, #hi_addr(?lstr1_DCVA_GUI_driver+0)
MOVS	R2, #120
MOVS	R1, #1
BL	_TFT_Write_Text+0
;DCVA_GUI_driver.c,115 :: 		TFT_Line(0, 319, 5, 319);
MOVW	R3, #319
SXTH	R3, R3
MOVS	R2, #5
SXTH	R2, R2
MOVW	R1, #319
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;DCVA_GUI_driver.c,116 :: 		TFT_Line(0, 319, 0, 314);
MOVW	R3, #314
SXTH	R3, R3
MOVS	R2, #0
SXTH	R2, R2
MOVW	R1, #319
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;DCVA_GUI_driver.c,117 :: 		TFT_Line(0, 319, 10, 309);
MOVW	R3, #309
SXTH	R3, R3
MOVS	R2, #10
SXTH	R2, R2
MOVW	R1, #319
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;DCVA_GUI_driver.c,118 :: 		TFT_Write_Text("first here", 20, 290);
MOVW	R0, #lo_addr(?lstr2_DCVA_GUI_driver+0)
MOVT	R0, #hi_addr(?lstr2_DCVA_GUI_driver+0)
MOVW	R2, #290
MOVS	R1, #20
BL	_TFT_Write_Text+0
;DCVA_GUI_driver.c,120 :: 		TP_TFT_Calibrate_Min();                      // Calibration of bottom left corner
BL	_TP_TFT_Calibrate_Min+0
;DCVA_GUI_driver.c,121 :: 		Delay_ms(500);
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
;DCVA_GUI_driver.c,123 :: 		TFT_Set_Pen(CL_BLACK, 3);
MOVS	R1, #3
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;DCVA_GUI_driver.c,124 :: 		TFT_Set_Font(TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #0
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;DCVA_GUI_driver.c,125 :: 		TFT_Line(0, 319, 5, 319);
MOVW	R3, #319
SXTH	R3, R3
MOVS	R2, #5
SXTH	R2, R2
MOVW	R1, #319
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;DCVA_GUI_driver.c,126 :: 		TFT_Line(0, 319, 0, 314);
MOVW	R3, #314
SXTH	R3, R3
MOVS	R2, #0
SXTH	R2, R2
MOVW	R1, #319
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;DCVA_GUI_driver.c,127 :: 		TFT_Line(0, 319, 10, 309);
MOVW	R3, #309
SXTH	R3, R3
MOVS	R2, #10
SXTH	R2, R2
MOVW	R1, #319
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;DCVA_GUI_driver.c,128 :: 		TFT_Write_Text("first here", 20, 290);
MOVW	R0, #lo_addr(?lstr3_DCVA_GUI_driver+0)
MOVT	R0, #hi_addr(?lstr3_DCVA_GUI_driver+0)
MOVW	R2, #290
MOVS	R1, #20
BL	_TFT_Write_Text+0
;DCVA_GUI_driver.c,130 :: 		TFT_Set_Pen(CL_WHITE, 3);
MOVS	R1, #3
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;DCVA_GUI_driver.c,131 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;DCVA_GUI_driver.c,132 :: 		TFT_Write_Text("now here ", 160, 15);
MOVW	R0, #lo_addr(?lstr4_DCVA_GUI_driver+0)
MOVT	R0, #hi_addr(?lstr4_DCVA_GUI_driver+0)
MOVS	R2, #15
MOVS	R1, #160
BL	_TFT_Write_Text+0
;DCVA_GUI_driver.c,133 :: 		TFT_Line(239, 0, 234, 0);
MOVS	R3, #0
SXTH	R3, R3
MOVS	R2, #234
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #239
SXTH	R0, R0
BL	_TFT_Line+0
;DCVA_GUI_driver.c,134 :: 		TFT_Line(239, 0, 239, 5);
MOVS	R3, #5
SXTH	R3, R3
MOVS	R2, #239
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #239
SXTH	R0, R0
BL	_TFT_Line+0
;DCVA_GUI_driver.c,135 :: 		TFT_Line(239, 0, 229, 10);
MOVS	R3, #10
SXTH	R3, R3
MOVS	R2, #229
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #239
SXTH	R0, R0
BL	_TFT_Line+0
;DCVA_GUI_driver.c,137 :: 		TP_TFT_Calibrate_Max();                       // Calibration of bottom left corner
BL	_TP_TFT_Calibrate_Max+0
;DCVA_GUI_driver.c,138 :: 		Delay_ms(500);
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
;DCVA_GUI_driver.c,139 :: 		}
L_end_Calibrate:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Calibrate
DCVA_GUI_driver_InitializeObjects:
;DCVA_GUI_driver.c,349 :: 		static void InitializeObjects() {
;DCVA_GUI_driver.c,350 :: 		Screen1.Color                     = 0x87FF;
MOVW	R1, #34815
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,351 :: 		Screen1.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen1+2)
MOVT	R0, #hi_addr(_Screen1+2)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,352 :: 		Screen1.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen1+4)
MOVT	R0, #hi_addr(_Screen1+4)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,353 :: 		Screen1.Buttons_RoundCount        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen1+8)
MOVT	R0, #hi_addr(_Screen1+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,354 :: 		Screen1.Buttons_Round             = Screen1_Buttons_Round;
MOVW	R1, #lo_addr(_Screen1_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen1_Buttons_Round+0)
MOVW	R0, #lo_addr(_Screen1+12)
MOVT	R0, #hi_addr(_Screen1+12)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,355 :: 		Screen1.LabelsCount               = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Screen1+16)
MOVT	R0, #hi_addr(_Screen1+16)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,356 :: 		Screen1.Labels                    = Screen1_Labels;
MOVW	R1, #lo_addr(_Screen1_Labels+0)
MOVT	R1, #hi_addr(_Screen1_Labels+0)
MOVW	R0, #lo_addr(_Screen1+20)
MOVT	R0, #hi_addr(_Screen1+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,357 :: 		Screen1.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen1+24)
MOVT	R0, #hi_addr(_Screen1+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,358 :: 		Screen1.Images                    = Screen1_Images;
MOVW	R1, #lo_addr(_Screen1_Images+0)
MOVT	R1, #hi_addr(_Screen1_Images+0)
MOVW	R0, #lo_addr(_Screen1+28)
MOVT	R0, #hi_addr(_Screen1+28)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,359 :: 		Screen1.CircleButtonsCount        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen1+32)
MOVT	R0, #hi_addr(_Screen1+32)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,360 :: 		Screen1.CircleButtons             = Screen1_CircleButtons;
MOVW	R1, #lo_addr(_Screen1_CircleButtons+0)
MOVT	R1, #hi_addr(_Screen1_CircleButtons+0)
MOVW	R0, #lo_addr(_Screen1+36)
MOVT	R0, #hi_addr(_Screen1+36)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,361 :: 		Screen1.BoxesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+40)
MOVT	R0, #hi_addr(_Screen1+40)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,362 :: 		Screen1.RadioButtonsCount         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+48)
MOVT	R0, #hi_addr(_Screen1+48)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,363 :: 		Screen1.ProgressBarsCount         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+56)
MOVT	R0, #hi_addr(_Screen1+56)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,364 :: 		Screen1.ObjectsCount              = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Screen1+6)
MOVT	R0, #hi_addr(_Screen1+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,366 :: 		Screen2.Color                     = 0x001F;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Screen2+0)
MOVT	R0, #hi_addr(_Screen2+0)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,367 :: 		Screen2.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen2+2)
MOVT	R0, #hi_addr(_Screen2+2)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,368 :: 		Screen2.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen2+4)
MOVT	R0, #hi_addr(_Screen2+4)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,369 :: 		Screen2.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+8)
MOVT	R0, #hi_addr(_Screen2+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,370 :: 		Screen2.LabelsCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen2+16)
MOVT	R0, #hi_addr(_Screen2+16)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,371 :: 		Screen2.Labels                    = Screen2_Labels;
MOVW	R1, #lo_addr(_Screen2_Labels+0)
MOVT	R1, #hi_addr(_Screen2_Labels+0)
MOVW	R0, #lo_addr(_Screen2+20)
MOVT	R0, #hi_addr(_Screen2+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,372 :: 		Screen2.ImagesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+24)
MOVT	R0, #hi_addr(_Screen2+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,373 :: 		Screen2.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+32)
MOVT	R0, #hi_addr(_Screen2+32)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,374 :: 		Screen2.BoxesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+40)
MOVT	R0, #hi_addr(_Screen2+40)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,375 :: 		Screen2.RadioButtonsCount         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+48)
MOVT	R0, #hi_addr(_Screen2+48)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,376 :: 		Screen2.ProgressBarsCount         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+56)
MOVT	R0, #hi_addr(_Screen2+56)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,377 :: 		Screen2.ObjectsCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen2+6)
MOVT	R0, #hi_addr(_Screen2+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,379 :: 		Screen3.Color                     = 0xFC00;
MOVW	R1, #64512
MOVW	R0, #lo_addr(_Screen3+0)
MOVT	R0, #hi_addr(_Screen3+0)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,380 :: 		Screen3.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen3+2)
MOVT	R0, #hi_addr(_Screen3+2)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,381 :: 		Screen3.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen3+4)
MOVT	R0, #hi_addr(_Screen3+4)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,382 :: 		Screen3.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+8)
MOVT	R0, #hi_addr(_Screen3+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,383 :: 		Screen3.LabelsCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen3+16)
MOVT	R0, #hi_addr(_Screen3+16)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,384 :: 		Screen3.Labels                    = Screen3_Labels;
MOVW	R1, #lo_addr(_Screen3_Labels+0)
MOVT	R1, #hi_addr(_Screen3_Labels+0)
MOVW	R0, #lo_addr(_Screen3+20)
MOVT	R0, #hi_addr(_Screen3+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,385 :: 		Screen3.ImagesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+24)
MOVT	R0, #hi_addr(_Screen3+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,386 :: 		Screen3.CircleButtonsCount        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen3+32)
MOVT	R0, #hi_addr(_Screen3+32)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,387 :: 		Screen3.CircleButtons             = Screen3_CircleButtons;
MOVW	R1, #lo_addr(_Screen3_CircleButtons+0)
MOVT	R1, #hi_addr(_Screen3_CircleButtons+0)
MOVW	R0, #lo_addr(_Screen3+36)
MOVT	R0, #hi_addr(_Screen3+36)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,388 :: 		Screen3.BoxesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+40)
MOVT	R0, #hi_addr(_Screen3+40)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,389 :: 		Screen3.RadioButtonsCount         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+48)
MOVT	R0, #hi_addr(_Screen3+48)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,390 :: 		Screen3.ProgressBarsCount         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+56)
MOVT	R0, #hi_addr(_Screen3+56)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,391 :: 		Screen3.ObjectsCount              = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen3+6)
MOVT	R0, #hi_addr(_Screen3+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,393 :: 		Screen4.Color                     = 0x001F;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Screen4+0)
MOVT	R0, #hi_addr(_Screen4+0)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,394 :: 		Screen4.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen4+2)
MOVT	R0, #hi_addr(_Screen4+2)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,395 :: 		Screen4.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen4+4)
MOVT	R0, #hi_addr(_Screen4+4)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,396 :: 		Screen4.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen4+8)
MOVT	R0, #hi_addr(_Screen4+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,397 :: 		Screen4.LabelsCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen4+16)
MOVT	R0, #hi_addr(_Screen4+16)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,398 :: 		Screen4.Labels                    = Screen4_Labels;
MOVW	R1, #lo_addr(_Screen4_Labels+0)
MOVT	R1, #hi_addr(_Screen4_Labels+0)
MOVW	R0, #lo_addr(_Screen4+20)
MOVT	R0, #hi_addr(_Screen4+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,399 :: 		Screen4.ImagesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen4+24)
MOVT	R0, #hi_addr(_Screen4+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,400 :: 		Screen4.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen4+32)
MOVT	R0, #hi_addr(_Screen4+32)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,401 :: 		Screen4.BoxesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen4+40)
MOVT	R0, #hi_addr(_Screen4+40)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,402 :: 		Screen4.RadioButtonsCount         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen4+48)
MOVT	R0, #hi_addr(_Screen4+48)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,403 :: 		Screen4.ProgressBarsCount         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen4+56)
MOVT	R0, #hi_addr(_Screen4+56)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,404 :: 		Screen4.ObjectsCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen4+6)
MOVT	R0, #hi_addr(_Screen4+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,406 :: 		Screen5.Color                     = 0x07E8;
MOVW	R1, #2024
MOVW	R0, #lo_addr(_Screen5+0)
MOVT	R0, #hi_addr(_Screen5+0)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,407 :: 		Screen5.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen5+2)
MOVT	R0, #hi_addr(_Screen5+2)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,408 :: 		Screen5.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen5+4)
MOVT	R0, #hi_addr(_Screen5+4)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,409 :: 		Screen5.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen5+8)
MOVT	R0, #hi_addr(_Screen5+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,410 :: 		Screen5.LabelsCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen5+16)
MOVT	R0, #hi_addr(_Screen5+16)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,411 :: 		Screen5.Labels                    = Screen5_Labels;
MOVW	R1, #lo_addr(_Screen5_Labels+0)
MOVT	R1, #hi_addr(_Screen5_Labels+0)
MOVW	R0, #lo_addr(_Screen5+20)
MOVT	R0, #hi_addr(_Screen5+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,412 :: 		Screen5.ImagesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen5+24)
MOVT	R0, #hi_addr(_Screen5+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,413 :: 		Screen5.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen5+32)
MOVT	R0, #hi_addr(_Screen5+32)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,414 :: 		Screen5.BoxesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen5+40)
MOVT	R0, #hi_addr(_Screen5+40)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,415 :: 		Screen5.RadioButtonsCount         = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Screen5+48)
MOVT	R0, #hi_addr(_Screen5+48)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,416 :: 		Screen5.RadioButtons              = Screen5_RadioButtons;
MOVW	R1, #lo_addr(_Screen5_RadioButtons+0)
MOVT	R1, #hi_addr(_Screen5_RadioButtons+0)
MOVW	R0, #lo_addr(_Screen5+52)
MOVT	R0, #hi_addr(_Screen5+52)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,417 :: 		Screen5.ProgressBarsCount         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen5+56)
MOVT	R0, #hi_addr(_Screen5+56)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,418 :: 		Screen5.ObjectsCount              = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Screen5+6)
MOVT	R0, #hi_addr(_Screen5+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,420 :: 		Screen6.Color                     = 0x801F;
MOVW	R1, #32799
MOVW	R0, #lo_addr(_Screen6+0)
MOVT	R0, #hi_addr(_Screen6+0)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,421 :: 		Screen6.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen6+2)
MOVT	R0, #hi_addr(_Screen6+2)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,422 :: 		Screen6.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen6+4)
MOVT	R0, #hi_addr(_Screen6+4)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,423 :: 		Screen6.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen6+8)
MOVT	R0, #hi_addr(_Screen6+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,424 :: 		Screen6.LabelsCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen6+16)
MOVT	R0, #hi_addr(_Screen6+16)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,425 :: 		Screen6.Labels                    = Screen6_Labels;
MOVW	R1, #lo_addr(_Screen6_Labels+0)
MOVT	R1, #hi_addr(_Screen6_Labels+0)
MOVW	R0, #lo_addr(_Screen6+20)
MOVT	R0, #hi_addr(_Screen6+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,426 :: 		Screen6.ImagesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen6+24)
MOVT	R0, #hi_addr(_Screen6+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,427 :: 		Screen6.CircleButtonsCount        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen6+32)
MOVT	R0, #hi_addr(_Screen6+32)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,428 :: 		Screen6.CircleButtons             = Screen6_CircleButtons;
MOVW	R1, #lo_addr(_Screen6_CircleButtons+0)
MOVT	R1, #hi_addr(_Screen6_CircleButtons+0)
MOVW	R0, #lo_addr(_Screen6+36)
MOVT	R0, #hi_addr(_Screen6+36)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,429 :: 		Screen6.BoxesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen6+40)
MOVT	R0, #hi_addr(_Screen6+40)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,430 :: 		Screen6.RadioButtonsCount         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen6+48)
MOVT	R0, #hi_addr(_Screen6+48)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,431 :: 		Screen6.ProgressBarsCount         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen6+56)
MOVT	R0, #hi_addr(_Screen6+56)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,432 :: 		Screen6.ObjectsCount              = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen6+6)
MOVT	R0, #hi_addr(_Screen6+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,434 :: 		Screen7.Color                     = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Screen7+0)
MOVT	R0, #hi_addr(_Screen7+0)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,435 :: 		Screen7.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen7+2)
MOVT	R0, #hi_addr(_Screen7+2)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,436 :: 		Screen7.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen7+4)
MOVT	R0, #hi_addr(_Screen7+4)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,437 :: 		Screen7.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen7+8)
MOVT	R0, #hi_addr(_Screen7+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,438 :: 		Screen7.LabelsCount               = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen7+16)
MOVT	R0, #hi_addr(_Screen7+16)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,439 :: 		Screen7.Labels                    = Screen7_Labels;
MOVW	R1, #lo_addr(_Screen7_Labels+0)
MOVT	R1, #hi_addr(_Screen7_Labels+0)
MOVW	R0, #lo_addr(_Screen7+20)
MOVT	R0, #hi_addr(_Screen7+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,440 :: 		Screen7.ImagesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen7+24)
MOVT	R0, #hi_addr(_Screen7+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,441 :: 		Screen7.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen7+32)
MOVT	R0, #hi_addr(_Screen7+32)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,442 :: 		Screen7.BoxesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen7+40)
MOVT	R0, #hi_addr(_Screen7+40)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,443 :: 		Screen7.RadioButtonsCount         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen7+48)
MOVT	R0, #hi_addr(_Screen7+48)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,444 :: 		Screen7.ProgressBarsCount         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen7+56)
MOVT	R0, #hi_addr(_Screen7+56)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,445 :: 		Screen7.ProgressBars              = Screen7_ProgressBars;
MOVW	R1, #lo_addr(_Screen7_ProgressBars+0)
MOVT	R1, #hi_addr(_Screen7_ProgressBars+0)
MOVW	R0, #lo_addr(_Screen7+60)
MOVT	R0, #hi_addr(_Screen7+60)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,446 :: 		Screen7.ObjectsCount              = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Screen7+6)
MOVT	R0, #hi_addr(_Screen7+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,448 :: 		Screen8.Color                     = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Screen8+0)
MOVT	R0, #hi_addr(_Screen8+0)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,449 :: 		Screen8.Width                     = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen8+2)
MOVT	R0, #hi_addr(_Screen8+2)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,450 :: 		Screen8.Height                    = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen8+4)
MOVT	R0, #hi_addr(_Screen8+4)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,451 :: 		Screen8.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen8+8)
MOVT	R0, #hi_addr(_Screen8+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,452 :: 		Screen8.LabelsCount               = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Screen8+16)
MOVT	R0, #hi_addr(_Screen8+16)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,453 :: 		Screen8.Labels                    = Screen8_Labels;
MOVW	R1, #lo_addr(_Screen8_Labels+0)
MOVT	R1, #hi_addr(_Screen8_Labels+0)
MOVW	R0, #lo_addr(_Screen8+20)
MOVT	R0, #hi_addr(_Screen8+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,454 :: 		Screen8.ImagesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen8+24)
MOVT	R0, #hi_addr(_Screen8+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,455 :: 		Screen8.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen8+32)
MOVT	R0, #hi_addr(_Screen8+32)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,456 :: 		Screen8.BoxesCount                = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Screen8+40)
MOVT	R0, #hi_addr(_Screen8+40)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,457 :: 		Screen8.Boxes                     = Screen8_Boxes;
MOVW	R1, #lo_addr(_Screen8_Boxes+0)
MOVT	R1, #hi_addr(_Screen8_Boxes+0)
MOVW	R0, #lo_addr(_Screen8+44)
MOVT	R0, #hi_addr(_Screen8+44)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,458 :: 		Screen8.RadioButtonsCount         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen8+48)
MOVT	R0, #hi_addr(_Screen8+48)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,459 :: 		Screen8.ProgressBarsCount         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen8+56)
MOVT	R0, #hi_addr(_Screen8+56)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,460 :: 		Screen8.ObjectsCount              = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Screen8+6)
MOVT	R0, #hi_addr(_Screen8+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,463 :: 		Label1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label1+0)
MOVT	R0, #hi_addr(_Label1+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,464 :: 		Label1.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+4)
MOVT	R0, #hi_addr(_Label1+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,465 :: 		Label1.Left            = 75;
MOVS	R1, #75
MOVW	R0, #lo_addr(_Label1+6)
MOVT	R0, #hi_addr(_Label1+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,466 :: 		Label1.Top             = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Label1+8)
MOVT	R0, #hi_addr(_Label1+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,467 :: 		Label1.Width           = 71;
MOVS	R1, #71
MOVW	R0, #lo_addr(_Label1+10)
MOVT	R0, #hi_addr(_Label1+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,468 :: 		Label1.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Label1+12)
MOVT	R0, #hi_addr(_Label1+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,469 :: 		Label1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+26)
MOVT	R0, #hi_addr(_Label1+26)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,470 :: 		Label1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+27)
MOVT	R0, #hi_addr(_Label1+27)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,471 :: 		Label1.Caption         = Label1_Caption;
MOVW	R1, #lo_addr(_Label1_Caption+0)
MOVT	R1, #hi_addr(_Label1_Caption+0)
MOVW	R0, #lo_addr(_Label1+16)
MOVT	R0, #hi_addr(_Label1+16)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,472 :: 		Label1.FontName        = Tahoma19x23_Regular;
MOVW	R1, #6602
MOVW	R0, #lo_addr(_Label1+20)
MOVT	R0, #hi_addr(_Label1+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,473 :: 		Label1.Font_Color      = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label1+24)
MOVT	R0, #hi_addr(_Label1+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,474 :: 		Label1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+28)
MOVT	R0, #hi_addr(_Label1+28)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,475 :: 		Label1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+32)
MOVT	R0, #hi_addr(_Label1+32)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,476 :: 		Label1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+36)
MOVT	R0, #hi_addr(_Label1+36)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,477 :: 		Label1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+40)
MOVT	R0, #hi_addr(_Label1+40)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,479 :: 		CircleButton1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_CircleButton1+0)
MOVT	R0, #hi_addr(_CircleButton1+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,480 :: 		CircleButton1.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton1+4)
MOVT	R0, #hi_addr(_CircleButton1+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,481 :: 		CircleButton1.Left            = 77;
MOVS	R1, #77
MOVW	R0, #lo_addr(_CircleButton1+6)
MOVT	R0, #hi_addr(_CircleButton1+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,482 :: 		CircleButton1.Top             = 83;
MOVS	R1, #83
MOVW	R0, #lo_addr(_CircleButton1+8)
MOVT	R0, #hi_addr(_CircleButton1+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,483 :: 		CircleButton1.Radius          = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_CircleButton1+10)
MOVT	R0, #hi_addr(_CircleButton1+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,484 :: 		CircleButton1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton1+12)
MOVT	R0, #hi_addr(_CircleButton1+12)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,485 :: 		CircleButton1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton1+14)
MOVT	R0, #hi_addr(_CircleButton1+14)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,486 :: 		CircleButton1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton1+16)
MOVT	R0, #hi_addr(_CircleButton1+16)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,487 :: 		CircleButton1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton1+17)
MOVT	R0, #hi_addr(_CircleButton1+17)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,488 :: 		CircleButton1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton1+18)
MOVT	R0, #hi_addr(_CircleButton1+18)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,489 :: 		CircleButton1.Caption         = CircleButton1_Caption;
MOVW	R1, #lo_addr(_CircleButton1_Caption+0)
MOVT	R1, #hi_addr(_CircleButton1_Caption+0)
MOVW	R0, #lo_addr(_CircleButton1+20)
MOVT	R0, #hi_addr(_CircleButton1+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,490 :: 		CircleButton1.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton1+24)
MOVT	R0, #hi_addr(_CircleButton1+24)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,491 :: 		CircleButton1.FontName        = Tahoma13x16_Regular;
MOVW	R1, #2410
MOVW	R0, #lo_addr(_CircleButton1+28)
MOVT	R0, #hi_addr(_CircleButton1+28)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,492 :: 		CircleButton1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton1+42)
MOVT	R0, #hi_addr(_CircleButton1+42)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,493 :: 		CircleButton1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton1+32)
MOVT	R0, #hi_addr(_CircleButton1+32)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,494 :: 		CircleButton1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton1+34)
MOVT	R0, #hi_addr(_CircleButton1+34)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,495 :: 		CircleButton1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton1+35)
MOVT	R0, #hi_addr(_CircleButton1+35)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,496 :: 		CircleButton1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_CircleButton1+36)
MOVT	R0, #hi_addr(_CircleButton1+36)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,497 :: 		CircleButton1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CircleButton1+38)
MOVT	R0, #hi_addr(_CircleButton1+38)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,498 :: 		CircleButton1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CircleButton1+40)
MOVT	R0, #hi_addr(_CircleButton1+40)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,499 :: 		CircleButton1.Press_Color     = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_CircleButton1+44)
MOVT	R0, #hi_addr(_CircleButton1+44)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,500 :: 		CircleButton1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton1+48)
MOVT	R0, #hi_addr(_CircleButton1+48)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,501 :: 		CircleButton1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton1+52)
MOVT	R0, #hi_addr(_CircleButton1+52)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,502 :: 		CircleButton1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton1+56)
MOVT	R0, #hi_addr(_CircleButton1+56)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,503 :: 		CircleButton1.OnPressPtr      = DCVA_START;
MOVW	R1, #lo_addr(_DCVA_START+0)
MOVT	R1, #hi_addr(_DCVA_START+0)
MOVW	R0, #lo_addr(_CircleButton1+60)
MOVT	R0, #hi_addr(_CircleButton1+60)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,505 :: 		Label4.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label4+0)
MOVT	R0, #hi_addr(_Label4+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,506 :: 		Label4.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label4+4)
MOVT	R0, #hi_addr(_Label4+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,507 :: 		Label4.Left            = 78;
MOVS	R1, #78
MOVW	R0, #lo_addr(_Label4+6)
MOVT	R0, #hi_addr(_Label4+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,508 :: 		Label4.Top             = 48;
MOVS	R1, #48
MOVW	R0, #lo_addr(_Label4+8)
MOVT	R0, #hi_addr(_Label4+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,509 :: 		Label4.Width           = 63;
MOVS	R1, #63
MOVW	R0, #lo_addr(_Label4+10)
MOVT	R0, #hi_addr(_Label4+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,510 :: 		Label4.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Label4+12)
MOVT	R0, #hi_addr(_Label4+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,511 :: 		Label4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label4+26)
MOVT	R0, #hi_addr(_Label4+26)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,512 :: 		Label4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label4+27)
MOVT	R0, #hi_addr(_Label4+27)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,513 :: 		Label4.Caption         = Label4_Caption;
MOVW	R1, #lo_addr(_Label4_Caption+0)
MOVT	R1, #hi_addr(_Label4_Caption+0)
MOVW	R0, #lo_addr(_Label4+16)
MOVT	R0, #hi_addr(_Label4+16)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,514 :: 		Label4.FontName        = Tahoma19x23_Regular;
MOVW	R1, #6602
MOVW	R0, #lo_addr(_Label4+20)
MOVT	R0, #hi_addr(_Label4+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,515 :: 		Label4.Font_Color      = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label4+24)
MOVT	R0, #hi_addr(_Label4+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,516 :: 		Label4.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+28)
MOVT	R0, #hi_addr(_Label4+28)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,517 :: 		Label4.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+32)
MOVT	R0, #hi_addr(_Label4+32)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,518 :: 		Label4.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+36)
MOVT	R0, #hi_addr(_Label4+36)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,519 :: 		Label4.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+40)
MOVT	R0, #hi_addr(_Label4+40)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,521 :: 		Label6.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label6+0)
MOVT	R0, #hi_addr(_Label6+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,522 :: 		Label6.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Label6+4)
MOVT	R0, #hi_addr(_Label6+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,523 :: 		Label6.Left            = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label6+6)
MOVT	R0, #hi_addr(_Label6+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,524 :: 		Label6.Top             = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label6+8)
MOVT	R0, #hi_addr(_Label6+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,525 :: 		Label6.Width           = 169;
MOVS	R1, #169
MOVW	R0, #lo_addr(_Label6+10)
MOVT	R0, #hi_addr(_Label6+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,526 :: 		Label6.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Label6+12)
MOVT	R0, #hi_addr(_Label6+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,527 :: 		Label6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label6+26)
MOVT	R0, #hi_addr(_Label6+26)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,528 :: 		Label6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label6+27)
MOVT	R0, #hi_addr(_Label6+27)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,529 :: 		Label6.Caption         = Label6_Caption;
MOVW	R1, #lo_addr(_Label6_Caption+0)
MOVT	R1, #hi_addr(_Label6_Caption+0)
MOVW	R0, #lo_addr(_Label6+16)
MOVT	R0, #hi_addr(_Label6+16)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,530 :: 		Label6.FontName        = Tahoma19x23_Regular;
MOVW	R1, #6602
MOVW	R0, #lo_addr(_Label6+20)
MOVT	R0, #hi_addr(_Label6+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,531 :: 		Label6.Font_Color      = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label6+24)
MOVT	R0, #hi_addr(_Label6+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,532 :: 		Label6.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+28)
MOVT	R0, #hi_addr(_Label6+28)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,533 :: 		Label6.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+32)
MOVT	R0, #hi_addr(_Label6+32)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,534 :: 		Label6.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+36)
MOVT	R0, #hi_addr(_Label6+36)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,535 :: 		Label6.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+40)
MOVT	R0, #hi_addr(_Label6+40)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,537 :: 		Label5.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label5+0)
MOVT	R0, #hi_addr(_Label5+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,538 :: 		Label5.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label5+4)
MOVT	R0, #hi_addr(_Label5+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,539 :: 		Label5.Left            = 153;
MOVS	R1, #153
MOVW	R0, #lo_addr(_Label5+6)
MOVT	R0, #hi_addr(_Label5+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,540 :: 		Label5.Top             = 300;
MOVW	R1, #300
MOVW	R0, #lo_addr(_Label5+8)
MOVT	R0, #hi_addr(_Label5+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,541 :: 		Label5.Width           = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Label5+10)
MOVT	R0, #hi_addr(_Label5+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,542 :: 		Label5.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label5+12)
MOVT	R0, #hi_addr(_Label5+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,543 :: 		Label5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label5+26)
MOVT	R0, #hi_addr(_Label5+26)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,544 :: 		Label5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label5+27)
MOVT	R0, #hi_addr(_Label5+27)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,545 :: 		Label5.Caption         = Label5_Caption;
MOVW	R1, #lo_addr(_Label5_Caption+0)
MOVT	R1, #hi_addr(_Label5_Caption+0)
MOVW	R0, #lo_addr(_Label5+16)
MOVT	R0, #hi_addr(_Label5+16)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,546 :: 		Label5.FontName        = Tahoma11x13_Regular;
MOVW	R1, #15618
MOVW	R0, #lo_addr(_Label5+20)
MOVT	R0, #hi_addr(_Label5+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,547 :: 		Label5.Font_Color      = 0x8000;
MOVW	R1, #32768
MOVW	R0, #lo_addr(_Label5+24)
MOVT	R0, #hi_addr(_Label5+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,548 :: 		Label5.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+28)
MOVT	R0, #hi_addr(_Label5+28)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,549 :: 		Label5.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+32)
MOVT	R0, #hi_addr(_Label5+32)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,550 :: 		Label5.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+36)
MOVT	R0, #hi_addr(_Label5+36)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,551 :: 		Label5.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+40)
MOVT	R0, #hi_addr(_Label5+40)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,553 :: 		ButtonRound1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_ButtonRound1+0)
MOVT	R0, #hi_addr(_ButtonRound1+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,554 :: 		ButtonRound1.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_ButtonRound1+4)
MOVT	R0, #hi_addr(_ButtonRound1+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,555 :: 		ButtonRound1.Left            = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_ButtonRound1+6)
MOVT	R0, #hi_addr(_ButtonRound1+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,556 :: 		ButtonRound1.Top             = 213;
MOVS	R1, #213
MOVW	R0, #lo_addr(_ButtonRound1+8)
MOVT	R0, #hi_addr(_ButtonRound1+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,557 :: 		ButtonRound1.Width           = 106;
MOVS	R1, #106
MOVW	R0, #lo_addr(_ButtonRound1+10)
MOVT	R0, #hi_addr(_ButtonRound1+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,558 :: 		ButtonRound1.Height          = 44;
MOVS	R1, #44
MOVW	R0, #lo_addr(_ButtonRound1+12)
MOVT	R0, #hi_addr(_ButtonRound1+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,559 :: 		ButtonRound1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+14)
MOVT	R0, #hi_addr(_ButtonRound1+14)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,560 :: 		ButtonRound1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+16)
MOVT	R0, #hi_addr(_ButtonRound1+16)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,561 :: 		ButtonRound1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+18)
MOVT	R0, #hi_addr(_ButtonRound1+18)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,562 :: 		ButtonRound1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+19)
MOVT	R0, #hi_addr(_ButtonRound1+19)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,563 :: 		ButtonRound1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+20)
MOVT	R0, #hi_addr(_ButtonRound1+20)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,564 :: 		ButtonRound1.Caption         = ButtonRound1_Caption;
MOVW	R1, #lo_addr(_ButtonRound1_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound1_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound1+24)
MOVT	R0, #hi_addr(_ButtonRound1+24)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,565 :: 		ButtonRound1.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+28)
MOVT	R0, #hi_addr(_ButtonRound1+28)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,566 :: 		ButtonRound1.FontName        = Tahoma13x16_Regular;
MOVW	R1, #2410
MOVW	R0, #lo_addr(_ButtonRound1+32)
MOVT	R0, #hi_addr(_ButtonRound1+32)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,567 :: 		ButtonRound1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+47)
MOVT	R0, #hi_addr(_ButtonRound1+47)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,568 :: 		ButtonRound1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+36)
MOVT	R0, #hi_addr(_ButtonRound1+36)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,569 :: 		ButtonRound1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+38)
MOVT	R0, #hi_addr(_ButtonRound1+38)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,570 :: 		ButtonRound1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+39)
MOVT	R0, #hi_addr(_ButtonRound1+39)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,571 :: 		ButtonRound1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound1+40)
MOVT	R0, #hi_addr(_ButtonRound1+40)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,572 :: 		ButtonRound1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound1+42)
MOVT	R0, #hi_addr(_ButtonRound1+42)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,573 :: 		ButtonRound1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound1+44)
MOVT	R0, #hi_addr(_ButtonRound1+44)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,574 :: 		ButtonRound1.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound1+48)
MOVT	R0, #hi_addr(_ButtonRound1+48)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,575 :: 		ButtonRound1.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound1+46)
MOVT	R0, #hi_addr(_ButtonRound1+46)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,576 :: 		ButtonRound1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+52)
MOVT	R0, #hi_addr(_ButtonRound1+52)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,577 :: 		ButtonRound1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+56)
MOVT	R0, #hi_addr(_ButtonRound1+56)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,578 :: 		ButtonRound1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+60)
MOVT	R0, #hi_addr(_ButtonRound1+60)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,579 :: 		ButtonRound1.OnPressPtr      = Show_database;
MOVW	R1, #lo_addr(_Show_database+0)
MOVT	R1, #hi_addr(_Show_database+0)
MOVW	R0, #lo_addr(_ButtonRound1+64)
MOVT	R0, #hi_addr(_ButtonRound1+64)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,581 :: 		Image1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Image1+0)
MOVT	R0, #hi_addr(_Image1+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,582 :: 		Image1.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Image1+4)
MOVT	R0, #hi_addr(_Image1+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,583 :: 		Image1.Left            = 157;
MOVS	R1, #157
MOVW	R0, #lo_addr(_Image1+6)
MOVT	R0, #hi_addr(_Image1+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,584 :: 		Image1.Top             = 194;
MOVS	R1, #194
MOVW	R0, #lo_addr(_Image1+8)
MOVT	R0, #hi_addr(_Image1+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,585 :: 		Image1.Width           = 62;
MOVS	R1, #62
MOVW	R0, #lo_addr(_Image1+10)
MOVT	R0, #hi_addr(_Image1+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,586 :: 		Image1.Height          = 85;
MOVS	R1, #85
MOVW	R0, #lo_addr(_Image1+12)
MOVT	R0, #hi_addr(_Image1+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,587 :: 		Image1.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+22)
MOVT	R0, #hi_addr(_Image1+22)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,588 :: 		Image1.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+23)
MOVT	R0, #hi_addr(_Image1+23)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,589 :: 		Image1.Picture_Name    = ITU_son_jpg;
MOVW	R1, #19002
MOVW	R0, #lo_addr(_Image1+16)
MOVT	R0, #hi_addr(_Image1+16)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,590 :: 		Image1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+20)
MOVT	R0, #hi_addr(_Image1+20)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,591 :: 		Image1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+21)
MOVT	R0, #hi_addr(_Image1+21)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,592 :: 		Image1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+24)
MOVT	R0, #hi_addr(_Image1+24)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,593 :: 		Image1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+28)
MOVT	R0, #hi_addr(_Image1+28)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,594 :: 		Image1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+32)
MOVT	R0, #hi_addr(_Image1+32)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,595 :: 		Image1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+36)
MOVT	R0, #hi_addr(_Image1+36)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,597 :: 		Label2.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Label2+0)
MOVT	R0, #hi_addr(_Label2+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,598 :: 		Label2.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+4)
MOVT	R0, #hi_addr(_Label2+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,599 :: 		Label2.Left            = 62;
MOVS	R1, #62
MOVW	R0, #lo_addr(_Label2+6)
MOVT	R0, #hi_addr(_Label2+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,600 :: 		Label2.Top             = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label2+8)
MOVT	R0, #hi_addr(_Label2+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,601 :: 		Label2.Width           = 112;
MOVS	R1, #112
MOVW	R0, #lo_addr(_Label2+10)
MOVT	R0, #hi_addr(_Label2+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,602 :: 		Label2.Height          = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label2+12)
MOVT	R0, #hi_addr(_Label2+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,603 :: 		Label2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label2+26)
MOVT	R0, #hi_addr(_Label2+26)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,604 :: 		Label2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label2+27)
MOVT	R0, #hi_addr(_Label2+27)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,605 :: 		Label2.Caption         = Label2_Caption;
MOVW	R1, #lo_addr(_Label2_Caption+0)
MOVT	R1, #hi_addr(_Label2_Caption+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,606 :: 		Label2.FontName        = Tahoma14x16_Bold;
MOVW	R1, #4450
MOVW	R0, #lo_addr(_Label2+20)
MOVT	R0, #hi_addr(_Label2+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,607 :: 		Label2.Font_Color      = 0xFFE0;
MOVW	R1, #65504
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,608 :: 		Label2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+28)
MOVT	R0, #hi_addr(_Label2+28)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,609 :: 		Label2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+32)
MOVT	R0, #hi_addr(_Label2+32)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,610 :: 		Label2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+36)
MOVT	R0, #hi_addr(_Label2+36)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,611 :: 		Label2.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+40)
MOVT	R0, #hi_addr(_Label2+40)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,613 :: 		Label3.OwnerScreen     = &Screen3;
MOVW	R1, #lo_addr(_Screen3+0)
MOVT	R1, #hi_addr(_Screen3+0)
MOVW	R0, #lo_addr(_Label3+0)
MOVT	R0, #hi_addr(_Label3+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,614 :: 		Label3.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+4)
MOVT	R0, #hi_addr(_Label3+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,615 :: 		Label3.Left            = 58;
MOVS	R1, #58
MOVW	R0, #lo_addr(_Label3+6)
MOVT	R0, #hi_addr(_Label3+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,616 :: 		Label3.Top             = 66;
MOVS	R1, #66
MOVW	R0, #lo_addr(_Label3+8)
MOVT	R0, #hi_addr(_Label3+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,617 :: 		Label3.Width           = 120;
MOVS	R1, #120
MOVW	R0, #lo_addr(_Label3+10)
MOVT	R0, #hi_addr(_Label3+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,618 :: 		Label3.Height          = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_Label3+12)
MOVT	R0, #hi_addr(_Label3+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,619 :: 		Label3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label3+26)
MOVT	R0, #hi_addr(_Label3+26)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,620 :: 		Label3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label3+27)
MOVT	R0, #hi_addr(_Label3+27)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,621 :: 		Label3.Caption         = Label3_Caption;
MOVW	R1, #lo_addr(_Label3_Caption+0)
MOVT	R1, #hi_addr(_Label3_Caption+0)
MOVW	R0, #lo_addr(_Label3+16)
MOVT	R0, #hi_addr(_Label3+16)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,622 :: 		Label3.FontName        = Tahoma25x25_Bold;
MOVW	R1, #10651
MOVW	R0, #lo_addr(_Label3+20)
MOVT	R0, #hi_addr(_Label3+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,623 :: 		Label3.Font_Color      = 0x601F;
MOVW	R1, #24607
MOVW	R0, #lo_addr(_Label3+24)
MOVT	R0, #hi_addr(_Label3+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,624 :: 		Label3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+28)
MOVT	R0, #hi_addr(_Label3+28)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,625 :: 		Label3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+32)
MOVT	R0, #hi_addr(_Label3+32)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,626 :: 		Label3.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+36)
MOVT	R0, #hi_addr(_Label3+36)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,627 :: 		Label3.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+40)
MOVT	R0, #hi_addr(_Label3+40)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,629 :: 		CircleButton2.OwnerScreen     = &Screen3;
MOVW	R1, #lo_addr(_Screen3+0)
MOVT	R1, #hi_addr(_Screen3+0)
MOVW	R0, #lo_addr(_CircleButton2+0)
MOVT	R0, #hi_addr(_CircleButton2+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,630 :: 		CircleButton2.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton2+4)
MOVT	R0, #hi_addr(_CircleButton2+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,631 :: 		CircleButton2.Left            = 78;
MOVS	R1, #78
MOVW	R0, #lo_addr(_CircleButton2+6)
MOVT	R0, #hi_addr(_CircleButton2+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,632 :: 		CircleButton2.Top             = 137;
MOVS	R1, #137
MOVW	R0, #lo_addr(_CircleButton2+8)
MOVT	R0, #hi_addr(_CircleButton2+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,633 :: 		CircleButton2.Radius          = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_CircleButton2+10)
MOVT	R0, #hi_addr(_CircleButton2+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,634 :: 		CircleButton2.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton2+12)
MOVT	R0, #hi_addr(_CircleButton2+12)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,635 :: 		CircleButton2.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton2+14)
MOVT	R0, #hi_addr(_CircleButton2+14)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,636 :: 		CircleButton2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton2+16)
MOVT	R0, #hi_addr(_CircleButton2+16)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,637 :: 		CircleButton2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton2+17)
MOVT	R0, #hi_addr(_CircleButton2+17)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,638 :: 		CircleButton2.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton2+18)
MOVT	R0, #hi_addr(_CircleButton2+18)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,639 :: 		CircleButton2.Caption         = CircleButton2_Caption;
MOVW	R1, #lo_addr(_CircleButton2_Caption+0)
MOVT	R1, #hi_addr(_CircleButton2_Caption+0)
MOVW	R0, #lo_addr(_CircleButton2+20)
MOVT	R0, #hi_addr(_CircleButton2+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,640 :: 		CircleButton2.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton2+24)
MOVT	R0, #hi_addr(_CircleButton2+24)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,641 :: 		CircleButton2.FontName        = Tahoma19x23_Regular;
MOVW	R1, #6602
MOVW	R0, #lo_addr(_CircleButton2+28)
MOVT	R0, #hi_addr(_CircleButton2+28)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,642 :: 		CircleButton2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton2+42)
MOVT	R0, #hi_addr(_CircleButton2+42)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,643 :: 		CircleButton2.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton2+32)
MOVT	R0, #hi_addr(_CircleButton2+32)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,644 :: 		CircleButton2.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton2+34)
MOVT	R0, #hi_addr(_CircleButton2+34)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,645 :: 		CircleButton2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton2+35)
MOVT	R0, #hi_addr(_CircleButton2+35)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,646 :: 		CircleButton2.Gradient_Start_Color = 0xFFF0;
MOVW	R1, #65520
MOVW	R0, #lo_addr(_CircleButton2+36)
MOVT	R0, #hi_addr(_CircleButton2+36)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,647 :: 		CircleButton2.Gradient_End_Color = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_CircleButton2+38)
MOVT	R0, #hi_addr(_CircleButton2+38)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,648 :: 		CircleButton2.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CircleButton2+40)
MOVT	R0, #hi_addr(_CircleButton2+40)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,649 :: 		CircleButton2.Press_Color     = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_CircleButton2+44)
MOVT	R0, #hi_addr(_CircleButton2+44)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,650 :: 		CircleButton2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton2+48)
MOVT	R0, #hi_addr(_CircleButton2+48)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,651 :: 		CircleButton2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton2+52)
MOVT	R0, #hi_addr(_CircleButton2+52)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,652 :: 		CircleButton2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton2+56)
MOVT	R0, #hi_addr(_CircleButton2+56)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,653 :: 		CircleButton2.OnPressPtr      = DCVA_TEST;
MOVW	R1, #lo_addr(_DCVA_TEST+0)
MOVT	R1, #hi_addr(_DCVA_TEST+0)
MOVW	R0, #lo_addr(_CircleButton2+60)
MOVT	R0, #hi_addr(_CircleButton2+60)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,655 :: 		Label7.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_Label7+0)
MOVT	R0, #hi_addr(_Label7+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,656 :: 		Label7.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+4)
MOVT	R0, #hi_addr(_Label7+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,657 :: 		Label7.Left            = 78;
MOVS	R1, #78
MOVW	R0, #lo_addr(_Label7+6)
MOVT	R0, #hi_addr(_Label7+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,658 :: 		Label7.Top             = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label7+8)
MOVT	R0, #hi_addr(_Label7+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,659 :: 		Label7.Width           = 74;
MOVS	R1, #74
MOVW	R0, #lo_addr(_Label7+10)
MOVT	R0, #hi_addr(_Label7+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,660 :: 		Label7.Height          = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label7+12)
MOVT	R0, #hi_addr(_Label7+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,661 :: 		Label7.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label7+26)
MOVT	R0, #hi_addr(_Label7+26)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,662 :: 		Label7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label7+27)
MOVT	R0, #hi_addr(_Label7+27)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,663 :: 		Label7.Caption         = Label7_Caption;
MOVW	R1, #lo_addr(_Label7_Caption+0)
MOVT	R1, #hi_addr(_Label7_Caption+0)
MOVW	R0, #lo_addr(_Label7+16)
MOVT	R0, #hi_addr(_Label7+16)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,664 :: 		Label7.FontName        = Tahoma14x16_Bold;
MOVW	R1, #4450
MOVW	R0, #lo_addr(_Label7+20)
MOVT	R0, #hi_addr(_Label7+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,665 :: 		Label7.Font_Color      = 0xFFE0;
MOVW	R1, #65504
MOVW	R0, #lo_addr(_Label7+24)
MOVT	R0, #hi_addr(_Label7+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,666 :: 		Label7.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+28)
MOVT	R0, #hi_addr(_Label7+28)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,667 :: 		Label7.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+32)
MOVT	R0, #hi_addr(_Label7+32)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,668 :: 		Label7.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+36)
MOVT	R0, #hi_addr(_Label7+36)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,669 :: 		Label7.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+40)
MOVT	R0, #hi_addr(_Label7+40)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,671 :: 		RadioButton1.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_RadioButton1+0)
MOVT	R0, #hi_addr(_RadioButton1+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,672 :: 		RadioButton1.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+4)
MOVT	R0, #hi_addr(_RadioButton1+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,673 :: 		RadioButton1.Left            = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_RadioButton1+6)
MOVT	R0, #hi_addr(_RadioButton1+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,674 :: 		RadioButton1.Top             = 49;
MOVS	R1, #49
MOVW	R0, #lo_addr(_RadioButton1+8)
MOVT	R0, #hi_addr(_RadioButton1+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,675 :: 		RadioButton1.Width           = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton1+10)
MOVT	R0, #hi_addr(_RadioButton1+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,676 :: 		RadioButton1.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_RadioButton1+12)
MOVT	R0, #hi_addr(_RadioButton1+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,677 :: 		RadioButton1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton1+14)
MOVT	R0, #hi_addr(_RadioButton1+14)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,678 :: 		RadioButton1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+16)
MOVT	R0, #hi_addr(_RadioButton1+16)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,679 :: 		RadioButton1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton1+18)
MOVT	R0, #hi_addr(_RadioButton1+18)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,680 :: 		RadioButton1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton1+19)
MOVT	R0, #hi_addr(_RadioButton1+19)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,681 :: 		RadioButton1.Checked         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton1+20)
MOVT	R0, #hi_addr(_RadioButton1+20)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,682 :: 		RadioButton1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton1+21)
MOVT	R0, #hi_addr(_RadioButton1+21)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,683 :: 		RadioButton1.Caption         = RadioButton1_Caption;
MOVW	R1, #lo_addr(_RadioButton1_Caption+0)
MOVT	R1, #hi_addr(_RadioButton1_Caption+0)
MOVW	R0, #lo_addr(_RadioButton1+24)
MOVT	R0, #hi_addr(_RadioButton1+24)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,684 :: 		RadioButton1.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+28)
MOVT	R0, #hi_addr(_RadioButton1+28)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,685 :: 		RadioButton1.FontName        = Tahoma11x13_Regular;
MOVW	R1, #15618
MOVW	R0, #lo_addr(_RadioButton1+32)
MOVT	R0, #hi_addr(_RadioButton1+32)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,686 :: 		RadioButton1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton1+48)
MOVT	R0, #hi_addr(_RadioButton1+48)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,687 :: 		RadioButton1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+36)
MOVT	R0, #hi_addr(_RadioButton1+36)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,688 :: 		RadioButton1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton1+38)
MOVT	R0, #hi_addr(_RadioButton1+38)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,689 :: 		RadioButton1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+39)
MOVT	R0, #hi_addr(_RadioButton1+39)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,690 :: 		RadioButton1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton1+40)
MOVT	R0, #hi_addr(_RadioButton1+40)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,691 :: 		RadioButton1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton1+42)
MOVT	R0, #hi_addr(_RadioButton1+42)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,692 :: 		RadioButton1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton1+44)
MOVT	R0, #hi_addr(_RadioButton1+44)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,693 :: 		RadioButton1.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton1+50)
MOVT	R0, #hi_addr(_RadioButton1+50)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,694 :: 		RadioButton1.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_RadioButton1+46)
MOVT	R0, #hi_addr(_RadioButton1+46)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,695 :: 		RadioButton1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+52)
MOVT	R0, #hi_addr(_RadioButton1+52)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,696 :: 		RadioButton1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+56)
MOVT	R0, #hi_addr(_RadioButton1+56)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,697 :: 		RadioButton1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+60)
MOVT	R0, #hi_addr(_RadioButton1+60)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,698 :: 		RadioButton1.OnPressPtr      = J_E_2;
MOVW	R1, #lo_addr(_J_E_2+0)
MOVT	R1, #hi_addr(_J_E_2+0)
MOVW	R0, #lo_addr(_RadioButton1+64)
MOVT	R0, #hi_addr(_RadioButton1+64)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,700 :: 		RadioButton2.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_RadioButton2+0)
MOVT	R0, #hi_addr(_RadioButton2+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,701 :: 		RadioButton2.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton2+4)
MOVT	R0, #hi_addr(_RadioButton2+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,702 :: 		RadioButton2.Left            = 151;
MOVS	R1, #151
MOVW	R0, #lo_addr(_RadioButton2+6)
MOVT	R0, #hi_addr(_RadioButton2+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,703 :: 		RadioButton2.Top             = 66;
MOVS	R1, #66
MOVW	R0, #lo_addr(_RadioButton2+8)
MOVT	R0, #hi_addr(_RadioButton2+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,704 :: 		RadioButton2.Width           = 48;
MOVS	R1, #48
MOVW	R0, #lo_addr(_RadioButton2+10)
MOVT	R0, #hi_addr(_RadioButton2+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,705 :: 		RadioButton2.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_RadioButton2+12)
MOVT	R0, #hi_addr(_RadioButton2+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,706 :: 		RadioButton2.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton2+14)
MOVT	R0, #hi_addr(_RadioButton2+14)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,707 :: 		RadioButton2.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+16)
MOVT	R0, #hi_addr(_RadioButton2+16)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,708 :: 		RadioButton2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton2+18)
MOVT	R0, #hi_addr(_RadioButton2+18)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,709 :: 		RadioButton2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton2+19)
MOVT	R0, #hi_addr(_RadioButton2+19)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,710 :: 		RadioButton2.Checked         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton2+20)
MOVT	R0, #hi_addr(_RadioButton2+20)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,711 :: 		RadioButton2.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton2+21)
MOVT	R0, #hi_addr(_RadioButton2+21)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,712 :: 		RadioButton2.Caption         = RadioButton2_Caption;
MOVW	R1, #lo_addr(_RadioButton2_Caption+0)
MOVT	R1, #hi_addr(_RadioButton2_Caption+0)
MOVW	R0, #lo_addr(_RadioButton2+24)
MOVT	R0, #hi_addr(_RadioButton2+24)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,713 :: 		RadioButton2.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+28)
MOVT	R0, #hi_addr(_RadioButton2+28)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,714 :: 		RadioButton2.FontName        = Tahoma11x13_Regular;
MOVW	R1, #15618
MOVW	R0, #lo_addr(_RadioButton2+32)
MOVT	R0, #hi_addr(_RadioButton2+32)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,715 :: 		RadioButton2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton2+48)
MOVT	R0, #hi_addr(_RadioButton2+48)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,716 :: 		RadioButton2.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+36)
MOVT	R0, #hi_addr(_RadioButton2+36)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,717 :: 		RadioButton2.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton2+38)
MOVT	R0, #hi_addr(_RadioButton2+38)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,718 :: 		RadioButton2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+39)
MOVT	R0, #hi_addr(_RadioButton2+39)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,719 :: 		RadioButton2.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton2+40)
MOVT	R0, #hi_addr(_RadioButton2+40)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,720 :: 		RadioButton2.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton2+42)
MOVT	R0, #hi_addr(_RadioButton2+42)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,721 :: 		RadioButton2.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton2+44)
MOVT	R0, #hi_addr(_RadioButton2+44)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,722 :: 		RadioButton2.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton2+50)
MOVT	R0, #hi_addr(_RadioButton2+50)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,723 :: 		RadioButton2.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_RadioButton2+46)
MOVT	R0, #hi_addr(_RadioButton2+46)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,724 :: 		RadioButton2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+52)
MOVT	R0, #hi_addr(_RadioButton2+52)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,725 :: 		RadioButton2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+56)
MOVT	R0, #hi_addr(_RadioButton2+56)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,726 :: 		RadioButton2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+60)
MOVT	R0, #hi_addr(_RadioButton2+60)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,727 :: 		RadioButton2.OnPressPtr      = J_E_3;
MOVW	R1, #lo_addr(_J_E_3+0)
MOVT	R1, #hi_addr(_J_E_3+0)
MOVW	R0, #lo_addr(_RadioButton2+64)
MOVT	R0, #hi_addr(_RadioButton2+64)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,729 :: 		RadioButton3.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_RadioButton3+0)
MOVT	R0, #hi_addr(_RadioButton3+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,730 :: 		RadioButton3.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_RadioButton3+4)
MOVT	R0, #hi_addr(_RadioButton3+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,731 :: 		RadioButton3.Left            = 39;
MOVS	R1, #39
MOVW	R0, #lo_addr(_RadioButton3+6)
MOVT	R0, #hi_addr(_RadioButton3+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,732 :: 		RadioButton3.Top             = 103;
MOVS	R1, #103
MOVW	R0, #lo_addr(_RadioButton3+8)
MOVT	R0, #hi_addr(_RadioButton3+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,733 :: 		RadioButton3.Width           = 54;
MOVS	R1, #54
MOVW	R0, #lo_addr(_RadioButton3+10)
MOVT	R0, #hi_addr(_RadioButton3+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,734 :: 		RadioButton3.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_RadioButton3+12)
MOVT	R0, #hi_addr(_RadioButton3+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,735 :: 		RadioButton3.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton3+14)
MOVT	R0, #hi_addr(_RadioButton3+14)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,736 :: 		RadioButton3.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton3+16)
MOVT	R0, #hi_addr(_RadioButton3+16)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,737 :: 		RadioButton3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton3+18)
MOVT	R0, #hi_addr(_RadioButton3+18)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,738 :: 		RadioButton3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton3+19)
MOVT	R0, #hi_addr(_RadioButton3+19)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,739 :: 		RadioButton3.Checked         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton3+20)
MOVT	R0, #hi_addr(_RadioButton3+20)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,740 :: 		RadioButton3.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton3+21)
MOVT	R0, #hi_addr(_RadioButton3+21)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,741 :: 		RadioButton3.Caption         = RadioButton3_Caption;
MOVW	R1, #lo_addr(_RadioButton3_Caption+0)
MOVT	R1, #hi_addr(_RadioButton3_Caption+0)
MOVW	R0, #lo_addr(_RadioButton3+24)
MOVT	R0, #hi_addr(_RadioButton3+24)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,742 :: 		RadioButton3.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton3+28)
MOVT	R0, #hi_addr(_RadioButton3+28)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,743 :: 		RadioButton3.FontName        = Tahoma11x13_Regular;
MOVW	R1, #15618
MOVW	R0, #lo_addr(_RadioButton3+32)
MOVT	R0, #hi_addr(_RadioButton3+32)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,744 :: 		RadioButton3.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton3+48)
MOVT	R0, #hi_addr(_RadioButton3+48)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,745 :: 		RadioButton3.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton3+36)
MOVT	R0, #hi_addr(_RadioButton3+36)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,746 :: 		RadioButton3.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton3+38)
MOVT	R0, #hi_addr(_RadioButton3+38)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,747 :: 		RadioButton3.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton3+39)
MOVT	R0, #hi_addr(_RadioButton3+39)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,748 :: 		RadioButton3.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton3+40)
MOVT	R0, #hi_addr(_RadioButton3+40)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,749 :: 		RadioButton3.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton3+42)
MOVT	R0, #hi_addr(_RadioButton3+42)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,750 :: 		RadioButton3.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton3+44)
MOVT	R0, #hi_addr(_RadioButton3+44)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,751 :: 		RadioButton3.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton3+50)
MOVT	R0, #hi_addr(_RadioButton3+50)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,752 :: 		RadioButton3.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_RadioButton3+46)
MOVT	R0, #hi_addr(_RadioButton3+46)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,753 :: 		RadioButton3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton3+52)
MOVT	R0, #hi_addr(_RadioButton3+52)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,754 :: 		RadioButton3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton3+56)
MOVT	R0, #hi_addr(_RadioButton3+56)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,755 :: 		RadioButton3.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton3+60)
MOVT	R0, #hi_addr(_RadioButton3+60)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,756 :: 		RadioButton3.OnPressPtr      = J_E_4;
MOVW	R1, #lo_addr(_J_E_4+0)
MOVT	R1, #hi_addr(_J_E_4+0)
MOVW	R0, #lo_addr(_RadioButton3+64)
MOVT	R0, #hi_addr(_RadioButton3+64)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,758 :: 		RadioButton4.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_RadioButton4+0)
MOVT	R0, #hi_addr(_RadioButton4+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,759 :: 		RadioButton4.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_RadioButton4+4)
MOVT	R0, #hi_addr(_RadioButton4+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,760 :: 		RadioButton4.Left            = 144;
MOVS	R1, #144
MOVW	R0, #lo_addr(_RadioButton4+6)
MOVT	R0, #hi_addr(_RadioButton4+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,761 :: 		RadioButton4.Top             = 121;
MOVS	R1, #121
MOVW	R0, #lo_addr(_RadioButton4+8)
MOVT	R0, #hi_addr(_RadioButton4+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,762 :: 		RadioButton4.Width           = 61;
MOVS	R1, #61
MOVW	R0, #lo_addr(_RadioButton4+10)
MOVT	R0, #hi_addr(_RadioButton4+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,763 :: 		RadioButton4.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_RadioButton4+12)
MOVT	R0, #hi_addr(_RadioButton4+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,764 :: 		RadioButton4.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton4+14)
MOVT	R0, #hi_addr(_RadioButton4+14)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,765 :: 		RadioButton4.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton4+16)
MOVT	R0, #hi_addr(_RadioButton4+16)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,766 :: 		RadioButton4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton4+18)
MOVT	R0, #hi_addr(_RadioButton4+18)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,767 :: 		RadioButton4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton4+19)
MOVT	R0, #hi_addr(_RadioButton4+19)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,768 :: 		RadioButton4.Checked         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton4+20)
MOVT	R0, #hi_addr(_RadioButton4+20)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,769 :: 		RadioButton4.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton4+21)
MOVT	R0, #hi_addr(_RadioButton4+21)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,770 :: 		RadioButton4.Caption         = RadioButton4_Caption;
MOVW	R1, #lo_addr(_RadioButton4_Caption+0)
MOVT	R1, #hi_addr(_RadioButton4_Caption+0)
MOVW	R0, #lo_addr(_RadioButton4+24)
MOVT	R0, #hi_addr(_RadioButton4+24)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,771 :: 		RadioButton4.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton4+28)
MOVT	R0, #hi_addr(_RadioButton4+28)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,772 :: 		RadioButton4.FontName        = Tahoma11x13_Regular;
MOVW	R1, #15618
MOVW	R0, #lo_addr(_RadioButton4+32)
MOVT	R0, #hi_addr(_RadioButton4+32)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,773 :: 		RadioButton4.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton4+48)
MOVT	R0, #hi_addr(_RadioButton4+48)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,774 :: 		RadioButton4.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton4+36)
MOVT	R0, #hi_addr(_RadioButton4+36)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,775 :: 		RadioButton4.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton4+38)
MOVT	R0, #hi_addr(_RadioButton4+38)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,776 :: 		RadioButton4.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton4+39)
MOVT	R0, #hi_addr(_RadioButton4+39)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,777 :: 		RadioButton4.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton4+40)
MOVT	R0, #hi_addr(_RadioButton4+40)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,778 :: 		RadioButton4.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton4+42)
MOVT	R0, #hi_addr(_RadioButton4+42)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,779 :: 		RadioButton4.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton4+44)
MOVT	R0, #hi_addr(_RadioButton4+44)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,780 :: 		RadioButton4.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton4+50)
MOVT	R0, #hi_addr(_RadioButton4+50)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,781 :: 		RadioButton4.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_RadioButton4+46)
MOVT	R0, #hi_addr(_RadioButton4+46)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,782 :: 		RadioButton4.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton4+52)
MOVT	R0, #hi_addr(_RadioButton4+52)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,783 :: 		RadioButton4.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton4+56)
MOVT	R0, #hi_addr(_RadioButton4+56)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,784 :: 		RadioButton4.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton4+60)
MOVT	R0, #hi_addr(_RadioButton4+60)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,785 :: 		RadioButton4.OnPressPtr      = J_E_5;
MOVW	R1, #lo_addr(_J_E_5+0)
MOVT	R1, #hi_addr(_J_E_5+0)
MOVW	R0, #lo_addr(_RadioButton4+64)
MOVT	R0, #hi_addr(_RadioButton4+64)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,787 :: 		RadioButton5.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_RadioButton5+0)
MOVT	R0, #hi_addr(_RadioButton5+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,788 :: 		RadioButton5.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_RadioButton5+4)
MOVT	R0, #hi_addr(_RadioButton5+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,789 :: 		RadioButton5.Left            = 39;
MOVS	R1, #39
MOVW	R0, #lo_addr(_RadioButton5+6)
MOVT	R0, #hi_addr(_RadioButton5+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,790 :: 		RadioButton5.Top             = 156;
MOVS	R1, #156
MOVW	R0, #lo_addr(_RadioButton5+8)
MOVT	R0, #hi_addr(_RadioButton5+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,791 :: 		RadioButton5.Width           = 67;
MOVS	R1, #67
MOVW	R0, #lo_addr(_RadioButton5+10)
MOVT	R0, #hi_addr(_RadioButton5+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,792 :: 		RadioButton5.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_RadioButton5+12)
MOVT	R0, #hi_addr(_RadioButton5+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,793 :: 		RadioButton5.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton5+14)
MOVT	R0, #hi_addr(_RadioButton5+14)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,794 :: 		RadioButton5.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton5+16)
MOVT	R0, #hi_addr(_RadioButton5+16)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,795 :: 		RadioButton5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton5+18)
MOVT	R0, #hi_addr(_RadioButton5+18)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,796 :: 		RadioButton5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton5+19)
MOVT	R0, #hi_addr(_RadioButton5+19)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,797 :: 		RadioButton5.Checked         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton5+20)
MOVT	R0, #hi_addr(_RadioButton5+20)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,798 :: 		RadioButton5.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton5+21)
MOVT	R0, #hi_addr(_RadioButton5+21)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,799 :: 		RadioButton5.Caption         = RadioButton5_Caption;
MOVW	R1, #lo_addr(_RadioButton5_Caption+0)
MOVT	R1, #hi_addr(_RadioButton5_Caption+0)
MOVW	R0, #lo_addr(_RadioButton5+24)
MOVT	R0, #hi_addr(_RadioButton5+24)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,800 :: 		RadioButton5.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton5+28)
MOVT	R0, #hi_addr(_RadioButton5+28)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,801 :: 		RadioButton5.FontName        = Tahoma11x13_Regular;
MOVW	R1, #15618
MOVW	R0, #lo_addr(_RadioButton5+32)
MOVT	R0, #hi_addr(_RadioButton5+32)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,802 :: 		RadioButton5.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton5+48)
MOVT	R0, #hi_addr(_RadioButton5+48)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,803 :: 		RadioButton5.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton5+36)
MOVT	R0, #hi_addr(_RadioButton5+36)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,804 :: 		RadioButton5.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton5+38)
MOVT	R0, #hi_addr(_RadioButton5+38)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,805 :: 		RadioButton5.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton5+39)
MOVT	R0, #hi_addr(_RadioButton5+39)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,806 :: 		RadioButton5.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton5+40)
MOVT	R0, #hi_addr(_RadioButton5+40)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,807 :: 		RadioButton5.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton5+42)
MOVT	R0, #hi_addr(_RadioButton5+42)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,808 :: 		RadioButton5.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton5+44)
MOVT	R0, #hi_addr(_RadioButton5+44)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,809 :: 		RadioButton5.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton5+50)
MOVT	R0, #hi_addr(_RadioButton5+50)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,810 :: 		RadioButton5.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_RadioButton5+46)
MOVT	R0, #hi_addr(_RadioButton5+46)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,811 :: 		RadioButton5.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton5+52)
MOVT	R0, #hi_addr(_RadioButton5+52)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,812 :: 		RadioButton5.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton5+56)
MOVT	R0, #hi_addr(_RadioButton5+56)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,813 :: 		RadioButton5.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton5+60)
MOVT	R0, #hi_addr(_RadioButton5+60)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,814 :: 		RadioButton5.OnPressPtr      = J_E_6;
MOVW	R1, #lo_addr(_J_E_6+0)
MOVT	R1, #hi_addr(_J_E_6+0)
MOVW	R0, #lo_addr(_RadioButton5+64)
MOVT	R0, #hi_addr(_RadioButton5+64)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,816 :: 		RadioButton6.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_RadioButton6+0)
MOVT	R0, #hi_addr(_RadioButton6+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,817 :: 		RadioButton6.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_RadioButton6+4)
MOVT	R0, #hi_addr(_RadioButton6+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,818 :: 		RadioButton6.Left            = 134;
MOVS	R1, #134
MOVW	R0, #lo_addr(_RadioButton6+6)
MOVT	R0, #hi_addr(_RadioButton6+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,819 :: 		RadioButton6.Top             = 184;
MOVS	R1, #184
MOVW	R0, #lo_addr(_RadioButton6+8)
MOVT	R0, #hi_addr(_RadioButton6+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,820 :: 		RadioButton6.Width           = 73;
MOVS	R1, #73
MOVW	R0, #lo_addr(_RadioButton6+10)
MOVT	R0, #hi_addr(_RadioButton6+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,821 :: 		RadioButton6.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_RadioButton6+12)
MOVT	R0, #hi_addr(_RadioButton6+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,822 :: 		RadioButton6.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton6+14)
MOVT	R0, #hi_addr(_RadioButton6+14)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,823 :: 		RadioButton6.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton6+16)
MOVT	R0, #hi_addr(_RadioButton6+16)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,824 :: 		RadioButton6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton6+18)
MOVT	R0, #hi_addr(_RadioButton6+18)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,825 :: 		RadioButton6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton6+19)
MOVT	R0, #hi_addr(_RadioButton6+19)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,826 :: 		RadioButton6.Checked         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton6+20)
MOVT	R0, #hi_addr(_RadioButton6+20)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,827 :: 		RadioButton6.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton6+21)
MOVT	R0, #hi_addr(_RadioButton6+21)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,828 :: 		RadioButton6.Caption         = RadioButton6_Caption;
MOVW	R1, #lo_addr(_RadioButton6_Caption+0)
MOVT	R1, #hi_addr(_RadioButton6_Caption+0)
MOVW	R0, #lo_addr(_RadioButton6+24)
MOVT	R0, #hi_addr(_RadioButton6+24)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,829 :: 		RadioButton6.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton6+28)
MOVT	R0, #hi_addr(_RadioButton6+28)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,830 :: 		RadioButton6.FontName        = Tahoma11x13_Regular;
MOVW	R1, #15618
MOVW	R0, #lo_addr(_RadioButton6+32)
MOVT	R0, #hi_addr(_RadioButton6+32)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,831 :: 		RadioButton6.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton6+48)
MOVT	R0, #hi_addr(_RadioButton6+48)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,832 :: 		RadioButton6.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton6+36)
MOVT	R0, #hi_addr(_RadioButton6+36)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,833 :: 		RadioButton6.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton6+38)
MOVT	R0, #hi_addr(_RadioButton6+38)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,834 :: 		RadioButton6.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton6+39)
MOVT	R0, #hi_addr(_RadioButton6+39)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,835 :: 		RadioButton6.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton6+40)
MOVT	R0, #hi_addr(_RadioButton6+40)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,836 :: 		RadioButton6.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton6+42)
MOVT	R0, #hi_addr(_RadioButton6+42)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,837 :: 		RadioButton6.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton6+44)
MOVT	R0, #hi_addr(_RadioButton6+44)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,838 :: 		RadioButton6.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton6+50)
MOVT	R0, #hi_addr(_RadioButton6+50)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,839 :: 		RadioButton6.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_RadioButton6+46)
MOVT	R0, #hi_addr(_RadioButton6+46)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,840 :: 		RadioButton6.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton6+52)
MOVT	R0, #hi_addr(_RadioButton6+52)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,841 :: 		RadioButton6.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton6+56)
MOVT	R0, #hi_addr(_RadioButton6+56)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,842 :: 		RadioButton6.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton6+60)
MOVT	R0, #hi_addr(_RadioButton6+60)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,843 :: 		RadioButton6.OnPressPtr      = J_E_7;
MOVW	R1, #lo_addr(_J_E_7+0)
MOVT	R1, #hi_addr(_J_E_7+0)
MOVW	R0, #lo_addr(_RadioButton6+64)
MOVT	R0, #hi_addr(_RadioButton6+64)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,845 :: 		RadioButton7.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_RadioButton7+0)
MOVT	R0, #hi_addr(_RadioButton7+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,846 :: 		RadioButton7.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_RadioButton7+4)
MOVT	R0, #hi_addr(_RadioButton7+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,847 :: 		RadioButton7.Left            = 47;
MOVS	R1, #47
MOVW	R0, #lo_addr(_RadioButton7+6)
MOVT	R0, #hi_addr(_RadioButton7+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,848 :: 		RadioButton7.Top             = 221;
MOVS	R1, #221
MOVW	R0, #lo_addr(_RadioButton7+8)
MOVT	R0, #hi_addr(_RadioButton7+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,849 :: 		RadioButton7.Width           = 79;
MOVS	R1, #79
MOVW	R0, #lo_addr(_RadioButton7+10)
MOVT	R0, #hi_addr(_RadioButton7+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,850 :: 		RadioButton7.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_RadioButton7+12)
MOVT	R0, #hi_addr(_RadioButton7+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,851 :: 		RadioButton7.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton7+14)
MOVT	R0, #hi_addr(_RadioButton7+14)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,852 :: 		RadioButton7.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+16)
MOVT	R0, #hi_addr(_RadioButton7+16)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,853 :: 		RadioButton7.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton7+18)
MOVT	R0, #hi_addr(_RadioButton7+18)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,854 :: 		RadioButton7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton7+19)
MOVT	R0, #hi_addr(_RadioButton7+19)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,855 :: 		RadioButton7.Checked         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton7+20)
MOVT	R0, #hi_addr(_RadioButton7+20)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,856 :: 		RadioButton7.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton7+21)
MOVT	R0, #hi_addr(_RadioButton7+21)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,857 :: 		RadioButton7.Caption         = RadioButton7_Caption;
MOVW	R1, #lo_addr(_RadioButton7_Caption+0)
MOVT	R1, #hi_addr(_RadioButton7_Caption+0)
MOVW	R0, #lo_addr(_RadioButton7+24)
MOVT	R0, #hi_addr(_RadioButton7+24)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,858 :: 		RadioButton7.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+28)
MOVT	R0, #hi_addr(_RadioButton7+28)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,859 :: 		RadioButton7.FontName        = Tahoma11x13_Regular;
MOVW	R1, #15618
MOVW	R0, #lo_addr(_RadioButton7+32)
MOVT	R0, #hi_addr(_RadioButton7+32)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,860 :: 		RadioButton7.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton7+48)
MOVT	R0, #hi_addr(_RadioButton7+48)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,861 :: 		RadioButton7.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+36)
MOVT	R0, #hi_addr(_RadioButton7+36)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,862 :: 		RadioButton7.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton7+38)
MOVT	R0, #hi_addr(_RadioButton7+38)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,863 :: 		RadioButton7.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+39)
MOVT	R0, #hi_addr(_RadioButton7+39)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,864 :: 		RadioButton7.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton7+40)
MOVT	R0, #hi_addr(_RadioButton7+40)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,865 :: 		RadioButton7.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton7+42)
MOVT	R0, #hi_addr(_RadioButton7+42)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,866 :: 		RadioButton7.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton7+44)
MOVT	R0, #hi_addr(_RadioButton7+44)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,867 :: 		RadioButton7.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton7+50)
MOVT	R0, #hi_addr(_RadioButton7+50)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,868 :: 		RadioButton7.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_RadioButton7+46)
MOVT	R0, #hi_addr(_RadioButton7+46)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,869 :: 		RadioButton7.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+52)
MOVT	R0, #hi_addr(_RadioButton7+52)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,870 :: 		RadioButton7.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+56)
MOVT	R0, #hi_addr(_RadioButton7+56)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,871 :: 		RadioButton7.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+60)
MOVT	R0, #hi_addr(_RadioButton7+60)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,872 :: 		RadioButton7.OnPressPtr      = J_E_8;
MOVW	R1, #lo_addr(_J_E_8+0)
MOVT	R1, #hi_addr(_J_E_8+0)
MOVW	R0, #lo_addr(_RadioButton7+64)
MOVT	R0, #hi_addr(_RadioButton7+64)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,874 :: 		RadioButton8.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_RadioButton8+0)
MOVT	R0, #hi_addr(_RadioButton8+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,875 :: 		RadioButton8.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_RadioButton8+4)
MOVT	R0, #hi_addr(_RadioButton8+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,876 :: 		RadioButton8.Left            = 129;
MOVS	R1, #129
MOVW	R0, #lo_addr(_RadioButton8+6)
MOVT	R0, #hi_addr(_RadioButton8+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,877 :: 		RadioButton8.Top             = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_RadioButton8+8)
MOVT	R0, #hi_addr(_RadioButton8+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,878 :: 		RadioButton8.Width           = 85;
MOVS	R1, #85
MOVW	R0, #lo_addr(_RadioButton8+10)
MOVT	R0, #hi_addr(_RadioButton8+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,879 :: 		RadioButton8.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_RadioButton8+12)
MOVT	R0, #hi_addr(_RadioButton8+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,880 :: 		RadioButton8.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton8+14)
MOVT	R0, #hi_addr(_RadioButton8+14)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,881 :: 		RadioButton8.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+16)
MOVT	R0, #hi_addr(_RadioButton8+16)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,882 :: 		RadioButton8.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton8+18)
MOVT	R0, #hi_addr(_RadioButton8+18)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,883 :: 		RadioButton8.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton8+19)
MOVT	R0, #hi_addr(_RadioButton8+19)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,884 :: 		RadioButton8.Checked         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton8+20)
MOVT	R0, #hi_addr(_RadioButton8+20)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,885 :: 		RadioButton8.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton8+21)
MOVT	R0, #hi_addr(_RadioButton8+21)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,886 :: 		RadioButton8.Caption         = RadioButton8_Caption;
MOVW	R1, #lo_addr(_RadioButton8_Caption+0)
MOVT	R1, #hi_addr(_RadioButton8_Caption+0)
MOVW	R0, #lo_addr(_RadioButton8+24)
MOVT	R0, #hi_addr(_RadioButton8+24)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,887 :: 		RadioButton8.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+28)
MOVT	R0, #hi_addr(_RadioButton8+28)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,888 :: 		RadioButton8.FontName        = Tahoma11x13_Regular;
MOVW	R1, #15618
MOVW	R0, #lo_addr(_RadioButton8+32)
MOVT	R0, #hi_addr(_RadioButton8+32)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,889 :: 		RadioButton8.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton8+48)
MOVT	R0, #hi_addr(_RadioButton8+48)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,890 :: 		RadioButton8.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+36)
MOVT	R0, #hi_addr(_RadioButton8+36)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,891 :: 		RadioButton8.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton8+38)
MOVT	R0, #hi_addr(_RadioButton8+38)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,892 :: 		RadioButton8.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+39)
MOVT	R0, #hi_addr(_RadioButton8+39)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,893 :: 		RadioButton8.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton8+40)
MOVT	R0, #hi_addr(_RadioButton8+40)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,894 :: 		RadioButton8.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton8+42)
MOVT	R0, #hi_addr(_RadioButton8+42)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,895 :: 		RadioButton8.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton8+44)
MOVT	R0, #hi_addr(_RadioButton8+44)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,896 :: 		RadioButton8.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton8+50)
MOVT	R0, #hi_addr(_RadioButton8+50)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,897 :: 		RadioButton8.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_RadioButton8+46)
MOVT	R0, #hi_addr(_RadioButton8+46)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,898 :: 		RadioButton8.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+52)
MOVT	R0, #hi_addr(_RadioButton8+52)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,899 :: 		RadioButton8.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+56)
MOVT	R0, #hi_addr(_RadioButton8+56)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,900 :: 		RadioButton8.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+60)
MOVT	R0, #hi_addr(_RadioButton8+60)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,901 :: 		RadioButton8.OnPressPtr      = J_E_9;
MOVW	R1, #lo_addr(_J_E_9+0)
MOVT	R1, #hi_addr(_J_E_9+0)
MOVW	R0, #lo_addr(_RadioButton8+64)
MOVT	R0, #hi_addr(_RadioButton8+64)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,903 :: 		Label8.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_Label8+0)
MOVT	R0, #hi_addr(_Label8+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,904 :: 		Label8.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Label8+4)
MOVT	R0, #hi_addr(_Label8+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,905 :: 		Label8.Left            = 72;
MOVS	R1, #72
MOVW	R0, #lo_addr(_Label8+6)
MOVT	R0, #hi_addr(_Label8+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,906 :: 		Label8.Top             = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label8+8)
MOVT	R0, #hi_addr(_Label8+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,907 :: 		Label8.Width           = 98;
MOVS	R1, #98
MOVW	R0, #lo_addr(_Label8+10)
MOVT	R0, #hi_addr(_Label8+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,908 :: 		Label8.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label8+12)
MOVT	R0, #hi_addr(_Label8+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,909 :: 		Label8.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label8+26)
MOVT	R0, #hi_addr(_Label8+26)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,910 :: 		Label8.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label8+27)
MOVT	R0, #hi_addr(_Label8+27)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,911 :: 		Label8.Caption         = Label8_Caption;
MOVW	R1, #lo_addr(_Label8_Caption+0)
MOVT	R1, #hi_addr(_Label8_Caption+0)
MOVW	R0, #lo_addr(_Label8+16)
MOVT	R0, #hi_addr(_Label8+16)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,912 :: 		Label8.FontName        = Tahoma11x13_Regular;
MOVW	R1, #15618
MOVW	R0, #lo_addr(_Label8+20)
MOVT	R0, #hi_addr(_Label8+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,913 :: 		Label8.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label8+24)
MOVT	R0, #hi_addr(_Label8+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,914 :: 		Label8.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label8+28)
MOVT	R0, #hi_addr(_Label8+28)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,915 :: 		Label8.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label8+32)
MOVT	R0, #hi_addr(_Label8+32)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,916 :: 		Label8.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label8+36)
MOVT	R0, #hi_addr(_Label8+36)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,917 :: 		Label8.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label8+40)
MOVT	R0, #hi_addr(_Label8+40)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,919 :: 		Label9.OwnerScreen     = &Screen6;
MOVW	R1, #lo_addr(_Screen6+0)
MOVT	R1, #hi_addr(_Screen6+0)
MOVW	R0, #lo_addr(_Label9+0)
MOVT	R0, #hi_addr(_Label9+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,920 :: 		Label9.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label9+4)
MOVT	R0, #hi_addr(_Label9+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,921 :: 		Label9.Left            = 35;
MOVS	R1, #35
MOVW	R0, #lo_addr(_Label9+6)
MOVT	R0, #hi_addr(_Label9+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,922 :: 		Label9.Top             = 63;
MOVS	R1, #63
MOVW	R0, #lo_addr(_Label9+8)
MOVT	R0, #hi_addr(_Label9+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,923 :: 		Label9.Width           = 181;
MOVS	R1, #181
MOVW	R0, #lo_addr(_Label9+10)
MOVT	R0, #hi_addr(_Label9+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,924 :: 		Label9.Height          = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_Label9+12)
MOVT	R0, #hi_addr(_Label9+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,925 :: 		Label9.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label9+26)
MOVT	R0, #hi_addr(_Label9+26)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,926 :: 		Label9.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label9+27)
MOVT	R0, #hi_addr(_Label9+27)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,927 :: 		Label9.Caption         = Label9_Caption;
MOVW	R1, #lo_addr(_Label9_Caption+0)
MOVT	R1, #hi_addr(_Label9_Caption+0)
MOVW	R0, #lo_addr(_Label9+16)
MOVT	R0, #hi_addr(_Label9+16)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,928 :: 		Label9.FontName        = Tahoma25x25_Bold;
MOVW	R1, #10651
MOVW	R0, #lo_addr(_Label9+20)
MOVT	R0, #hi_addr(_Label9+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,929 :: 		Label9.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label9+24)
MOVT	R0, #hi_addr(_Label9+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,930 :: 		Label9.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label9+28)
MOVT	R0, #hi_addr(_Label9+28)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,931 :: 		Label9.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label9+32)
MOVT	R0, #hi_addr(_Label9+32)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,932 :: 		Label9.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label9+36)
MOVT	R0, #hi_addr(_Label9+36)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,933 :: 		Label9.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label9+40)
MOVT	R0, #hi_addr(_Label9+40)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,935 :: 		CircleButton3.OwnerScreen     = &Screen6;
MOVW	R1, #lo_addr(_Screen6+0)
MOVT	R1, #hi_addr(_Screen6+0)
MOVW	R0, #lo_addr(_CircleButton3+0)
MOVT	R0, #hi_addr(_CircleButton3+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,936 :: 		CircleButton3.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton3+4)
MOVT	R0, #hi_addr(_CircleButton3+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,937 :: 		CircleButton3.Left            = 78;
MOVS	R1, #78
MOVW	R0, #lo_addr(_CircleButton3+6)
MOVT	R0, #hi_addr(_CircleButton3+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,938 :: 		CircleButton3.Top             = 128;
MOVS	R1, #128
MOVW	R0, #lo_addr(_CircleButton3+8)
MOVT	R0, #hi_addr(_CircleButton3+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,939 :: 		CircleButton3.Radius          = 38;
MOVS	R1, #38
MOVW	R0, #lo_addr(_CircleButton3+10)
MOVT	R0, #hi_addr(_CircleButton3+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,940 :: 		CircleButton3.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton3+12)
MOVT	R0, #hi_addr(_CircleButton3+12)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,941 :: 		CircleButton3.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton3+14)
MOVT	R0, #hi_addr(_CircleButton3+14)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,942 :: 		CircleButton3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton3+16)
MOVT	R0, #hi_addr(_CircleButton3+16)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,943 :: 		CircleButton3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton3+17)
MOVT	R0, #hi_addr(_CircleButton3+17)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,944 :: 		CircleButton3.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton3+18)
MOVT	R0, #hi_addr(_CircleButton3+18)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,945 :: 		CircleButton3.Caption         = CircleButton3_Caption;
MOVW	R1, #lo_addr(_CircleButton3_Caption+0)
MOVT	R1, #hi_addr(_CircleButton3_Caption+0)
MOVW	R0, #lo_addr(_CircleButton3+20)
MOVT	R0, #hi_addr(_CircleButton3+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,946 :: 		CircleButton3.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton3+24)
MOVT	R0, #hi_addr(_CircleButton3+24)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,947 :: 		CircleButton3.FontName        = Tahoma11x13_Regular;
MOVW	R1, #15618
MOVW	R0, #lo_addr(_CircleButton3+28)
MOVT	R0, #hi_addr(_CircleButton3+28)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,948 :: 		CircleButton3.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton3+42)
MOVT	R0, #hi_addr(_CircleButton3+42)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,949 :: 		CircleButton3.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton3+32)
MOVT	R0, #hi_addr(_CircleButton3+32)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,950 :: 		CircleButton3.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton3+34)
MOVT	R0, #hi_addr(_CircleButton3+34)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,951 :: 		CircleButton3.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton3+35)
MOVT	R0, #hi_addr(_CircleButton3+35)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,952 :: 		CircleButton3.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_CircleButton3+36)
MOVT	R0, #hi_addr(_CircleButton3+36)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,953 :: 		CircleButton3.Gradient_End_Color = 0x07FF;
MOVW	R1, #2047
MOVW	R0, #lo_addr(_CircleButton3+38)
MOVT	R0, #hi_addr(_CircleButton3+38)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,954 :: 		CircleButton3.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CircleButton3+40)
MOVT	R0, #hi_addr(_CircleButton3+40)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,955 :: 		CircleButton3.Press_Color     = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_CircleButton3+44)
MOVT	R0, #hi_addr(_CircleButton3+44)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,956 :: 		CircleButton3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton3+48)
MOVT	R0, #hi_addr(_CircleButton3+48)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,957 :: 		CircleButton3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton3+52)
MOVT	R0, #hi_addr(_CircleButton3+52)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,958 :: 		CircleButton3.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton3+56)
MOVT	R0, #hi_addr(_CircleButton3+56)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,959 :: 		CircleButton3.OnPressPtr      = DCVA_TRAINING;
MOVW	R1, #lo_addr(_DCVA_TRAINING+0)
MOVT	R1, #hi_addr(_DCVA_TRAINING+0)
MOVW	R0, #lo_addr(_CircleButton3+60)
MOVT	R0, #hi_addr(_CircleButton3+60)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,961 :: 		ProgressBar1.OwnerScreen     = &Screen7;
MOVW	R1, #lo_addr(_Screen7+0)
MOVT	R1, #hi_addr(_Screen7+0)
MOVW	R0, #lo_addr(_ProgressBar1+0)
MOVT	R0, #hi_addr(_ProgressBar1+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,962 :: 		ProgressBar1.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar1+4)
MOVT	R0, #hi_addr(_ProgressBar1+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,963 :: 		ProgressBar1.Left            = 72;
MOVS	R1, #72
MOVW	R0, #lo_addr(_ProgressBar1+6)
MOVT	R0, #hi_addr(_ProgressBar1+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,964 :: 		ProgressBar1.Top             = 256;
MOVW	R1, #256
MOVW	R0, #lo_addr(_ProgressBar1+8)
MOVT	R0, #hi_addr(_ProgressBar1+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,965 :: 		ProgressBar1.Width           = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_ProgressBar1+10)
MOVT	R0, #hi_addr(_ProgressBar1+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,966 :: 		ProgressBar1.Height          = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_ProgressBar1+12)
MOVT	R0, #hi_addr(_ProgressBar1+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,967 :: 		ProgressBar1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar1+14)
MOVT	R0, #hi_addr(_ProgressBar1+14)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,968 :: 		ProgressBar1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar1+16)
MOVT	R0, #hi_addr(_ProgressBar1+16)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,969 :: 		ProgressBar1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar1+18)
MOVT	R0, #hi_addr(_ProgressBar1+18)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,970 :: 		ProgressBar1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar1+19)
MOVT	R0, #hi_addr(_ProgressBar1+19)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,971 :: 		ProgressBar1.Caption         = ProgressBar1_Caption;
MOVW	R1, #lo_addr(_ProgressBar1_Caption+0)
MOVT	R1, #hi_addr(_ProgressBar1_Caption+0)
MOVW	R0, #lo_addr(_ProgressBar1+20)
MOVT	R0, #hi_addr(_ProgressBar1+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,972 :: 		ProgressBar1.FontName        = Tahoma11x13_Regular;
MOVW	R1, #15618
MOVW	R0, #lo_addr(_ProgressBar1+24)
MOVT	R0, #hi_addr(_ProgressBar1+24)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,973 :: 		ProgressBar1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar1+28)
MOVT	R0, #hi_addr(_ProgressBar1+28)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,974 :: 		ProgressBar1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar1+30)
MOVT	R0, #hi_addr(_ProgressBar1+30)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,975 :: 		ProgressBar1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar1+31)
MOVT	R0, #hi_addr(_ProgressBar1+31)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,976 :: 		ProgressBar1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ProgressBar1+32)
MOVT	R0, #hi_addr(_ProgressBar1+32)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,977 :: 		ProgressBar1.Gradient_End_Color = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ProgressBar1+34)
MOVT	R0, #hi_addr(_ProgressBar1+34)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,978 :: 		ProgressBar1.Color           = 0xA65E;
MOVW	R1, #42590
MOVW	R0, #lo_addr(_ProgressBar1+36)
MOVT	R0, #hi_addr(_ProgressBar1+36)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,979 :: 		ProgressBar1.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_ProgressBar1+38)
MOVT	R0, #hi_addr(_ProgressBar1+38)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,980 :: 		ProgressBar1.Min             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar1+40)
MOVT	R0, #hi_addr(_ProgressBar1+40)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,981 :: 		ProgressBar1.Max             = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_ProgressBar1+42)
MOVT	R0, #hi_addr(_ProgressBar1+42)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,982 :: 		ProgressBar1.Position        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,983 :: 		ProgressBar1.Show_Position   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar1+46)
MOVT	R0, #hi_addr(_ProgressBar1+46)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,984 :: 		ProgressBar1.Show_Percentage = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar1+47)
MOVT	R0, #hi_addr(_ProgressBar1+47)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,985 :: 		ProgressBar1.Smooth          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar1+48)
MOVT	R0, #hi_addr(_ProgressBar1+48)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,986 :: 		ProgressBar1.Rounded         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar1+49)
MOVT	R0, #hi_addr(_ProgressBar1+49)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,987 :: 		ProgressBar1.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ProgressBar1+50)
MOVT	R0, #hi_addr(_ProgressBar1+50)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,989 :: 		Label10.OwnerScreen     = &Screen7;
MOVW	R1, #lo_addr(_Screen7+0)
MOVT	R1, #hi_addr(_Screen7+0)
MOVW	R0, #lo_addr(_Label10+0)
MOVT	R0, #hi_addr(_Label10+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,990 :: 		Label10.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label10+4)
MOVT	R0, #hi_addr(_Label10+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,991 :: 		Label10.Left            = 62;
MOVS	R1, #62
MOVW	R0, #lo_addr(_Label10+6)
MOVT	R0, #hi_addr(_Label10+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,992 :: 		Label10.Top             = 234;
MOVS	R1, #234
MOVW	R0, #lo_addr(_Label10+8)
MOVT	R0, #hi_addr(_Label10+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,993 :: 		Label10.Width           = 126;
MOVS	R1, #126
MOVW	R0, #lo_addr(_Label10+10)
MOVT	R0, #hi_addr(_Label10+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,994 :: 		Label10.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label10+12)
MOVT	R0, #hi_addr(_Label10+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,995 :: 		Label10.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label10+26)
MOVT	R0, #hi_addr(_Label10+26)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,996 :: 		Label10.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label10+27)
MOVT	R0, #hi_addr(_Label10+27)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,997 :: 		Label10.Caption         = Label10_Caption;
MOVW	R1, #lo_addr(_Label10_Caption+0)
MOVT	R1, #hi_addr(_Label10_Caption+0)
MOVW	R0, #lo_addr(_Label10+16)
MOVT	R0, #hi_addr(_Label10+16)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,998 :: 		Label10.FontName        = Arial13x16_Bold;
MOVW	R1, #258
MOVW	R0, #lo_addr(_Label10+20)
MOVT	R0, #hi_addr(_Label10+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,999 :: 		Label10.Font_Color      = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label10+24)
MOVT	R0, #hi_addr(_Label10+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1000 :: 		Label10.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+28)
MOVT	R0, #hi_addr(_Label10+28)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1001 :: 		Label10.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+32)
MOVT	R0, #hi_addr(_Label10+32)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1002 :: 		Label10.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+36)
MOVT	R0, #hi_addr(_Label10+36)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1003 :: 		Label10.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+40)
MOVT	R0, #hi_addr(_Label10+40)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1005 :: 		Label11.OwnerScreen     = &Screen7;
MOVW	R1, #lo_addr(_Screen7+0)
MOVT	R1, #hi_addr(_Screen7+0)
MOVW	R0, #lo_addr(_Label11+0)
MOVT	R0, #hi_addr(_Label11+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1006 :: 		Label11.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label11+4)
MOVT	R0, #hi_addr(_Label11+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1007 :: 		Label11.Left            = 87;
MOVS	R1, #87
MOVW	R0, #lo_addr(_Label11+6)
MOVT	R0, #hi_addr(_Label11+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1008 :: 		Label11.Top             = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Label11+8)
MOVT	R0, #hi_addr(_Label11+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1009 :: 		Label11.Width           = 62;
MOVS	R1, #62
MOVW	R0, #lo_addr(_Label11+10)
MOVT	R0, #hi_addr(_Label11+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1010 :: 		Label11.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label11+12)
MOVT	R0, #hi_addr(_Label11+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1011 :: 		Label11.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label11+26)
MOVT	R0, #hi_addr(_Label11+26)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1012 :: 		Label11.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label11+27)
MOVT	R0, #hi_addr(_Label11+27)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1013 :: 		Label11.Caption         = Label11_Caption;
MOVW	R1, #lo_addr(_Label11_Caption+0)
MOVT	R1, #hi_addr(_Label11_Caption+0)
MOVW	R0, #lo_addr(_Label11+16)
MOVT	R0, #hi_addr(_Label11+16)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1014 :: 		Label11.FontName        = Arial13x16_Bold;
MOVW	R1, #258
MOVW	R0, #lo_addr(_Label11+20)
MOVT	R0, #hi_addr(_Label11+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1015 :: 		Label11.Font_Color      = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label11+24)
MOVT	R0, #hi_addr(_Label11+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1016 :: 		Label11.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label11+28)
MOVT	R0, #hi_addr(_Label11+28)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1017 :: 		Label11.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label11+32)
MOVT	R0, #hi_addr(_Label11+32)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1018 :: 		Label11.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label11+36)
MOVT	R0, #hi_addr(_Label11+36)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1019 :: 		Label11.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label11+40)
MOVT	R0, #hi_addr(_Label11+40)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1021 :: 		Diagram8_Box6.OwnerScreen     = &Screen8;
MOVW	R1, #lo_addr(_Screen8+0)
MOVT	R1, #hi_addr(_Screen8+0)
MOVW	R0, #lo_addr(_Diagram8_Box6+0)
MOVT	R0, #hi_addr(_Diagram8_Box6+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1022 :: 		Diagram8_Box6.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box6+4)
MOVT	R0, #hi_addr(_Diagram8_Box6+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1023 :: 		Diagram8_Box6.Left            = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Diagram8_Box6+6)
MOVT	R0, #hi_addr(_Diagram8_Box6+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1024 :: 		Diagram8_Box6.Top             = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Diagram8_Box6+8)
MOVT	R0, #hi_addr(_Diagram8_Box6+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1025 :: 		Diagram8_Box6.Width           = 60;
MOVS	R1, #60
MOVW	R0, #lo_addr(_Diagram8_Box6+10)
MOVT	R0, #hi_addr(_Diagram8_Box6+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1026 :: 		Diagram8_Box6.Height          = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Diagram8_Box6+12)
MOVT	R0, #hi_addr(_Diagram8_Box6+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1027 :: 		Diagram8_Box6.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box6+14)
MOVT	R0, #hi_addr(_Diagram8_Box6+14)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1028 :: 		Diagram8_Box6.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box6+16)
MOVT	R0, #hi_addr(_Diagram8_Box6+16)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1029 :: 		Diagram8_Box6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box6+18)
MOVT	R0, #hi_addr(_Diagram8_Box6+18)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1030 :: 		Diagram8_Box6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box6+19)
MOVT	R0, #hi_addr(_Diagram8_Box6+19)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1031 :: 		Diagram8_Box6.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box6+20)
MOVT	R0, #hi_addr(_Diagram8_Box6+20)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1032 :: 		Diagram8_Box6.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box6+21)
MOVT	R0, #hi_addr(_Diagram8_Box6+21)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1033 :: 		Diagram8_Box6.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box6+22)
MOVT	R0, #hi_addr(_Diagram8_Box6+22)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1034 :: 		Diagram8_Box6.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Diagram8_Box6+24)
MOVT	R0, #hi_addr(_Diagram8_Box6+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1035 :: 		Diagram8_Box6.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Diagram8_Box6+26)
MOVT	R0, #hi_addr(_Diagram8_Box6+26)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1036 :: 		Diagram8_Box6.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Diagram8_Box6+28)
MOVT	R0, #hi_addr(_Diagram8_Box6+28)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1037 :: 		Diagram8_Box6.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box6+30)
MOVT	R0, #hi_addr(_Diagram8_Box6+30)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1038 :: 		Diagram8_Box6.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Diagram8_Box6+32)
MOVT	R0, #hi_addr(_Diagram8_Box6+32)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1039 :: 		Diagram8_Box6.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box6+36)
MOVT	R0, #hi_addr(_Diagram8_Box6+36)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1040 :: 		Diagram8_Box6.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box6+40)
MOVT	R0, #hi_addr(_Diagram8_Box6+40)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1041 :: 		Diagram8_Box6.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box6+44)
MOVT	R0, #hi_addr(_Diagram8_Box6+44)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1042 :: 		Diagram8_Box6.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box6+48)
MOVT	R0, #hi_addr(_Diagram8_Box6+48)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1044 :: 		Diagram8_Box5.OwnerScreen     = &Screen8;
MOVW	R1, #lo_addr(_Screen8+0)
MOVT	R1, #hi_addr(_Screen8+0)
MOVW	R0, #lo_addr(_Diagram8_Box5+0)
MOVT	R0, #hi_addr(_Diagram8_Box5+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1045 :: 		Diagram8_Box5.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box5+4)
MOVT	R0, #hi_addr(_Diagram8_Box5+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1046 :: 		Diagram8_Box5.Left            = 190;
MOVS	R1, #190
MOVW	R0, #lo_addr(_Diagram8_Box5+6)
MOVT	R0, #hi_addr(_Diagram8_Box5+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1047 :: 		Diagram8_Box5.Top             = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Diagram8_Box5+8)
MOVT	R0, #hi_addr(_Diagram8_Box5+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1048 :: 		Diagram8_Box5.Width           = 60;
MOVS	R1, #60
MOVW	R0, #lo_addr(_Diagram8_Box5+10)
MOVT	R0, #hi_addr(_Diagram8_Box5+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1049 :: 		Diagram8_Box5.Height          = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Diagram8_Box5+12)
MOVT	R0, #hi_addr(_Diagram8_Box5+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1050 :: 		Diagram8_Box5.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box5+14)
MOVT	R0, #hi_addr(_Diagram8_Box5+14)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1051 :: 		Diagram8_Box5.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box5+16)
MOVT	R0, #hi_addr(_Diagram8_Box5+16)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1052 :: 		Diagram8_Box5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box5+18)
MOVT	R0, #hi_addr(_Diagram8_Box5+18)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1053 :: 		Diagram8_Box5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box5+19)
MOVT	R0, #hi_addr(_Diagram8_Box5+19)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1054 :: 		Diagram8_Box5.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box5+20)
MOVT	R0, #hi_addr(_Diagram8_Box5+20)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1055 :: 		Diagram8_Box5.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box5+21)
MOVT	R0, #hi_addr(_Diagram8_Box5+21)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1056 :: 		Diagram8_Box5.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box5+22)
MOVT	R0, #hi_addr(_Diagram8_Box5+22)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1057 :: 		Diagram8_Box5.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Diagram8_Box5+24)
MOVT	R0, #hi_addr(_Diagram8_Box5+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1058 :: 		Diagram8_Box5.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Diagram8_Box5+26)
MOVT	R0, #hi_addr(_Diagram8_Box5+26)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1059 :: 		Diagram8_Box5.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Diagram8_Box5+28)
MOVT	R0, #hi_addr(_Diagram8_Box5+28)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1060 :: 		Diagram8_Box5.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box5+30)
MOVT	R0, #hi_addr(_Diagram8_Box5+30)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1061 :: 		Diagram8_Box5.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Diagram8_Box5+32)
MOVT	R0, #hi_addr(_Diagram8_Box5+32)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1062 :: 		Diagram8_Box5.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box5+36)
MOVT	R0, #hi_addr(_Diagram8_Box5+36)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1063 :: 		Diagram8_Box5.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box5+40)
MOVT	R0, #hi_addr(_Diagram8_Box5+40)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1064 :: 		Diagram8_Box5.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box5+44)
MOVT	R0, #hi_addr(_Diagram8_Box5+44)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1065 :: 		Diagram8_Box5.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box5+48)
MOVT	R0, #hi_addr(_Diagram8_Box5+48)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1067 :: 		Diagram8_Box4.OwnerScreen     = &Screen8;
MOVW	R1, #lo_addr(_Screen8+0)
MOVT	R1, #hi_addr(_Screen8+0)
MOVW	R0, #lo_addr(_Diagram8_Box4+0)
MOVT	R0, #hi_addr(_Diagram8_Box4+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1068 :: 		Diagram8_Box4.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Diagram8_Box4+4)
MOVT	R0, #hi_addr(_Diagram8_Box4+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1069 :: 		Diagram8_Box4.Left            = 130;
MOVS	R1, #130
MOVW	R0, #lo_addr(_Diagram8_Box4+6)
MOVT	R0, #hi_addr(_Diagram8_Box4+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1070 :: 		Diagram8_Box4.Top             = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Diagram8_Box4+8)
MOVT	R0, #hi_addr(_Diagram8_Box4+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1071 :: 		Diagram8_Box4.Width           = 60;
MOVS	R1, #60
MOVW	R0, #lo_addr(_Diagram8_Box4+10)
MOVT	R0, #hi_addr(_Diagram8_Box4+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1072 :: 		Diagram8_Box4.Height          = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Diagram8_Box4+12)
MOVT	R0, #hi_addr(_Diagram8_Box4+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1073 :: 		Diagram8_Box4.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box4+14)
MOVT	R0, #hi_addr(_Diagram8_Box4+14)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1074 :: 		Diagram8_Box4.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box4+16)
MOVT	R0, #hi_addr(_Diagram8_Box4+16)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1075 :: 		Diagram8_Box4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box4+18)
MOVT	R0, #hi_addr(_Diagram8_Box4+18)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1076 :: 		Diagram8_Box4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box4+19)
MOVT	R0, #hi_addr(_Diagram8_Box4+19)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1077 :: 		Diagram8_Box4.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box4+20)
MOVT	R0, #hi_addr(_Diagram8_Box4+20)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1078 :: 		Diagram8_Box4.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box4+21)
MOVT	R0, #hi_addr(_Diagram8_Box4+21)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1079 :: 		Diagram8_Box4.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box4+22)
MOVT	R0, #hi_addr(_Diagram8_Box4+22)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1080 :: 		Diagram8_Box4.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Diagram8_Box4+24)
MOVT	R0, #hi_addr(_Diagram8_Box4+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1081 :: 		Diagram8_Box4.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Diagram8_Box4+26)
MOVT	R0, #hi_addr(_Diagram8_Box4+26)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1082 :: 		Diagram8_Box4.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Diagram8_Box4+28)
MOVT	R0, #hi_addr(_Diagram8_Box4+28)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1083 :: 		Diagram8_Box4.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box4+30)
MOVT	R0, #hi_addr(_Diagram8_Box4+30)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1084 :: 		Diagram8_Box4.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Diagram8_Box4+32)
MOVT	R0, #hi_addr(_Diagram8_Box4+32)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1085 :: 		Diagram8_Box4.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box4+36)
MOVT	R0, #hi_addr(_Diagram8_Box4+36)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1086 :: 		Diagram8_Box4.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box4+40)
MOVT	R0, #hi_addr(_Diagram8_Box4+40)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1087 :: 		Diagram8_Box4.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box4+44)
MOVT	R0, #hi_addr(_Diagram8_Box4+44)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1088 :: 		Diagram8_Box4.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box4+48)
MOVT	R0, #hi_addr(_Diagram8_Box4+48)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1090 :: 		Diagram8_Box3.OwnerScreen     = &Screen8;
MOVW	R1, #lo_addr(_Screen8+0)
MOVT	R1, #hi_addr(_Screen8+0)
MOVW	R0, #lo_addr(_Diagram8_Box3+0)
MOVT	R0, #hi_addr(_Diagram8_Box3+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1091 :: 		Diagram8_Box3.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Diagram8_Box3+4)
MOVT	R0, #hi_addr(_Diagram8_Box3+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1092 :: 		Diagram8_Box3.Left            = 70;
MOVS	R1, #70
MOVW	R0, #lo_addr(_Diagram8_Box3+6)
MOVT	R0, #hi_addr(_Diagram8_Box3+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1093 :: 		Diagram8_Box3.Top             = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Diagram8_Box3+8)
MOVT	R0, #hi_addr(_Diagram8_Box3+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1094 :: 		Diagram8_Box3.Width           = 60;
MOVS	R1, #60
MOVW	R0, #lo_addr(_Diagram8_Box3+10)
MOVT	R0, #hi_addr(_Diagram8_Box3+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1095 :: 		Diagram8_Box3.Height          = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Diagram8_Box3+12)
MOVT	R0, #hi_addr(_Diagram8_Box3+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1096 :: 		Diagram8_Box3.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box3+14)
MOVT	R0, #hi_addr(_Diagram8_Box3+14)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1097 :: 		Diagram8_Box3.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box3+16)
MOVT	R0, #hi_addr(_Diagram8_Box3+16)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1098 :: 		Diagram8_Box3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box3+18)
MOVT	R0, #hi_addr(_Diagram8_Box3+18)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1099 :: 		Diagram8_Box3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box3+19)
MOVT	R0, #hi_addr(_Diagram8_Box3+19)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1100 :: 		Diagram8_Box3.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box3+20)
MOVT	R0, #hi_addr(_Diagram8_Box3+20)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1101 :: 		Diagram8_Box3.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box3+21)
MOVT	R0, #hi_addr(_Diagram8_Box3+21)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1102 :: 		Diagram8_Box3.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box3+22)
MOVT	R0, #hi_addr(_Diagram8_Box3+22)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1103 :: 		Diagram8_Box3.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Diagram8_Box3+24)
MOVT	R0, #hi_addr(_Diagram8_Box3+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1104 :: 		Diagram8_Box3.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Diagram8_Box3+26)
MOVT	R0, #hi_addr(_Diagram8_Box3+26)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1105 :: 		Diagram8_Box3.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Diagram8_Box3+28)
MOVT	R0, #hi_addr(_Diagram8_Box3+28)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1106 :: 		Diagram8_Box3.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box3+30)
MOVT	R0, #hi_addr(_Diagram8_Box3+30)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1107 :: 		Diagram8_Box3.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Diagram8_Box3+32)
MOVT	R0, #hi_addr(_Diagram8_Box3+32)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1108 :: 		Diagram8_Box3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box3+36)
MOVT	R0, #hi_addr(_Diagram8_Box3+36)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1109 :: 		Diagram8_Box3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box3+40)
MOVT	R0, #hi_addr(_Diagram8_Box3+40)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1110 :: 		Diagram8_Box3.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box3+44)
MOVT	R0, #hi_addr(_Diagram8_Box3+44)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1111 :: 		Diagram8_Box3.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box3+48)
MOVT	R0, #hi_addr(_Diagram8_Box3+48)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1113 :: 		Diagram8_Box2.OwnerScreen     = &Screen8;
MOVW	R1, #lo_addr(_Screen8+0)
MOVT	R1, #hi_addr(_Screen8+0)
MOVW	R0, #lo_addr(_Diagram8_Box2+0)
MOVT	R0, #hi_addr(_Diagram8_Box2+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1114 :: 		Diagram8_Box2.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Diagram8_Box2+4)
MOVT	R0, #hi_addr(_Diagram8_Box2+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1115 :: 		Diagram8_Box2.Left            = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Diagram8_Box2+6)
MOVT	R0, #hi_addr(_Diagram8_Box2+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1116 :: 		Diagram8_Box2.Top             = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Diagram8_Box2+8)
MOVT	R0, #hi_addr(_Diagram8_Box2+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1117 :: 		Diagram8_Box2.Width           = 60;
MOVS	R1, #60
MOVW	R0, #lo_addr(_Diagram8_Box2+10)
MOVT	R0, #hi_addr(_Diagram8_Box2+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1118 :: 		Diagram8_Box2.Height          = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Diagram8_Box2+12)
MOVT	R0, #hi_addr(_Diagram8_Box2+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1119 :: 		Diagram8_Box2.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box2+14)
MOVT	R0, #hi_addr(_Diagram8_Box2+14)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1120 :: 		Diagram8_Box2.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box2+16)
MOVT	R0, #hi_addr(_Diagram8_Box2+16)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1121 :: 		Diagram8_Box2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box2+18)
MOVT	R0, #hi_addr(_Diagram8_Box2+18)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1122 :: 		Diagram8_Box2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box2+19)
MOVT	R0, #hi_addr(_Diagram8_Box2+19)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1123 :: 		Diagram8_Box2.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box2+20)
MOVT	R0, #hi_addr(_Diagram8_Box2+20)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1124 :: 		Diagram8_Box2.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box2+21)
MOVT	R0, #hi_addr(_Diagram8_Box2+21)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1125 :: 		Diagram8_Box2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box2+22)
MOVT	R0, #hi_addr(_Diagram8_Box2+22)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1126 :: 		Diagram8_Box2.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Diagram8_Box2+24)
MOVT	R0, #hi_addr(_Diagram8_Box2+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1127 :: 		Diagram8_Box2.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Diagram8_Box2+26)
MOVT	R0, #hi_addr(_Diagram8_Box2+26)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1128 :: 		Diagram8_Box2.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Diagram8_Box2+28)
MOVT	R0, #hi_addr(_Diagram8_Box2+28)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1129 :: 		Diagram8_Box2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box2+30)
MOVT	R0, #hi_addr(_Diagram8_Box2+30)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1130 :: 		Diagram8_Box2.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Diagram8_Box2+32)
MOVT	R0, #hi_addr(_Diagram8_Box2+32)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1131 :: 		Diagram8_Box2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box2+36)
MOVT	R0, #hi_addr(_Diagram8_Box2+36)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1132 :: 		Diagram8_Box2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box2+40)
MOVT	R0, #hi_addr(_Diagram8_Box2+40)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1133 :: 		Diagram8_Box2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box2+44)
MOVT	R0, #hi_addr(_Diagram8_Box2+44)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1134 :: 		Diagram8_Box2.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box2+48)
MOVT	R0, #hi_addr(_Diagram8_Box2+48)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1136 :: 		Diagram8_S2L2.OwnerScreen     = &Screen8;
MOVW	R1, #lo_addr(_Screen8+0)
MOVT	R1, #hi_addr(_Screen8+0)
MOVW	R0, #lo_addr(_Diagram8_S2L2+0)
MOVT	R0, #hi_addr(_Diagram8_S2L2+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1137 :: 		Diagram8_S2L2.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Diagram8_S2L2+4)
MOVT	R0, #hi_addr(_Diagram8_S2L2+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1138 :: 		Diagram8_S2L2.Left            = 137;
MOVS	R1, #137
MOVW	R0, #lo_addr(_Diagram8_S2L2+6)
MOVT	R0, #hi_addr(_Diagram8_S2L2+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1139 :: 		Diagram8_S2L2.Top             = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Diagram8_S2L2+8)
MOVT	R0, #hi_addr(_Diagram8_S2L2+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1140 :: 		Diagram8_S2L2.Width           = 46;
MOVS	R1, #46
MOVW	R0, #lo_addr(_Diagram8_S2L2+10)
MOVT	R0, #hi_addr(_Diagram8_S2L2+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1141 :: 		Diagram8_S2L2.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Diagram8_S2L2+12)
MOVT	R0, #hi_addr(_Diagram8_S2L2+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1142 :: 		Diagram8_S2L2.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_S2L2+26)
MOVT	R0, #hi_addr(_Diagram8_S2L2+26)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1143 :: 		Diagram8_S2L2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_S2L2+27)
MOVT	R0, #hi_addr(_Diagram8_S2L2+27)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1144 :: 		Diagram8_S2L2.Caption         = Diagram8_S2L2_Caption;
MOVW	R1, #lo_addr(_Diagram8_S2L2_Caption+0)
MOVT	R1, #hi_addr(_Diagram8_S2L2_Caption+0)
MOVW	R0, #lo_addr(_Diagram8_S2L2+16)
MOVT	R0, #hi_addr(_Diagram8_S2L2+16)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1145 :: 		Diagram8_S2L2.FontName        = Tahoma13x13_Bold;
MOVW	R1, #17297
MOVW	R0, #lo_addr(_Diagram8_S2L2+20)
MOVT	R0, #hi_addr(_Diagram8_S2L2+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1146 :: 		Diagram8_S2L2.Font_Color      = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Diagram8_S2L2+24)
MOVT	R0, #hi_addr(_Diagram8_S2L2+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1147 :: 		Diagram8_S2L2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_S2L2+28)
MOVT	R0, #hi_addr(_Diagram8_S2L2+28)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1148 :: 		Diagram8_S2L2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_S2L2+32)
MOVT	R0, #hi_addr(_Diagram8_S2L2+32)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1149 :: 		Diagram8_S2L2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_S2L2+36)
MOVT	R0, #hi_addr(_Diagram8_S2L2+36)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1150 :: 		Diagram8_S2L2.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_S2L2+40)
MOVT	R0, #hi_addr(_Diagram8_S2L2+40)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1152 :: 		Diagram8_Box1.OwnerScreen     = &Screen8;
MOVW	R1, #lo_addr(_Screen8+0)
MOVT	R1, #hi_addr(_Screen8+0)
MOVW	R0, #lo_addr(_Diagram8_Box1+0)
MOVT	R0, #hi_addr(_Diagram8_Box1+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1153 :: 		Diagram8_Box1.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Diagram8_Box1+4)
MOVT	R0, #hi_addr(_Diagram8_Box1+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1154 :: 		Diagram8_Box1.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box1+6)
MOVT	R0, #hi_addr(_Diagram8_Box1+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1155 :: 		Diagram8_Box1.Top             = 120;
MOVS	R1, #120
MOVW	R0, #lo_addr(_Diagram8_Box1+8)
MOVT	R0, #hi_addr(_Diagram8_Box1+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1156 :: 		Diagram8_Box1.Width           = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Diagram8_Box1+10)
MOVT	R0, #hi_addr(_Diagram8_Box1+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1157 :: 		Diagram8_Box1.Height          = 120;
MOVS	R1, #120
MOVW	R0, #lo_addr(_Diagram8_Box1+12)
MOVT	R0, #hi_addr(_Diagram8_Box1+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1158 :: 		Diagram8_Box1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box1+14)
MOVT	R0, #hi_addr(_Diagram8_Box1+14)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1159 :: 		Diagram8_Box1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box1+16)
MOVT	R0, #hi_addr(_Diagram8_Box1+16)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1160 :: 		Diagram8_Box1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box1+18)
MOVT	R0, #hi_addr(_Diagram8_Box1+18)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1161 :: 		Diagram8_Box1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box1+19)
MOVT	R0, #hi_addr(_Diagram8_Box1+19)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1162 :: 		Diagram8_Box1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box1+20)
MOVT	R0, #hi_addr(_Diagram8_Box1+20)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1163 :: 		Diagram8_Box1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box1+21)
MOVT	R0, #hi_addr(_Diagram8_Box1+21)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1164 :: 		Diagram8_Box1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box1+22)
MOVT	R0, #hi_addr(_Diagram8_Box1+22)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1165 :: 		Diagram8_Box1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Diagram8_Box1+24)
MOVT	R0, #hi_addr(_Diagram8_Box1+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1166 :: 		Diagram8_Box1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Diagram8_Box1+26)
MOVT	R0, #hi_addr(_Diagram8_Box1+26)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1167 :: 		Diagram8_Box1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Diagram8_Box1+28)
MOVT	R0, #hi_addr(_Diagram8_Box1+28)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1168 :: 		Diagram8_Box1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_Box1+30)
MOVT	R0, #hi_addr(_Diagram8_Box1+30)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1169 :: 		Diagram8_Box1.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Diagram8_Box1+32)
MOVT	R0, #hi_addr(_Diagram8_Box1+32)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1170 :: 		Diagram8_Box1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box1+36)
MOVT	R0, #hi_addr(_Diagram8_Box1+36)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1171 :: 		Diagram8_Box1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box1+40)
MOVT	R0, #hi_addr(_Diagram8_Box1+40)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1172 :: 		Diagram8_Box1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box1+44)
MOVT	R0, #hi_addr(_Diagram8_Box1+44)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1173 :: 		Diagram8_Box1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_Box1+48)
MOVT	R0, #hi_addr(_Diagram8_Box1+48)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1175 :: 		Diagram8_S2L4.OwnerScreen     = &Screen8;
MOVW	R1, #lo_addr(_Screen8+0)
MOVT	R1, #hi_addr(_Screen8+0)
MOVW	R0, #lo_addr(_Diagram8_S2L4+0)
MOVT	R0, #hi_addr(_Diagram8_S2L4+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1176 :: 		Diagram8_S2L4.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Diagram8_S2L4+4)
MOVT	R0, #hi_addr(_Diagram8_S2L4+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1177 :: 		Diagram8_S2L4.Left            = 35;
MOVS	R1, #35
MOVW	R0, #lo_addr(_Diagram8_S2L4+6)
MOVT	R0, #hi_addr(_Diagram8_S2L4+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1178 :: 		Diagram8_S2L4.Top             = 105;
MOVS	R1, #105
MOVW	R0, #lo_addr(_Diagram8_S2L4+8)
MOVT	R0, #hi_addr(_Diagram8_S2L4+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1179 :: 		Diagram8_S2L4.Width           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Diagram8_S2L4+10)
MOVT	R0, #hi_addr(_Diagram8_S2L4+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1180 :: 		Diagram8_S2L4.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Diagram8_S2L4+12)
MOVT	R0, #hi_addr(_Diagram8_S2L4+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1181 :: 		Diagram8_S2L4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_S2L4+26)
MOVT	R0, #hi_addr(_Diagram8_S2L4+26)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1182 :: 		Diagram8_S2L4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_S2L4+27)
MOVT	R0, #hi_addr(_Diagram8_S2L4+27)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1183 :: 		Diagram8_S2L4.Caption         = Diagram8_S2L4_Caption;
MOVW	R1, #lo_addr(_Diagram8_S2L4_Caption+0)
MOVT	R1, #hi_addr(_Diagram8_S2L4_Caption+0)
MOVW	R0, #lo_addr(_Diagram8_S2L4+16)
MOVT	R0, #hi_addr(_Diagram8_S2L4+16)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1184 :: 		Diagram8_S2L4.FontName        = Tahoma13x13_Bold;
MOVW	R1, #17297
MOVW	R0, #lo_addr(_Diagram8_S2L4+20)
MOVT	R0, #hi_addr(_Diagram8_S2L4+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1185 :: 		Diagram8_S2L4.Font_Color      = 0xFC00;
MOVW	R1, #64512
MOVW	R0, #lo_addr(_Diagram8_S2L4+24)
MOVT	R0, #hi_addr(_Diagram8_S2L4+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1186 :: 		Diagram8_S2L4.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_S2L4+28)
MOVT	R0, #hi_addr(_Diagram8_S2L4+28)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1187 :: 		Diagram8_S2L4.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_S2L4+32)
MOVT	R0, #hi_addr(_Diagram8_S2L4+32)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1188 :: 		Diagram8_S2L4.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_S2L4+36)
MOVT	R0, #hi_addr(_Diagram8_S2L4+36)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1189 :: 		Diagram8_S2L4.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_S2L4+40)
MOVT	R0, #hi_addr(_Diagram8_S2L4+40)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1191 :: 		Diagram8_S2L5.OwnerScreen     = &Screen8;
MOVW	R1, #lo_addr(_Screen8+0)
MOVT	R1, #hi_addr(_Screen8+0)
MOVW	R0, #lo_addr(_Diagram8_S2L5+0)
MOVT	R0, #hi_addr(_Diagram8_S2L5+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1192 :: 		Diagram8_S2L5.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Diagram8_S2L5+4)
MOVT	R0, #hi_addr(_Diagram8_S2L5+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1193 :: 		Diagram8_S2L5.Left            = 95;
MOVS	R1, #95
MOVW	R0, #lo_addr(_Diagram8_S2L5+6)
MOVT	R0, #hi_addr(_Diagram8_S2L5+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1194 :: 		Diagram8_S2L5.Top             = 105;
MOVS	R1, #105
MOVW	R0, #lo_addr(_Diagram8_S2L5+8)
MOVT	R0, #hi_addr(_Diagram8_S2L5+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1195 :: 		Diagram8_S2L5.Width           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Diagram8_S2L5+10)
MOVT	R0, #hi_addr(_Diagram8_S2L5+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1196 :: 		Diagram8_S2L5.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Diagram8_S2L5+12)
MOVT	R0, #hi_addr(_Diagram8_S2L5+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1197 :: 		Diagram8_S2L5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_S2L5+26)
MOVT	R0, #hi_addr(_Diagram8_S2L5+26)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1198 :: 		Diagram8_S2L5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_S2L5+27)
MOVT	R0, #hi_addr(_Diagram8_S2L5+27)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1199 :: 		Diagram8_S2L5.Caption         = Diagram8_S2L5_Caption;
MOVW	R1, #lo_addr(_Diagram8_S2L5_Caption+0)
MOVT	R1, #hi_addr(_Diagram8_S2L5_Caption+0)
MOVW	R0, #lo_addr(_Diagram8_S2L5+16)
MOVT	R0, #hi_addr(_Diagram8_S2L5+16)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1200 :: 		Diagram8_S2L5.FontName        = Tahoma13x13_Bold;
MOVW	R1, #17297
MOVW	R0, #lo_addr(_Diagram8_S2L5+20)
MOVT	R0, #hi_addr(_Diagram8_S2L5+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1201 :: 		Diagram8_S2L5.Font_Color      = 0x87E0;
MOVW	R1, #34784
MOVW	R0, #lo_addr(_Diagram8_S2L5+24)
MOVT	R0, #hi_addr(_Diagram8_S2L5+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1202 :: 		Diagram8_S2L5.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_S2L5+28)
MOVT	R0, #hi_addr(_Diagram8_S2L5+28)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1203 :: 		Diagram8_S2L5.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_S2L5+32)
MOVT	R0, #hi_addr(_Diagram8_S2L5+32)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1204 :: 		Diagram8_S2L5.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_S2L5+36)
MOVT	R0, #hi_addr(_Diagram8_S2L5+36)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1205 :: 		Diagram8_S2L5.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_S2L5+40)
MOVT	R0, #hi_addr(_Diagram8_S2L5+40)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1207 :: 		Diagram8_S2L6.OwnerScreen     = &Screen8;
MOVW	R1, #lo_addr(_Screen8+0)
MOVT	R1, #hi_addr(_Screen8+0)
MOVW	R0, #lo_addr(_Diagram8_S2L6+0)
MOVT	R0, #hi_addr(_Diagram8_S2L6+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1208 :: 		Diagram8_S2L6.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Diagram8_S2L6+4)
MOVT	R0, #hi_addr(_Diagram8_S2L6+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1209 :: 		Diagram8_S2L6.Left            = 155;
MOVS	R1, #155
MOVW	R0, #lo_addr(_Diagram8_S2L6+6)
MOVT	R0, #hi_addr(_Diagram8_S2L6+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1210 :: 		Diagram8_S2L6.Top             = 105;
MOVS	R1, #105
MOVW	R0, #lo_addr(_Diagram8_S2L6+8)
MOVT	R0, #hi_addr(_Diagram8_S2L6+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1211 :: 		Diagram8_S2L6.Width           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Diagram8_S2L6+10)
MOVT	R0, #hi_addr(_Diagram8_S2L6+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1212 :: 		Diagram8_S2L6.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Diagram8_S2L6+12)
MOVT	R0, #hi_addr(_Diagram8_S2L6+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1213 :: 		Diagram8_S2L6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_S2L6+26)
MOVT	R0, #hi_addr(_Diagram8_S2L6+26)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1214 :: 		Diagram8_S2L6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_S2L6+27)
MOVT	R0, #hi_addr(_Diagram8_S2L6+27)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1215 :: 		Diagram8_S2L6.Caption         = Diagram8_S2L6_Caption;
MOVW	R1, #lo_addr(_Diagram8_S2L6_Caption+0)
MOVT	R1, #hi_addr(_Diagram8_S2L6_Caption+0)
MOVW	R0, #lo_addr(_Diagram8_S2L6+16)
MOVT	R0, #hi_addr(_Diagram8_S2L6+16)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1216 :: 		Diagram8_S2L6.FontName        = Tahoma13x13_Bold;
MOVW	R1, #17297
MOVW	R0, #lo_addr(_Diagram8_S2L6+20)
MOVT	R0, #hi_addr(_Diagram8_S2L6+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1217 :: 		Diagram8_S2L6.Font_Color      = 0x8000;
MOVW	R1, #32768
MOVW	R0, #lo_addr(_Diagram8_S2L6+24)
MOVT	R0, #hi_addr(_Diagram8_S2L6+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1218 :: 		Diagram8_S2L6.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_S2L6+28)
MOVT	R0, #hi_addr(_Diagram8_S2L6+28)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1219 :: 		Diagram8_S2L6.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_S2L6+32)
MOVT	R0, #hi_addr(_Diagram8_S2L6+32)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1220 :: 		Diagram8_S2L6.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_S2L6+36)
MOVT	R0, #hi_addr(_Diagram8_S2L6+36)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1221 :: 		Diagram8_S2L6.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_S2L6+40)
MOVT	R0, #hi_addr(_Diagram8_S2L6+40)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1223 :: 		Diagram8_S2L7.OwnerScreen     = &Screen8;
MOVW	R1, #lo_addr(_Screen8+0)
MOVT	R1, #hi_addr(_Screen8+0)
MOVW	R0, #lo_addr(_Diagram8_S2L7+0)
MOVT	R0, #hi_addr(_Diagram8_S2L7+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1224 :: 		Diagram8_S2L7.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Diagram8_S2L7+4)
MOVT	R0, #hi_addr(_Diagram8_S2L7+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1225 :: 		Diagram8_S2L7.Left            = 215;
MOVS	R1, #215
MOVW	R0, #lo_addr(_Diagram8_S2L7+6)
MOVT	R0, #hi_addr(_Diagram8_S2L7+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1226 :: 		Diagram8_S2L7.Top             = 105;
MOVS	R1, #105
MOVW	R0, #lo_addr(_Diagram8_S2L7+8)
MOVT	R0, #hi_addr(_Diagram8_S2L7+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1227 :: 		Diagram8_S2L7.Width           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Diagram8_S2L7+10)
MOVT	R0, #hi_addr(_Diagram8_S2L7+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1228 :: 		Diagram8_S2L7.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Diagram8_S2L7+12)
MOVT	R0, #hi_addr(_Diagram8_S2L7+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1229 :: 		Diagram8_S2L7.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_S2L7+26)
MOVT	R0, #hi_addr(_Diagram8_S2L7+26)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1230 :: 		Diagram8_S2L7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_S2L7+27)
MOVT	R0, #hi_addr(_Diagram8_S2L7+27)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1231 :: 		Diagram8_S2L7.Caption         = Diagram8_S2L7_Caption;
MOVW	R1, #lo_addr(_Diagram8_S2L7_Caption+0)
MOVT	R1, #hi_addr(_Diagram8_S2L7_Caption+0)
MOVW	R0, #lo_addr(_Diagram8_S2L7+16)
MOVT	R0, #hi_addr(_Diagram8_S2L7+16)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1232 :: 		Diagram8_S2L7.FontName        = Tahoma13x13_Bold;
MOVW	R1, #17297
MOVW	R0, #lo_addr(_Diagram8_S2L7+20)
MOVT	R0, #hi_addr(_Diagram8_S2L7+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1233 :: 		Diagram8_S2L7.Font_Color      = 0x801F;
MOVW	R1, #32799
MOVW	R0, #lo_addr(_Diagram8_S2L7+24)
MOVT	R0, #hi_addr(_Diagram8_S2L7+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1234 :: 		Diagram8_S2L7.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_S2L7+28)
MOVT	R0, #hi_addr(_Diagram8_S2L7+28)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1235 :: 		Diagram8_S2L7.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_S2L7+32)
MOVT	R0, #hi_addr(_Diagram8_S2L7+32)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1236 :: 		Diagram8_S2L7.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_S2L7+36)
MOVT	R0, #hi_addr(_Diagram8_S2L7+36)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1237 :: 		Diagram8_S2L7.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_S2L7+40)
MOVT	R0, #hi_addr(_Diagram8_S2L7+40)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1239 :: 		Diagram8_S2L8.OwnerScreen     = &Screen8;
MOVW	R1, #lo_addr(_Screen8+0)
MOVT	R1, #hi_addr(_Screen8+0)
MOVW	R0, #lo_addr(_Diagram8_S2L8+0)
MOVT	R0, #hi_addr(_Diagram8_S2L8+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1240 :: 		Diagram8_S2L8.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Diagram8_S2L8+4)
MOVT	R0, #hi_addr(_Diagram8_S2L8+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1241 :: 		Diagram8_S2L8.Left            = 275;
MOVW	R1, #275
MOVW	R0, #lo_addr(_Diagram8_S2L8+6)
MOVT	R0, #hi_addr(_Diagram8_S2L8+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1242 :: 		Diagram8_S2L8.Top             = 105;
MOVS	R1, #105
MOVW	R0, #lo_addr(_Diagram8_S2L8+8)
MOVT	R0, #hi_addr(_Diagram8_S2L8+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1243 :: 		Diagram8_S2L8.Width           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Diagram8_S2L8+10)
MOVT	R0, #hi_addr(_Diagram8_S2L8+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1244 :: 		Diagram8_S2L8.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Diagram8_S2L8+12)
MOVT	R0, #hi_addr(_Diagram8_S2L8+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1245 :: 		Diagram8_S2L8.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_S2L8+26)
MOVT	R0, #hi_addr(_Diagram8_S2L8+26)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1246 :: 		Diagram8_S2L8.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_S2L8+27)
MOVT	R0, #hi_addr(_Diagram8_S2L8+27)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1247 :: 		Diagram8_S2L8.Caption         = Diagram8_S2L8_Caption;
MOVW	R1, #lo_addr(_Diagram8_S2L8_Caption+0)
MOVT	R1, #hi_addr(_Diagram8_S2L8_Caption+0)
MOVW	R0, #lo_addr(_Diagram8_S2L8+16)
MOVT	R0, #hi_addr(_Diagram8_S2L8+16)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1248 :: 		Diagram8_S2L8.FontName        = Tahoma13x13_Bold;
MOVW	R1, #17297
MOVW	R0, #lo_addr(_Diagram8_S2L8+20)
MOVT	R0, #hi_addr(_Diagram8_S2L8+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1249 :: 		Diagram8_S2L8.Font_Color      = 0xFC1F;
MOVW	R1, #64543
MOVW	R0, #lo_addr(_Diagram8_S2L8+24)
MOVT	R0, #hi_addr(_Diagram8_S2L8+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1250 :: 		Diagram8_S2L8.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_S2L8+28)
MOVT	R0, #hi_addr(_Diagram8_S2L8+28)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1251 :: 		Diagram8_S2L8.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_S2L8+32)
MOVT	R0, #hi_addr(_Diagram8_S2L8+32)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1252 :: 		Diagram8_S2L8.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_S2L8+36)
MOVT	R0, #hi_addr(_Diagram8_S2L8+36)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1253 :: 		Diagram8_S2L8.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_S2L8+40)
MOVT	R0, #hi_addr(_Diagram8_S2L8+40)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1255 :: 		Diagram8_S2L1.OwnerScreen     = &Screen8;
MOVW	R1, #lo_addr(_Screen8+0)
MOVT	R1, #hi_addr(_Screen8+0)
MOVW	R0, #lo_addr(_Diagram8_S2L1+0)
MOVT	R0, #hi_addr(_Diagram8_S2L1+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1256 :: 		Diagram8_S2L1.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Diagram8_S2L1+4)
MOVT	R0, #hi_addr(_Diagram8_S2L1+4)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1257 :: 		Diagram8_S2L1.Left            = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Diagram8_S2L1+6)
MOVT	R0, #hi_addr(_Diagram8_S2L1+6)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1258 :: 		Diagram8_S2L1.Top             = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Diagram8_S2L1+8)
MOVT	R0, #hi_addr(_Diagram8_S2L1+8)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1259 :: 		Diagram8_S2L1.Width           = 69;
MOVS	R1, #69
MOVW	R0, #lo_addr(_Diagram8_S2L1+10)
MOVT	R0, #hi_addr(_Diagram8_S2L1+10)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1260 :: 		Diagram8_S2L1.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Diagram8_S2L1+12)
MOVT	R0, #hi_addr(_Diagram8_S2L1+12)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1261 :: 		Diagram8_S2L1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_S2L1+26)
MOVT	R0, #hi_addr(_Diagram8_S2L1+26)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1262 :: 		Diagram8_S2L1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram8_S2L1+27)
MOVT	R0, #hi_addr(_Diagram8_S2L1+27)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,1263 :: 		Diagram8_S2L1.Caption         = Diagram8_S2L1_Caption;
MOVW	R1, #lo_addr(_Diagram8_S2L1_Caption+0)
MOVT	R1, #hi_addr(_Diagram8_S2L1_Caption+0)
MOVW	R0, #lo_addr(_Diagram8_S2L1+16)
MOVT	R0, #hi_addr(_Diagram8_S2L1+16)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1264 :: 		Diagram8_S2L1.FontName        = Tahoma13x13_Bold;
MOVW	R1, #17297
MOVW	R0, #lo_addr(_Diagram8_S2L1+20)
MOVT	R0, #hi_addr(_Diagram8_S2L1+20)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1265 :: 		Diagram8_S2L1.Font_Color      = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Diagram8_S2L1+24)
MOVT	R0, #hi_addr(_Diagram8_S2L1+24)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,1266 :: 		Diagram8_S2L1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_S2L1+28)
MOVT	R0, #hi_addr(_Diagram8_S2L1+28)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1267 :: 		Diagram8_S2L1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_S2L1+32)
MOVT	R0, #hi_addr(_Diagram8_S2L1+32)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1268 :: 		Diagram8_S2L1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_S2L1+36)
MOVT	R0, #hi_addr(_Diagram8_S2L1+36)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1269 :: 		Diagram8_S2L1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram8_S2L1+40)
MOVT	R0, #hi_addr(_Diagram8_S2L1+40)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,1270 :: 		}
L_end_InitializeObjects:
BX	LR
; end of DCVA_GUI_driver_InitializeObjects
DCVA_GUI_driver_IsInsideObject:
;DCVA_GUI_driver.c,1272 :: 		static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
; Top start address is: 12 (R3)
; Left start address is: 8 (R2)
; Y start address is: 4 (R1)
; Top end address is: 12 (R3)
; Left end address is: 8 (R2)
; Y end address is: 4 (R1)
; Y start address is: 4 (R1)
; Left start address is: 8 (R2)
; Top start address is: 12 (R3)
; Width start address is: 20 (R5)
LDRH	R5, [SP, #0]
; Height start address is: 24 (R6)
LDRH	R6, [SP, #4]
;DCVA_GUI_driver.c,1273 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
CMP	R2, R0
IT	HI
BHI	L_DCVA_GUI_driver_IsInsideObject251
ADDS	R4, R2, R5
UXTH	R4, R4
; Left end address is: 8 (R2)
; Width end address is: 20 (R5)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R0
IT	CC
BCC	L_DCVA_GUI_driver_IsInsideObject250
;DCVA_GUI_driver.c,1274 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
CMP	R3, R1
IT	HI
BHI	L_DCVA_GUI_driver_IsInsideObject249
ADDS	R4, R3, R6
UXTH	R4, R4
; Top end address is: 12 (R3)
; Height end address is: 24 (R6)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R1
IT	CC
BCC	L_DCVA_GUI_driver_IsInsideObject248
; Y end address is: 4 (R1)
L_DCVA_GUI_driver_IsInsideObject247:
;DCVA_GUI_driver.c,1275 :: 		return 1;
MOVS	R0, #1
IT	AL
BAL	L_end_IsInsideObject
;DCVA_GUI_driver.c,1273 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
L_DCVA_GUI_driver_IsInsideObject251:
L_DCVA_GUI_driver_IsInsideObject250:
;DCVA_GUI_driver.c,1274 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
L_DCVA_GUI_driver_IsInsideObject249:
L_DCVA_GUI_driver_IsInsideObject248:
;DCVA_GUI_driver.c,1277 :: 		return 0;
MOVS	R0, #0
;DCVA_GUI_driver.c,1278 :: 		}
L_end_IsInsideObject:
BX	LR
; end of DCVA_GUI_driver_IsInsideObject
_DeleteTrailingSpaces:
;DCVA_GUI_driver.c,1289 :: 		void DeleteTrailingSpaces(char* str){
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R4, R0
;DCVA_GUI_driver.c,1291 :: 		while(1) {
L_DeleteTrailingSpaces16:
;DCVA_GUI_driver.c,1292 :: 		if (str[0] == ' ') {
; str start address is: 16 (R4)
LDRB	R1, [R4, #0]
CMP	R1, #32
IT	NE
BNE	L_DeleteTrailingSpaces18
;DCVA_GUI_driver.c,1293 :: 		for(counter = 0; counter < strlen(str); counter++) {
; counter start address is: 20 (R5)
MOVS	R5, #0
; str end address is: 16 (R4)
; counter end address is: 20 (R5)
L_DeleteTrailingSpaces19:
; counter start address is: 20 (R5)
; str start address is: 16 (R4)
MOV	R0, R4
BL	_strlen+0
CMP	R5, R0
IT	GE
BGE	L_DeleteTrailingSpaces20
;DCVA_GUI_driver.c,1294 :: 		str[counter] = str[counter+1];
ADDS	R2, R4, R5
ADDS	R1, R5, #1
SXTH	R1, R1
ADDS	R1, R4, R1
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;DCVA_GUI_driver.c,1293 :: 		for(counter = 0; counter < strlen(str); counter++) {
ADDS	R5, R5, #1
UXTB	R5, R5
;DCVA_GUI_driver.c,1295 :: 		}
; counter end address is: 20 (R5)
IT	AL
BAL	L_DeleteTrailingSpaces19
L_DeleteTrailingSpaces20:
;DCVA_GUI_driver.c,1296 :: 		}
IT	AL
BAL	L_DeleteTrailingSpaces22
; str end address is: 16 (R4)
L_DeleteTrailingSpaces18:
;DCVA_GUI_driver.c,1298 :: 		break;
IT	AL
BAL	L_DeleteTrailingSpaces17
L_DeleteTrailingSpaces22:
;DCVA_GUI_driver.c,1299 :: 		}
; str start address is: 16 (R4)
; str end address is: 16 (R4)
IT	AL
BAL	L_DeleteTrailingSpaces16
L_DeleteTrailingSpaces17:
;DCVA_GUI_driver.c,1300 :: 		}
L_end_DeleteTrailingSpaces:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DeleteTrailingSpaces
_DrawRoundButton:
;DCVA_GUI_driver.c,1303 :: 		void DrawRoundButton(TButton_Round *Around_button) {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;DCVA_GUI_driver.c,1304 :: 		if (Around_button->Visible == 1) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton23
;DCVA_GUI_driver.c,1305 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton24
;DCVA_GUI_driver.c,1306 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;DCVA_GUI_driver.c,1308 :: 		Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R5, R1
;DCVA_GUI_driver.c,1307 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
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
;DCVA_GUI_driver.c,1308 :: 		Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;DCVA_GUI_driver.c,1307 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;DCVA_GUI_driver.c,1309 :: 		}
IT	AL
BAL	L_DrawRoundButton25
L_DrawRoundButton24:
;DCVA_GUI_driver.c,1312 :: 		Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R5, R1
;DCVA_GUI_driver.c,1311 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
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
;DCVA_GUI_driver.c,1312 :: 		Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;DCVA_GUI_driver.c,1311 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;DCVA_GUI_driver.c,1313 :: 		}
L_DrawRoundButton25:
;DCVA_GUI_driver.c,1314 :: 		TFT_Set_Pen(Around_button->Pen_Color, Around_button->Pen_Width);
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
;DCVA_GUI_driver.c,1317 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
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
;DCVA_GUI_driver.c,1316 :: 		Around_button->Left + Around_button->Width - 2,
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #2
;DCVA_GUI_driver.c,1315 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
ADDS	R2, R2, #1
ADDS	R1, R4, #1
;DCVA_GUI_driver.c,1317 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
STR	R0, [SP, #4]
;DCVA_GUI_driver.c,1315 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
UXTH	R0, R1
UXTH	R1, R2
;DCVA_GUI_driver.c,1316 :: 		Around_button->Left + Around_button->Width - 2,
UXTH	R2, R3
;DCVA_GUI_driver.c,1317 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
UXTH	R3, R5
PUSH	(R6)
BL	_TFT_Rectangle_Round_Edges+0
ADD	SP, SP, #4
LDR	R0, [SP, #4]
;DCVA_GUI_driver.c,1318 :: 		TFT_Set_Ext_Font(Around_button->FontName, Around_button->Font_Color, FO_HORIZONTAL);
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
;DCVA_GUI_driver.c,1319 :: 		TFT_Write_Text_Return_Pos(Around_button->Caption, Around_button->Left, Around_button->Top);
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
;DCVA_GUI_driver.c,1320 :: 		if (Around_button->TextAlign == _taLeft)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawRoundButton26
;DCVA_GUI_driver.c,1321 :: 		TFT_Write_Text(Around_button->Caption, Around_button->Left + 4, (Around_button->Top + ((Around_button->Height - caption_height) / 2)));
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
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text+0
IT	AL
BAL	L_DrawRoundButton27
L_DrawRoundButton26:
;DCVA_GUI_driver.c,1322 :: 		else if (Around_button->TextAlign == _taCenter)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton28
;DCVA_GUI_driver.c,1323 :: 		TFT_Write_Text(Around_button->Caption, (Around_button->Left + (Around_button->Width - caption_length) / 2), (Around_button->Top + ((Around_button->Height - caption_height) / 2)));
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
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R4
BL	_TFT_Write_Text+0
IT	AL
BAL	L_DrawRoundButton29
L_DrawRoundButton28:
;DCVA_GUI_driver.c,1324 :: 		else if (Around_button->TextAlign == _taRight)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawRoundButton30
;DCVA_GUI_driver.c,1325 :: 		TFT_Write_Text(Around_button->Caption, Around_button->Left + (Around_button->Width - caption_length - 4), (Around_button->Top + (Around_button->Height - caption_height) / 2));
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
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R4
BL	_TFT_Write_Text+0
L_DrawRoundButton30:
L_DrawRoundButton29:
L_DrawRoundButton27:
;DCVA_GUI_driver.c,1326 :: 		}
L_DrawRoundButton23:
;DCVA_GUI_driver.c,1327 :: 		}
L_end_DrawRoundButton:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawRoundButton
_DrawLabel:
;DCVA_GUI_driver.c,1329 :: 		void DrawLabel(TLabel *ALabel) {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;DCVA_GUI_driver.c,1330 :: 		if (ALabel->Visible == 1) {
ADDW	R1, R0, #26
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawLabel31
;DCVA_GUI_driver.c,1331 :: 		TFT_Set_Ext_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
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
;DCVA_GUI_driver.c,1332 :: 		TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #16
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text+0
;DCVA_GUI_driver.c,1333 :: 		}
L_DrawLabel31:
;DCVA_GUI_driver.c,1334 :: 		}
L_end_DrawLabel:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawLabel
_DrawImage:
;DCVA_GUI_driver.c,1336 :: 		void DrawImage(TImage *AImage) {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DCVA_GUI_driver.c,1337 :: 		if (AImage->Visible) {
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawImage32
;DCVA_GUI_driver.c,1338 :: 		TFT_Ext_Image(AImage->Left, AImage->Top, AImage->Picture_Name, AImage->Picture_Ratio);
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
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
MOV	R2, R3
UXTB	R3, R4
BL	_TFT_Ext_Image+0
;DCVA_GUI_driver.c,1339 :: 		}
L_DrawImage32:
;DCVA_GUI_driver.c,1340 :: 		}
L_end_DrawImage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DrawImage
_DrawCircleButton:
;DCVA_GUI_driver.c,1342 :: 		void DrawCircleButton(TCircleButton *ACircle_button) {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;DCVA_GUI_driver.c,1343 :: 		if (ACircle_button->Visible == 1) {
ADDW	R1, R0, #16
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCircleButton33
;DCVA_GUI_driver.c,1344 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCircleButton34
;DCVA_GUI_driver.c,1345 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;DCVA_GUI_driver.c,1347 :: 		ACircle_button->Gradient_End_Color, ACircle_button->Gradient_Start_Color);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #38
LDRH	R1, [R1, #0]
UXTH	R5, R1
;DCVA_GUI_driver.c,1346 :: 		TFT_Set_Brush(ACircle_button->Transparent, ACircle_button->Press_Color, ACircle_button->Gradient, ACircle_button->Gradient_Orientation,
ADDW	R1, R0, #35
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #34
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;DCVA_GUI_driver.c,1347 :: 		ACircle_button->Gradient_End_Color, ACircle_button->Gradient_Start_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;DCVA_GUI_driver.c,1346 :: 		TFT_Set_Brush(ACircle_button->Transparent, ACircle_button->Press_Color, ACircle_button->Gradient, ACircle_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;DCVA_GUI_driver.c,1348 :: 		}
IT	AL
BAL	L_DrawCircleButton35
L_DrawCircleButton34:
;DCVA_GUI_driver.c,1351 :: 		ACircle_button->Gradient_Start_Color, ACircle_button->Gradient_End_Color);
ADDW	R1, R0, #38
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R5, R1
;DCVA_GUI_driver.c,1350 :: 		TFT_Set_Brush(ACircle_button->Transparent, ACircle_button->Color, ACircle_button->Gradient, ACircle_button->Gradient_Orientation,
ADDW	R1, R0, #35
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #34
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;DCVA_GUI_driver.c,1351 :: 		ACircle_button->Gradient_Start_Color, ACircle_button->Gradient_End_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;DCVA_GUI_driver.c,1350 :: 		TFT_Set_Brush(ACircle_button->Transparent, ACircle_button->Color, ACircle_button->Gradient, ACircle_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;DCVA_GUI_driver.c,1352 :: 		}
L_DrawCircleButton35:
;DCVA_GUI_driver.c,1353 :: 		TFT_Set_Pen(ACircle_button->Pen_Color, ACircle_button->Pen_Width);
ADDW	R1, R0, #12
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #14
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;DCVA_GUI_driver.c,1356 :: 		ACircle_button->Radius);
ADDW	R1, R0, #10
LDRH	R4, [R1, #0]
SXTH	R3, R4
;DCVA_GUI_driver.c,1355 :: 		ACircle_button->Top + ACircle_button->Radius,
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
ADDS	R2, R1, R4
;DCVA_GUI_driver.c,1354 :: 		TFT_Circle(ACircle_button->Left + ACircle_button->Radius,
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R1, R1, R4
;DCVA_GUI_driver.c,1356 :: 		ACircle_button->Radius);
STR	R0, [SP, #4]
;DCVA_GUI_driver.c,1354 :: 		TFT_Circle(ACircle_button->Left + ACircle_button->Radius,
SXTH	R0, R1
;DCVA_GUI_driver.c,1355 :: 		ACircle_button->Top + ACircle_button->Radius,
SXTH	R1, R2
;DCVA_GUI_driver.c,1356 :: 		ACircle_button->Radius);
SXTH	R2, R3
BL	_TFT_Circle+0
LDR	R0, [SP, #4]
;DCVA_GUI_driver.c,1357 :: 		TFT_Set_Ext_Font(ACircle_button->FontName, ACircle_button->Font_Color, FO_HORIZONTAL);
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
;DCVA_GUI_driver.c,1358 :: 		TFT_Write_Text_Return_Pos(ACircle_button->Caption, ACircle_button->Left, ACircle_button->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text_Return_Pos+0
LDR	R0, [SP, #4]
;DCVA_GUI_driver.c,1359 :: 		if (ACircle_button->TextAlign == _taLeft)
ADDW	R1, R0, #24
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawCircleButton36
;DCVA_GUI_driver.c,1360 :: 		TFT_Write_Text(ACircle_button->Caption, ACircle_button->Left + 4, (ACircle_button->Top + ACircle_button->Radius - caption_height / 2));
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R2, R2, R1
UXTH	R2, R2
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
LSRS	R1, R1, #1
UXTH	R1, R1
SUB	R3, R2, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R2, R1, #4
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text+0
IT	AL
BAL	L_DrawCircleButton37
L_DrawCircleButton36:
;DCVA_GUI_driver.c,1361 :: 		else if (ACircle_button->TextAlign == _taCenter)
ADDW	R1, R0, #24
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCircleButton38
;DCVA_GUI_driver.c,1362 :: 		TFT_Write_Text(ACircle_button->Caption, (ACircle_button->Left + (ACircle_button->Radius*2 - caption_length) / 2), (ACircle_button->Top + ACircle_button->Radius - caption_height / 2));
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #10
LDRH	R5, [R1, #0]
ADDS	R2, R2, R5
UXTH	R2, R2
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
LSRS	R1, R1, #1
UXTH	R1, R1
SUB	R4, R2, R1
ADDS	R1, R0, #6
LDRH	R3, [R1, #0]
LSLS	R2, R5, #1
UXTH	R2, R2
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R2, R3, R1
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R4
BL	_TFT_Write_Text+0
IT	AL
BAL	L_DrawCircleButton39
L_DrawCircleButton38:
;DCVA_GUI_driver.c,1363 :: 		else if (ACircle_button->TextAlign == _taRight)
ADDW	R1, R0, #24
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawCircleButton40
;DCVA_GUI_driver.c,1364 :: 		TFT_Write_Text(ACircle_button->Caption, ACircle_button->Left + (ACircle_button->Radius*2 - caption_length - 4), (ACircle_button->Top + ACircle_button->Radius - caption_height / 2));
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #10
LDRH	R5, [R1, #0]
ADDS	R2, R2, R5
UXTH	R2, R2
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
LSRS	R1, R1, #1
UXTH	R1, R1
SUB	R4, R2, R1
ADDS	R1, R0, #6
LDRH	R3, [R1, #0]
LSLS	R2, R5, #1
UXTH	R2, R2
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
SUBS	R1, R1, #4
UXTH	R1, R1
ADDS	R2, R3, R1
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R4
BL	_TFT_Write_Text+0
L_DrawCircleButton40:
L_DrawCircleButton39:
L_DrawCircleButton37:
;DCVA_GUI_driver.c,1365 :: 		}
L_DrawCircleButton33:
;DCVA_GUI_driver.c,1366 :: 		}
L_end_DrawCircleButton:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawCircleButton
_DrawBox:
;DCVA_GUI_driver.c,1368 :: 		void DrawBox(TBox *ABox) {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;DCVA_GUI_driver.c,1369 :: 		if (ABox->Visible == 1) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawBox41
;DCVA_GUI_driver.c,1370 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawBox42
;DCVA_GUI_driver.c,1371 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;DCVA_GUI_driver.c,1372 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Press_Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_End_Color, ABox->Gradient_Start_Color);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #32
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
;DCVA_GUI_driver.c,1373 :: 		}
IT	AL
BAL	L_DrawBox43
L_DrawBox42:
;DCVA_GUI_driver.c,1375 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_Start_Color, ABox->Gradient_End_Color);
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #28
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
;DCVA_GUI_driver.c,1376 :: 		}
L_DrawBox43:
;DCVA_GUI_driver.c,1377 :: 		TFT_Set_Pen(ABox->Pen_Color, ABox->Pen_Width);
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
;DCVA_GUI_driver.c,1378 :: 		TFT_Rectangle(ABox->Left, ABox->Top, ABox->Left + ABox->Width - 1, ABox->Top + ABox->Height - 1);
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUBS	R5, R1, #1
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #1
SXTH	R2, R2
SXTH	R1, R4
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
SXTH	R3, R5
BL	_TFT_Rectangle+0
;DCVA_GUI_driver.c,1379 :: 		}
L_DrawBox41:
;DCVA_GUI_driver.c,1380 :: 		}
L_end_DrawBox:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawBox
_DrawRadioButton:
;DCVA_GUI_driver.c,1382 :: 		void DrawRadioButton(TRadioButton *ARadioButton) {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;DCVA_GUI_driver.c,1383 :: 		int circleOffset = 0;
;DCVA_GUI_driver.c,1384 :: 		if (ARadioButton->Visible == 1) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRadioButton44
;DCVA_GUI_driver.c,1385 :: 		circleOffset = ARadioButton->Height / 5;
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVS	R1, #5
UDIV	R1, R2, R1
; circleOffset start address is: 28 (R7)
SXTH	R7, R1
;DCVA_GUI_driver.c,1386 :: 		TFT_Set_Pen(ARadioButton->Pen_Color, ARadioButton->Pen_Width);
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
;DCVA_GUI_driver.c,1387 :: 		TFT_Set_Ext_Font(ARadioButton->FontName, ARadioButton->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
STRH	R7, [SP, #4]
STR	R0, [SP, #8]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Ext_Font+0
LDR	R0, [SP, #8]
LDRSH	R7, [SP, #4]
;DCVA_GUI_driver.c,1388 :: 		if (ARadioButton->TextAlign == _taLeft) {
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawRadioButton45
;DCVA_GUI_driver.c,1389 :: 		TFT_Set_Brush(ARadioButton->Transparent,ARadioButton->Background_Color,0,0,0,0);
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
;DCVA_GUI_driver.c,1390 :: 		TFT_Circle(ARadioButton->Left + ARadioButton->Height / 2, ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2);
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
;DCVA_GUI_driver.c,1391 :: 		if (ARadioButton->Checked == 1) {
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRadioButton46
;DCVA_GUI_driver.c,1392 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRadioButton47
;DCVA_GUI_driver.c,1393 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;DCVA_GUI_driver.c,1394 :: 		TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Press_Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_End_Color, ARadioButton->Gradient_Start_Color);
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
;DCVA_GUI_driver.c,1395 :: 		} else
IT	AL
BAL	L_DrawRadioButton48
L_DrawRadioButton47:
;DCVA_GUI_driver.c,1396 :: 		TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_Start_Color, ARadioButton->Gradient_End_Color);
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
L_DrawRadioButton48:
;DCVA_GUI_driver.c,1397 :: 		TFT_Circle(ARadioButton->Left + ARadioButton->Height / 2 , ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2 - circleOffset);
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
;DCVA_GUI_driver.c,1398 :: 		}
L_DrawRadioButton46:
;DCVA_GUI_driver.c,1399 :: 		TFT_Write_Text_Return_Pos(ARadioButton->Caption, ARadioButton->Left + ARadioButton->Height + 4, ARadioButton->Top);
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
;DCVA_GUI_driver.c,1400 :: 		TFT_Write_Text(ARadioButton->Caption, ARadioButton->Left + ARadioButton->Height + 4, (ARadioButton->Top + ((ARadioButton->Height - caption_height) / 2)));
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
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text+0
;DCVA_GUI_driver.c,1401 :: 		} else {
IT	AL
BAL	L_DrawRadioButton49
L_DrawRadioButton45:
;DCVA_GUI_driver.c,1402 :: 		TFT_Set_Brush(ARadioButton->Transparent,ARadioButton->Background_Color,0,0,0,0);
; circleOffset start address is: 28 (R7)
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
;DCVA_GUI_driver.c,1403 :: 		TFT_Circle(ARadioButton->Left  + ARadioButton->Width - ARadioButton->Height / 2, ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2);
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
;DCVA_GUI_driver.c,1404 :: 		if (ARadioButton->Checked == 1) {
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRadioButton50
;DCVA_GUI_driver.c,1405 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRadioButton51
;DCVA_GUI_driver.c,1406 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;DCVA_GUI_driver.c,1407 :: 		TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Press_Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_End_Color, ARadioButton->Gradient_Start_Color);
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
;DCVA_GUI_driver.c,1408 :: 		} else
IT	AL
BAL	L_DrawRadioButton52
L_DrawRadioButton51:
;DCVA_GUI_driver.c,1409 :: 		TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_Start_Color, ARadioButton->Gradient_End_Color);
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
L_DrawRadioButton52:
;DCVA_GUI_driver.c,1410 :: 		TFT_Circle(ARadioButton->Left  + ARadioButton->Width - ARadioButton->Height / 2, ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2 - circleOffset);
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
;DCVA_GUI_driver.c,1411 :: 		}
L_DrawRadioButton50:
;DCVA_GUI_driver.c,1412 :: 		TFT_Write_Text_Return_Pos(ARadioButton->Caption, ARadioButton->Left + 3, ARadioButton->Top);
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
;DCVA_GUI_driver.c,1413 :: 		TFT_Write_Text(ARadioButton->Caption, ARadioButton->Left + 3, ARadioButton->Top + (ARadioButton->Height - caption_height) / 2);
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
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text+0
;DCVA_GUI_driver.c,1414 :: 		}
L_DrawRadioButton49:
;DCVA_GUI_driver.c,1415 :: 		}
L_DrawRadioButton44:
;DCVA_GUI_driver.c,1416 :: 		}
L_end_DrawRadioButton:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DrawRadioButton
_UpdatePBPosition:
;DCVA_GUI_driver.c,1418 :: 		void UpdatePBPosition(TProgressBar *AProgressBar) {
SUB	SP, SP, #28
STR	LR, [SP, #0]
;DCVA_GUI_driver.c,1420 :: 		unsigned int locPosition = 0;
;DCVA_GUI_driver.c,1421 :: 		unsigned cnt = 0;
;DCVA_GUI_driver.c,1423 :: 		unsigned int tmpWidth = 0;
;DCVA_GUI_driver.c,1424 :: 		unsigned int tmpRound = 0;
;DCVA_GUI_driver.c,1425 :: 		move_offset = 10;
; move_offset start address is: 32 (R8)
MOVW	R8, #10
SXTH	R8, R8
;DCVA_GUI_driver.c,1426 :: 		locPosition = (AProgressBar->Position - AProgressBar->Min) * 100 / (AProgressBar->Max - AProgressBar->Min);
ADDW	R1, R0, #44
LDRH	R2, [R1, #0]
ADDW	R1, R0, #40
LDRH	R3, [R1, #0]
SUB	R7, R2, R3
UXTH	R7, R7
MOVS	R1, #100
MULS	R7, R1, R7
UXTH	R7, R7
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
SUB	R1, R1, R3
UXTH	R1, R1
UDIV	R7, R7, R1
UXTH	R7, R7
; locPosition start address is: 28 (R7)
;DCVA_GUI_driver.c,1427 :: 		if (AProgressBar->Visible == 1) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_UpdatePBPosition53
;DCVA_GUI_driver.c,1428 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
MOVS	R4, #0
MOVS	R3, #0
ADDW	R1, R0, #38
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #19
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
;DCVA_GUI_driver.c,1429 :: 		TFT_Set_Pen(AProgressBar->Background_Color, AProgressBar->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #38
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;DCVA_GUI_driver.c,1430 :: 		TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
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
;DCVA_GUI_driver.c,1431 :: 		if (caption_height >  AProgressBar->Height)
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	LS
BLS	L_UpdatePBPosition54
;DCVA_GUI_driver.c,1432 :: 		caption_height =  AProgressBar->Height;
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
STRH	R2, [R1, #0]
L_UpdatePBPosition54:
;DCVA_GUI_driver.c,1433 :: 		if (caption_length >  AProgressBar->Width)
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	LS
BLS	L_UpdatePBPosition55
;DCVA_GUI_driver.c,1434 :: 		caption_length =  AProgressBar->Width;
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
STRH	R2, [R1, #0]
L_UpdatePBPosition55:
;DCVA_GUI_driver.c,1435 :: 		if (AProgressBar->Position < (AProgressBar->Left + (AProgressBar->Width - caption_length) / 2)) {
ADDW	R1, R0, #44
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
BCS	L_UpdatePBPosition56
;DCVA_GUI_driver.c,1439 :: 		AProgressBar->Top +(AProgressBar->Height - caption_height) / 2 + caption_height);
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
;DCVA_GUI_driver.c,1438 :: 		AProgressBar->Left + (AProgressBar->Width - caption_length) / 2 + caption_length,
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
;DCVA_GUI_driver.c,1439 :: 		AProgressBar->Top +(AProgressBar->Height - caption_height) / 2 + caption_height);
STRH	R7, [SP, #4]
STRH	R8, [SP, #6]
STR	R0, [SP, #8]
SXTH	R3, R5
;DCVA_GUI_driver.c,1436 :: 		TFT_Rectangle(AProgressBar->Left + (AProgressBar->Width - caption_length) / 2,
SXTH	R0, R2
;DCVA_GUI_driver.c,1438 :: 		AProgressBar->Left + (AProgressBar->Width - caption_length) / 2 + caption_length,
SXTH	R2, R1
;DCVA_GUI_driver.c,1437 :: 		AProgressBar->Top +(AProgressBar->Height - caption_height) / 2,
SXTH	R1, R6
;DCVA_GUI_driver.c,1439 :: 		AProgressBar->Top +(AProgressBar->Height - caption_height) / 2 + caption_height);
BL	_TFT_Rectangle+0
LDR	R0, [SP, #8]
LDRSH	R8, [SP, #6]
LDRH	R7, [SP, #4]
;DCVA_GUI_driver.c,1440 :: 		}
L_UpdatePBPosition56:
;DCVA_GUI_driver.c,1441 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
ADDW	R1, R0, #34
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #32
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #31
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #30
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #19
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
;DCVA_GUI_driver.c,1442 :: 		TFT_Set_Pen(AProgressBar->Pen_Color, AProgressBar->Pen_Width);
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
;DCVA_GUI_driver.c,1443 :: 		if (AProgressBar->Rounded == 1) {
ADDW	R1, R0, #49
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_UpdatePBPosition57
;DCVA_GUI_driver.c,1444 :: 		if (locPosition > 0) {
CMP	R7, #0
IT	LS
BLS	L_UpdatePBPosition58
;DCVA_GUI_driver.c,1446 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
ADDW	R1, R0, #34
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #32
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #31
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #30
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #19
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
;DCVA_GUI_driver.c,1447 :: 		TFT_Rectangle(AProgressBar->Left + AProgressBar->Corner_Radius, AProgressBar->Top,  AProgressBar->Left + AProgressBar->Corner_Radius  + locPosition *  (AProgressBar->Width-AProgressBar->Corner_Radius*2) / 100 , AProgressBar->Top + AProgressBar->Height);
ADDW	R1, R0, #8
LDRH	R6, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R5, R6, R1
ADDS	R1, R0, #6
LDRH	R2, [R1, #0]
ADDW	R1, R0, #50
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
;DCVA_GUI_driver.c,1448 :: 		}
L_UpdatePBPosition58:
;DCVA_GUI_driver.c,1449 :: 		}
IT	AL
BAL	L_UpdatePBPosition59
L_UpdatePBPosition57:
;DCVA_GUI_driver.c,1451 :: 		if (locPosition > 0) {
CMP	R7, #0
IT	LS
BLS	L_UpdatePBPosition60
;DCVA_GUI_driver.c,1452 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
ADDW	R1, R0, #34
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #32
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #31
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #30
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #19
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
;DCVA_GUI_driver.c,1453 :: 		TFT_Rectangle(AProgressBar->Left, AProgressBar->Top,  AProgressBar->Left + (locPosition * AProgressBar->Width) / 100, AProgressBar->Top + AProgressBar->Height);
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
;DCVA_GUI_driver.c,1454 :: 		}
L_UpdatePBPosition60:
;DCVA_GUI_driver.c,1455 :: 		}
L_UpdatePBPosition59:
;DCVA_GUI_driver.c,1457 :: 		if (AProgressBar->Smooth != 1) {
ADDW	R1, R0, #48
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	EQ
BEQ	L__UpdatePBPosition252
;DCVA_GUI_driver.c,1458 :: 		if(AProgressBar->Rounded == 1) {
ADDW	R1, R0, #49
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_UpdatePBPosition62
;DCVA_GUI_driver.c,1459 :: 		tmpRound = AProgressBar->Corner_Radius;
ADDW	R1, R0, #50
LDRB	R3, [R1, #0]
; tmpRound start address is: 16 (R4)
UXTB	R4, R3
;DCVA_GUI_driver.c,1460 :: 		cnt = move_offset + tmpRound;
ADD	R10, R8, R4, LSL #0
UXTH	R10, R10
; cnt start address is: 40 (R10)
;DCVA_GUI_driver.c,1461 :: 		tmpWidth = AProgressBar->Width - AProgressBar->Corner_Radius * 2;
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
LSLS	R1, R3, #1
SXTH	R1, R1
SUB	R9, R2, R1, LSL #0
UXTH	R9, R9
; tmpWidth start address is: 36 (R9)
;DCVA_GUI_driver.c,1462 :: 		}
UXTH	R5, R4
; tmpRound end address is: 16 (R4)
; tmpWidth end address is: 36 (R9)
; cnt end address is: 40 (R10)
IT	AL
BAL	L_UpdatePBPosition63
L_UpdatePBPosition62:
;DCVA_GUI_driver.c,1464 :: 		tmpRound = 0;
; tmpRound start address is: 20 (R5)
MOVS	R5, #0
;DCVA_GUI_driver.c,1465 :: 		cnt = move_offset;
; cnt start address is: 40 (R10)
UXTH	R10, R8
;DCVA_GUI_driver.c,1466 :: 		tmpWidth = AProgressBar->Width;
ADDW	R1, R0, #10
LDRH	R9, [R1, #0]
; tmpWidth start address is: 36 (R9)
; tmpRound end address is: 20 (R5)
; tmpWidth end address is: 36 (R9)
; cnt end address is: 40 (R10)
;DCVA_GUI_driver.c,1467 :: 		}
L_UpdatePBPosition63:
;DCVA_GUI_driver.c,1468 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
; tmpWidth start address is: 36 (R9)
; cnt start address is: 40 (R10)
; tmpRound start address is: 20 (R5)
MOVS	R4, #0
MOVS	R3, #0
ADDW	R1, R0, #38
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #19
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
LDR	R0, [SP, #8]
LDRH	R5, [SP, #4]
SXTH	R11, R8
UXTH	R8, R5
;DCVA_GUI_driver.c,1469 :: 		while (cnt-tmpRound < (locPosition * tmpWidth) / 100) {
L_UpdatePBPosition64:
; move_offset start address is: 44 (R11)
; tmpRound start address is: 32 (R8)
; cnt start address is: 40 (R10)
; tmpWidth start address is: 36 (R9)
; locPosition start address is: 28 (R7)
; move_offset start address is: 44 (R11)
; move_offset end address is: 44 (R11)
SUB	R3, R10, R8, LSL #0
UXTH	R3, R3
MUL	R2, R7, R9
UXTH	R2, R2
MOVS	R1, #100
UDIV	R1, R2, R1
UXTH	R1, R1
CMP	R3, R1
IT	CS
BCS	L_UpdatePBPosition65
; move_offset end address is: 44 (R11)
;DCVA_GUI_driver.c,1470 :: 		if  (cnt - tmpRound + 3 >=  tmpWidth * locPosition)
; move_offset start address is: 44 (R11)
SUB	R1, R10, R8, LSL #0
UXTH	R1, R1
ADDS	R2, R1, #3
UXTH	R2, R2
MUL	R1, R9, R7
UXTH	R1, R1
CMP	R2, R1
IT	CC
BCC	L_UpdatePBPosition66
;DCVA_GUI_driver.c,1471 :: 		TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top, AProgressBar->Left + tmpRound  + tmpWidth * locPosition , AProgressBar->Top + AProgressBar->Height);
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
BAL	L_UpdatePBPosition67
L_UpdatePBPosition66:
;DCVA_GUI_driver.c,1473 :: 		TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top,  AProgressBar->Left + cnt + 3, AProgressBar->Top + AProgressBar->Height);
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
L_UpdatePBPosition67:
;DCVA_GUI_driver.c,1474 :: 		cnt = cnt + move_offset + 3;
ADD	R1, R10, R11, LSL #0
UXTH	R1, R1
; cnt end address is: 40 (R10)
ADDS	R1, R1, #3
; cnt start address is: 40 (R10)
UXTH	R10, R1
;DCVA_GUI_driver.c,1475 :: 		}
; tmpRound end address is: 32 (R8)
; tmpWidth end address is: 36 (R9)
; move_offset end address is: 44 (R11)
; cnt end address is: 40 (R10)
IT	AL
BAL	L_UpdatePBPosition64
L_UpdatePBPosition65:
;DCVA_GUI_driver.c,1476 :: 		}
UXTH	R2, R7
IT	AL
BAL	L_UpdatePBPosition61
; locPosition end address is: 28 (R7)
L__UpdatePBPosition252:
;DCVA_GUI_driver.c,1457 :: 		if (AProgressBar->Smooth != 1) {
UXTH	R2, R7
;DCVA_GUI_driver.c,1476 :: 		}
L_UpdatePBPosition61:
;DCVA_GUI_driver.c,1478 :: 		if (AProgressBar->Show_Position == 1){
; locPosition start address is: 8 (R2)
ADDW	R1, R0, #46
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_UpdatePBPosition68
;DCVA_GUI_driver.c,1479 :: 		if (AProgressBar->Show_Percentage == 1) {
ADDW	R1, R0, #47
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_UpdatePBPosition69
;DCVA_GUI_driver.c,1480 :: 		WordToStr(locPosition , tmpStr);
ADD	R1, SP, #18
STR	R0, [SP, #4]
UXTH	R0, R2
; locPosition end address is: 8 (R2)
BL	_WordToStr+0
;DCVA_GUI_driver.c,1481 :: 		DeleteTrailingSpaces(tmpStr);
ADD	R1, SP, #18
MOV	R0, R1
BL	_DeleteTrailingSpaces+0
LDR	R0, [SP, #4]
;DCVA_GUI_driver.c,1482 :: 		strcpy(AProgressBar->Caption, tmpStr);
ADD	R2, SP, #18
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
BL	_strcpy+0
LDR	R0, [SP, #4]
;DCVA_GUI_driver.c,1483 :: 		strcat(AProgressBar->Caption, "\%");
MOVW	R2, #lo_addr(?lstr5_DCVA_GUI_driver+0)
MOVT	R2, #hi_addr(?lstr5_DCVA_GUI_driver+0)
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
LDR	R0, [SP, #4]
;DCVA_GUI_driver.c,1484 :: 		}
IT	AL
BAL	L_UpdatePBPosition70
L_UpdatePBPosition69:
;DCVA_GUI_driver.c,1486 :: 		WordToStr(AProgressBar->Position , tmpStr);
ADD	R2, SP, #18
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
MOV	R1, R2
BL	_WordToStr+0
;DCVA_GUI_driver.c,1487 :: 		DeleteTrailingSpaces(tmpStr);
ADD	R1, SP, #18
MOV	R0, R1
BL	_DeleteTrailingSpaces+0
LDR	R0, [SP, #4]
;DCVA_GUI_driver.c,1488 :: 		strcpy(AProgressBar->Caption, tmpStr);
ADD	R2, SP, #18
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
BL	_strcpy+0
LDR	R0, [SP, #4]
;DCVA_GUI_driver.c,1489 :: 		}
L_UpdatePBPosition70:
;DCVA_GUI_driver.c,1490 :: 		TFT_Set_Ext_Font(AProgressBar->FontName, AProgressBar->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #28
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Ext_Font+0
LDR	R0, [SP, #4]
;DCVA_GUI_driver.c,1491 :: 		TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text_Return_Pos+0
LDR	R0, [SP, #4]
;DCVA_GUI_driver.c,1492 :: 		TFT_Write_Text(AProgressBar->Caption, AProgressBar->Left + (AProgressBar->Width - caption_length) / 2, AProgressBar->Top + (AProgressBar->Height - caption_height) / 2);
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
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R4
BL	_TFT_Write_Text+0
;DCVA_GUI_driver.c,1493 :: 		}
L_UpdatePBPosition68:
;DCVA_GUI_driver.c,1494 :: 		}
L_UpdatePBPosition53:
;DCVA_GUI_driver.c,1495 :: 		}
L_end_UpdatePBPosition:
LDR	LR, [SP, #0]
ADD	SP, SP, #28
BX	LR
; end of _UpdatePBPosition
_DrawProgressBar:
;DCVA_GUI_driver.c,1497 :: 		void DrawProgressBar(TProgressBar *AProgressBar) {
SUB	SP, SP, #32
STR	LR, [SP, #0]
;DCVA_GUI_driver.c,1498 :: 		unsigned long locPosition = 0;
;DCVA_GUI_driver.c,1499 :: 		int move_offset = 0;
;DCVA_GUI_driver.c,1500 :: 		unsigned cnt = 0;
;DCVA_GUI_driver.c,1501 :: 		unsigned int tmpWidth = 0;
;DCVA_GUI_driver.c,1502 :: 		unsigned int tmpRound = 0;
;DCVA_GUI_driver.c,1505 :: 		move_offset = 10;
MOVS	R1, #10
SXTH	R1, R1
STRH	R1, [SP, #24]
;DCVA_GUI_driver.c,1506 :: 		_tmpI = AProgressBar->Position - AProgressBar->Min;
ADDW	R1, R0, #44
LDRH	R2, [R1, #0]
ADDW	R1, R0, #40
LDRH	R3, [R1, #0]
SUB	R2, R2, R3
UXTH	R2, R2
;DCVA_GUI_driver.c,1507 :: 		_tmpII = AProgressBar->Max - AProgressBar->Min;
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
SUB	R1, R1, R3
; _tmpII start address is: 12 (R3)
UXTH	R3, R1
;DCVA_GUI_driver.c,1508 :: 		locPosition = (unsigned long)_tmpI * 100 / _tmpII;
MOVS	R1, #100
MULS	R1, R2, R1
UDIV	R1, R1, R3
; _tmpII end address is: 12 (R3)
STR	R1, [SP, #20]
;DCVA_GUI_driver.c,1509 :: 		if (AProgressBar->Visible == 1) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawProgressBar71
;DCVA_GUI_driver.c,1510 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
MOVS	R4, #0
MOVS	R3, #0
ADDW	R1, R0, #38
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #19
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
;DCVA_GUI_driver.c,1511 :: 		TFT_Set_Pen(AProgressBar->Pen_Color, AProgressBar->Pen_Width);
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
;DCVA_GUI_driver.c,1512 :: 		if (AProgressBar->Rounded == 1) {
ADDW	R1, R0, #49
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawProgressBar72
;DCVA_GUI_driver.c,1514 :: 		TFT_Rectangle_Round_Edges(AProgressBar->Left, AProgressBar->Top,  AProgressBar->Left + AProgressBar->Width, AProgressBar->Top + AProgressBar->Height, AProgressBar->Corner_Radius);
ADDW	R1, R0, #50
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
;DCVA_GUI_driver.c,1515 :: 		if (locPosition > 0) {
LDR	R1, [SP, #20]
CMP	R1, #0
IT	LS
BLS	L_DrawProgressBar73
;DCVA_GUI_driver.c,1517 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
ADDW	R1, R0, #34
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #32
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #31
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #30
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #19
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
;DCVA_GUI_driver.c,1518 :: 		TFT_Rectangle(AProgressBar->Left + AProgressBar->Corner_Radius, AProgressBar->Top,  AProgressBar->Left + AProgressBar->Corner_Radius   + locPosition *  (AProgressBar->Width-AProgressBar->Corner_Radius*2) / 100, AProgressBar->Top + AProgressBar->Height);
ADDW	R1, R0, #8
LDRH	R6, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R5, R6, R1
ADDS	R1, R0, #6
LDRH	R2, [R1, #0]
ADDW	R1, R0, #50
LDRB	R4, [R1, #0]
ADDS	R3, R2, R4
UXTH	R3, R3
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
LSLS	R1, R4, #1
SXTH	R1, R1
SUB	R2, R2, R1
UXTH	R2, R2
LDR	R1, [SP, #20]
MULS	R2, R1, R2
MOVS	R1, #100
UDIV	R1, R2, R1
ADDS	R2, R3, R1
SXTH	R1, R6
STR	R0, [SP, #4]
SXTH	R2, R2
SXTH	R0, R3
SXTH	R3, R5
BL	_TFT_Rectangle+0
LDR	R0, [SP, #4]
;DCVA_GUI_driver.c,1519 :: 		}
L_DrawProgressBar73:
;DCVA_GUI_driver.c,1520 :: 		}
IT	AL
BAL	L_DrawProgressBar74
L_DrawProgressBar72:
;DCVA_GUI_driver.c,1523 :: 		TFT_Rectangle(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + AProgressBar->Width, AProgressBar->Top + AProgressBar->Height);
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
;DCVA_GUI_driver.c,1524 :: 		if (locPosition > 0) {
LDR	R1, [SP, #20]
CMP	R1, #0
IT	LS
BLS	L_DrawProgressBar75
;DCVA_GUI_driver.c,1526 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
ADDW	R1, R0, #34
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #32
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #31
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #30
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #19
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
;DCVA_GUI_driver.c,1527 :: 		TFT_Rectangle(AProgressBar->Left, AProgressBar->Top,  AProgressBar->Left + (locPosition * AProgressBar->Width) / 100, AProgressBar->Top + AProgressBar->Height);
ADDW	R1, R0, #8
LDRH	R6, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R5, R6, R1
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
LDR	R1, [SP, #20]
MULS	R2, R1, R2
MOVS	R1, #100
UDIV	R1, R2, R1
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
;DCVA_GUI_driver.c,1528 :: 		}
L_DrawProgressBar75:
;DCVA_GUI_driver.c,1529 :: 		}
L_DrawProgressBar74:
;DCVA_GUI_driver.c,1531 :: 		if (AProgressBar->Smooth != 1) {
ADDW	R1, R0, #48
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	EQ
BEQ	L__DrawProgressBar253
;DCVA_GUI_driver.c,1532 :: 		if(AProgressBar->Rounded == 1) {
ADDW	R1, R0, #49
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawProgressBar77
;DCVA_GUI_driver.c,1533 :: 		tmpRound = AProgressBar->Corner_Radius;
ADDW	R1, R0, #50
LDRB	R3, [R1, #0]
STRH	R3, [SP, #28]
;DCVA_GUI_driver.c,1534 :: 		cnt = move_offset + tmpRound;
LDRH	R2, [SP, #28]
LDRSH	R1, [SP, #24]
ADD	R10, R1, R2, LSL #0
UXTH	R10, R10
; cnt start address is: 40 (R10)
;DCVA_GUI_driver.c,1535 :: 		tmpWidth = AProgressBar->Width - AProgressBar->Corner_Radius * 2;
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
LSLS	R1, R3, #1
SXTH	R1, R1
SUB	R1, R2, R1
STRH	R1, [SP, #26]
;DCVA_GUI_driver.c,1536 :: 		}
; cnt end address is: 40 (R10)
IT	AL
BAL	L_DrawProgressBar78
L_DrawProgressBar77:
;DCVA_GUI_driver.c,1538 :: 		tmpRound = 0;
MOVS	R1, #0
STRH	R1, [SP, #28]
;DCVA_GUI_driver.c,1539 :: 		cnt = move_offset;
; cnt start address is: 40 (R10)
LDRSH	R10, [SP, #24]
;DCVA_GUI_driver.c,1540 :: 		tmpWidth = AProgressBar->Width;
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
STRH	R1, [SP, #26]
; cnt end address is: 40 (R10)
;DCVA_GUI_driver.c,1541 :: 		}
L_DrawProgressBar78:
;DCVA_GUI_driver.c,1542 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
; cnt start address is: 40 (R10)
MOVS	R4, #0
MOVS	R3, #0
ADDW	R1, R0, #38
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #19
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
LDR	R0, [SP, #4]
MOV	R8, R0
UXTH	R7, R10
;DCVA_GUI_driver.c,1543 :: 		while (cnt-tmpRound < (locPosition * tmpWidth) / 100) {
L_DrawProgressBar79:
; cnt start address is: 28 (R7)
; AProgressBar start address is: 32 (R8)
LDRH	R1, [SP, #28]
SUB	R3, R7, R1
UXTH	R3, R3
LDRH	R2, [SP, #26]
LDR	R1, [SP, #20]
MULS	R2, R1, R2
MOVS	R1, #100
UDIV	R1, R2, R1
CMP	R3, R1
IT	CS
BCS	L_DrawProgressBar80
;DCVA_GUI_driver.c,1544 :: 		if  (cnt - tmpRound + 3 >=  tmpWidth * locPosition)
LDRH	R1, [SP, #28]
SUB	R1, R7, R1
UXTH	R1, R1
ADDS	R3, R1, #3
UXTH	R3, R3
LDR	R2, [SP, #20]
LDRH	R1, [SP, #26]
MULS	R1, R2, R1
CMP	R3, R1
IT	CC
BCC	L_DrawProgressBar81
;DCVA_GUI_driver.c,1545 :: 		TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top, AProgressBar->Left + tmpRound  + tmpWidth * locPosition , AProgressBar->Top + AProgressBar->Height);
ADD	R1, R8, #8
LDRH	R6, [R1, #0]
ADD	R1, R8, #12
LDRH	R1, [R1, #0]
ADDS	R5, R6, R1
ADD	R1, R8, #6
LDRH	R4, [R1, #0]
LDRH	R1, [SP, #28]
ADDS	R3, R4, R1
UXTH	R3, R3
LDR	R2, [SP, #20]
LDRH	R1, [SP, #26]
MULS	R1, R2, R1
ADDS	R3, R3, R1
SXTH	R2, R6
ADDS	R1, R4, R7
STR	R8, [SP, #4]
STRH	R7, [SP, #8]
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
SXTH	R3, R5
BL	_TFT_Rectangle+0
LDRH	R7, [SP, #8]
LDR	R8, [SP, #4]
IT	AL
BAL	L_DrawProgressBar82
L_DrawProgressBar81:
;DCVA_GUI_driver.c,1547 :: 		TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top,  AProgressBar->Left + cnt + 3, AProgressBar->Top + AProgressBar->Height);
ADD	R1, R8, #8
LDRH	R5, [R1, #0]
ADD	R1, R8, #12
LDRH	R1, [R1, #0]
ADDS	R4, R5, R1
ADD	R1, R8, #6
LDRH	R1, [R1, #0]
ADDS	R3, R1, R7
UXTH	R3, R3
ADDS	R2, R3, #3
SXTH	R1, R5
STR	R8, [SP, #4]
STRH	R7, [SP, #8]
SXTH	R2, R2
SXTH	R0, R3
SXTH	R3, R4
BL	_TFT_Rectangle+0
LDRH	R7, [SP, #8]
LDR	R8, [SP, #4]
L_DrawProgressBar82:
;DCVA_GUI_driver.c,1548 :: 		cnt = cnt + move_offset + 3;
LDRSH	R1, [SP, #24]
ADDS	R1, R7, R1
UXTH	R1, R1
; cnt end address is: 28 (R7)
ADDS	R1, R1, #3
; cnt start address is: 40 (R10)
UXTH	R10, R1
;DCVA_GUI_driver.c,1549 :: 		}
; cnt end address is: 40 (R10)
UXTH	R7, R10
IT	AL
BAL	L_DrawProgressBar79
L_DrawProgressBar80:
;DCVA_GUI_driver.c,1550 :: 		}
MOV	R0, R8
IT	AL
BAL	L_DrawProgressBar76
; AProgressBar end address is: 32 (R8)
L__DrawProgressBar253:
;DCVA_GUI_driver.c,1531 :: 		if (AProgressBar->Smooth != 1) {
;DCVA_GUI_driver.c,1550 :: 		}
L_DrawProgressBar76:
;DCVA_GUI_driver.c,1552 :: 		if (AProgressBar->Show_Position == 1){
ADDW	R1, R0, #46
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawProgressBar83
;DCVA_GUI_driver.c,1553 :: 		if (AProgressBar->Show_Percentage == 1) {
ADDW	R1, R0, #47
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawProgressBar84
;DCVA_GUI_driver.c,1554 :: 		WordToStr(locPosition , tmpStr);
ADD	R1, SP, #10
STR	R0, [SP, #4]
LDR	R0, [SP, #20]
BL	_WordToStr+0
;DCVA_GUI_driver.c,1555 :: 		DeleteTrailingSpaces(tmpStr);
ADD	R1, SP, #10
MOV	R0, R1
BL	_DeleteTrailingSpaces+0
LDR	R0, [SP, #4]
;DCVA_GUI_driver.c,1556 :: 		strcpy(AProgressBar->Caption, tmpStr);
ADD	R2, SP, #10
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
BL	_strcpy+0
LDR	R0, [SP, #4]
;DCVA_GUI_driver.c,1557 :: 		strcat(AProgressBar->Caption, "\%");
MOVW	R2, #lo_addr(?lstr6_DCVA_GUI_driver+0)
MOVT	R2, #hi_addr(?lstr6_DCVA_GUI_driver+0)
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
LDR	R0, [SP, #4]
;DCVA_GUI_driver.c,1558 :: 		}
IT	AL
BAL	L_DrawProgressBar85
L_DrawProgressBar84:
;DCVA_GUI_driver.c,1560 :: 		WordToStr(AProgressBar->Position , tmpStr);
ADD	R2, SP, #10
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
MOV	R1, R2
BL	_WordToStr+0
;DCVA_GUI_driver.c,1561 :: 		DeleteTrailingSpaces(tmpStr);
ADD	R1, SP, #10
MOV	R0, R1
BL	_DeleteTrailingSpaces+0
LDR	R0, [SP, #4]
;DCVA_GUI_driver.c,1562 :: 		strcpy(AProgressBar->Caption, tmpStr);
ADD	R2, SP, #10
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
BL	_strcpy+0
LDR	R0, [SP, #4]
;DCVA_GUI_driver.c,1563 :: 		}
L_DrawProgressBar85:
;DCVA_GUI_driver.c,1564 :: 		TFT_Set_Ext_Font(AProgressBar->FontName, AProgressBar->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #28
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Ext_Font+0
LDR	R0, [SP, #4]
;DCVA_GUI_driver.c,1565 :: 		TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text_Return_Pos+0
LDR	R0, [SP, #4]
;DCVA_GUI_driver.c,1566 :: 		TFT_Write_Text(AProgressBar->Caption, AProgressBar->Left + (AProgressBar->Width - caption_length) / 2, AProgressBar->Top + (AProgressBar->Height - caption_height) / 2);
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
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R4
BL	_TFT_Write_Text+0
;DCVA_GUI_driver.c,1567 :: 		}
L_DrawProgressBar83:
;DCVA_GUI_driver.c,1568 :: 		}
L_DrawProgressBar71:
;DCVA_GUI_driver.c,1569 :: 		}
L_end_DrawProgressBar:
LDR	LR, [SP, #0]
ADD	SP, SP, #32
BX	LR
; end of _DrawProgressBar
_DrawScreen:
;DCVA_GUI_driver.c,1571 :: 		void DrawScreen(TScreen *aScreen) {
SUB	SP, SP, #80
STR	LR, [SP, #0]
;DCVA_GUI_driver.c,1589 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;DCVA_GUI_driver.c,1590 :: 		order = 0;
MOVS	R1, #0
STRH	R1, [SP, #4]
;DCVA_GUI_driver.c,1591 :: 		round_button_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #6]
;DCVA_GUI_driver.c,1592 :: 		label_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #12]
;DCVA_GUI_driver.c,1593 :: 		image_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #20]
;DCVA_GUI_driver.c,1594 :: 		circle_button_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #28]
;DCVA_GUI_driver.c,1595 :: 		box_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #36]
;DCVA_GUI_driver.c,1596 :: 		radio_button_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #44]
;DCVA_GUI_driver.c,1597 :: 		progress_bar_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #52]
;DCVA_GUI_driver.c,1598 :: 		CurrentScreen = aScreen;
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
STR	R0, [R1, #0]
;DCVA_GUI_driver.c,1600 :: 		if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
ADDS	R1, R0, #2
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen256
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
BNE	L__DrawScreen255
IT	AL
BAL	L_DrawScreen88
L__DrawScreen256:
L__DrawScreen255:
;DCVA_GUI_driver.c,1601 :: 		save_bled = TFT_BLED;
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
STR	R2, [SP, #76]
LDR	R1, [R2, #0]
STRB	R1, [SP, #60]
;DCVA_GUI_driver.c,1602 :: 		TFT_BLED           = 0;
MOVS	R1, #0
SXTB	R1, R1
STR	R1, [R2, #0]
;DCVA_GUI_driver.c,1603 :: 		TFT_Init(CurrentScreen->Width, CurrentScreen->Height);
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
STR	R3, [SP, #72]
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
;DCVA_GUI_driver.c,1604 :: 		TFT_Set_Ext_Buffer(TFT_Get_Data);
MOVW	R1, #lo_addr(_TFT_Get_Data+0)
MOVT	R1, #hi_addr(_TFT_Get_Data+0)
MOV	R0, R1
BL	_TFT_Set_Ext_Buffer+0
;DCVA_GUI_driver.c,1605 :: 		TP_TFT_Init(CurrentScreen->Width, CurrentScreen->Height, 8, 9);                                  // Initialize touch panel
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
;DCVA_GUI_driver.c,1606 :: 		TP_TFT_Set_ADC_Threshold(ADC_THRESHOLD);                              // Set touch panel ADC threshold
MOVW	R0, #1500
SXTH	R0, R0
BL	_TP_TFT_Set_ADC_Threshold+0
;DCVA_GUI_driver.c,1607 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
;DCVA_GUI_driver.c,1608 :: 		display_width = CurrentScreen->Width;
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
STRH	R2, [R1, #0]
;DCVA_GUI_driver.c,1609 :: 		display_height = CurrentScreen->Height;
LDR	R1, [SP, #72]
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
STRH	R2, [R1, #0]
;DCVA_GUI_driver.c,1610 :: 		TFT_BLED           = save_bled;
LDRB	R2, [SP, #60]
LDR	R1, [SP, #76]
STR	R2, [R1, #0]
;DCVA_GUI_driver.c,1611 :: 		}
IT	AL
BAL	L_DrawScreen89
L_DrawScreen88:
;DCVA_GUI_driver.c,1613 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
L_DrawScreen89:
;DCVA_GUI_driver.c,1616 :: 		while (order < CurrentScreen->ObjectsCount) {
L_DrawScreen90:
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #6
LDRH	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen91
;DCVA_GUI_driver.c,1617 :: 		if (round_button_idx < CurrentScreen->Buttons_RoundCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #8
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #6]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen92
;DCVA_GUI_driver.c,1618 :: 		local_round_button = GetRoundButton(round_button_idx);
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
;DCVA_GUI_driver.c,1619 :: 		if (order == local_round_button->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen93
;DCVA_GUI_driver.c,1620 :: 		round_button_idx++;
LDRB	R1, [SP, #6]
ADDS	R1, R1, #1
STRB	R1, [SP, #6]
;DCVA_GUI_driver.c,1621 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;DCVA_GUI_driver.c,1622 :: 		DrawRoundButton(local_round_button);
LDR	R0, [SP, #8]
BL	_DrawRoundButton+0
;DCVA_GUI_driver.c,1623 :: 		}
L_DrawScreen93:
;DCVA_GUI_driver.c,1624 :: 		}
L_DrawScreen92:
;DCVA_GUI_driver.c,1626 :: 		if (label_idx < CurrentScreen->LabelsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #16
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #12]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen94
;DCVA_GUI_driver.c,1627 :: 		local_label = GetLabel(label_idx);
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
;DCVA_GUI_driver.c,1628 :: 		if (order == local_label->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen95
;DCVA_GUI_driver.c,1629 :: 		label_idx++;
LDRB	R1, [SP, #12]
ADDS	R1, R1, #1
STRB	R1, [SP, #12]
;DCVA_GUI_driver.c,1630 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;DCVA_GUI_driver.c,1631 :: 		DrawLabel(local_label);
LDR	R0, [SP, #16]
BL	_DrawLabel+0
;DCVA_GUI_driver.c,1632 :: 		}
L_DrawScreen95:
;DCVA_GUI_driver.c,1633 :: 		}
L_DrawScreen94:
;DCVA_GUI_driver.c,1635 :: 		if (circle_button_idx < CurrentScreen->CircleButtonsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #32
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #28]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen96
;DCVA_GUI_driver.c,1636 :: 		local_circle_button = GetCircleButton(circle_button_idx);
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
;DCVA_GUI_driver.c,1637 :: 		if (order == local_circle_button->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen97
;DCVA_GUI_driver.c,1638 :: 		circle_button_idx++;
LDRB	R1, [SP, #28]
ADDS	R1, R1, #1
STRB	R1, [SP, #28]
;DCVA_GUI_driver.c,1639 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;DCVA_GUI_driver.c,1640 :: 		DrawCircleButton(local_circle_button);
LDR	R0, [SP, #32]
BL	_DrawCircleButton+0
;DCVA_GUI_driver.c,1641 :: 		}
L_DrawScreen97:
;DCVA_GUI_driver.c,1642 :: 		}
L_DrawScreen96:
;DCVA_GUI_driver.c,1644 :: 		if (box_idx < CurrentScreen->BoxesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #40
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #36]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen98
;DCVA_GUI_driver.c,1645 :: 		local_box = GetBox(box_idx);
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
;DCVA_GUI_driver.c,1646 :: 		if (order == local_box->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen99
;DCVA_GUI_driver.c,1647 :: 		box_idx++;
LDRB	R1, [SP, #36]
ADDS	R1, R1, #1
STRB	R1, [SP, #36]
;DCVA_GUI_driver.c,1648 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;DCVA_GUI_driver.c,1649 :: 		DrawBox(local_box);
LDR	R0, [SP, #40]
BL	_DrawBox+0
;DCVA_GUI_driver.c,1650 :: 		}
L_DrawScreen99:
;DCVA_GUI_driver.c,1651 :: 		}
L_DrawScreen98:
;DCVA_GUI_driver.c,1653 :: 		if (image_idx < CurrentScreen->ImagesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #24
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #20]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen100
;DCVA_GUI_driver.c,1654 :: 		local_image = GetImage(image_idx);
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
;DCVA_GUI_driver.c,1655 :: 		if (order == local_image->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen101
;DCVA_GUI_driver.c,1656 :: 		image_idx++;
LDRB	R1, [SP, #20]
ADDS	R1, R1, #1
STRB	R1, [SP, #20]
;DCVA_GUI_driver.c,1657 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;DCVA_GUI_driver.c,1658 :: 		DrawImage(local_image);
LDR	R0, [SP, #24]
BL	_DrawImage+0
;DCVA_GUI_driver.c,1659 :: 		}
L_DrawScreen101:
;DCVA_GUI_driver.c,1660 :: 		}
L_DrawScreen100:
;DCVA_GUI_driver.c,1662 :: 		if (radio_button_idx < CurrentScreen->RadioButtonsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #48
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #44]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen102
;DCVA_GUI_driver.c,1663 :: 		local_radio_button = GetRadioButton(radio_button_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #52
LDR	R2, [R1, #0]
LDRB	R1, [SP, #44]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #48]
;DCVA_GUI_driver.c,1664 :: 		if (order == local_radio_button->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen103
;DCVA_GUI_driver.c,1665 :: 		radio_button_idx++;
LDRB	R1, [SP, #44]
ADDS	R1, R1, #1
STRB	R1, [SP, #44]
;DCVA_GUI_driver.c,1666 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;DCVA_GUI_driver.c,1667 :: 		DrawRadioButton(local_radio_button);
LDR	R0, [SP, #48]
BL	_DrawRadioButton+0
;DCVA_GUI_driver.c,1668 :: 		}
L_DrawScreen103:
;DCVA_GUI_driver.c,1669 :: 		}
L_DrawScreen102:
;DCVA_GUI_driver.c,1671 :: 		if (progress_bar_idx < CurrentScreen->ProgressBarsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #56
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #52]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen104
;DCVA_GUI_driver.c,1672 :: 		local_progress_bar = GetProgressBar(progress_bar_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #60
LDR	R2, [R1, #0]
LDRB	R1, [SP, #52]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #56]
;DCVA_GUI_driver.c,1673 :: 		if (order == local_progress_bar->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen105
;DCVA_GUI_driver.c,1674 :: 		progress_bar_idx++;
LDRB	R1, [SP, #52]
ADDS	R1, R1, #1
STRB	R1, [SP, #52]
;DCVA_GUI_driver.c,1675 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;DCVA_GUI_driver.c,1676 :: 		DrawProgressBar(local_progress_bar);
LDR	R0, [SP, #56]
BL	_DrawProgressBar+0
;DCVA_GUI_driver.c,1677 :: 		}
L_DrawScreen105:
;DCVA_GUI_driver.c,1678 :: 		}
L_DrawScreen104:
;DCVA_GUI_driver.c,1680 :: 		}
IT	AL
BAL	L_DrawScreen90
L_DrawScreen91:
;DCVA_GUI_driver.c,1681 :: 		}
L_end_DrawScreen:
LDR	LR, [SP, #0]
ADD	SP, SP, #80
BX	LR
; end of _DrawScreen
_Get_Object:
;DCVA_GUI_driver.c,1683 :: 		void Get_Object(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; Y start address is: 4 (R1)
;DCVA_GUI_driver.c,1684 :: 		round_button_order  = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
STRH	R3, [R2, #0]
;DCVA_GUI_driver.c,1685 :: 		label_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;DCVA_GUI_driver.c,1686 :: 		image_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
STRH	R3, [R2, #0]
;DCVA_GUI_driver.c,1687 :: 		circle_button_order = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_circle_button_order+0)
MOVT	R2, #hi_addr(_circle_button_order+0)
STRH	R3, [R2, #0]
;DCVA_GUI_driver.c,1688 :: 		box_order           = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
STRH	R3, [R2, #0]
;DCVA_GUI_driver.c,1689 :: 		radio_button_order  = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
STRH	R3, [R2, #0]
;DCVA_GUI_driver.c,1691 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 4 (R1)
UXTH	R8, R0
UXTH	R7, R1
L_Get_Object106:
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
BCS	L_Get_Object107
;DCVA_GUI_driver.c,1692 :: 		local_round_button = GetRoundButton(_object_count);
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
;DCVA_GUI_driver.c,1693 :: 		if (local_round_button->Active == 1) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object109
;DCVA_GUI_driver.c,1695 :: 		local_round_button->Width, local_round_button->Height) == 1) {
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
;DCVA_GUI_driver.c,1694 :: 		if (IsInsideObject(X, Y, local_round_button->Left, local_round_button->Top,
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
;DCVA_GUI_driver.c,1695 :: 		local_round_button->Width, local_round_button->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	DCVA_GUI_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object110
;DCVA_GUI_driver.c,1696 :: 		round_button_order = local_round_button->Order;
MOVW	R4, #lo_addr(_local_round_button+0)
MOVT	R4, #hi_addr(_local_round_button+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
STRH	R3, [R2, #0]
;DCVA_GUI_driver.c,1697 :: 		exec_round_button = local_round_button;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1698 :: 		}
L_Get_Object110:
;DCVA_GUI_driver.c,1699 :: 		}
L_Get_Object109:
;DCVA_GUI_driver.c,1691 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;DCVA_GUI_driver.c,1700 :: 		}
IT	AL
BAL	L_Get_Object106
L_Get_Object107:
;DCVA_GUI_driver.c,1703 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
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
L_Get_Object111:
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
BCS	L_Get_Object112
;DCVA_GUI_driver.c,1704 :: 		local_label = GetLabel(_object_count);
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
;DCVA_GUI_driver.c,1705 :: 		if (local_label->Active == 1) {
ADDW	R2, R3, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object114
;DCVA_GUI_driver.c,1707 :: 		local_label->Width, local_label->Height) == 1) {
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
;DCVA_GUI_driver.c,1706 :: 		if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
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
;DCVA_GUI_driver.c,1707 :: 		local_label->Width, local_label->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	DCVA_GUI_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object115
;DCVA_GUI_driver.c,1708 :: 		label_order = local_label->Order;
MOVW	R4, #lo_addr(_local_label+0)
MOVT	R4, #hi_addr(_local_label+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;DCVA_GUI_driver.c,1709 :: 		exec_label = local_label;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1710 :: 		}
L_Get_Object115:
;DCVA_GUI_driver.c,1711 :: 		}
L_Get_Object114:
;DCVA_GUI_driver.c,1703 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;DCVA_GUI_driver.c,1712 :: 		}
IT	AL
BAL	L_Get_Object111
L_Get_Object112:
;DCVA_GUI_driver.c,1715 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
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
L_Get_Object116:
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
BCS	L_Get_Object117
;DCVA_GUI_driver.c,1716 :: 		local_image = GetImage(_object_count);
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
;DCVA_GUI_driver.c,1717 :: 		if (local_image->Active == 1) {
ADDW	R2, R3, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object119
;DCVA_GUI_driver.c,1719 :: 		local_image->Width, local_image->Height) == 1) {
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
;DCVA_GUI_driver.c,1718 :: 		if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
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
;DCVA_GUI_driver.c,1719 :: 		local_image->Width, local_image->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	DCVA_GUI_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object120
;DCVA_GUI_driver.c,1720 :: 		image_order = local_image->Order;
MOVW	R4, #lo_addr(_local_image+0)
MOVT	R4, #hi_addr(_local_image+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
STRH	R3, [R2, #0]
;DCVA_GUI_driver.c,1721 :: 		exec_image = local_image;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1722 :: 		}
L_Get_Object120:
;DCVA_GUI_driver.c,1723 :: 		}
L_Get_Object119:
;DCVA_GUI_driver.c,1715 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;DCVA_GUI_driver.c,1724 :: 		}
IT	AL
BAL	L_Get_Object116
L_Get_Object117:
;DCVA_GUI_driver.c,1727 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CircleButtonsCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
L_Get_Object121:
; X start address is: 32 (R8)
; Y start address is: 28 (R7)
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
BCS	L_Get_Object122
;DCVA_GUI_driver.c,1728 :: 		local_circle_button = GetCircleButton(_object_count);
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
MOVW	R2, #lo_addr(_local_circle_button+0)
MOVT	R2, #hi_addr(_local_circle_button+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1729 :: 		if (local_circle_button->Active == 1) {
ADDW	R2, R3, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object124
;DCVA_GUI_driver.c,1731 :: 		(local_circle_button->Radius * 2), (local_circle_button->Radius * 2)) == 1) {
MOVW	R5, #lo_addr(_local_circle_button+0)
MOVT	R5, #hi_addr(_local_circle_button+0)
LDR	R2, [R5, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
LSLS	R4, R2, #1
UXTH	R4, R4
;DCVA_GUI_driver.c,1730 :: 		if (IsInsideObject(X, Y, local_circle_button->Left, local_circle_button->Top,
MOV	R2, R5
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R5
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;DCVA_GUI_driver.c,1731 :: 		(local_circle_button->Radius * 2), (local_circle_button->Radius * 2)) == 1) {
PUSH	(R4)
PUSH	(R4)
BL	DCVA_GUI_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object125
;DCVA_GUI_driver.c,1732 :: 		circle_button_order = local_circle_button->Order;
MOVW	R4, #lo_addr(_local_circle_button+0)
MOVT	R4, #hi_addr(_local_circle_button+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_circle_button_order+0)
MOVT	R2, #hi_addr(_circle_button_order+0)
STRH	R3, [R2, #0]
;DCVA_GUI_driver.c,1733 :: 		exec_circle_button = local_circle_button;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1734 :: 		}
L_Get_Object125:
;DCVA_GUI_driver.c,1735 :: 		}
L_Get_Object124:
;DCVA_GUI_driver.c,1727 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CircleButtonsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;DCVA_GUI_driver.c,1736 :: 		}
IT	AL
BAL	L_Get_Object121
L_Get_Object122:
;DCVA_GUI_driver.c,1739 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
L_Get_Object126:
; Y start address is: 28 (R7)
; X start address is: 32 (R8)
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
BCS	L_Get_Object127
;DCVA_GUI_driver.c,1740 :: 		local_box = GetBox(_object_count);
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
MOVW	R2, #lo_addr(_local_box+0)
MOVT	R2, #hi_addr(_local_box+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1741 :: 		if (local_box->Active == 1) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object129
;DCVA_GUI_driver.c,1743 :: 		local_box->Width, local_box->Height) == 1) {
MOVW	R6, #lo_addr(_local_box+0)
MOVT	R6, #hi_addr(_local_box+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;DCVA_GUI_driver.c,1742 :: 		if (IsInsideObject(X, Y, local_box->Left, local_box->Top,
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
;DCVA_GUI_driver.c,1743 :: 		local_box->Width, local_box->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	DCVA_GUI_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object130
;DCVA_GUI_driver.c,1744 :: 		box_order = local_box->Order;
MOVW	R4, #lo_addr(_local_box+0)
MOVT	R4, #hi_addr(_local_box+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
STRH	R3, [R2, #0]
;DCVA_GUI_driver.c,1745 :: 		exec_box = local_box;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1746 :: 		}
L_Get_Object130:
;DCVA_GUI_driver.c,1747 :: 		}
L_Get_Object129:
;DCVA_GUI_driver.c,1739 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;DCVA_GUI_driver.c,1748 :: 		}
IT	AL
BAL	L_Get_Object126
L_Get_Object127:
;DCVA_GUI_driver.c,1751 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->RadioButtonsCount ; _object_count++ ) {
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
L_Get_Object131:
; Y start address is: 32 (R8)
; X start address is: 28 (R7)
; X start address is: 28 (R7)
; X end address is: 28 (R7)
; Y start address is: 32 (R8)
; Y end address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #48
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object132
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
;DCVA_GUI_driver.c,1752 :: 		local_radio_button = GetRadioButton(_object_count);
; Y start address is: 32 (R8)
; X start address is: 28 (R7)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #52
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
;DCVA_GUI_driver.c,1753 :: 		if (local_radio_button->Active == 1) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object134
;DCVA_GUI_driver.c,1755 :: 		local_radio_button->Width, local_radio_button->Height) == 1) {
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
;DCVA_GUI_driver.c,1754 :: 		if (IsInsideObject(X, Y, local_radio_button->Left, local_radio_button->Top,
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
;DCVA_GUI_driver.c,1755 :: 		local_radio_button->Width, local_radio_button->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	DCVA_GUI_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object135
;DCVA_GUI_driver.c,1756 :: 		radio_button_order = local_radio_button->Order;
MOVW	R4, #lo_addr(_local_radio_button+0)
MOVT	R4, #hi_addr(_local_radio_button+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
STRH	R3, [R2, #0]
;DCVA_GUI_driver.c,1757 :: 		exec_radio_button = local_radio_button;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1758 :: 		}
L_Get_Object135:
;DCVA_GUI_driver.c,1759 :: 		}
L_Get_Object134:
;DCVA_GUI_driver.c,1751 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->RadioButtonsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;DCVA_GUI_driver.c,1760 :: 		}
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
IT	AL
BAL	L_Get_Object131
L_Get_Object132:
;DCVA_GUI_driver.c,1762 :: 		_object_count = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
;DCVA_GUI_driver.c,1763 :: 		if (round_button_order >  _object_count )
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	LE
BLE	L_Get_Object136
;DCVA_GUI_driver.c,1764 :: 		_object_count = round_button_order;
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object136:
;DCVA_GUI_driver.c,1765 :: 		if (label_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object137
;DCVA_GUI_driver.c,1766 :: 		_object_count = label_order;
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object137:
;DCVA_GUI_driver.c,1767 :: 		if (image_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object138
;DCVA_GUI_driver.c,1768 :: 		_object_count = image_order;
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object138:
;DCVA_GUI_driver.c,1769 :: 		if (circle_button_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_circle_button_order+0)
MOVT	R2, #hi_addr(_circle_button_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object139
;DCVA_GUI_driver.c,1770 :: 		_object_count = circle_button_order;
MOVW	R2, #lo_addr(_circle_button_order+0)
MOVT	R2, #hi_addr(_circle_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object139:
;DCVA_GUI_driver.c,1771 :: 		if (box_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object140
;DCVA_GUI_driver.c,1772 :: 		_object_count = box_order;
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object140:
;DCVA_GUI_driver.c,1773 :: 		if (radio_button_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object141
;DCVA_GUI_driver.c,1774 :: 		_object_count = radio_button_order;
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object141:
;DCVA_GUI_driver.c,1775 :: 		}
L_end_Get_Object:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Get_Object
DCVA_GUI_driver_Process_TP_Press:
;DCVA_GUI_driver.c,1778 :: 		static void Process_TP_Press(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; Y start address is: 4 (R1)
;DCVA_GUI_driver.c,1779 :: 		exec_round_button   = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1780 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1781 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1782 :: 		exec_circle_button  = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1783 :: 		exec_box            = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1784 :: 		exec_radio_button   = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1786 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
BL	_Get_Object+0
;DCVA_GUI_driver.c,1788 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Press142
;DCVA_GUI_driver.c,1789 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Press143
;DCVA_GUI_driver.c,1790 :: 		if (exec_round_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Press144
;DCVA_GUI_driver.c,1791 :: 		if (exec_round_button->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Press145
;DCVA_GUI_driver.c,1792 :: 		exec_round_button->OnPressPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R2, [R4, #0]
BLX	R2
;DCVA_GUI_driver.c,1793 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;DCVA_GUI_driver.c,1794 :: 		}
L_DCVA_GUI_driver_Process_TP_Press145:
;DCVA_GUI_driver.c,1795 :: 		}
L_DCVA_GUI_driver_Process_TP_Press144:
;DCVA_GUI_driver.c,1796 :: 		}
L_DCVA_GUI_driver_Process_TP_Press143:
;DCVA_GUI_driver.c,1798 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Press146
;DCVA_GUI_driver.c,1799 :: 		if (exec_label->Active == 1) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Press147
;DCVA_GUI_driver.c,1800 :: 		if (exec_label->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Press148
;DCVA_GUI_driver.c,1801 :: 		exec_label->OnPressPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
;DCVA_GUI_driver.c,1802 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;DCVA_GUI_driver.c,1803 :: 		}
L_DCVA_GUI_driver_Process_TP_Press148:
;DCVA_GUI_driver.c,1804 :: 		}
L_DCVA_GUI_driver_Process_TP_Press147:
;DCVA_GUI_driver.c,1805 :: 		}
L_DCVA_GUI_driver_Process_TP_Press146:
;DCVA_GUI_driver.c,1807 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Press149
;DCVA_GUI_driver.c,1808 :: 		if (exec_image->Active == 1) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Press150
;DCVA_GUI_driver.c,1809 :: 		if (exec_image->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Press151
;DCVA_GUI_driver.c,1810 :: 		exec_image->OnPressPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;DCVA_GUI_driver.c,1811 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;DCVA_GUI_driver.c,1812 :: 		}
L_DCVA_GUI_driver_Process_TP_Press151:
;DCVA_GUI_driver.c,1813 :: 		}
L_DCVA_GUI_driver_Process_TP_Press150:
;DCVA_GUI_driver.c,1814 :: 		}
L_DCVA_GUI_driver_Process_TP_Press149:
;DCVA_GUI_driver.c,1816 :: 		if (_object_count == circle_button_order) {
MOVW	R2, #lo_addr(_circle_button_order+0)
MOVT	R2, #hi_addr(_circle_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Press152
;DCVA_GUI_driver.c,1817 :: 		if (exec_circle_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Press153
;DCVA_GUI_driver.c,1818 :: 		if (exec_circle_button->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Press154
;DCVA_GUI_driver.c,1819 :: 		exec_circle_button->OnPressPtr();
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R2, [R4, #0]
BLX	R2
;DCVA_GUI_driver.c,1820 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;DCVA_GUI_driver.c,1821 :: 		}
L_DCVA_GUI_driver_Process_TP_Press154:
;DCVA_GUI_driver.c,1822 :: 		}
L_DCVA_GUI_driver_Process_TP_Press153:
;DCVA_GUI_driver.c,1823 :: 		}
L_DCVA_GUI_driver_Process_TP_Press152:
;DCVA_GUI_driver.c,1825 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Press155
;DCVA_GUI_driver.c,1826 :: 		if (exec_box->Active == 1) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Press156
;DCVA_GUI_driver.c,1827 :: 		if (exec_box->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Press157
;DCVA_GUI_driver.c,1828 :: 		exec_box->OnPressPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R2, [R4, #0]
BLX	R2
;DCVA_GUI_driver.c,1829 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;DCVA_GUI_driver.c,1830 :: 		}
L_DCVA_GUI_driver_Process_TP_Press157:
;DCVA_GUI_driver.c,1831 :: 		}
L_DCVA_GUI_driver_Process_TP_Press156:
;DCVA_GUI_driver.c,1832 :: 		}
L_DCVA_GUI_driver_Process_TP_Press155:
;DCVA_GUI_driver.c,1834 :: 		if (_object_count == radio_button_order) {
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Press158
;DCVA_GUI_driver.c,1835 :: 		if (exec_radio_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Press159
;DCVA_GUI_driver.c,1836 :: 		if (exec_radio_button->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Press160
;DCVA_GUI_driver.c,1837 :: 		exec_radio_button->OnPressPtr();
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R2, [R4, #0]
BLX	R2
;DCVA_GUI_driver.c,1838 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;DCVA_GUI_driver.c,1839 :: 		}
L_DCVA_GUI_driver_Process_TP_Press160:
;DCVA_GUI_driver.c,1840 :: 		}
L_DCVA_GUI_driver_Process_TP_Press159:
;DCVA_GUI_driver.c,1841 :: 		}
L_DCVA_GUI_driver_Process_TP_Press158:
;DCVA_GUI_driver.c,1843 :: 		}
L_DCVA_GUI_driver_Process_TP_Press142:
;DCVA_GUI_driver.c,1844 :: 		}
L_end_Process_TP_Press:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of DCVA_GUI_driver_Process_TP_Press
DCVA_GUI_driver_Process_TP_Up:
;DCVA_GUI_driver.c,1846 :: 		static void Process_TP_Up(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; Y start address is: 4 (R1)
;DCVA_GUI_driver.c,1848 :: 		switch (PressedObjectType) {
IT	AL
BAL	L_DCVA_GUI_driver_Process_TP_Up161
;DCVA_GUI_driver.c,1850 :: 		case 1: {
L_DCVA_GUI_driver_Process_TP_Up163:
;DCVA_GUI_driver.c,1851 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Up164
;DCVA_GUI_driver.c,1852 :: 		exec_round_button = (TButton_Round*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1853 :: 		if ((exec_round_button->PressColEnabled == 1) && (exec_round_button->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #47
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Up262
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Up261
L_DCVA_GUI_driver_Process_TP_Up260:
;DCVA_GUI_driver.c,1854 :: 		DrawRoundButton(exec_round_button);
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawRoundButton+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;DCVA_GUI_driver.c,1853 :: 		if ((exec_round_button->PressColEnabled == 1) && (exec_round_button->OwnerScreen == CurrentScreen)) {
L_DCVA_GUI_driver_Process_TP_Up262:
L_DCVA_GUI_driver_Process_TP_Up261:
;DCVA_GUI_driver.c,1856 :: 		break;
IT	AL
BAL	L_DCVA_GUI_driver_Process_TP_Up162
;DCVA_GUI_driver.c,1857 :: 		}
L_DCVA_GUI_driver_Process_TP_Up164:
;DCVA_GUI_driver.c,1858 :: 		break;
IT	AL
BAL	L_DCVA_GUI_driver_Process_TP_Up162
;DCVA_GUI_driver.c,1861 :: 		case 5: {
L_DCVA_GUI_driver_Process_TP_Up168:
;DCVA_GUI_driver.c,1862 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Up169
;DCVA_GUI_driver.c,1863 :: 		exec_circle_button = (TCircleButton*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1864 :: 		if ((exec_circle_button->PressColEnabled == 1) && (exec_circle_button->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #42
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Up264
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Up263
L_DCVA_GUI_driver_Process_TP_Up259:
;DCVA_GUI_driver.c,1865 :: 		DrawCircleButton(exec_circle_button);
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawCircleButton+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;DCVA_GUI_driver.c,1864 :: 		if ((exec_circle_button->PressColEnabled == 1) && (exec_circle_button->OwnerScreen == CurrentScreen)) {
L_DCVA_GUI_driver_Process_TP_Up264:
L_DCVA_GUI_driver_Process_TP_Up263:
;DCVA_GUI_driver.c,1867 :: 		break;
IT	AL
BAL	L_DCVA_GUI_driver_Process_TP_Up162
;DCVA_GUI_driver.c,1868 :: 		}
L_DCVA_GUI_driver_Process_TP_Up169:
;DCVA_GUI_driver.c,1869 :: 		break;
IT	AL
BAL	L_DCVA_GUI_driver_Process_TP_Up162
;DCVA_GUI_driver.c,1872 :: 		case 6: {
L_DCVA_GUI_driver_Process_TP_Up173:
;DCVA_GUI_driver.c,1873 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Up174
;DCVA_GUI_driver.c,1874 :: 		exec_box = (TBox*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1875 :: 		if ((exec_box->PressColEnabled == 1) && (exec_box->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #30
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Up266
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Up265
L_DCVA_GUI_driver_Process_TP_Up258:
;DCVA_GUI_driver.c,1876 :: 		DrawBox(exec_box);
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawBox+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;DCVA_GUI_driver.c,1875 :: 		if ((exec_box->PressColEnabled == 1) && (exec_box->OwnerScreen == CurrentScreen)) {
L_DCVA_GUI_driver_Process_TP_Up266:
L_DCVA_GUI_driver_Process_TP_Up265:
;DCVA_GUI_driver.c,1878 :: 		break;
IT	AL
BAL	L_DCVA_GUI_driver_Process_TP_Up162
;DCVA_GUI_driver.c,1879 :: 		}
L_DCVA_GUI_driver_Process_TP_Up174:
;DCVA_GUI_driver.c,1880 :: 		break;
IT	AL
BAL	L_DCVA_GUI_driver_Process_TP_Up162
;DCVA_GUI_driver.c,1883 :: 		case 17: {
L_DCVA_GUI_driver_Process_TP_Up178:
;DCVA_GUI_driver.c,1884 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Up179
;DCVA_GUI_driver.c,1885 :: 		exec_radio_button = (TRadioButton*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1886 :: 		if ((exec_radio_button->PressColEnabled == 1) && (exec_radio_button->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #48
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Up268
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Up267
L_DCVA_GUI_driver_Process_TP_Up257:
;DCVA_GUI_driver.c,1887 :: 		DrawRadioButton(exec_radio_button);
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawRadioButton+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;DCVA_GUI_driver.c,1886 :: 		if ((exec_radio_button->PressColEnabled == 1) && (exec_radio_button->OwnerScreen == CurrentScreen)) {
L_DCVA_GUI_driver_Process_TP_Up268:
L_DCVA_GUI_driver_Process_TP_Up267:
;DCVA_GUI_driver.c,1889 :: 		break;
IT	AL
BAL	L_DCVA_GUI_driver_Process_TP_Up162
;DCVA_GUI_driver.c,1890 :: 		}
L_DCVA_GUI_driver_Process_TP_Up179:
;DCVA_GUI_driver.c,1891 :: 		break;
IT	AL
BAL	L_DCVA_GUI_driver_Process_TP_Up162
;DCVA_GUI_driver.c,1893 :: 		}
L_DCVA_GUI_driver_Process_TP_Up161:
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #1
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Up163
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #5
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Up168
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #6
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Up173
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #17
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Up178
; Y end address is: 4 (R1)
L_DCVA_GUI_driver_Process_TP_Up162:
;DCVA_GUI_driver.c,1895 :: 		exec_label          = 0;
; Y start address is: 4 (R1)
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1896 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1898 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
BL	_Get_Object+0
;DCVA_GUI_driver.c,1901 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Up183
;DCVA_GUI_driver.c,1903 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Up184
;DCVA_GUI_driver.c,1904 :: 		if (exec_round_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Up185
;DCVA_GUI_driver.c,1905 :: 		if (exec_round_button->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Up186
;DCVA_GUI_driver.c,1906 :: 		exec_round_button->OnUpPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R2, [R4, #0]
BLX	R2
L_DCVA_GUI_driver_Process_TP_Up186:
;DCVA_GUI_driver.c,1907 :: 		if (PressedObject == (void *)exec_round_button)
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Up187
;DCVA_GUI_driver.c,1908 :: 		if (exec_round_button->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Up188
;DCVA_GUI_driver.c,1909 :: 		exec_round_button->OnClickPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R2, [R4, #0]
BLX	R2
L_DCVA_GUI_driver_Process_TP_Up188:
L_DCVA_GUI_driver_Process_TP_Up187:
;DCVA_GUI_driver.c,1910 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1911 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;DCVA_GUI_driver.c,1912 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;DCVA_GUI_driver.c,1913 :: 		}
L_DCVA_GUI_driver_Process_TP_Up185:
;DCVA_GUI_driver.c,1914 :: 		}
L_DCVA_GUI_driver_Process_TP_Up184:
;DCVA_GUI_driver.c,1917 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Up189
;DCVA_GUI_driver.c,1918 :: 		if (exec_label->Active == 1) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Up190
;DCVA_GUI_driver.c,1919 :: 		if (exec_label->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Up191
;DCVA_GUI_driver.c,1920 :: 		exec_label->OnUpPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R2, [R4, #0]
BLX	R2
L_DCVA_GUI_driver_Process_TP_Up191:
;DCVA_GUI_driver.c,1921 :: 		if (PressedObject == (void *)exec_label)
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Up192
;DCVA_GUI_driver.c,1922 :: 		if (exec_label->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Up193
;DCVA_GUI_driver.c,1923 :: 		exec_label->OnClickPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
L_DCVA_GUI_driver_Process_TP_Up193:
L_DCVA_GUI_driver_Process_TP_Up192:
;DCVA_GUI_driver.c,1924 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1925 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;DCVA_GUI_driver.c,1926 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;DCVA_GUI_driver.c,1927 :: 		}
L_DCVA_GUI_driver_Process_TP_Up190:
;DCVA_GUI_driver.c,1928 :: 		}
L_DCVA_GUI_driver_Process_TP_Up189:
;DCVA_GUI_driver.c,1931 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Up194
;DCVA_GUI_driver.c,1932 :: 		if (exec_image->Active == 1) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Up195
;DCVA_GUI_driver.c,1933 :: 		if (exec_image->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Up196
;DCVA_GUI_driver.c,1934 :: 		exec_image->OnUpPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R2, [R4, #0]
BLX	R2
L_DCVA_GUI_driver_Process_TP_Up196:
;DCVA_GUI_driver.c,1935 :: 		if (PressedObject == (void *)exec_image)
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Up197
;DCVA_GUI_driver.c,1936 :: 		if (exec_image->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Up198
;DCVA_GUI_driver.c,1937 :: 		exec_image->OnClickPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_DCVA_GUI_driver_Process_TP_Up198:
L_DCVA_GUI_driver_Process_TP_Up197:
;DCVA_GUI_driver.c,1938 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1939 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;DCVA_GUI_driver.c,1940 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;DCVA_GUI_driver.c,1941 :: 		}
L_DCVA_GUI_driver_Process_TP_Up195:
;DCVA_GUI_driver.c,1942 :: 		}
L_DCVA_GUI_driver_Process_TP_Up194:
;DCVA_GUI_driver.c,1945 :: 		if (_object_count == circle_button_order) {
MOVW	R2, #lo_addr(_circle_button_order+0)
MOVT	R2, #hi_addr(_circle_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Up199
;DCVA_GUI_driver.c,1946 :: 		if (exec_circle_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Up200
;DCVA_GUI_driver.c,1947 :: 		if (exec_circle_button->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Up201
;DCVA_GUI_driver.c,1948 :: 		exec_circle_button->OnUpPtr();
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R2, [R4, #0]
BLX	R2
L_DCVA_GUI_driver_Process_TP_Up201:
;DCVA_GUI_driver.c,1949 :: 		if (PressedObject == (void *)exec_circle_button)
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Up202
;DCVA_GUI_driver.c,1950 :: 		if (exec_circle_button->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Up203
;DCVA_GUI_driver.c,1951 :: 		exec_circle_button->OnClickPtr();
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R2, [R4, #0]
BLX	R2
L_DCVA_GUI_driver_Process_TP_Up203:
L_DCVA_GUI_driver_Process_TP_Up202:
;DCVA_GUI_driver.c,1952 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1953 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;DCVA_GUI_driver.c,1954 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;DCVA_GUI_driver.c,1955 :: 		}
L_DCVA_GUI_driver_Process_TP_Up200:
;DCVA_GUI_driver.c,1956 :: 		}
L_DCVA_GUI_driver_Process_TP_Up199:
;DCVA_GUI_driver.c,1959 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Up204
;DCVA_GUI_driver.c,1960 :: 		if (exec_box->Active == 1) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Up205
;DCVA_GUI_driver.c,1961 :: 		if (exec_box->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Up206
;DCVA_GUI_driver.c,1962 :: 		exec_box->OnUpPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
L_DCVA_GUI_driver_Process_TP_Up206:
;DCVA_GUI_driver.c,1963 :: 		if (PressedObject == (void *)exec_box)
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Up207
;DCVA_GUI_driver.c,1964 :: 		if (exec_box->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Up208
;DCVA_GUI_driver.c,1965 :: 		exec_box->OnClickPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
L_DCVA_GUI_driver_Process_TP_Up208:
L_DCVA_GUI_driver_Process_TP_Up207:
;DCVA_GUI_driver.c,1966 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1967 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;DCVA_GUI_driver.c,1968 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;DCVA_GUI_driver.c,1969 :: 		}
L_DCVA_GUI_driver_Process_TP_Up205:
;DCVA_GUI_driver.c,1970 :: 		}
L_DCVA_GUI_driver_Process_TP_Up204:
;DCVA_GUI_driver.c,1973 :: 		if (_object_count == radio_button_order) {
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Up209
;DCVA_GUI_driver.c,1974 :: 		if (exec_radio_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Up210
;DCVA_GUI_driver.c,1975 :: 		if (exec_radio_button->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Up211
;DCVA_GUI_driver.c,1976 :: 		exec_radio_button->OnUpPtr();
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R2, [R4, #0]
BLX	R2
L_DCVA_GUI_driver_Process_TP_Up211:
;DCVA_GUI_driver.c,1977 :: 		if (PressedObject == (void *)exec_radio_button)
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Up212
;DCVA_GUI_driver.c,1978 :: 		if (exec_radio_button->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Up213
;DCVA_GUI_driver.c,1979 :: 		exec_radio_button->OnClickPtr();
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R2, [R4, #0]
BLX	R2
L_DCVA_GUI_driver_Process_TP_Up213:
L_DCVA_GUI_driver_Process_TP_Up212:
;DCVA_GUI_driver.c,1980 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1981 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;DCVA_GUI_driver.c,1982 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;DCVA_GUI_driver.c,1983 :: 		}
L_DCVA_GUI_driver_Process_TP_Up210:
;DCVA_GUI_driver.c,1984 :: 		}
L_DCVA_GUI_driver_Process_TP_Up209:
;DCVA_GUI_driver.c,1986 :: 		}
L_DCVA_GUI_driver_Process_TP_Up183:
;DCVA_GUI_driver.c,1987 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1988 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;DCVA_GUI_driver.c,1989 :: 		}
L_end_Process_TP_Up:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of DCVA_GUI_driver_Process_TP_Up
DCVA_GUI_driver_Process_TP_Down:
;DCVA_GUI_driver.c,1991 :: 		static void Process_TP_Down(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; Y start address is: 4 (R1)
;DCVA_GUI_driver.c,1993 :: 		object_pressed      = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;DCVA_GUI_driver.c,1994 :: 		exec_round_button   = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1995 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1996 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1997 :: 		exec_circle_button  = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1998 :: 		exec_box            = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,1999 :: 		exec_radio_button   = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,2001 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
BL	_Get_Object+0
;DCVA_GUI_driver.c,2003 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Down214
;DCVA_GUI_driver.c,2004 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Down215
;DCVA_GUI_driver.c,2005 :: 		if (exec_round_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Down216
;DCVA_GUI_driver.c,2006 :: 		if (exec_round_button->PressColEnabled == 1) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #47
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Down217
;DCVA_GUI_driver.c,2007 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;DCVA_GUI_driver.c,2008 :: 		DrawRoundButton(exec_round_button);
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawRoundButton+0
;DCVA_GUI_driver.c,2009 :: 		}
L_DCVA_GUI_driver_Process_TP_Down217:
;DCVA_GUI_driver.c,2010 :: 		PressedObject = (void *)exec_round_button;
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,2011 :: 		PressedObjectType = 1;
MOVS	R3, #1
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;DCVA_GUI_driver.c,2012 :: 		if (exec_round_button->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Down218
;DCVA_GUI_driver.c,2013 :: 		exec_round_button->OnDownPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R2, [R4, #0]
BLX	R2
;DCVA_GUI_driver.c,2014 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;DCVA_GUI_driver.c,2015 :: 		}
L_DCVA_GUI_driver_Process_TP_Down218:
;DCVA_GUI_driver.c,2016 :: 		}
L_DCVA_GUI_driver_Process_TP_Down216:
;DCVA_GUI_driver.c,2017 :: 		}
L_DCVA_GUI_driver_Process_TP_Down215:
;DCVA_GUI_driver.c,2019 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Down219
;DCVA_GUI_driver.c,2020 :: 		if (exec_label->Active == 1) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Down220
;DCVA_GUI_driver.c,2021 :: 		PressedObject = (void *)exec_label;
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,2022 :: 		PressedObjectType = 2;
MOVS	R3, #2
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;DCVA_GUI_driver.c,2023 :: 		if (exec_label->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Down221
;DCVA_GUI_driver.c,2024 :: 		exec_label->OnDownPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
;DCVA_GUI_driver.c,2025 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;DCVA_GUI_driver.c,2026 :: 		}
L_DCVA_GUI_driver_Process_TP_Down221:
;DCVA_GUI_driver.c,2027 :: 		}
L_DCVA_GUI_driver_Process_TP_Down220:
;DCVA_GUI_driver.c,2028 :: 		}
L_DCVA_GUI_driver_Process_TP_Down219:
;DCVA_GUI_driver.c,2030 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Down222
;DCVA_GUI_driver.c,2031 :: 		if (exec_image->Active == 1) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Down223
;DCVA_GUI_driver.c,2032 :: 		PressedObject = (void *)exec_image;
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,2033 :: 		PressedObjectType = 3;
MOVS	R3, #3
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;DCVA_GUI_driver.c,2034 :: 		if (exec_image->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Down224
;DCVA_GUI_driver.c,2035 :: 		exec_image->OnDownPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R2, [R4, #0]
BLX	R2
;DCVA_GUI_driver.c,2036 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;DCVA_GUI_driver.c,2037 :: 		}
L_DCVA_GUI_driver_Process_TP_Down224:
;DCVA_GUI_driver.c,2038 :: 		}
L_DCVA_GUI_driver_Process_TP_Down223:
;DCVA_GUI_driver.c,2039 :: 		}
L_DCVA_GUI_driver_Process_TP_Down222:
;DCVA_GUI_driver.c,2041 :: 		if (_object_count == circle_button_order) {
MOVW	R2, #lo_addr(_circle_button_order+0)
MOVT	R2, #hi_addr(_circle_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Down225
;DCVA_GUI_driver.c,2042 :: 		if (exec_circle_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Down226
;DCVA_GUI_driver.c,2043 :: 		if (exec_circle_button->PressColEnabled == 1) {
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #42
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Down227
;DCVA_GUI_driver.c,2044 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;DCVA_GUI_driver.c,2045 :: 		DrawCircleButton(exec_circle_button);
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawCircleButton+0
;DCVA_GUI_driver.c,2046 :: 		}
L_DCVA_GUI_driver_Process_TP_Down227:
;DCVA_GUI_driver.c,2047 :: 		PressedObject = (void *)exec_circle_button;
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,2048 :: 		PressedObjectType = 5;
MOVS	R3, #5
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;DCVA_GUI_driver.c,2049 :: 		if (exec_circle_button->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Down228
;DCVA_GUI_driver.c,2050 :: 		exec_circle_button->OnDownPtr();
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R2, [R4, #0]
BLX	R2
;DCVA_GUI_driver.c,2051 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;DCVA_GUI_driver.c,2052 :: 		}
L_DCVA_GUI_driver_Process_TP_Down228:
;DCVA_GUI_driver.c,2053 :: 		}
L_DCVA_GUI_driver_Process_TP_Down226:
;DCVA_GUI_driver.c,2054 :: 		}
L_DCVA_GUI_driver_Process_TP_Down225:
;DCVA_GUI_driver.c,2056 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Down229
;DCVA_GUI_driver.c,2057 :: 		if (exec_box->Active == 1) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Down230
;DCVA_GUI_driver.c,2058 :: 		if (exec_box->PressColEnabled == 1) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #30
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Down231
;DCVA_GUI_driver.c,2059 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;DCVA_GUI_driver.c,2060 :: 		DrawBox(exec_box);
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawBox+0
;DCVA_GUI_driver.c,2061 :: 		}
L_DCVA_GUI_driver_Process_TP_Down231:
;DCVA_GUI_driver.c,2062 :: 		PressedObject = (void *)exec_box;
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,2063 :: 		PressedObjectType = 6;
MOVS	R3, #6
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;DCVA_GUI_driver.c,2064 :: 		if (exec_box->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Down232
;DCVA_GUI_driver.c,2065 :: 		exec_box->OnDownPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
;DCVA_GUI_driver.c,2066 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;DCVA_GUI_driver.c,2067 :: 		}
L_DCVA_GUI_driver_Process_TP_Down232:
;DCVA_GUI_driver.c,2068 :: 		}
L_DCVA_GUI_driver_Process_TP_Down230:
;DCVA_GUI_driver.c,2069 :: 		}
L_DCVA_GUI_driver_Process_TP_Down229:
;DCVA_GUI_driver.c,2071 :: 		if (_object_count == radio_button_order) {
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Down233
;DCVA_GUI_driver.c,2072 :: 		if (exec_radio_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Down234
;DCVA_GUI_driver.c,2073 :: 		if (exec_radio_button->PressColEnabled == 1) {
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #48
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_DCVA_GUI_driver_Process_TP_Down235
;DCVA_GUI_driver.c,2074 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;DCVA_GUI_driver.c,2075 :: 		DrawRadioButton(exec_radio_button);
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawRadioButton+0
;DCVA_GUI_driver.c,2076 :: 		}
L_DCVA_GUI_driver_Process_TP_Down235:
;DCVA_GUI_driver.c,2077 :: 		PressedObject = (void *)exec_radio_button;
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;DCVA_GUI_driver.c,2078 :: 		PressedObjectType = 17;
MOVS	R3, #17
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;DCVA_GUI_driver.c,2079 :: 		if (exec_radio_button->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_DCVA_GUI_driver_Process_TP_Down236
;DCVA_GUI_driver.c,2080 :: 		exec_radio_button->OnDownPtr();
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R2, [R4, #0]
BLX	R2
;DCVA_GUI_driver.c,2081 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;DCVA_GUI_driver.c,2082 :: 		}
L_DCVA_GUI_driver_Process_TP_Down236:
;DCVA_GUI_driver.c,2083 :: 		}
L_DCVA_GUI_driver_Process_TP_Down234:
;DCVA_GUI_driver.c,2084 :: 		}
L_DCVA_GUI_driver_Process_TP_Down233:
;DCVA_GUI_driver.c,2086 :: 		}
L_DCVA_GUI_driver_Process_TP_Down214:
;DCVA_GUI_driver.c,2087 :: 		}
L_end_Process_TP_Down:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of DCVA_GUI_driver_Process_TP_Down
_Check_TP:
;DCVA_GUI_driver.c,2089 :: 		void Check_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DCVA_GUI_driver.c,2090 :: 		if (TP_TFT_Press_Detect()) {
BL	_TP_TFT_Press_Detect+0
CMP	R0, #0
IT	EQ
BEQ	L_Check_TP237
;DCVA_GUI_driver.c,2092 :: 		if (TP_TFT_Get_Coordinates(&Xcoord, &Ycoord) == 0) {
MOVW	R1, #lo_addr(_Ycoord+0)
MOVT	R1, #hi_addr(_Ycoord+0)
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
BL	_TP_TFT_Get_Coordinates+0
CMP	R0, #0
IT	NE
BNE	L_Check_TP238
;DCVA_GUI_driver.c,2093 :: 		Process_TP_Press(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	DCVA_GUI_driver_Process_TP_Press+0
;DCVA_GUI_driver.c,2094 :: 		if (PenDown == 0) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Check_TP239
;DCVA_GUI_driver.c,2095 :: 		PenDown = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,2096 :: 		Process_TP_Down(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	DCVA_GUI_driver_Process_TP_Down+0
;DCVA_GUI_driver.c,2097 :: 		}
L_Check_TP239:
;DCVA_GUI_driver.c,2098 :: 		}
L_Check_TP238:
;DCVA_GUI_driver.c,2099 :: 		}
IT	AL
BAL	L_Check_TP240
L_Check_TP237:
;DCVA_GUI_driver.c,2100 :: 		else if (PenDown == 1) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Check_TP241
;DCVA_GUI_driver.c,2101 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;DCVA_GUI_driver.c,2102 :: 		Process_TP_Up(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	DCVA_GUI_driver_Process_TP_Up+0
;DCVA_GUI_driver.c,2103 :: 		}
L_Check_TP241:
L_Check_TP240:
;DCVA_GUI_driver.c,2104 :: 		}
L_end_Check_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Check_TP
_Init_MCU:
;DCVA_GUI_driver.c,2106 :: 		void Init_MCU() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DCVA_GUI_driver.c,2107 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_9);
MOVW	R1, #512
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;DCVA_GUI_driver.c,2108 :: 		TFT_BLED = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,2109 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;DCVA_GUI_driver.c,2110 :: 		TP_TFT_Set_Default_Mode();
BL	_TP_TFT_Set_Default_Mode+0
;DCVA_GUI_driver.c,2111 :: 		}
L_end_Init_MCU:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_MCU
_Init_Ext_Mem:
;DCVA_GUI_driver.c,2113 :: 		void Init_Ext_Mem() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DCVA_GUI_driver.c,2118 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
MOVW	R2, #lo_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
;DCVA_GUI_driver.c,2117 :: 		_SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
MOVW	R1, #772
;DCVA_GUI_driver.c,2115 :: 		SPI3_Init_Advanced(_SPI_FPCLK_DIV64, _SPI_MASTER | _SPI_8_BIT |
MOVS	R0, #5
;DCVA_GUI_driver.c,2118 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
BL	_SPI3_Init_Advanced+0
;DCVA_GUI_driver.c,2119 :: 		Delay_ms(10);
MOVW	R7, #7913
MOVT	R7, #7
NOP
NOP
L_Init_Ext_Mem242:
SUBS	R7, R7, #1
BNE	L_Init_Ext_Mem242
NOP
NOP
;DCVA_GUI_driver.c,2121 :: 		if (!Mmc_Fat_Init()) {
BL	_Mmc_Fat_Init+0
CMP	R0, #0
IT	NE
BNE	L_Init_Ext_Mem244
;DCVA_GUI_driver.c,2122 :: 		SPI3_CR1 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(SPI3_CR1+0)
MOVT	R0, #hi_addr(SPI3_CR1+0)
STR	R1, [R0, #0]
;DCVA_GUI_driver.c,2127 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
MOVW	R2, #lo_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
;DCVA_GUI_driver.c,2126 :: 		_SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
MOVW	R1, #772
;DCVA_GUI_driver.c,2124 :: 		SPI3_Init_Advanced(_SPI_FPCLK_DIV2, _SPI_MASTER | _SPI_8_BIT |
MOVS	R0, #0
;DCVA_GUI_driver.c,2127 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
BL	_SPI3_Init_Advanced+0
;DCVA_GUI_driver.c,2129 :: 		Mmc_Fat_Assign("DCVA_GUI.RES", 0);
MOVW	R0, #lo_addr(?lstr7_DCVA_GUI_driver+0)
MOVT	R0, #hi_addr(?lstr7_DCVA_GUI_driver+0)
MOVS	R1, #0
BL	_Mmc_Fat_Assign+0
;DCVA_GUI_driver.c,2130 :: 		Mmc_Fat_Reset(&res_file_size);
MOVW	R0, #lo_addr(_res_file_size+0)
MOVT	R0, #hi_addr(_res_file_size+0)
BL	_Mmc_Fat_Reset+0
;DCVA_GUI_driver.c,2131 :: 		}
L_Init_Ext_Mem244:
;DCVA_GUI_driver.c,2132 :: 		}
L_end_Init_Ext_Mem:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_Ext_Mem
_Start_TP:
;DCVA_GUI_driver.c,2134 :: 		void Start_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DCVA_GUI_driver.c,2135 :: 		Init_MCU();
BL	_Init_MCU+0
;DCVA_GUI_driver.c,2137 :: 		Init_Ext_Mem();
BL	_Init_Ext_Mem+0
;DCVA_GUI_driver.c,2139 :: 		InitializeTouchPanel();
BL	DCVA_GUI_driver_InitializeTouchPanel+0
;DCVA_GUI_driver.c,2141 :: 		Delay_ms(1000);
MOVW	R7, #5033
MOVT	R7, #712
NOP
NOP
L_Start_TP245:
SUBS	R7, R7, #1
BNE	L_Start_TP245
NOP
NOP
;DCVA_GUI_driver.c,2142 :: 		TFT_Fill_Screen(0);
MOVS	R0, #0
BL	_TFT_Fill_Screen+0
;DCVA_GUI_driver.c,2143 :: 		Calibrate();
BL	_Calibrate+0
;DCVA_GUI_driver.c,2144 :: 		TFT_Fill_Screen(0);
MOVS	R0, #0
BL	_TFT_Fill_Screen+0
;DCVA_GUI_driver.c,2146 :: 		InitializeObjects();
BL	DCVA_GUI_driver_InitializeObjects+0
;DCVA_GUI_driver.c,2147 :: 		display_width = Screen1.Width;
MOVW	R0, #lo_addr(_Screen1+2)
MOVT	R0, #hi_addr(_Screen1+2)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_width+0)
MOVT	R0, #hi_addr(_display_width+0)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,2148 :: 		display_height = Screen1.Height;
MOVW	R0, #lo_addr(_Screen1+4)
MOVT	R0, #hi_addr(_Screen1+4)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_height+0)
MOVT	R0, #hi_addr(_display_height+0)
STRH	R1, [R0, #0]
;DCVA_GUI_driver.c,2149 :: 		DrawScreen(&Screen1);
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;DCVA_GUI_driver.c,2150 :: 		}
L_end_Start_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Start_TP
DCVA_GUI_driver____?ag:
L_end_DCVA_GUI_driver___?ag:
BX	LR
; end of DCVA_GUI_driver____?ag
