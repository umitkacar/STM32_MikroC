_Init_ADC:
;PCA_FLDA_GUI_driver.c,61 :: 		void Init_ADC() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PCA_FLDA_GUI_driver.c,62 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_8 | _ADC_CHANNEL_9);
MOVW	R0, #768
BL	_ADC_Set_Input_Channel+0
;PCA_FLDA_GUI_driver.c,63 :: 		ADC1_Init();
BL	_ADC1_Init+0
;PCA_FLDA_GUI_driver.c,64 :: 		Delay_ms(100);
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
;PCA_FLDA_GUI_driver.c,65 :: 		}
L_end_Init_ADC:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_ADC
_TFT_Get_Data:
;PCA_FLDA_GUI_driver.c,67 :: 		char* TFT_Get_Data(unsigned long offset, unsigned long count, unsigned long *num) {
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R2, [SP, #16]
MOV	R2, R0
STR	R1, [SP, #12]
; offset start address is: 8 (R2)
;PCA_FLDA_GUI_driver.c,71 :: 		start_sector = Mmc_Get_File_Write_Sector() + offset/512;
BL	_Mmc_Get_File_Write_Sector+0
LSRS	R3, R2, #9
ADDS	R4, R0, R3
STR	R4, [SP, #4]
;PCA_FLDA_GUI_driver.c,72 :: 		pos = (unsigned long)offset%512;
MOVW	R3, #511
AND	R3, R2, R3, LSL #0
; offset end address is: 8 (R2)
STRH	R3, [SP, #8]
;PCA_FLDA_GUI_driver.c,74 :: 		if(start_sector == currentSector+1) {
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
LDR	R3, [R3, #0]
ADDS	R3, R3, #1
CMP	R4, R3
IT	NE
BNE	L_TFT_Get_Data2
;PCA_FLDA_GUI_driver.c,75 :: 		Mmc_Multi_Read_Sector(Ext_Data_Buffer);
MOVW	R0, #lo_addr(_Ext_Data_Buffer+0)
MOVT	R0, #hi_addr(_Ext_Data_Buffer+0)
BL	_Mmc_Multi_Read_Sector+0
;PCA_FLDA_GUI_driver.c,76 :: 		currentSector = start_sector;
LDR	R4, [SP, #4]
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
STR	R4, [R3, #0]
;PCA_FLDA_GUI_driver.c,77 :: 		} else if (start_sector != currentSector) {
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
;PCA_FLDA_GUI_driver.c,78 :: 		if(currentSector != -1)
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
LDR	R3, [R3, #0]
CMP	R3, #-1
IT	EQ
BEQ	L_TFT_Get_Data5
;PCA_FLDA_GUI_driver.c,79 :: 		Mmc_Multi_Read_Stop();
BL	_Mmc_Multi_Read_Stop+0
L_TFT_Get_Data5:
;PCA_FLDA_GUI_driver.c,80 :: 		Mmc_Multi_Read_Start(start_sector);
LDR	R0, [SP, #4]
BL	_Mmc_Multi_Read_Start+0
;PCA_FLDA_GUI_driver.c,81 :: 		Mmc_Multi_Read_Sector(Ext_Data_Buffer);
MOVW	R0, #lo_addr(_Ext_Data_Buffer+0)
MOVT	R0, #hi_addr(_Ext_Data_Buffer+0)
BL	_Mmc_Multi_Read_Sector+0
;PCA_FLDA_GUI_driver.c,82 :: 		currentSector = start_sector;
LDR	R4, [SP, #4]
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
STR	R4, [R3, #0]
;PCA_FLDA_GUI_driver.c,83 :: 		}
L_TFT_Get_Data4:
L_TFT_Get_Data3:
;PCA_FLDA_GUI_driver.c,85 :: 		if(count>512-pos)
LDRH	R3, [SP, #8]
RSB	R4, R3, #512
UXTH	R4, R4
LDR	R3, [SP, #12]
CMP	R3, R4
IT	LS
BLS	L_TFT_Get_Data6
;PCA_FLDA_GUI_driver.c,86 :: 		*num = 512-pos;
LDRH	R3, [SP, #8]
RSB	R4, R3, #512
UXTH	R4, R4
LDR	R3, [SP, #16]
STR	R4, [R3, #0]
IT	AL
BAL	L_TFT_Get_Data7
L_TFT_Get_Data6:
;PCA_FLDA_GUI_driver.c,88 :: 		*num = count;
LDR	R4, [SP, #12]
LDR	R3, [SP, #16]
STR	R4, [R3, #0]
L_TFT_Get_Data7:
;PCA_FLDA_GUI_driver.c,90 :: 		return Ext_Data_Buffer+pos;
LDRH	R4, [SP, #8]
MOVW	R3, #lo_addr(_Ext_Data_Buffer+0)
MOVT	R3, #hi_addr(_Ext_Data_Buffer+0)
ADDS	R3, R3, R4
MOV	R0, R3
;PCA_FLDA_GUI_driver.c,91 :: 		}
L_end_TFT_Get_Data:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _TFT_Get_Data
PCA_FLDA_GUI_driver_InitializeTouchPanel:
;PCA_FLDA_GUI_driver.c,92 :: 		static void InitializeTouchPanel() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PCA_FLDA_GUI_driver.c,93 :: 		Init_ADC();
BL	_Init_ADC+0
;PCA_FLDA_GUI_driver.c,94 :: 		TFT_Init(240, 320);
MOVW	R1, #320
MOVS	R0, #240
BL	_TFT_Init+0
;PCA_FLDA_GUI_driver.c,95 :: 		TFT_Set_Ext_Buffer(TFT_Get_Data);
MOVW	R0, #lo_addr(_TFT_Get_Data+0)
MOVT	R0, #hi_addr(_TFT_Get_Data+0)
BL	_TFT_Set_Ext_Buffer+0
;PCA_FLDA_GUI_driver.c,97 :: 		TP_TFT_Init(240, 320, 8, 9);                                  // Initialize touch panel
MOVS	R3, #9
MOVS	R2, #8
MOVW	R1, #320
MOVS	R0, #240
BL	_TP_TFT_Init+0
;PCA_FLDA_GUI_driver.c,98 :: 		TP_TFT_Set_ADC_Threshold(ADC_THRESHOLD);                              // Set touch panel ADC threshold
MOVW	R0, #1500
SXTH	R0, R0
BL	_TP_TFT_Set_ADC_Threshold+0
;PCA_FLDA_GUI_driver.c,100 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,101 :: 		PressedObject = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PressedObject+0)
MOVT	R0, #hi_addr(_PressedObject+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,102 :: 		PressedObjectType = -1;
MOVW	R1, #65535
SXTH	R1, R1
MOVW	R0, #lo_addr(_PressedObjectType+0)
MOVT	R0, #hi_addr(_PressedObjectType+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,103 :: 		}
L_end_InitializeTouchPanel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of PCA_FLDA_GUI_driver_InitializeTouchPanel
_Calibrate:
;PCA_FLDA_GUI_driver.c,105 :: 		void Calibrate() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PCA_FLDA_GUI_driver.c,106 :: 		TFT_Set_Pen(CL_WHITE, 3);
MOVS	R1, #3
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;PCA_FLDA_GUI_driver.c,107 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;PCA_FLDA_GUI_driver.c,108 :: 		TFT_Write_Text("Touch selected corners for calibration", 1, 150);
MOVW	R0, #lo_addr(?lstr1_PCA_FLDA_GUI_driver+0)
MOVT	R0, #hi_addr(?lstr1_PCA_FLDA_GUI_driver+0)
MOVS	R2, #150
MOVS	R1, #1
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_driver.c,109 :: 		TFT_Line(0, 319, 5, 319);
MOVW	R3, #319
SXTH	R3, R3
MOVS	R2, #5
SXTH	R2, R2
MOVW	R1, #319
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;PCA_FLDA_GUI_driver.c,110 :: 		TFT_Line(0, 319, 0, 314);
MOVW	R3, #314
SXTH	R3, R3
MOVS	R2, #0
SXTH	R2, R2
MOVW	R1, #319
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;PCA_FLDA_GUI_driver.c,111 :: 		TFT_Line(0, 319, 10, 309);
MOVW	R3, #309
SXTH	R3, R3
MOVS	R2, #10
SXTH	R2, R2
MOVW	R1, #319
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;PCA_FLDA_GUI_driver.c,112 :: 		TFT_Write_Text("first here", 20, 290);
MOVW	R0, #lo_addr(?lstr2_PCA_FLDA_GUI_driver+0)
MOVT	R0, #hi_addr(?lstr2_PCA_FLDA_GUI_driver+0)
MOVW	R2, #290
MOVS	R1, #20
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_driver.c,114 :: 		TP_TFT_Calibrate_Min();                      // Calibration of bottom left corner
BL	_TP_TFT_Calibrate_Min+0
;PCA_FLDA_GUI_driver.c,115 :: 		Delay_ms(500);
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
;PCA_FLDA_GUI_driver.c,117 :: 		TFT_Set_Pen(CL_BLACK, 3);
MOVS	R1, #3
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;PCA_FLDA_GUI_driver.c,118 :: 		TFT_Set_Font(TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #0
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;PCA_FLDA_GUI_driver.c,119 :: 		TFT_Line(0, 319, 5, 319);
MOVW	R3, #319
SXTH	R3, R3
MOVS	R2, #5
SXTH	R2, R2
MOVW	R1, #319
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;PCA_FLDA_GUI_driver.c,120 :: 		TFT_Line(0, 319, 0, 314);
MOVW	R3, #314
SXTH	R3, R3
MOVS	R2, #0
SXTH	R2, R2
MOVW	R1, #319
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;PCA_FLDA_GUI_driver.c,121 :: 		TFT_Line(0, 319, 10, 309);
MOVW	R3, #309
SXTH	R3, R3
MOVS	R2, #10
SXTH	R2, R2
MOVW	R1, #319
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;PCA_FLDA_GUI_driver.c,122 :: 		TFT_Write_Text("first here", 20, 290);
MOVW	R0, #lo_addr(?lstr3_PCA_FLDA_GUI_driver+0)
MOVT	R0, #hi_addr(?lstr3_PCA_FLDA_GUI_driver+0)
MOVW	R2, #290
MOVS	R1, #20
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_driver.c,124 :: 		TFT_Set_Pen(CL_WHITE, 3);
MOVS	R1, #3
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;PCA_FLDA_GUI_driver.c,125 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;PCA_FLDA_GUI_driver.c,126 :: 		TFT_Write_Text("now here ", 180, 15);
MOVW	R0, #lo_addr(?lstr4_PCA_FLDA_GUI_driver+0)
MOVT	R0, #hi_addr(?lstr4_PCA_FLDA_GUI_driver+0)
MOVS	R2, #15
MOVS	R1, #180
BL	_TFT_Write_Text+0
;PCA_FLDA_GUI_driver.c,127 :: 		TFT_Line(239, 0, 234, 0);
MOVS	R3, #0
SXTH	R3, R3
MOVS	R2, #234
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #239
SXTH	R0, R0
BL	_TFT_Line+0
;PCA_FLDA_GUI_driver.c,128 :: 		TFT_Line(239, 0, 239, 5);
MOVS	R3, #5
SXTH	R3, R3
MOVS	R2, #239
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #239
SXTH	R0, R0
BL	_TFT_Line+0
;PCA_FLDA_GUI_driver.c,129 :: 		TFT_Line(239, 0, 229, 10);
MOVS	R3, #10
SXTH	R3, R3
MOVS	R2, #229
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #239
SXTH	R0, R0
BL	_TFT_Line+0
;PCA_FLDA_GUI_driver.c,131 :: 		TP_TFT_Calibrate_Max();                      // Calibration of bottom left corner
BL	_TP_TFT_Calibrate_Max+0
;PCA_FLDA_GUI_driver.c,132 :: 		Delay_ms(500);
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
;PCA_FLDA_GUI_driver.c,133 :: 		}
L_end_Calibrate:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Calibrate
PCA_FLDA_GUI_driver_InitializeObjects:
;PCA_FLDA_GUI_driver.c,564 :: 		static void InitializeObjects() {
SUB	SP, SP, #4
;PCA_FLDA_GUI_driver.c,565 :: 		Screen1.Color                     = 0x87FF;
MOVW	R1, #34815
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,566 :: 		Screen1.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen1+2)
MOVT	R0, #hi_addr(_Screen1+2)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,567 :: 		Screen1.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen1+4)
MOVT	R0, #hi_addr(_Screen1+4)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,568 :: 		Screen1.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+8)
MOVT	R0, #hi_addr(_Screen1+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,569 :: 		Screen1.LabelsCount               = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Screen1+16)
MOVT	R0, #hi_addr(_Screen1+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,570 :: 		Screen1.Labels                    = Screen1_Labels;
MOVW	R1, #lo_addr(_Screen1_Labels+0)
MOVT	R1, #hi_addr(_Screen1_Labels+0)
MOVW	R0, #lo_addr(_Screen1+20)
MOVT	R0, #hi_addr(_Screen1+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,571 :: 		Screen1.CircleButtonsCount        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen1+24)
MOVT	R0, #hi_addr(_Screen1+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,572 :: 		Screen1.CircleButtons             = Screen1_CircleButtons;
MOVW	R1, #lo_addr(_Screen1_CircleButtons+0)
MOVT	R1, #hi_addr(_Screen1_CircleButtons+0)
MOVW	R0, #lo_addr(_Screen1+28)
MOVT	R0, #hi_addr(_Screen1+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,573 :: 		Screen1.RadioButtonsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+32)
MOVT	R0, #hi_addr(_Screen1+32)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,574 :: 		Screen1.ProgressBarsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+40)
MOVT	R0, #hi_addr(_Screen1+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,575 :: 		Screen1.ObjectsCount              = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Screen1+6)
MOVT	R0, #hi_addr(_Screen1+6)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,577 :: 		Screen2.Color                     = 0x07F0;
MOVW	R1, #2032
MOVW	R0, #lo_addr(_Screen2+0)
MOVT	R0, #hi_addr(_Screen2+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,578 :: 		Screen2.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen2+2)
MOVT	R0, #hi_addr(_Screen2+2)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,579 :: 		Screen2.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen2+4)
MOVT	R0, #hi_addr(_Screen2+4)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,580 :: 		Screen2.Buttons_RoundCount        = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Screen2+8)
MOVT	R0, #hi_addr(_Screen2+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,581 :: 		Screen2.Buttons_Round             = Screen2_Buttons_Round;
MOVW	R1, #lo_addr(_Screen2_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen2_Buttons_Round+0)
MOVW	R0, #lo_addr(_Screen2+12)
MOVT	R0, #hi_addr(_Screen2+12)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,582 :: 		Screen2.LabelsCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen2+16)
MOVT	R0, #hi_addr(_Screen2+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,583 :: 		Screen2.Labels                    = Screen2_Labels;
MOVW	R1, #lo_addr(_Screen2_Labels+0)
MOVT	R1, #hi_addr(_Screen2_Labels+0)
MOVW	R0, #lo_addr(_Screen2+20)
MOVT	R0, #hi_addr(_Screen2+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,584 :: 		Screen2.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+24)
MOVT	R0, #hi_addr(_Screen2+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,585 :: 		Screen2.RadioButtonsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+32)
MOVT	R0, #hi_addr(_Screen2+32)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,586 :: 		Screen2.ProgressBarsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+40)
MOVT	R0, #hi_addr(_Screen2+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,587 :: 		Screen2.ObjectsCount              = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Screen2+6)
MOVT	R0, #hi_addr(_Screen2+6)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,589 :: 		Screen3.Color                     = 0x4410;
MOVW	R1, #17424
MOVW	R0, #lo_addr(_Screen3+0)
MOVT	R0, #hi_addr(_Screen3+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,590 :: 		Screen3.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen3+2)
MOVT	R0, #hi_addr(_Screen3+2)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,591 :: 		Screen3.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen3+4)
MOVT	R0, #hi_addr(_Screen3+4)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,592 :: 		Screen3.Buttons_RoundCount        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen3+8)
MOVT	R0, #hi_addr(_Screen3+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,593 :: 		Screen3.Buttons_Round             = Screen3_Buttons_Round;
MOVW	R1, #lo_addr(_Screen3_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen3_Buttons_Round+0)
MOVW	R0, #lo_addr(_Screen3+12)
MOVT	R0, #hi_addr(_Screen3+12)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,594 :: 		Screen3.LabelsCount               = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen3+16)
MOVT	R0, #hi_addr(_Screen3+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,595 :: 		Screen3.Labels                    = Screen3_Labels;
MOVW	R1, #lo_addr(_Screen3_Labels+0)
MOVT	R1, #hi_addr(_Screen3_Labels+0)
MOVW	R0, #lo_addr(_Screen3+20)
MOVT	R0, #hi_addr(_Screen3+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,596 :: 		Screen3.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+24)
MOVT	R0, #hi_addr(_Screen3+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,597 :: 		Screen3.RadioButtonsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+32)
MOVT	R0, #hi_addr(_Screen3+32)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,598 :: 		Screen3.ProgressBarsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+40)
MOVT	R0, #hi_addr(_Screen3+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,599 :: 		Screen3.ObjectsCount              = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Screen3+6)
MOVT	R0, #hi_addr(_Screen3+6)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,601 :: 		Screen5.Color                     = 0xAEBF;
MOVW	R1, #44735
MOVW	R0, #lo_addr(_Screen5+0)
MOVT	R0, #hi_addr(_Screen5+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,602 :: 		Screen5.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen5+2)
MOVT	R0, #hi_addr(_Screen5+2)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,603 :: 		Screen5.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen5+4)
MOVT	R0, #hi_addr(_Screen5+4)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,604 :: 		Screen5.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen5+8)
MOVT	R0, #hi_addr(_Screen5+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,605 :: 		Screen5.LabelsCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen5+16)
MOVT	R0, #hi_addr(_Screen5+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,606 :: 		Screen5.Labels                    = Screen4_Labels;
MOVW	R1, #lo_addr(_Screen4_Labels+0)
MOVT	R1, #hi_addr(_Screen4_Labels+0)
MOVW	R0, #lo_addr(_Screen5+20)
MOVT	R0, #hi_addr(_Screen5+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,607 :: 		Screen5.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen5+24)
MOVT	R0, #hi_addr(_Screen5+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,608 :: 		Screen5.RadioButtonsCount           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Screen5+32)
MOVT	R0, #hi_addr(_Screen5+32)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,609 :: 		Screen5.RadioButtons                = Screen4_RadioButtons;
MOVW	R1, #lo_addr(_Screen4_RadioButtons+0)
MOVT	R1, #hi_addr(_Screen4_RadioButtons+0)
MOVW	R0, #lo_addr(_Screen5+36)
MOVT	R0, #hi_addr(_Screen5+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,610 :: 		Screen5.ProgressBarsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen5+40)
MOVT	R0, #hi_addr(_Screen5+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,611 :: 		Screen5.ObjectsCount              = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Screen5+6)
MOVT	R0, #hi_addr(_Screen5+6)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,613 :: 		Screen6.Color                     = 0xFFE3;
MOVW	R1, #65507
MOVW	R0, #lo_addr(_Screen6+0)
MOVT	R0, #hi_addr(_Screen6+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,614 :: 		Screen6.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen6+2)
MOVT	R0, #hi_addr(_Screen6+2)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,615 :: 		Screen6.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen6+4)
MOVT	R0, #hi_addr(_Screen6+4)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,616 :: 		Screen6.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen6+8)
MOVT	R0, #hi_addr(_Screen6+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,617 :: 		Screen6.LabelsCount               = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen6+16)
MOVT	R0, #hi_addr(_Screen6+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,618 :: 		Screen6.Labels                    = Screen5_Labels;
MOVW	R1, #lo_addr(_Screen5_Labels+0)
MOVT	R1, #hi_addr(_Screen5_Labels+0)
MOVW	R0, #lo_addr(_Screen6+20)
MOVT	R0, #hi_addr(_Screen6+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,619 :: 		Screen6.CircleButtonsCount        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen6+24)
MOVT	R0, #hi_addr(_Screen6+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,620 :: 		Screen6.CircleButtons             = Screen5_CircleButtons;
MOVW	R1, #lo_addr(_Screen5_CircleButtons+0)
MOVT	R1, #hi_addr(_Screen5_CircleButtons+0)
MOVW	R0, #lo_addr(_Screen6+28)
MOVT	R0, #hi_addr(_Screen6+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,621 :: 		Screen6.RadioButtonsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen6+32)
MOVT	R0, #hi_addr(_Screen6+32)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,622 :: 		Screen6.ProgressBarsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen6+40)
MOVT	R0, #hi_addr(_Screen6+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,623 :: 		Screen6.ObjectsCount              = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Screen6+6)
MOVT	R0, #hi_addr(_Screen6+6)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,625 :: 		Screen7.Color                     = 0x001F;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Screen7+0)
MOVT	R0, #hi_addr(_Screen7+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,626 :: 		Screen7.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen7+2)
MOVT	R0, #hi_addr(_Screen7+2)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,627 :: 		Screen7.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen7+4)
MOVT	R0, #hi_addr(_Screen7+4)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,628 :: 		Screen7.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen7+8)
MOVT	R0, #hi_addr(_Screen7+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,629 :: 		Screen7.LabelsCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen7+16)
MOVT	R0, #hi_addr(_Screen7+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,630 :: 		Screen7.Labels                    = Screen6_Labels;
MOVW	R1, #lo_addr(_Screen6_Labels+0)
MOVT	R1, #hi_addr(_Screen6_Labels+0)
MOVW	R0, #lo_addr(_Screen7+20)
MOVT	R0, #hi_addr(_Screen7+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,631 :: 		Screen7.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen7+24)
MOVT	R0, #hi_addr(_Screen7+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,632 :: 		Screen7.RadioButtonsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen7+32)
MOVT	R0, #hi_addr(_Screen7+32)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,633 :: 		Screen7.ProgressBarsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen7+40)
MOVT	R0, #hi_addr(_Screen7+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,634 :: 		Screen7.ObjectsCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen7+6)
MOVT	R0, #hi_addr(_Screen7+6)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,636 :: 		Screen8.Color                     = 0x8008;
MOVW	R1, #32776
MOVW	R0, #lo_addr(_Screen8+0)
MOVT	R0, #hi_addr(_Screen8+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,637 :: 		Screen8.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen8+2)
MOVT	R0, #hi_addr(_Screen8+2)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,638 :: 		Screen8.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen8+4)
MOVT	R0, #hi_addr(_Screen8+4)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,639 :: 		Screen8.Buttons_RoundCount        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen8+8)
MOVT	R0, #hi_addr(_Screen8+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,640 :: 		Screen8.Buttons_Round             = Screen7_Buttons_Round;
MOVW	R1, #lo_addr(_Screen7_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen7_Buttons_Round+0)
MOVW	R0, #lo_addr(_Screen8+12)
MOVT	R0, #hi_addr(_Screen8+12)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,641 :: 		Screen8.LabelsCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen8+16)
MOVT	R0, #hi_addr(_Screen8+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,642 :: 		Screen8.Labels                    = Screen7_Labels;
MOVW	R1, #lo_addr(_Screen7_Labels+0)
MOVT	R1, #hi_addr(_Screen7_Labels+0)
MOVW	R0, #lo_addr(_Screen8+20)
MOVT	R0, #hi_addr(_Screen8+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,643 :: 		Screen8.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen8+24)
MOVT	R0, #hi_addr(_Screen8+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,644 :: 		Screen8.RadioButtonsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen8+32)
MOVT	R0, #hi_addr(_Screen8+32)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,645 :: 		Screen8.ProgressBarsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen8+40)
MOVT	R0, #hi_addr(_Screen8+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,646 :: 		Screen8.ObjectsCount              = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen8+6)
MOVT	R0, #hi_addr(_Screen8+6)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,648 :: 		Screen9.Color                     = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Screen9+0)
MOVT	R0, #hi_addr(_Screen9+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,649 :: 		Screen9.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen9+2)
MOVT	R0, #hi_addr(_Screen9+2)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,650 :: 		Screen9.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen9+4)
MOVT	R0, #hi_addr(_Screen9+4)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,651 :: 		Screen9.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen9+8)
MOVT	R0, #hi_addr(_Screen9+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,652 :: 		Screen9.LabelsCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen9+16)
MOVT	R0, #hi_addr(_Screen9+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,653 :: 		Screen9.Labels                    = Screen8_Labels;
MOVW	R1, #lo_addr(_Screen8_Labels+0)
MOVT	R1, #hi_addr(_Screen8_Labels+0)
MOVW	R0, #lo_addr(_Screen9+20)
MOVT	R0, #hi_addr(_Screen9+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,654 :: 		Screen9.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen9+24)
MOVT	R0, #hi_addr(_Screen9+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,655 :: 		Screen9.RadioButtonsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen9+32)
MOVT	R0, #hi_addr(_Screen9+32)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,656 :: 		Screen9.ProgressBarsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen9+40)
MOVT	R0, #hi_addr(_Screen9+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,657 :: 		Screen9.ObjectsCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen9+6)
MOVT	R0, #hi_addr(_Screen9+6)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,659 :: 		Screen10.Color                     = 0x8408;
MOVW	R1, #33800
MOVW	R0, #lo_addr(_Screen10+0)
MOVT	R0, #hi_addr(_Screen10+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,660 :: 		Screen10.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen10+2)
MOVT	R0, #hi_addr(_Screen10+2)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,661 :: 		Screen10.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen10+4)
MOVT	R0, #hi_addr(_Screen10+4)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,662 :: 		Screen10.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen10+8)
MOVT	R0, #hi_addr(_Screen10+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,663 :: 		Screen10.LabelsCount               = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen10+16)
MOVT	R0, #hi_addr(_Screen10+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,664 :: 		Screen10.Labels                    = Screen9_Labels;
MOVW	R1, #lo_addr(_Screen9_Labels+0)
MOVT	R1, #hi_addr(_Screen9_Labels+0)
MOVW	R0, #lo_addr(_Screen10+20)
MOVT	R0, #hi_addr(_Screen10+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,665 :: 		Screen10.CircleButtonsCount        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen10+24)
MOVT	R0, #hi_addr(_Screen10+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,666 :: 		Screen10.CircleButtons             = Screen9_CircleButtons;
MOVW	R1, #lo_addr(_Screen9_CircleButtons+0)
MOVT	R1, #hi_addr(_Screen9_CircleButtons+0)
MOVW	R0, #lo_addr(_Screen10+28)
MOVT	R0, #hi_addr(_Screen10+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,667 :: 		Screen10.RadioButtonsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen10+32)
MOVT	R0, #hi_addr(_Screen10+32)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,668 :: 		Screen10.ProgressBarsCount           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen10+40)
MOVT	R0, #hi_addr(_Screen10+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,669 :: 		Screen10.ProgressBars                = Screen9_ProgressBars;
MOVW	R1, #lo_addr(_Screen9_ProgressBars+0)
MOVT	R1, #hi_addr(_Screen9_ProgressBars+0)
MOVW	R0, #lo_addr(_Screen10+44)
MOVT	R0, #hi_addr(_Screen10+44)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,670 :: 		Screen10.ObjectsCount              = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Screen10+6)
MOVT	R0, #hi_addr(_Screen10+6)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,672 :: 		Screen11.Color                     = 0x801F;
MOVW	R1, #32799
MOVW	R0, #lo_addr(_Screen11+0)
MOVT	R0, #hi_addr(_Screen11+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,673 :: 		Screen11.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen11+2)
MOVT	R0, #hi_addr(_Screen11+2)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,674 :: 		Screen11.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen11+4)
MOVT	R0, #hi_addr(_Screen11+4)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,675 :: 		Screen11.Buttons_RoundCount        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen11+8)
MOVT	R0, #hi_addr(_Screen11+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,676 :: 		Screen11.Buttons_Round             = Screen10_Buttons_Round;
MOVW	R1, #lo_addr(_Screen10_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen10_Buttons_Round+0)
MOVW	R0, #lo_addr(_Screen11+12)
MOVT	R0, #hi_addr(_Screen11+12)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,677 :: 		Screen11.LabelsCount               = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Screen11+16)
MOVT	R0, #hi_addr(_Screen11+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,678 :: 		Screen11.Labels                    = Screen10_Labels;
MOVW	R1, #lo_addr(_Screen10_Labels+0)
MOVT	R1, #hi_addr(_Screen10_Labels+0)
MOVW	R0, #lo_addr(_Screen11+20)
MOVT	R0, #hi_addr(_Screen11+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,679 :: 		Screen11.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen11+24)
MOVT	R0, #hi_addr(_Screen11+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,680 :: 		Screen11.RadioButtonsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen11+32)
MOVT	R0, #hi_addr(_Screen11+32)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,681 :: 		Screen11.ProgressBarsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen11+40)
MOVT	R0, #hi_addr(_Screen11+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,682 :: 		Screen11.ObjectsCount              = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Screen11+6)
MOVT	R0, #hi_addr(_Screen11+6)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,684 :: 		Screen12.Color                     = 0x001F;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Screen12+0)
MOVT	R0, #hi_addr(_Screen12+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,685 :: 		Screen12.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen12+2)
MOVT	R0, #hi_addr(_Screen12+2)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,686 :: 		Screen12.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen12+4)
MOVT	R0, #hi_addr(_Screen12+4)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,687 :: 		Screen12.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen12+8)
MOVT	R0, #hi_addr(_Screen12+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,688 :: 		Screen12.LabelsCount               = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen12+16)
MOVT	R0, #hi_addr(_Screen12+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,689 :: 		Screen12.Labels                    = Screen11_Labels;
MOVW	R1, #lo_addr(_Screen11_Labels+0)
MOVT	R1, #hi_addr(_Screen11_Labels+0)
MOVW	R0, #lo_addr(_Screen12+20)
MOVT	R0, #hi_addr(_Screen12+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,690 :: 		Screen12.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen12+24)
MOVT	R0, #hi_addr(_Screen12+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,691 :: 		Screen12.RadioButtonsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen12+32)
MOVT	R0, #hi_addr(_Screen12+32)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,692 :: 		Screen12.ProgressBarsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen12+40)
MOVT	R0, #hi_addr(_Screen12+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,693 :: 		Screen12.ObjectsCount              = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen12+6)
MOVT	R0, #hi_addr(_Screen12+6)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,695 :: 		Screen13.Color                     = 0xF81F;
MOVW	R1, #63519
MOVW	R0, #lo_addr(_Screen13+0)
MOVT	R0, #hi_addr(_Screen13+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,696 :: 		Screen13.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen13+2)
MOVT	R0, #hi_addr(_Screen13+2)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,697 :: 		Screen13.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen13+4)
MOVT	R0, #hi_addr(_Screen13+4)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,698 :: 		Screen13.Buttons_RoundCount        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen13+8)
MOVT	R0, #hi_addr(_Screen13+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,699 :: 		Screen13.Buttons_Round             = Screen12_Buttons_Round;
MOVW	R1, #lo_addr(_Screen12_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen12_Buttons_Round+0)
MOVW	R0, #lo_addr(_Screen13+12)
MOVT	R0, #hi_addr(_Screen13+12)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,700 :: 		Screen13.LabelsCount               = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Screen13+16)
MOVT	R0, #hi_addr(_Screen13+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,701 :: 		Screen13.Labels                    = Screen12_Labels;
MOVW	R1, #lo_addr(_Screen12_Labels+0)
MOVT	R1, #hi_addr(_Screen12_Labels+0)
MOVW	R0, #lo_addr(_Screen13+20)
MOVT	R0, #hi_addr(_Screen13+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,702 :: 		Screen13.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen13+24)
MOVT	R0, #hi_addr(_Screen13+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,703 :: 		Screen13.RadioButtonsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen13+32)
MOVT	R0, #hi_addr(_Screen13+32)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,704 :: 		Screen13.ProgressBarsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen13+40)
MOVT	R0, #hi_addr(_Screen13+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,705 :: 		Screen13.ObjectsCount              = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Screen13+6)
MOVT	R0, #hi_addr(_Screen13+6)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,707 :: 		Screen14.Color                     = 0x841F;
MOVW	R1, #33823
MOVW	R0, #lo_addr(_Screen14+0)
MOVT	R0, #hi_addr(_Screen14+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,708 :: 		Screen14.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen14+2)
MOVT	R0, #hi_addr(_Screen14+2)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,709 :: 		Screen14.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen14+4)
MOVT	R0, #hi_addr(_Screen14+4)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,710 :: 		Screen14.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen14+8)
MOVT	R0, #hi_addr(_Screen14+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,711 :: 		Screen14.LabelsCount               = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Screen14+16)
MOVT	R0, #hi_addr(_Screen14+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,712 :: 		Screen14.Labels                    = Screen13_Labels;
MOVW	R1, #lo_addr(_Screen13_Labels+0)
MOVT	R1, #hi_addr(_Screen13_Labels+0)
MOVW	R0, #lo_addr(_Screen14+20)
MOVT	R0, #hi_addr(_Screen14+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,713 :: 		Screen14.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen14+24)
MOVT	R0, #hi_addr(_Screen14+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,714 :: 		Screen14.RadioButtonsCount           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Screen14+32)
MOVT	R0, #hi_addr(_Screen14+32)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,715 :: 		Screen14.RadioButtons                = Screen13_RadioButtons;
MOVW	R1, #lo_addr(_Screen13_RadioButtons+0)
MOVT	R1, #hi_addr(_Screen13_RadioButtons+0)
MOVW	R0, #lo_addr(_Screen14+36)
MOVT	R0, #hi_addr(_Screen14+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,716 :: 		Screen14.ProgressBarsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen14+40)
MOVT	R0, #hi_addr(_Screen14+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,717 :: 		Screen14.ObjectsCount              = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Screen14+6)
MOVT	R0, #hi_addr(_Screen14+6)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,719 :: 		Screen15.Color                     = 0xA280;
MOVW	R1, #41600
MOVW	R0, #lo_addr(_Screen15+0)
MOVT	R0, #hi_addr(_Screen15+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,720 :: 		Screen15.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen15+2)
MOVT	R0, #hi_addr(_Screen15+2)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,721 :: 		Screen15.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen15+4)
MOVT	R0, #hi_addr(_Screen15+4)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,722 :: 		Screen15.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen15+8)
MOVT	R0, #hi_addr(_Screen15+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,723 :: 		Screen15.LabelsCount               = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Screen15+16)
MOVT	R0, #hi_addr(_Screen15+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,724 :: 		Screen15.Labels                    = Screen14_Labels;
MOVW	R1, #lo_addr(_Screen14_Labels+0)
MOVT	R1, #hi_addr(_Screen14_Labels+0)
MOVW	R0, #lo_addr(_Screen15+20)
MOVT	R0, #hi_addr(_Screen15+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,725 :: 		Screen15.CircleButtonsCount        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen15+24)
MOVT	R0, #hi_addr(_Screen15+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,726 :: 		Screen15.CircleButtons             = Screen14_CircleButtons;
MOVW	R1, #lo_addr(_Screen14_CircleButtons+0)
MOVT	R1, #hi_addr(_Screen14_CircleButtons+0)
MOVW	R0, #lo_addr(_Screen15+28)
MOVT	R0, #hi_addr(_Screen15+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,727 :: 		Screen15.RadioButtonsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen15+32)
MOVT	R0, #hi_addr(_Screen15+32)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,728 :: 		Screen15.ProgressBarsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen15+40)
MOVT	R0, #hi_addr(_Screen15+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,729 :: 		Screen15.ObjectsCount              = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Screen15+6)
MOVT	R0, #hi_addr(_Screen15+6)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,731 :: 		Screen16.Color                     = 0x001F;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Screen16+0)
MOVT	R0, #hi_addr(_Screen16+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,732 :: 		Screen16.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen16+2)
MOVT	R0, #hi_addr(_Screen16+2)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,733 :: 		Screen16.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen16+4)
MOVT	R0, #hi_addr(_Screen16+4)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,734 :: 		Screen16.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen16+8)
MOVT	R0, #hi_addr(_Screen16+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,735 :: 		Screen16.LabelsCount               = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen16+16)
MOVT	R0, #hi_addr(_Screen16+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,736 :: 		Screen16.Labels                    = Screen15_Labels;
MOVW	R1, #lo_addr(_Screen15_Labels+0)
MOVT	R1, #hi_addr(_Screen15_Labels+0)
MOVW	R0, #lo_addr(_Screen16+20)
MOVT	R0, #hi_addr(_Screen16+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,737 :: 		Screen16.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen16+24)
MOVT	R0, #hi_addr(_Screen16+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,738 :: 		Screen16.RadioButtonsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen16+32)
MOVT	R0, #hi_addr(_Screen16+32)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,739 :: 		Screen16.ProgressBarsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen16+40)
MOVT	R0, #hi_addr(_Screen16+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,740 :: 		Screen16.ObjectsCount              = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen16+6)
MOVT	R0, #hi_addr(_Screen16+6)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,742 :: 		Screen17.Color                     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Screen17+0)
MOVT	R0, #hi_addr(_Screen17+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,743 :: 		Screen17.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen17+2)
MOVT	R0, #hi_addr(_Screen17+2)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,744 :: 		Screen17.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen17+4)
MOVT	R0, #hi_addr(_Screen17+4)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,745 :: 		Screen17.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen17+8)
MOVT	R0, #hi_addr(_Screen17+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,746 :: 		Screen17.LabelsCount               = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Screen17+16)
MOVT	R0, #hi_addr(_Screen17+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,747 :: 		Screen17.Labels                    = Screen16_Labels;
MOVW	R1, #lo_addr(_Screen16_Labels+0)
MOVT	R1, #hi_addr(_Screen16_Labels+0)
MOVW	R0, #lo_addr(_Screen17+20)
MOVT	R0, #hi_addr(_Screen17+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,748 :: 		Screen17.CircleButtonsCount        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen17+24)
MOVT	R0, #hi_addr(_Screen17+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,749 :: 		Screen17.CircleButtons             = Screen16_CircleButtons;
MOVW	R1, #lo_addr(_Screen16_CircleButtons+0)
MOVT	R1, #hi_addr(_Screen16_CircleButtons+0)
MOVW	R0, #lo_addr(_Screen17+28)
MOVT	R0, #hi_addr(_Screen17+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,750 :: 		Screen17.RadioButtonsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen17+32)
MOVT	R0, #hi_addr(_Screen17+32)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,751 :: 		Screen17.ProgressBarsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen17+40)
MOVT	R0, #hi_addr(_Screen17+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,752 :: 		Screen17.ObjectsCount              = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Screen17+6)
MOVT	R0, #hi_addr(_Screen17+6)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,754 :: 		Screen18.Color                     = 0x4000;
MOVW	R1, #16384
MOVW	R0, #lo_addr(_Screen18+0)
MOVT	R0, #hi_addr(_Screen18+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,755 :: 		Screen18.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen18+2)
MOVT	R0, #hi_addr(_Screen18+2)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,756 :: 		Screen18.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen18+4)
MOVT	R0, #hi_addr(_Screen18+4)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,757 :: 		Screen18.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen18+8)
MOVT	R0, #hi_addr(_Screen18+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,758 :: 		Screen18.LabelsCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen18+16)
MOVT	R0, #hi_addr(_Screen18+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,759 :: 		Screen18.Labels                    = Screen17_Labels;
MOVW	R1, #lo_addr(_Screen17_Labels+0)
MOVT	R1, #hi_addr(_Screen17_Labels+0)
MOVW	R0, #lo_addr(_Screen18+20)
MOVT	R0, #hi_addr(_Screen18+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,760 :: 		Screen18.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen18+24)
MOVT	R0, #hi_addr(_Screen18+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,761 :: 		Screen18.RadioButtonsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen18+32)
MOVT	R0, #hi_addr(_Screen18+32)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,762 :: 		Screen18.ProgressBarsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen18+40)
MOVT	R0, #hi_addr(_Screen18+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,763 :: 		Screen18.ObjectsCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen18+6)
MOVT	R0, #hi_addr(_Screen18+6)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,765 :: 		Screen19.Color                     = 0x0200;
MOVW	R1, #512
MOVW	R0, #lo_addr(_Screen19+0)
MOVT	R0, #hi_addr(_Screen19+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,766 :: 		Screen19.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen19+2)
MOVT	R0, #hi_addr(_Screen19+2)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,767 :: 		Screen19.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen19+4)
MOVT	R0, #hi_addr(_Screen19+4)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,768 :: 		Screen19.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen19+8)
MOVT	R0, #hi_addr(_Screen19+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,769 :: 		Screen19.LabelsCount               = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen19+16)
MOVT	R0, #hi_addr(_Screen19+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,770 :: 		Screen19.Labels                    = Screen18_Labels;
MOVW	R1, #lo_addr(_Screen18_Labels+0)
MOVT	R1, #hi_addr(_Screen18_Labels+0)
MOVW	R0, #lo_addr(_Screen19+20)
MOVT	R0, #hi_addr(_Screen19+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,771 :: 		Screen19.CircleButtonsCount        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen19+24)
MOVT	R0, #hi_addr(_Screen19+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,772 :: 		Screen19.CircleButtons             = Screen18_CircleButtons;
MOVW	R1, #lo_addr(_Screen18_CircleButtons+0)
MOVT	R1, #hi_addr(_Screen18_CircleButtons+0)
MOVW	R0, #lo_addr(_Screen19+28)
MOVT	R0, #hi_addr(_Screen19+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,773 :: 		Screen19.RadioButtonsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen19+32)
MOVT	R0, #hi_addr(_Screen19+32)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,774 :: 		Screen19.ProgressBarsCount           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen19+40)
MOVT	R0, #hi_addr(_Screen19+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,775 :: 		Screen19.ProgressBars                = Screen18_ProgressBars;
MOVW	R1, #lo_addr(_Screen18_ProgressBars+0)
MOVT	R1, #hi_addr(_Screen18_ProgressBars+0)
MOVW	R0, #lo_addr(_Screen19+44)
MOVT	R0, #hi_addr(_Screen19+44)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,776 :: 		Screen19.ObjectsCount              = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Screen19+6)
MOVT	R0, #hi_addr(_Screen19+6)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,778 :: 		Screen20.Color                     = 0x8418;
MOVW	R1, #33816
MOVW	R0, #lo_addr(_Screen20+0)
MOVT	R0, #hi_addr(_Screen20+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,779 :: 		Screen20.Width                     = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen20+2)
MOVT	R0, #hi_addr(_Screen20+2)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,780 :: 		Screen20.Height                    = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen20+4)
MOVT	R0, #hi_addr(_Screen20+4)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,781 :: 		Screen20.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen20+8)
MOVT	R0, #hi_addr(_Screen20+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,782 :: 		Screen20.LabelsCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen20+16)
MOVT	R0, #hi_addr(_Screen20+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,783 :: 		Screen20.Labels                    = Screen19_Labels;
MOVW	R1, #lo_addr(_Screen19_Labels+0)
MOVT	R1, #hi_addr(_Screen19_Labels+0)
MOVW	R0, #lo_addr(_Screen20+20)
MOVT	R0, #hi_addr(_Screen20+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,784 :: 		Screen20.CircleButtonsCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen20+24)
MOVT	R0, #hi_addr(_Screen20+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,785 :: 		Screen20.RadioButtonsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen20+32)
MOVT	R0, #hi_addr(_Screen20+32)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,786 :: 		Screen20.ProgressBarsCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen20+40)
MOVT	R0, #hi_addr(_Screen20+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,787 :: 		Screen20.ObjectsCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen20+6)
MOVT	R0, #hi_addr(_Screen20+6)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,790 :: 		Label1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label1+0)
MOVT	R0, #hi_addr(_Label1+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,791 :: 		Label1.Order          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+4)
MOVT	R0, #hi_addr(_Label1+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,792 :: 		Label1.Left           = 86;
MOVS	R1, #86
MOVW	R0, #lo_addr(_Label1+6)
MOVT	R0, #hi_addr(_Label1+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,793 :: 		Label1.Top            = 45;
MOVS	R1, #45
MOVW	R0, #lo_addr(_Label1+8)
MOVT	R0, #hi_addr(_Label1+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,794 :: 		Label1.Width          = 52;
MOVS	R1, #52
MOVW	R0, #lo_addr(_Label1+10)
MOVT	R0, #hi_addr(_Label1+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,795 :: 		Label1.Height         = 30;
MOVS	R1, #30
MOVW	R0, #lo_addr(_Label1+12)
MOVT	R0, #hi_addr(_Label1+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,796 :: 		Label1.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+26)
MOVT	R0, #hi_addr(_Label1+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,797 :: 		Label1.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+27)
MOVT	R0, #hi_addr(_Label1+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,798 :: 		Label1.Caption        = Label1_Caption;
MOVW	R1, #lo_addr(_Label1_Caption+0)
MOVT	R1, #hi_addr(_Label1_Caption+0)
MOVW	R0, #lo_addr(_Label1+16)
MOVT	R0, #hi_addr(_Label1+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,799 :: 		Label1.FontName       = Arial23x29_Bold;
MOVW	R1, #8796
MOVW	R0, #lo_addr(_Label1+20)
MOVT	R0, #hi_addr(_Label1+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,800 :: 		Label1.Font_Color     = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label1+24)
MOVT	R0, #hi_addr(_Label1+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,801 :: 		Label1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+28)
MOVT	R0, #hi_addr(_Label1+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,802 :: 		Label1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+32)
MOVT	R0, #hi_addr(_Label1+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,803 :: 		Label1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+36)
MOVT	R0, #hi_addr(_Label1+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,804 :: 		Label1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+40)
MOVT	R0, #hi_addr(_Label1+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,806 :: 		Label2.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label2+0)
MOVT	R0, #hi_addr(_Label2+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,807 :: 		Label2.Order          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label2+4)
MOVT	R0, #hi_addr(_Label2+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,808 :: 		Label2.Left           = 33;
MOVS	R1, #33
MOVW	R0, #lo_addr(_Label2+6)
MOVT	R0, #hi_addr(_Label2+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,809 :: 		Label2.Top            = 78;
MOVS	R1, #78
MOVW	R0, #lo_addr(_Label2+8)
MOVT	R0, #hi_addr(_Label2+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,810 :: 		Label2.Width          = 174;
MOVS	R1, #174
MOVW	R0, #lo_addr(_Label2+10)
MOVT	R0, #hi_addr(_Label2+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,811 :: 		Label2.Height         = 30;
MOVS	R1, #30
MOVW	R0, #lo_addr(_Label2+12)
MOVT	R0, #hi_addr(_Label2+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,812 :: 		Label2.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label2+26)
MOVT	R0, #hi_addr(_Label2+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,813 :: 		Label2.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label2+27)
MOVT	R0, #hi_addr(_Label2+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,814 :: 		Label2.Caption        = Label2_Caption;
MOVW	R1, #lo_addr(_Label2_Caption+0)
MOVT	R1, #hi_addr(_Label2_Caption+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,815 :: 		Label2.FontName       = Arial23x29_Bold;
MOVW	R1, #8796
MOVW	R0, #lo_addr(_Label2+20)
MOVT	R0, #hi_addr(_Label2+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,816 :: 		Label2.Font_Color     = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,817 :: 		Label2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+28)
MOVT	R0, #hi_addr(_Label2+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,818 :: 		Label2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+32)
MOVT	R0, #hi_addr(_Label2+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,819 :: 		Label2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+36)
MOVT	R0, #hi_addr(_Label2+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,820 :: 		Label2.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+40)
MOVT	R0, #hi_addr(_Label2+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,822 :: 		Label3.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label3+0)
MOVT	R0, #hi_addr(_Label3+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,823 :: 		Label3.Order          = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label3+4)
MOVT	R0, #hi_addr(_Label3+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,824 :: 		Label3.Left           = 81;
MOVS	R1, #81
MOVW	R0, #lo_addr(_Label3+6)
MOVT	R0, #hi_addr(_Label3+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,825 :: 		Label3.Top            = 117;
MOVS	R1, #117
MOVW	R0, #lo_addr(_Label3+8)
MOVT	R0, #hi_addr(_Label3+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,826 :: 		Label3.Width          = 63;
MOVS	R1, #63
MOVW	R0, #lo_addr(_Label3+10)
MOVT	R0, #hi_addr(_Label3+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,827 :: 		Label3.Height         = 30;
MOVS	R1, #30
MOVW	R0, #lo_addr(_Label3+12)
MOVT	R0, #hi_addr(_Label3+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,828 :: 		Label3.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label3+26)
MOVT	R0, #hi_addr(_Label3+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,829 :: 		Label3.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label3+27)
MOVT	R0, #hi_addr(_Label3+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,830 :: 		Label3.Caption        = Label3_Caption;
MOVW	R1, #lo_addr(_Label3_Caption+0)
MOVT	R1, #hi_addr(_Label3_Caption+0)
MOVW	R0, #lo_addr(_Label3+16)
MOVT	R0, #hi_addr(_Label3+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,831 :: 		Label3.FontName       = Arial23x29_Bold;
MOVW	R1, #8796
MOVW	R0, #lo_addr(_Label3+20)
MOVT	R0, #hi_addr(_Label3+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,832 :: 		Label3.Font_Color     = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label3+24)
MOVT	R0, #hi_addr(_Label3+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,833 :: 		Label3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+28)
MOVT	R0, #hi_addr(_Label3+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,834 :: 		Label3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+32)
MOVT	R0, #hi_addr(_Label3+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,835 :: 		Label3.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+36)
MOVT	R0, #hi_addr(_Label3+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,836 :: 		Label3.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+40)
MOVT	R0, #hi_addr(_Label3+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,838 :: 		Label4.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label4+0)
MOVT	R0, #hi_addr(_Label4+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,839 :: 		Label4.Order          = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Label4+4)
MOVT	R0, #hi_addr(_Label4+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,840 :: 		Label4.Left           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Label4+6)
MOVT	R0, #hi_addr(_Label4+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,841 :: 		Label4.Top            = 153;
MOVS	R1, #153
MOVW	R0, #lo_addr(_Label4+8)
MOVT	R0, #hi_addr(_Label4+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,842 :: 		Label4.Width          = 201;
MOVS	R1, #201
MOVW	R0, #lo_addr(_Label4+10)
MOVT	R0, #hi_addr(_Label4+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,843 :: 		Label4.Height         = 30;
MOVS	R1, #30
MOVW	R0, #lo_addr(_Label4+12)
MOVT	R0, #hi_addr(_Label4+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,844 :: 		Label4.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label4+26)
MOVT	R0, #hi_addr(_Label4+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,845 :: 		Label4.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label4+27)
MOVT	R0, #hi_addr(_Label4+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,846 :: 		Label4.Caption        = Label4_Caption;
MOVW	R1, #lo_addr(_Label4_Caption+0)
MOVT	R1, #hi_addr(_Label4_Caption+0)
MOVW	R0, #lo_addr(_Label4+16)
MOVT	R0, #hi_addr(_Label4+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,847 :: 		Label4.FontName       = Arial23x29_Bold;
MOVW	R1, #8796
MOVW	R0, #lo_addr(_Label4+20)
MOVT	R0, #hi_addr(_Label4+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,848 :: 		Label4.Font_Color     = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label4+24)
MOVT	R0, #hi_addr(_Label4+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,849 :: 		Label4.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+28)
MOVT	R0, #hi_addr(_Label4+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,850 :: 		Label4.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+32)
MOVT	R0, #hi_addr(_Label4+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,851 :: 		Label4.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+36)
MOVT	R0, #hi_addr(_Label4+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,852 :: 		Label4.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+40)
MOVT	R0, #hi_addr(_Label4+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,854 :: 		CircleButton1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_CircleButton1+0)
MOVT	R0, #hi_addr(_CircleButton1+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,855 :: 		CircleButton1.Order          = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_CircleButton1+4)
MOVT	R0, #hi_addr(_CircleButton1+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,856 :: 		CircleButton1.Left           = 86;
MOVS	R1, #86
MOVW	R0, #lo_addr(_CircleButton1+6)
MOVT	R0, #hi_addr(_CircleButton1+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,857 :: 		CircleButton1.Top            = 202;
MOVS	R1, #202
MOVW	R0, #lo_addr(_CircleButton1+8)
MOVT	R0, #hi_addr(_CircleButton1+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,858 :: 		CircleButton1.Radius         = 30;
MOVS	R1, #30
MOVW	R0, #lo_addr(_CircleButton1+10)
MOVT	R0, #hi_addr(_CircleButton1+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,859 :: 		CircleButton1.Pen_Width      = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton1+12)
MOVT	R0, #hi_addr(_CircleButton1+12)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,860 :: 		CircleButton1.Pen_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton1+14)
MOVT	R0, #hi_addr(_CircleButton1+14)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,861 :: 		CircleButton1.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton1+16)
MOVT	R0, #hi_addr(_CircleButton1+16)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,862 :: 		CircleButton1.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton1+17)
MOVT	R0, #hi_addr(_CircleButton1+17)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,863 :: 		CircleButton1.Transparent    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton1+18)
MOVT	R0, #hi_addr(_CircleButton1+18)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,864 :: 		CircleButton1.Caption        = CircleButton1_Caption;
MOVW	R1, #lo_addr(_CircleButton1_Caption+0)
MOVT	R1, #hi_addr(_CircleButton1_Caption+0)
MOVW	R0, #lo_addr(_CircleButton1+20)
MOVT	R0, #hi_addr(_CircleButton1+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,865 :: 		CircleButton1.TextAlign             = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton1+24)
MOVT	R0, #hi_addr(_CircleButton1+24)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,866 :: 		CircleButton1.FontName       = Tahoma11x13_Regular;
MOVW	R1, #944
MOVT	R1, #1
MOVW	R0, #lo_addr(_CircleButton1+28)
MOVT	R0, #hi_addr(_CircleButton1+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,867 :: 		CircleButton1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton1+42)
MOVT	R0, #hi_addr(_CircleButton1+42)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,868 :: 		CircleButton1.Font_Color     = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton1+32)
MOVT	R0, #hi_addr(_CircleButton1+32)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,869 :: 		CircleButton1.Gradient       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton1+34)
MOVT	R0, #hi_addr(_CircleButton1+34)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,870 :: 		CircleButton1.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton1+35)
MOVT	R0, #hi_addr(_CircleButton1+35)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,871 :: 		CircleButton1.Gradient_Start_Color    = 0x8208;
MOVW	R1, #33288
MOVW	R0, #lo_addr(_CircleButton1+36)
MOVT	R0, #hi_addr(_CircleButton1+36)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,872 :: 		CircleButton1.Gradient_End_Color      = 0xFC08;
MOVW	R1, #64520
MOVW	R0, #lo_addr(_CircleButton1+38)
MOVT	R0, #hi_addr(_CircleButton1+38)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,873 :: 		CircleButton1.Color          = 0xFC00;
MOVW	R1, #64512
MOVW	R0, #lo_addr(_CircleButton1+40)
MOVT	R0, #hi_addr(_CircleButton1+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,874 :: 		CircleButton1.Press_Color    = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_CircleButton1+44)
MOVT	R0, #hi_addr(_CircleButton1+44)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,875 :: 		CircleButton1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton1+48)
MOVT	R0, #hi_addr(_CircleButton1+48)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,876 :: 		CircleButton1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton1+52)
MOVT	R0, #hi_addr(_CircleButton1+52)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,877 :: 		CircleButton1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton1+56)
MOVT	R0, #hi_addr(_CircleButton1+56)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,878 :: 		CircleButton1.OnPressPtr      = S1_START;
MOVW	R1, #lo_addr(_S1_START+0)
MOVT	R1, #hi_addr(_S1_START+0)
MOVW	R0, #lo_addr(_CircleButton1+60)
MOVT	R0, #hi_addr(_CircleButton1+60)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,880 :: 		ButtonRound1.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_ButtonRound1+0)
MOVT	R0, #hi_addr(_ButtonRound1+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,881 :: 		ButtonRound1.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+4)
MOVT	R0, #hi_addr(_ButtonRound1+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,882 :: 		ButtonRound1.Left            = 68;
MOVS	R1, #68
MOVW	R0, #lo_addr(_ButtonRound1+6)
MOVT	R0, #hi_addr(_ButtonRound1+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,883 :: 		ButtonRound1.Top             = 75;
MOVS	R1, #75
MOVW	R0, #lo_addr(_ButtonRound1+8)
MOVT	R0, #hi_addr(_ButtonRound1+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,884 :: 		ButtonRound1.Width           = 91;
MOVS	R1, #91
MOVW	R0, #lo_addr(_ButtonRound1+10)
MOVT	R0, #hi_addr(_ButtonRound1+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,885 :: 		ButtonRound1.Height          = 48;
MOVS	R1, #48
MOVW	R0, #lo_addr(_ButtonRound1+12)
MOVT	R0, #hi_addr(_ButtonRound1+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,886 :: 		ButtonRound1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+14)
MOVT	R0, #hi_addr(_ButtonRound1+14)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,887 :: 		ButtonRound1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+16)
MOVT	R0, #hi_addr(_ButtonRound1+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,888 :: 		ButtonRound1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+18)
MOVT	R0, #hi_addr(_ButtonRound1+18)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,889 :: 		ButtonRound1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+19)
MOVT	R0, #hi_addr(_ButtonRound1+19)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,890 :: 		ButtonRound1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+20)
MOVT	R0, #hi_addr(_ButtonRound1+20)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,891 :: 		ButtonRound1.Caption         = ButtonRound1_Caption;
MOVW	R1, #lo_addr(_ButtonRound1_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound1_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound1+24)
MOVT	R0, #hi_addr(_ButtonRound1+24)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,892 :: 		ButtonRound1.TextAlign             = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+28)
MOVT	R0, #hi_addr(_ButtonRound1+28)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,893 :: 		ButtonRound1.FontName        = Tahoma16x19_Regular;
MOVW	R1, #34092
MOVW	R0, #lo_addr(_ButtonRound1+32)
MOVT	R0, #hi_addr(_ButtonRound1+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,894 :: 		ButtonRound1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+47)
MOVT	R0, #hi_addr(_ButtonRound1+47)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,895 :: 		ButtonRound1.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound1+36)
MOVT	R0, #hi_addr(_ButtonRound1+36)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,896 :: 		ButtonRound1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+38)
MOVT	R0, #hi_addr(_ButtonRound1+38)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,897 :: 		ButtonRound1.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+39)
MOVT	R0, #hi_addr(_ButtonRound1+39)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,898 :: 		ButtonRound1.Gradient_Start_Color    = 0x041F;
MOVW	R1, #1055
MOVW	R0, #lo_addr(_ButtonRound1+40)
MOVT	R0, #hi_addr(_ButtonRound1+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,899 :: 		ButtonRound1.Gradient_End_Color      = 0xF810;
MOVW	R1, #63504
MOVW	R0, #lo_addr(_ButtonRound1+42)
MOVT	R0, #hi_addr(_ButtonRound1+42)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,900 :: 		ButtonRound1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound1+44)
MOVT	R0, #hi_addr(_ButtonRound1+44)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,901 :: 		ButtonRound1.Press_Color     = 0xF810;
MOVW	R1, #63504
MOVW	R0, #lo_addr(_ButtonRound1+48)
MOVT	R0, #hi_addr(_ButtonRound1+48)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,902 :: 		ButtonRound1.Corner_Radius      = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound1+46)
MOVT	R0, #hi_addr(_ButtonRound1+46)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,903 :: 		ButtonRound1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+52)
MOVT	R0, #hi_addr(_ButtonRound1+52)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,904 :: 		ButtonRound1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+56)
MOVT	R0, #hi_addr(_ButtonRound1+56)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,905 :: 		ButtonRound1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+60)
MOVT	R0, #hi_addr(_ButtonRound1+60)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,906 :: 		ButtonRound1.OnPressPtr      = PCA_SELECT;
MOVW	R1, #lo_addr(_PCA_SELECT+0)
MOVT	R1, #hi_addr(_PCA_SELECT+0)
MOVW	R0, #lo_addr(_ButtonRound1+64)
MOVT	R0, #hi_addr(_ButtonRound1+64)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,908 :: 		ButtonRound2.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_ButtonRound2+0)
MOVT	R0, #hi_addr(_ButtonRound2+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,909 :: 		ButtonRound2.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+4)
MOVT	R0, #hi_addr(_ButtonRound2+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,910 :: 		ButtonRound2.Left            = 70;
MOVS	R1, #70
MOVW	R0, #lo_addr(_ButtonRound2+6)
MOVT	R0, #hi_addr(_ButtonRound2+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,911 :: 		ButtonRound2.Top             = 151;
MOVS	R1, #151
MOVW	R0, #lo_addr(_ButtonRound2+8)
MOVT	R0, #hi_addr(_ButtonRound2+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,912 :: 		ButtonRound2.Width           = 91;
MOVS	R1, #91
MOVW	R0, #lo_addr(_ButtonRound2+10)
MOVT	R0, #hi_addr(_ButtonRound2+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,913 :: 		ButtonRound2.Height          = 49;
MOVS	R1, #49
MOVW	R0, #lo_addr(_ButtonRound2+12)
MOVT	R0, #hi_addr(_ButtonRound2+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,914 :: 		ButtonRound2.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+14)
MOVT	R0, #hi_addr(_ButtonRound2+14)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,915 :: 		ButtonRound2.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+16)
MOVT	R0, #hi_addr(_ButtonRound2+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,916 :: 		ButtonRound2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+18)
MOVT	R0, #hi_addr(_ButtonRound2+18)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,917 :: 		ButtonRound2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+19)
MOVT	R0, #hi_addr(_ButtonRound2+19)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,918 :: 		ButtonRound2.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+20)
MOVT	R0, #hi_addr(_ButtonRound2+20)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,919 :: 		ButtonRound2.Caption         = ButtonRound2_Caption;
MOVW	R1, #lo_addr(_ButtonRound2_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound2_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound2+24)
MOVT	R0, #hi_addr(_ButtonRound2+24)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,920 :: 		ButtonRound2.TextAlign             = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+28)
MOVT	R0, #hi_addr(_ButtonRound2+28)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,921 :: 		ButtonRound2.FontName        = Tahoma16x19_Regular;
MOVW	R1, #34092
MOVW	R0, #lo_addr(_ButtonRound2+32)
MOVT	R0, #hi_addr(_ButtonRound2+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,922 :: 		ButtonRound2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+47)
MOVT	R0, #hi_addr(_ButtonRound2+47)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,923 :: 		ButtonRound2.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound2+36)
MOVT	R0, #hi_addr(_ButtonRound2+36)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,924 :: 		ButtonRound2.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+38)
MOVT	R0, #hi_addr(_ButtonRound2+38)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,925 :: 		ButtonRound2.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+39)
MOVT	R0, #hi_addr(_ButtonRound2+39)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,926 :: 		ButtonRound2.Gradient_Start_Color    = 0x87F0;
MOVW	R1, #34800
MOVW	R0, #lo_addr(_ButtonRound2+40)
MOVT	R0, #hi_addr(_ButtonRound2+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,927 :: 		ButtonRound2.Gradient_End_Color      = 0x0418;
MOVW	R1, #1048
MOVW	R0, #lo_addr(_ButtonRound2+42)
MOVT	R0, #hi_addr(_ButtonRound2+42)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,928 :: 		ButtonRound2.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound2+44)
MOVT	R0, #hi_addr(_ButtonRound2+44)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,929 :: 		ButtonRound2.Press_Color     = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_ButtonRound2+48)
MOVT	R0, #hi_addr(_ButtonRound2+48)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,930 :: 		ButtonRound2.Corner_Radius      = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound2+46)
MOVT	R0, #hi_addr(_ButtonRound2+46)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,931 :: 		ButtonRound2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+52)
MOVT	R0, #hi_addr(_ButtonRound2+52)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,932 :: 		ButtonRound2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+56)
MOVT	R0, #hi_addr(_ButtonRound2+56)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,933 :: 		ButtonRound2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+60)
MOVT	R0, #hi_addr(_ButtonRound2+60)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,934 :: 		ButtonRound2.OnPressPtr      = FLDA_SELECT;
MOVW	R1, #lo_addr(_FLDA_SELECT+0)
MOVT	R1, #hi_addr(_FLDA_SELECT+0)
MOVW	R0, #lo_addr(_ButtonRound2+64)
MOVT	R0, #hi_addr(_ButtonRound2+64)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,936 :: 		Label8.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Label8+0)
MOVT	R0, #hi_addr(_Label8+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,937 :: 		Label8.Order          = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label8+4)
MOVT	R0, #hi_addr(_Label8+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,938 :: 		Label8.Left           = 55;
MOVS	R1, #55
MOVW	R0, #lo_addr(_Label8+6)
MOVT	R0, #hi_addr(_Label8+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,939 :: 		Label8.Top            = 27;
MOVS	R1, #27
MOVW	R0, #lo_addr(_Label8+8)
MOVT	R0, #hi_addr(_Label8+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,940 :: 		Label8.Width          = 119;
MOVS	R1, #119
MOVW	R0, #lo_addr(_Label8+10)
MOVT	R0, #hi_addr(_Label8+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,941 :: 		Label8.Height         = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_Label8+12)
MOVT	R0, #hi_addr(_Label8+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,942 :: 		Label8.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label8+26)
MOVT	R0, #hi_addr(_Label8+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,943 :: 		Label8.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label8+27)
MOVT	R0, #hi_addr(_Label8+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,944 :: 		Label8.Caption        = Label8_Caption;
MOVW	R1, #lo_addr(_Label8_Caption+0)
MOVT	R1, #hi_addr(_Label8_Caption+0)
MOVW	R0, #lo_addr(_Label8+16)
MOVT	R0, #hi_addr(_Label8+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,945 :: 		Label8.FontName       = Tahoma21x25_Regular;
MOVW	R1, #48631
MOVW	R0, #lo_addr(_Label8+20)
MOVT	R0, #hi_addr(_Label8+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,946 :: 		Label8.Font_Color     = 0x001F;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label8+24)
MOVT	R0, #hi_addr(_Label8+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,947 :: 		Label8.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label8+28)
MOVT	R0, #hi_addr(_Label8+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,948 :: 		Label8.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label8+32)
MOVT	R0, #hi_addr(_Label8+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,949 :: 		Label8.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label8+36)
MOVT	R0, #hi_addr(_Label8+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,950 :: 		Label8.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label8+40)
MOVT	R0, #hi_addr(_Label8+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,952 :: 		ButtonRound8.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_ButtonRound8+0)
MOVT	R0, #hi_addr(_ButtonRound8+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,953 :: 		ButtonRound8.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound8+4)
MOVT	R0, #hi_addr(_ButtonRound8+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,954 :: 		ButtonRound8.Left            = 68;
MOVS	R1, #68
MOVW	R0, #lo_addr(_ButtonRound8+6)
MOVT	R0, #hi_addr(_ButtonRound8+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,955 :: 		ButtonRound8.Top             = 234;
MOVS	R1, #234
MOVW	R0, #lo_addr(_ButtonRound8+8)
MOVT	R0, #hi_addr(_ButtonRound8+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,956 :: 		ButtonRound8.Width           = 99;
MOVS	R1, #99
MOVW	R0, #lo_addr(_ButtonRound8+10)
MOVT	R0, #hi_addr(_ButtonRound8+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,957 :: 		ButtonRound8.Height          = 49;
MOVS	R1, #49
MOVW	R0, #lo_addr(_ButtonRound8+12)
MOVT	R0, #hi_addr(_ButtonRound8+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,958 :: 		ButtonRound8.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+14)
MOVT	R0, #hi_addr(_ButtonRound8+14)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,959 :: 		ButtonRound8.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound8+16)
MOVT	R0, #hi_addr(_ButtonRound8+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,960 :: 		ButtonRound8.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+18)
MOVT	R0, #hi_addr(_ButtonRound8+18)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,961 :: 		ButtonRound8.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+19)
MOVT	R0, #hi_addr(_ButtonRound8+19)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,962 :: 		ButtonRound8.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+20)
MOVT	R0, #hi_addr(_ButtonRound8+20)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,963 :: 		ButtonRound8.Caption         = ButtonRound8_Caption;
MOVW	R1, #lo_addr(_ButtonRound8_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound8_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound8+24)
MOVT	R0, #hi_addr(_ButtonRound8+24)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,964 :: 		ButtonRound8.TextAlign             = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+28)
MOVT	R0, #hi_addr(_ButtonRound8+28)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,965 :: 		ButtonRound8.FontName        = Tahoma11x13_Regular;
MOVW	R1, #944
MOVT	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+32)
MOVT	R0, #hi_addr(_ButtonRound8+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,966 :: 		ButtonRound8.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+47)
MOVT	R0, #hi_addr(_ButtonRound8+47)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,967 :: 		ButtonRound8.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound8+36)
MOVT	R0, #hi_addr(_ButtonRound8+36)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,968 :: 		ButtonRound8.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+38)
MOVT	R0, #hi_addr(_ButtonRound8+38)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,969 :: 		ButtonRound8.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound8+39)
MOVT	R0, #hi_addr(_ButtonRound8+39)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,970 :: 		ButtonRound8.Gradient_Start_Color    = 0xFFF0;
MOVW	R1, #65520
MOVW	R0, #lo_addr(_ButtonRound8+40)
MOVT	R0, #hi_addr(_ButtonRound8+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,971 :: 		ButtonRound8.Gradient_End_Color      = 0x07FF;
MOVW	R1, #2047
MOVW	R0, #lo_addr(_ButtonRound8+42)
MOVT	R0, #hi_addr(_ButtonRound8+42)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,972 :: 		ButtonRound8.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound8+44)
MOVT	R0, #hi_addr(_ButtonRound8+44)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,973 :: 		ButtonRound8.Press_Color     = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_ButtonRound8+48)
MOVT	R0, #hi_addr(_ButtonRound8+48)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,974 :: 		ButtonRound8.Corner_Radius      = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound8+46)
MOVT	R0, #hi_addr(_ButtonRound8+46)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,975 :: 		ButtonRound8.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound8+52)
MOVT	R0, #hi_addr(_ButtonRound8+52)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,976 :: 		ButtonRound8.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound8+56)
MOVT	R0, #hi_addr(_ButtonRound8+56)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,977 :: 		ButtonRound8.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound8+60)
MOVT	R0, #hi_addr(_ButtonRound8+60)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,978 :: 		ButtonRound8.OnPressPtr      = DATABASE_SHOW;
MOVW	R1, #lo_addr(_DATABASE_SHOW+0)
MOVT	R1, #hi_addr(_DATABASE_SHOW+0)
MOVW	R0, #lo_addr(_ButtonRound8+64)
MOVT	R0, #hi_addr(_ButtonRound8+64)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,980 :: 		ButtonRound4.OwnerScreen     = &Screen3;
MOVW	R1, #lo_addr(_Screen3+0)
MOVT	R1, #hi_addr(_Screen3+0)
MOVW	R0, #lo_addr(_ButtonRound4+0)
MOVT	R0, #hi_addr(_ButtonRound4+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,981 :: 		ButtonRound4.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound4+4)
MOVT	R0, #hi_addr(_ButtonRound4+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,982 :: 		ButtonRound4.Left            = 67;
MOVS	R1, #67
MOVW	R0, #lo_addr(_ButtonRound4+6)
MOVT	R0, #hi_addr(_ButtonRound4+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,983 :: 		ButtonRound4.Top             = 146;
MOVS	R1, #146
MOVW	R0, #lo_addr(_ButtonRound4+8)
MOVT	R0, #hi_addr(_ButtonRound4+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,984 :: 		ButtonRound4.Width           = 102;
MOVS	R1, #102
MOVW	R0, #lo_addr(_ButtonRound4+10)
MOVT	R0, #hi_addr(_ButtonRound4+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,985 :: 		ButtonRound4.Height          = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_ButtonRound4+12)
MOVT	R0, #hi_addr(_ButtonRound4+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,986 :: 		ButtonRound4.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+14)
MOVT	R0, #hi_addr(_ButtonRound4+14)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,987 :: 		ButtonRound4.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound4+16)
MOVT	R0, #hi_addr(_ButtonRound4+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,988 :: 		ButtonRound4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+18)
MOVT	R0, #hi_addr(_ButtonRound4+18)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,989 :: 		ButtonRound4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+19)
MOVT	R0, #hi_addr(_ButtonRound4+19)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,990 :: 		ButtonRound4.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+20)
MOVT	R0, #hi_addr(_ButtonRound4+20)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,991 :: 		ButtonRound4.Caption         = ButtonRound4_Caption;
MOVW	R1, #lo_addr(_ButtonRound4_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound4_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound4+24)
MOVT	R0, #hi_addr(_ButtonRound4+24)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,992 :: 		ButtonRound4.TextAlign             = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+28)
MOVT	R0, #hi_addr(_ButtonRound4+28)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,993 :: 		ButtonRound4.FontName        = Tahoma11x13_Regular;
MOVW	R1, #944
MOVT	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+32)
MOVT	R0, #hi_addr(_ButtonRound4+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,994 :: 		ButtonRound4.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+47)
MOVT	R0, #hi_addr(_ButtonRound4+47)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,995 :: 		ButtonRound4.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound4+36)
MOVT	R0, #hi_addr(_ButtonRound4+36)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,996 :: 		ButtonRound4.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+38)
MOVT	R0, #hi_addr(_ButtonRound4+38)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,997 :: 		ButtonRound4.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound4+39)
MOVT	R0, #hi_addr(_ButtonRound4+39)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,998 :: 		ButtonRound4.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound4+40)
MOVT	R0, #hi_addr(_ButtonRound4+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,999 :: 		ButtonRound4.Gradient_End_Color      = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound4+42)
MOVT	R0, #hi_addr(_ButtonRound4+42)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1000 :: 		ButtonRound4.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound4+44)
MOVT	R0, #hi_addr(_ButtonRound4+44)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1001 :: 		ButtonRound4.Press_Color     = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_ButtonRound4+48)
MOVT	R0, #hi_addr(_ButtonRound4+48)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1002 :: 		ButtonRound4.Corner_Radius      = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound4+46)
MOVT	R0, #hi_addr(_ButtonRound4+46)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1003 :: 		ButtonRound4.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound4+52)
MOVT	R0, #hi_addr(_ButtonRound4+52)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1004 :: 		ButtonRound4.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound4+56)
MOVT	R0, #hi_addr(_ButtonRound4+56)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1005 :: 		ButtonRound4.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound4+60)
MOVT	R0, #hi_addr(_ButtonRound4+60)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1006 :: 		ButtonRound4.OnPressPtr      = JACOBI_SELECT;
MOVW	R1, #lo_addr(_JACOBI_SELECT+0)
MOVT	R1, #hi_addr(_JACOBI_SELECT+0)
MOVW	R0, #lo_addr(_ButtonRound4+64)
MOVT	R0, #hi_addr(_ButtonRound4+64)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1008 :: 		Label7.OwnerScreen     = &Screen3;
MOVW	R1, #lo_addr(_Screen3+0)
MOVT	R1, #hi_addr(_Screen3+0)
MOVW	R0, #lo_addr(_Label7+0)
MOVT	R0, #hi_addr(_Label7+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1009 :: 		Label7.Order          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label7+4)
MOVT	R0, #hi_addr(_Label7+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1010 :: 		Label7.Left           = 72;
MOVS	R1, #72
MOVW	R0, #lo_addr(_Label7+6)
MOVT	R0, #hi_addr(_Label7+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1011 :: 		Label7.Top            = 33;
MOVS	R1, #33
MOVW	R0, #lo_addr(_Label7+8)
MOVT	R0, #hi_addr(_Label7+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1012 :: 		Label7.Width          = 99;
MOVS	R1, #99
MOVW	R0, #lo_addr(_Label7+10)
MOVT	R0, #hi_addr(_Label7+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1013 :: 		Label7.Height         = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Label7+12)
MOVT	R0, #hi_addr(_Label7+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1014 :: 		Label7.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label7+26)
MOVT	R0, #hi_addr(_Label7+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1015 :: 		Label7.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label7+27)
MOVT	R0, #hi_addr(_Label7+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1016 :: 		Label7.Caption        = Label7_Caption;
MOVW	R1, #lo_addr(_Label7_Caption+0)
MOVT	R1, #hi_addr(_Label7_Caption+0)
MOVW	R0, #lo_addr(_Label7+16)
MOVT	R0, #hi_addr(_Label7+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1017 :: 		Label7.FontName       = Tahoma19x23_Regular;
MOVW	R1, #40234
MOVW	R0, #lo_addr(_Label7+20)
MOVT	R0, #hi_addr(_Label7+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1018 :: 		Label7.Font_Color     = 0x9FE0;
MOVW	R1, #40928
MOVW	R0, #lo_addr(_Label7+24)
MOVT	R0, #hi_addr(_Label7+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1019 :: 		Label7.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+28)
MOVT	R0, #hi_addr(_Label7+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1020 :: 		Label7.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+32)
MOVT	R0, #hi_addr(_Label7+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1021 :: 		Label7.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+36)
MOVT	R0, #hi_addr(_Label7+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1022 :: 		Label7.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+40)
MOVT	R0, #hi_addr(_Label7+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1024 :: 		Label5.OwnerScreen     = &Screen3;
MOVW	R1, #lo_addr(_Screen3+0)
MOVT	R1, #hi_addr(_Screen3+0)
MOVW	R0, #lo_addr(_Label5+0)
MOVT	R0, #hi_addr(_Label5+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1025 :: 		Label5.Order          = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label5+4)
MOVT	R0, #hi_addr(_Label5+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1026 :: 		Label5.Left           = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label5+6)
MOVT	R0, #hi_addr(_Label5+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1027 :: 		Label5.Top            = 69;
MOVS	R1, #69
MOVW	R0, #lo_addr(_Label5+8)
MOVT	R0, #hi_addr(_Label5+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1028 :: 		Label5.Width          = 181;
MOVS	R1, #181
MOVW	R0, #lo_addr(_Label5+10)
MOVT	R0, #hi_addr(_Label5+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1029 :: 		Label5.Height         = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Label5+12)
MOVT	R0, #hi_addr(_Label5+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1030 :: 		Label5.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label5+26)
MOVT	R0, #hi_addr(_Label5+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1031 :: 		Label5.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label5+27)
MOVT	R0, #hi_addr(_Label5+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1032 :: 		Label5.Caption        = Label5_Caption;
MOVW	R1, #lo_addr(_Label5_Caption+0)
MOVT	R1, #hi_addr(_Label5_Caption+0)
MOVW	R0, #lo_addr(_Label5+16)
MOVT	R0, #hi_addr(_Label5+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1033 :: 		Label5.FontName       = Tahoma19x23_Regular;
MOVW	R1, #40234
MOVW	R0, #lo_addr(_Label5+20)
MOVT	R0, #hi_addr(_Label5+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1034 :: 		Label5.Font_Color     = 0x9FE0;
MOVW	R1, #40928
MOVW	R0, #lo_addr(_Label5+24)
MOVT	R0, #hi_addr(_Label5+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1035 :: 		Label5.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+28)
MOVT	R0, #hi_addr(_Label5+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1036 :: 		Label5.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+32)
MOVT	R0, #hi_addr(_Label5+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1037 :: 		Label5.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+36)
MOVT	R0, #hi_addr(_Label5+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1038 :: 		Label5.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+40)
MOVT	R0, #hi_addr(_Label5+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1040 :: 		Label6.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_Label6+0)
MOVT	R0, #hi_addr(_Label6+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1041 :: 		Label6.Order          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+4)
MOVT	R0, #hi_addr(_Label6+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1042 :: 		Label6.Left           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label6+6)
MOVT	R0, #hi_addr(_Label6+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1043 :: 		Label6.Top            = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_Label6+8)
MOVT	R0, #hi_addr(_Label6+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1044 :: 		Label6.Width          = 219;
MOVS	R1, #219
MOVW	R0, #lo_addr(_Label6+10)
MOVT	R0, #hi_addr(_Label6+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1045 :: 		Label6.Height         = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label6+12)
MOVT	R0, #hi_addr(_Label6+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1046 :: 		Label6.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label6+26)
MOVT	R0, #hi_addr(_Label6+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1047 :: 		Label6.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label6+27)
MOVT	R0, #hi_addr(_Label6+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1048 :: 		Label6.Caption        = Label6_Caption;
MOVW	R1, #lo_addr(_Label6_Caption+0)
MOVT	R1, #hi_addr(_Label6_Caption+0)
MOVW	R0, #lo_addr(_Label6+16)
MOVT	R0, #hi_addr(_Label6+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1049 :: 		Label6.FontName       = Arial13x16_Bold;
MOVW	R1, #2666
MOVW	R0, #lo_addr(_Label6+20)
MOVT	R0, #hi_addr(_Label6+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1050 :: 		Label6.Font_Color     = 0x6000;
MOVW	R1, #24576
MOVW	R0, #lo_addr(_Label6+24)
MOVT	R0, #hi_addr(_Label6+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1051 :: 		Label6.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+28)
MOVT	R0, #hi_addr(_Label6+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1052 :: 		Label6.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+32)
MOVT	R0, #hi_addr(_Label6+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1053 :: 		Label6.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+36)
MOVT	R0, #hi_addr(_Label6+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1054 :: 		Label6.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+40)
MOVT	R0, #hi_addr(_Label6+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1056 :: 		RadioButton7.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_RadioButton7+0)
MOVT	R0, #hi_addr(_RadioButton7+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1057 :: 		RadioButton7.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton7+4)
MOVT	R0, #hi_addr(_RadioButton7+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1058 :: 		RadioButton7.Left            = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_RadioButton7+6)
MOVT	R0, #hi_addr(_RadioButton7+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1059 :: 		RadioButton7.Top             = 59;
MOVS	R1, #59
MOVW	R0, #lo_addr(_RadioButton7+8)
MOVT	R0, #hi_addr(_RadioButton7+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1060 :: 		RadioButton7.Width           = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton7+10)
MOVT	R0, #hi_addr(_RadioButton7+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1061 :: 		RadioButton7.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_RadioButton7+12)
MOVT	R0, #hi_addr(_RadioButton7+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1062 :: 		RadioButton7.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton7+14)
MOVT	R0, #hi_addr(_RadioButton7+14)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1063 :: 		RadioButton7.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+16)
MOVT	R0, #hi_addr(_RadioButton7+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1064 :: 		RadioButton7.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton7+18)
MOVT	R0, #hi_addr(_RadioButton7+18)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1065 :: 		RadioButton7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton7+19)
MOVT	R0, #hi_addr(_RadioButton7+19)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1066 :: 		RadioButton7.Checked          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton7+20)
MOVT	R0, #hi_addr(_RadioButton7+20)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1067 :: 		RadioButton7.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton7+21)
MOVT	R0, #hi_addr(_RadioButton7+21)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1068 :: 		RadioButton7.Caption         = RadioButton7_Caption;
MOVW	R1, #lo_addr(_RadioButton7_Caption+0)
MOVT	R1, #hi_addr(_RadioButton7_Caption+0)
MOVW	R0, #lo_addr(_RadioButton7+24)
MOVT	R0, #hi_addr(_RadioButton7+24)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1069 :: 		RadioButton7.TextAlign            = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+28)
MOVT	R0, #hi_addr(_RadioButton7+28)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1070 :: 		RadioButton7.FontName        = Tahoma11x13_Regular;
MOVW	R1, #944
MOVT	R1, #1
MOVW	R0, #lo_addr(_RadioButton7+32)
MOVT	R0, #hi_addr(_RadioButton7+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1071 :: 		RadioButton7.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton7+48)
MOVT	R0, #hi_addr(_RadioButton7+48)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1072 :: 		RadioButton7.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+36)
MOVT	R0, #hi_addr(_RadioButton7+36)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1073 :: 		RadioButton7.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton7+38)
MOVT	R0, #hi_addr(_RadioButton7+38)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1074 :: 		RadioButton7.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+39)
MOVT	R0, #hi_addr(_RadioButton7+39)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1075 :: 		RadioButton7.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton7+40)
MOVT	R0, #hi_addr(_RadioButton7+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1076 :: 		RadioButton7.Gradient_End_Color      = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton7+42)
MOVT	R0, #hi_addr(_RadioButton7+42)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1077 :: 		RadioButton7.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton7+44)
MOVT	R0, #hi_addr(_RadioButton7+44)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1078 :: 		RadioButton7.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton7+50)
MOVT	R0, #hi_addr(_RadioButton7+50)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1079 :: 		RadioButton7.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_RadioButton7+46)
MOVT	R0, #hi_addr(_RadioButton7+46)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1080 :: 		RadioButton7.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+52)
MOVT	R0, #hi_addr(_RadioButton7+52)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1081 :: 		RadioButton7.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+56)
MOVT	R0, #hi_addr(_RadioButton7+56)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1082 :: 		RadioButton7.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+60)
MOVT	R0, #hi_addr(_RadioButton7+60)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1083 :: 		RadioButton7.OnPressPtr      = J_E_2;
MOVW	R1, #lo_addr(_J_E_2+0)
MOVT	R1, #hi_addr(_J_E_2+0)
MOVW	R0, #lo_addr(_RadioButton7+64)
MOVT	R0, #hi_addr(_RadioButton7+64)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1085 :: 		RadioButton8.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_RadioButton8+0)
MOVT	R0, #hi_addr(_RadioButton8+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1086 :: 		RadioButton8.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_RadioButton8+4)
MOVT	R0, #hi_addr(_RadioButton8+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1087 :: 		RadioButton8.Left            = 110;
MOVS	R1, #110
MOVW	R0, #lo_addr(_RadioButton8+6)
MOVT	R0, #hi_addr(_RadioButton8+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1088 :: 		RadioButton8.Top             = 85;
MOVS	R1, #85
MOVW	R0, #lo_addr(_RadioButton8+8)
MOVT	R0, #hi_addr(_RadioButton8+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1089 :: 		RadioButton8.Width           = 48;
MOVS	R1, #48
MOVW	R0, #lo_addr(_RadioButton8+10)
MOVT	R0, #hi_addr(_RadioButton8+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1090 :: 		RadioButton8.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_RadioButton8+12)
MOVT	R0, #hi_addr(_RadioButton8+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1091 :: 		RadioButton8.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton8+14)
MOVT	R0, #hi_addr(_RadioButton8+14)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1092 :: 		RadioButton8.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+16)
MOVT	R0, #hi_addr(_RadioButton8+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1093 :: 		RadioButton8.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton8+18)
MOVT	R0, #hi_addr(_RadioButton8+18)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1094 :: 		RadioButton8.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton8+19)
MOVT	R0, #hi_addr(_RadioButton8+19)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1095 :: 		RadioButton8.Checked          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton8+20)
MOVT	R0, #hi_addr(_RadioButton8+20)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1096 :: 		RadioButton8.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton8+21)
MOVT	R0, #hi_addr(_RadioButton8+21)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1097 :: 		RadioButton8.Caption         = RadioButton8_Caption;
MOVW	R1, #lo_addr(_RadioButton8_Caption+0)
MOVT	R1, #hi_addr(_RadioButton8_Caption+0)
MOVW	R0, #lo_addr(_RadioButton8+24)
MOVT	R0, #hi_addr(_RadioButton8+24)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1098 :: 		RadioButton8.TextAlign            = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+28)
MOVT	R0, #hi_addr(_RadioButton8+28)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1099 :: 		RadioButton8.FontName        = Tahoma11x13_Regular;
MOVW	R1, #944
MOVT	R1, #1
MOVW	R0, #lo_addr(_RadioButton8+32)
MOVT	R0, #hi_addr(_RadioButton8+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1100 :: 		RadioButton8.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton8+48)
MOVT	R0, #hi_addr(_RadioButton8+48)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1101 :: 		RadioButton8.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+36)
MOVT	R0, #hi_addr(_RadioButton8+36)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1102 :: 		RadioButton8.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton8+38)
MOVT	R0, #hi_addr(_RadioButton8+38)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1103 :: 		RadioButton8.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+39)
MOVT	R0, #hi_addr(_RadioButton8+39)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1104 :: 		RadioButton8.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton8+40)
MOVT	R0, #hi_addr(_RadioButton8+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1105 :: 		RadioButton8.Gradient_End_Color      = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton8+42)
MOVT	R0, #hi_addr(_RadioButton8+42)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1106 :: 		RadioButton8.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton8+44)
MOVT	R0, #hi_addr(_RadioButton8+44)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1107 :: 		RadioButton8.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton8+50)
MOVT	R0, #hi_addr(_RadioButton8+50)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1108 :: 		RadioButton8.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_RadioButton8+46)
MOVT	R0, #hi_addr(_RadioButton8+46)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1109 :: 		RadioButton8.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+52)
MOVT	R0, #hi_addr(_RadioButton8+52)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1110 :: 		RadioButton8.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+56)
MOVT	R0, #hi_addr(_RadioButton8+56)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1111 :: 		RadioButton8.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+60)
MOVT	R0, #hi_addr(_RadioButton8+60)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1112 :: 		RadioButton8.OnPressPtr      = J_E_3;
MOVW	R1, #lo_addr(_J_E_3+0)
MOVT	R1, #hi_addr(_J_E_3+0)
MOVW	R0, #lo_addr(_RadioButton8+64)
MOVT	R0, #hi_addr(_RadioButton8+64)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1114 :: 		RadioButton9.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_RadioButton9+0)
MOVT	R0, #hi_addr(_RadioButton9+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1115 :: 		RadioButton9.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_RadioButton9+4)
MOVT	R0, #hi_addr(_RadioButton9+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1116 :: 		RadioButton9.Left            = 176;
MOVS	R1, #176
MOVW	R0, #lo_addr(_RadioButton9+6)
MOVT	R0, #hi_addr(_RadioButton9+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1117 :: 		RadioButton9.Top             = 123;
MOVS	R1, #123
MOVW	R0, #lo_addr(_RadioButton9+8)
MOVT	R0, #hi_addr(_RadioButton9+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1118 :: 		RadioButton9.Width           = 54;
MOVS	R1, #54
MOVW	R0, #lo_addr(_RadioButton9+10)
MOVT	R0, #hi_addr(_RadioButton9+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1119 :: 		RadioButton9.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_RadioButton9+12)
MOVT	R0, #hi_addr(_RadioButton9+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1120 :: 		RadioButton9.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton9+14)
MOVT	R0, #hi_addr(_RadioButton9+14)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1121 :: 		RadioButton9.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton9+16)
MOVT	R0, #hi_addr(_RadioButton9+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1122 :: 		RadioButton9.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton9+18)
MOVT	R0, #hi_addr(_RadioButton9+18)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1123 :: 		RadioButton9.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton9+19)
MOVT	R0, #hi_addr(_RadioButton9+19)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1124 :: 		RadioButton9.Checked          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton9+20)
MOVT	R0, #hi_addr(_RadioButton9+20)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1125 :: 		RadioButton9.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton9+21)
MOVT	R0, #hi_addr(_RadioButton9+21)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1126 :: 		RadioButton9.Caption         = RadioButton9_Caption;
MOVW	R1, #lo_addr(_RadioButton9_Caption+0)
MOVT	R1, #hi_addr(_RadioButton9_Caption+0)
MOVW	R0, #lo_addr(_RadioButton9+24)
MOVT	R0, #hi_addr(_RadioButton9+24)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1127 :: 		RadioButton9.TextAlign            = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton9+28)
MOVT	R0, #hi_addr(_RadioButton9+28)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1128 :: 		RadioButton9.FontName        = Tahoma11x13_Regular;
MOVW	R1, #944
MOVT	R1, #1
MOVW	R0, #lo_addr(_RadioButton9+32)
MOVT	R0, #hi_addr(_RadioButton9+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1129 :: 		RadioButton9.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton9+48)
MOVT	R0, #hi_addr(_RadioButton9+48)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1130 :: 		RadioButton9.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton9+36)
MOVT	R0, #hi_addr(_RadioButton9+36)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1131 :: 		RadioButton9.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton9+38)
MOVT	R0, #hi_addr(_RadioButton9+38)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1132 :: 		RadioButton9.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton9+39)
MOVT	R0, #hi_addr(_RadioButton9+39)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1133 :: 		RadioButton9.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton9+40)
MOVT	R0, #hi_addr(_RadioButton9+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1134 :: 		RadioButton9.Gradient_End_Color      = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton9+42)
MOVT	R0, #hi_addr(_RadioButton9+42)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1135 :: 		RadioButton9.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton9+44)
MOVT	R0, #hi_addr(_RadioButton9+44)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1136 :: 		RadioButton9.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton9+50)
MOVT	R0, #hi_addr(_RadioButton9+50)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1137 :: 		RadioButton9.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_RadioButton9+46)
MOVT	R0, #hi_addr(_RadioButton9+46)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1138 :: 		RadioButton9.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton9+52)
MOVT	R0, #hi_addr(_RadioButton9+52)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1139 :: 		RadioButton9.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton9+56)
MOVT	R0, #hi_addr(_RadioButton9+56)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1140 :: 		RadioButton9.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton9+60)
MOVT	R0, #hi_addr(_RadioButton9+60)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1141 :: 		RadioButton9.OnPressPtr      = J_E_4;
MOVW	R1, #lo_addr(_J_E_4+0)
MOVT	R1, #hi_addr(_J_E_4+0)
MOVW	R0, #lo_addr(_RadioButton9+64)
MOVT	R0, #hi_addr(_RadioButton9+64)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1143 :: 		RadioButton10.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_RadioButton10+0)
MOVT	R0, #hi_addr(_RadioButton10+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1144 :: 		RadioButton10.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_RadioButton10+4)
MOVT	R0, #hi_addr(_RadioButton10+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1145 :: 		RadioButton10.Left            = 104;
MOVS	R1, #104
MOVW	R0, #lo_addr(_RadioButton10+6)
MOVT	R0, #hi_addr(_RadioButton10+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1146 :: 		RadioButton10.Top             = 151;
MOVS	R1, #151
MOVW	R0, #lo_addr(_RadioButton10+8)
MOVT	R0, #hi_addr(_RadioButton10+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1147 :: 		RadioButton10.Width           = 61;
MOVS	R1, #61
MOVW	R0, #lo_addr(_RadioButton10+10)
MOVT	R0, #hi_addr(_RadioButton10+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1148 :: 		RadioButton10.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_RadioButton10+12)
MOVT	R0, #hi_addr(_RadioButton10+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1149 :: 		RadioButton10.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton10+14)
MOVT	R0, #hi_addr(_RadioButton10+14)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1150 :: 		RadioButton10.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton10+16)
MOVT	R0, #hi_addr(_RadioButton10+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1151 :: 		RadioButton10.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton10+18)
MOVT	R0, #hi_addr(_RadioButton10+18)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1152 :: 		RadioButton10.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton10+19)
MOVT	R0, #hi_addr(_RadioButton10+19)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1153 :: 		RadioButton10.Checked          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton10+20)
MOVT	R0, #hi_addr(_RadioButton10+20)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1154 :: 		RadioButton10.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton10+21)
MOVT	R0, #hi_addr(_RadioButton10+21)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1155 :: 		RadioButton10.Caption         = RadioButton10_Caption;
MOVW	R1, #lo_addr(_RadioButton10_Caption+0)
MOVT	R1, #hi_addr(_RadioButton10_Caption+0)
MOVW	R0, #lo_addr(_RadioButton10+24)
MOVT	R0, #hi_addr(_RadioButton10+24)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1156 :: 		RadioButton10.TextAlign            = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton10+28)
MOVT	R0, #hi_addr(_RadioButton10+28)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1157 :: 		RadioButton10.FontName        = Tahoma11x13_Regular;
MOVW	R1, #944
MOVT	R1, #1
MOVW	R0, #lo_addr(_RadioButton10+32)
MOVT	R0, #hi_addr(_RadioButton10+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1158 :: 		RadioButton10.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton10+48)
MOVT	R0, #hi_addr(_RadioButton10+48)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1159 :: 		RadioButton10.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton10+36)
MOVT	R0, #hi_addr(_RadioButton10+36)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1160 :: 		RadioButton10.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton10+38)
MOVT	R0, #hi_addr(_RadioButton10+38)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1161 :: 		RadioButton10.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton10+39)
MOVT	R0, #hi_addr(_RadioButton10+39)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1162 :: 		RadioButton10.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton10+40)
MOVT	R0, #hi_addr(_RadioButton10+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1163 :: 		RadioButton10.Gradient_End_Color      = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton10+42)
MOVT	R0, #hi_addr(_RadioButton10+42)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1164 :: 		RadioButton10.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton10+44)
MOVT	R0, #hi_addr(_RadioButton10+44)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1165 :: 		RadioButton10.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton10+50)
MOVT	R0, #hi_addr(_RadioButton10+50)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1166 :: 		RadioButton10.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_RadioButton10+46)
MOVT	R0, #hi_addr(_RadioButton10+46)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1167 :: 		RadioButton10.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton10+52)
MOVT	R0, #hi_addr(_RadioButton10+52)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1168 :: 		RadioButton10.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton10+56)
MOVT	R0, #hi_addr(_RadioButton10+56)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1169 :: 		RadioButton10.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton10+60)
MOVT	R0, #hi_addr(_RadioButton10+60)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1170 :: 		RadioButton10.OnPressPtr      = J_E_5;
MOVW	R1, #lo_addr(_J_E_5+0)
MOVT	R1, #hi_addr(_J_E_5+0)
MOVW	R0, #lo_addr(_RadioButton10+64)
MOVT	R0, #hi_addr(_RadioButton10+64)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1172 :: 		RadioButton11.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_RadioButton11+0)
MOVT	R0, #hi_addr(_RadioButton11+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1173 :: 		RadioButton11.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_RadioButton11+4)
MOVT	R0, #hi_addr(_RadioButton11+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1174 :: 		RadioButton11.Left            = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_RadioButton11+6)
MOVT	R0, #hi_addr(_RadioButton11+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1175 :: 		RadioButton11.Top             = 187;
MOVS	R1, #187
MOVW	R0, #lo_addr(_RadioButton11+8)
MOVT	R0, #hi_addr(_RadioButton11+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1176 :: 		RadioButton11.Width           = 67;
MOVS	R1, #67
MOVW	R0, #lo_addr(_RadioButton11+10)
MOVT	R0, #hi_addr(_RadioButton11+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1177 :: 		RadioButton11.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_RadioButton11+12)
MOVT	R0, #hi_addr(_RadioButton11+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1178 :: 		RadioButton11.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton11+14)
MOVT	R0, #hi_addr(_RadioButton11+14)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1179 :: 		RadioButton11.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton11+16)
MOVT	R0, #hi_addr(_RadioButton11+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1180 :: 		RadioButton11.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton11+18)
MOVT	R0, #hi_addr(_RadioButton11+18)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1181 :: 		RadioButton11.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton11+19)
MOVT	R0, #hi_addr(_RadioButton11+19)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1182 :: 		RadioButton11.Checked          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton11+20)
MOVT	R0, #hi_addr(_RadioButton11+20)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1183 :: 		RadioButton11.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton11+21)
MOVT	R0, #hi_addr(_RadioButton11+21)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1184 :: 		RadioButton11.Caption         = RadioButton11_Caption;
MOVW	R1, #lo_addr(_RadioButton11_Caption+0)
MOVT	R1, #hi_addr(_RadioButton11_Caption+0)
MOVW	R0, #lo_addr(_RadioButton11+24)
MOVT	R0, #hi_addr(_RadioButton11+24)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1185 :: 		RadioButton11.TextAlign            = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton11+28)
MOVT	R0, #hi_addr(_RadioButton11+28)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1186 :: 		RadioButton11.FontName        = Tahoma11x13_Regular;
MOVW	R1, #944
MOVT	R1, #1
MOVW	R0, #lo_addr(_RadioButton11+32)
MOVT	R0, #hi_addr(_RadioButton11+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1187 :: 		RadioButton11.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton11+48)
MOVT	R0, #hi_addr(_RadioButton11+48)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1188 :: 		RadioButton11.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton11+36)
MOVT	R0, #hi_addr(_RadioButton11+36)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1189 :: 		RadioButton11.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton11+38)
MOVT	R0, #hi_addr(_RadioButton11+38)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1190 :: 		RadioButton11.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton11+39)
MOVT	R0, #hi_addr(_RadioButton11+39)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1191 :: 		RadioButton11.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton11+40)
MOVT	R0, #hi_addr(_RadioButton11+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1192 :: 		RadioButton11.Gradient_End_Color      = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton11+42)
MOVT	R0, #hi_addr(_RadioButton11+42)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1193 :: 		RadioButton11.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton11+44)
MOVT	R0, #hi_addr(_RadioButton11+44)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1194 :: 		RadioButton11.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton11+50)
MOVT	R0, #hi_addr(_RadioButton11+50)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1195 :: 		RadioButton11.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_RadioButton11+46)
MOVT	R0, #hi_addr(_RadioButton11+46)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1196 :: 		RadioButton11.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton11+52)
MOVT	R0, #hi_addr(_RadioButton11+52)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1197 :: 		RadioButton11.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton11+56)
MOVT	R0, #hi_addr(_RadioButton11+56)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1198 :: 		RadioButton11.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton11+60)
MOVT	R0, #hi_addr(_RadioButton11+60)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1199 :: 		RadioButton11.OnPressPtr      = J_E_6;
MOVW	R1, #lo_addr(_J_E_6+0)
MOVT	R1, #hi_addr(_J_E_6+0)
MOVW	R0, #lo_addr(_RadioButton11+64)
MOVT	R0, #hi_addr(_RadioButton11+64)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1201 :: 		RadioButton1.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_RadioButton1+0)
MOVT	R0, #hi_addr(_RadioButton1+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1202 :: 		RadioButton1.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_RadioButton1+4)
MOVT	R0, #hi_addr(_RadioButton1+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1203 :: 		RadioButton1.Left            = 88;
MOVS	R1, #88
MOVW	R0, #lo_addr(_RadioButton1+6)
MOVT	R0, #hi_addr(_RadioButton1+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1204 :: 		RadioButton1.Top             = 228;
MOVS	R1, #228
MOVW	R0, #lo_addr(_RadioButton1+8)
MOVT	R0, #hi_addr(_RadioButton1+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1205 :: 		RadioButton1.Width           = 73;
MOVS	R1, #73
MOVW	R0, #lo_addr(_RadioButton1+10)
MOVT	R0, #hi_addr(_RadioButton1+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1206 :: 		RadioButton1.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_RadioButton1+12)
MOVT	R0, #hi_addr(_RadioButton1+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1207 :: 		RadioButton1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton1+14)
MOVT	R0, #hi_addr(_RadioButton1+14)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1208 :: 		RadioButton1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+16)
MOVT	R0, #hi_addr(_RadioButton1+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1209 :: 		RadioButton1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton1+18)
MOVT	R0, #hi_addr(_RadioButton1+18)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1210 :: 		RadioButton1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton1+19)
MOVT	R0, #hi_addr(_RadioButton1+19)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1211 :: 		RadioButton1.Checked          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton1+20)
MOVT	R0, #hi_addr(_RadioButton1+20)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1212 :: 		RadioButton1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton1+21)
MOVT	R0, #hi_addr(_RadioButton1+21)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1213 :: 		RadioButton1.Caption         = RadioButton1_Caption;
MOVW	R1, #lo_addr(_RadioButton1_Caption+0)
MOVT	R1, #hi_addr(_RadioButton1_Caption+0)
MOVW	R0, #lo_addr(_RadioButton1+24)
MOVT	R0, #hi_addr(_RadioButton1+24)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1214 :: 		RadioButton1.TextAlign            = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+28)
MOVT	R0, #hi_addr(_RadioButton1+28)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1215 :: 		RadioButton1.FontName        = Tahoma11x13_Regular;
MOVW	R1, #944
MOVT	R1, #1
MOVW	R0, #lo_addr(_RadioButton1+32)
MOVT	R0, #hi_addr(_RadioButton1+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1216 :: 		RadioButton1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton1+48)
MOVT	R0, #hi_addr(_RadioButton1+48)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1217 :: 		RadioButton1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+36)
MOVT	R0, #hi_addr(_RadioButton1+36)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1218 :: 		RadioButton1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton1+38)
MOVT	R0, #hi_addr(_RadioButton1+38)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1219 :: 		RadioButton1.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+39)
MOVT	R0, #hi_addr(_RadioButton1+39)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1220 :: 		RadioButton1.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton1+40)
MOVT	R0, #hi_addr(_RadioButton1+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1221 :: 		RadioButton1.Gradient_End_Color      = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton1+42)
MOVT	R0, #hi_addr(_RadioButton1+42)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1222 :: 		RadioButton1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton1+44)
MOVT	R0, #hi_addr(_RadioButton1+44)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1223 :: 		RadioButton1.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton1+50)
MOVT	R0, #hi_addr(_RadioButton1+50)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1224 :: 		RadioButton1.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_RadioButton1+46)
MOVT	R0, #hi_addr(_RadioButton1+46)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1225 :: 		RadioButton1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+52)
MOVT	R0, #hi_addr(_RadioButton1+52)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1226 :: 		RadioButton1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+56)
MOVT	R0, #hi_addr(_RadioButton1+56)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1227 :: 		RadioButton1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+60)
MOVT	R0, #hi_addr(_RadioButton1+60)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1228 :: 		RadioButton1.OnPressPtr      = J_E_7;
MOVW	R1, #lo_addr(_J_E_7+0)
MOVT	R1, #hi_addr(_J_E_7+0)
MOVW	R0, #lo_addr(_RadioButton1+64)
MOVT	R0, #hi_addr(_RadioButton1+64)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1230 :: 		RadioButton2.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_RadioButton2+0)
MOVT	R0, #hi_addr(_RadioButton2+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1231 :: 		RadioButton2.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_RadioButton2+4)
MOVT	R0, #hi_addr(_RadioButton2+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1232 :: 		RadioButton2.Left            = 151;
MOVS	R1, #151
MOVW	R0, #lo_addr(_RadioButton2+6)
MOVT	R0, #hi_addr(_RadioButton2+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1233 :: 		RadioButton2.Top             = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_RadioButton2+8)
MOVT	R0, #hi_addr(_RadioButton2+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1234 :: 		RadioButton2.Width           = 79;
MOVS	R1, #79
MOVW	R0, #lo_addr(_RadioButton2+10)
MOVT	R0, #hi_addr(_RadioButton2+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1235 :: 		RadioButton2.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_RadioButton2+12)
MOVT	R0, #hi_addr(_RadioButton2+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1236 :: 		RadioButton2.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton2+14)
MOVT	R0, #hi_addr(_RadioButton2+14)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1237 :: 		RadioButton2.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+16)
MOVT	R0, #hi_addr(_RadioButton2+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1238 :: 		RadioButton2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton2+18)
MOVT	R0, #hi_addr(_RadioButton2+18)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1239 :: 		RadioButton2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton2+19)
MOVT	R0, #hi_addr(_RadioButton2+19)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1240 :: 		RadioButton2.Checked          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton2+20)
MOVT	R0, #hi_addr(_RadioButton2+20)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1241 :: 		RadioButton2.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton2+21)
MOVT	R0, #hi_addr(_RadioButton2+21)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1242 :: 		RadioButton2.Caption         = RadioButton2_Caption;
MOVW	R1, #lo_addr(_RadioButton2_Caption+0)
MOVT	R1, #hi_addr(_RadioButton2_Caption+0)
MOVW	R0, #lo_addr(_RadioButton2+24)
MOVT	R0, #hi_addr(_RadioButton2+24)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1243 :: 		RadioButton2.TextAlign            = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+28)
MOVT	R0, #hi_addr(_RadioButton2+28)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1244 :: 		RadioButton2.FontName        = Tahoma11x13_Regular;
MOVW	R1, #944
MOVT	R1, #1
MOVW	R0, #lo_addr(_RadioButton2+32)
MOVT	R0, #hi_addr(_RadioButton2+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1245 :: 		RadioButton2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton2+48)
MOVT	R0, #hi_addr(_RadioButton2+48)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1246 :: 		RadioButton2.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+36)
MOVT	R0, #hi_addr(_RadioButton2+36)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1247 :: 		RadioButton2.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton2+38)
MOVT	R0, #hi_addr(_RadioButton2+38)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1248 :: 		RadioButton2.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+39)
MOVT	R0, #hi_addr(_RadioButton2+39)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1249 :: 		RadioButton2.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton2+40)
MOVT	R0, #hi_addr(_RadioButton2+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1250 :: 		RadioButton2.Gradient_End_Color      = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton2+42)
MOVT	R0, #hi_addr(_RadioButton2+42)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1251 :: 		RadioButton2.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton2+44)
MOVT	R0, #hi_addr(_RadioButton2+44)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1252 :: 		RadioButton2.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton2+50)
MOVT	R0, #hi_addr(_RadioButton2+50)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1253 :: 		RadioButton2.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_RadioButton2+46)
MOVT	R0, #hi_addr(_RadioButton2+46)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1254 :: 		RadioButton2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+52)
MOVT	R0, #hi_addr(_RadioButton2+52)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1255 :: 		RadioButton2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+56)
MOVT	R0, #hi_addr(_RadioButton2+56)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1256 :: 		RadioButton2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+60)
MOVT	R0, #hi_addr(_RadioButton2+60)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1257 :: 		RadioButton2.OnPressPtr      = J_E_8;
MOVW	R1, #lo_addr(_J_E_8+0)
MOVT	R1, #hi_addr(_J_E_8+0)
MOVW	R0, #lo_addr(_RadioButton2+64)
MOVT	R0, #hi_addr(_RadioButton2+64)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1259 :: 		Label9.OwnerScreen     = &Screen6;
MOVW	R1, #lo_addr(_Screen6+0)
MOVT	R1, #hi_addr(_Screen6+0)
MOVW	R0, #lo_addr(_Label9+0)
MOVT	R0, #hi_addr(_Label9+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1260 :: 		Label9.Order          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label9+4)
MOVT	R0, #hi_addr(_Label9+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1261 :: 		Label9.Left           = 79;
MOVS	R1, #79
MOVW	R0, #lo_addr(_Label9+6)
MOVT	R0, #hi_addr(_Label9+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1262 :: 		Label9.Top            = 46;
MOVS	R1, #46
MOVW	R0, #lo_addr(_Label9+8)
MOVT	R0, #hi_addr(_Label9+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1263 :: 		Label9.Width          = 68;
MOVS	R1, #68
MOVW	R0, #lo_addr(_Label9+10)
MOVT	R0, #hi_addr(_Label9+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1264 :: 		Label9.Height         = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_Label9+12)
MOVT	R0, #hi_addr(_Label9+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1265 :: 		Label9.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label9+26)
MOVT	R0, #hi_addr(_Label9+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1266 :: 		Label9.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label9+27)
MOVT	R0, #hi_addr(_Label9+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1267 :: 		Label9.Caption        = Label9_Caption;
MOVW	R1, #lo_addr(_Label9_Caption+0)
MOVT	R1, #hi_addr(_Label9_Caption+0)
MOVW	R0, #lo_addr(_Label9+16)
MOVT	R0, #hi_addr(_Label9+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1268 :: 		Label9.FontName       = Arial32x36_Regular;
MOVW	R1, #21408
MOVW	R0, #lo_addr(_Label9+20)
MOVT	R0, #hi_addr(_Label9+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1269 :: 		Label9.Font_Color     = 0x001F;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label9+24)
MOVT	R0, #hi_addr(_Label9+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1270 :: 		Label9.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label9+28)
MOVT	R0, #hi_addr(_Label9+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1271 :: 		Label9.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label9+32)
MOVT	R0, #hi_addr(_Label9+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1272 :: 		Label9.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label9+36)
MOVT	R0, #hi_addr(_Label9+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1273 :: 		Label9.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label9+40)
MOVT	R0, #hi_addr(_Label9+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1275 :: 		Label10.OwnerScreen     = &Screen6;
MOVW	R1, #lo_addr(_Screen6+0)
MOVT	R1, #hi_addr(_Screen6+0)
MOVW	R0, #lo_addr(_Label10+0)
MOVT	R0, #hi_addr(_Label10+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1276 :: 		Label10.Order          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label10+4)
MOVT	R0, #hi_addr(_Label10+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1277 :: 		Label10.Left           = 43;
MOVS	R1, #43
MOVW	R0, #lo_addr(_Label10+6)
MOVT	R0, #hi_addr(_Label10+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1278 :: 		Label10.Top            = 105;
MOVS	R1, #105
MOVW	R0, #lo_addr(_Label10+8)
MOVT	R0, #hi_addr(_Label10+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1279 :: 		Label10.Width          = 157;
MOVS	R1, #157
MOVW	R0, #lo_addr(_Label10+10)
MOVT	R0, #hi_addr(_Label10+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1280 :: 		Label10.Height         = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_Label10+12)
MOVT	R0, #hi_addr(_Label10+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1281 :: 		Label10.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label10+26)
MOVT	R0, #hi_addr(_Label10+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1282 :: 		Label10.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label10+27)
MOVT	R0, #hi_addr(_Label10+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1283 :: 		Label10.Caption        = Label10_Caption;
MOVW	R1, #lo_addr(_Label10_Caption+0)
MOVT	R1, #hi_addr(_Label10_Caption+0)
MOVW	R0, #lo_addr(_Label10+16)
MOVT	R0, #hi_addr(_Label10+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1284 :: 		Label10.FontName       = Arial32x36_Regular;
MOVW	R1, #21408
MOVW	R0, #lo_addr(_Label10+20)
MOVT	R0, #hi_addr(_Label10+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1285 :: 		Label10.Font_Color     = 0x001F;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label10+24)
MOVT	R0, #hi_addr(_Label10+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1286 :: 		Label10.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+28)
MOVT	R0, #hi_addr(_Label10+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1287 :: 		Label10.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+32)
MOVT	R0, #hi_addr(_Label10+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1288 :: 		Label10.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+36)
MOVT	R0, #hi_addr(_Label10+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1289 :: 		Label10.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+40)
MOVT	R0, #hi_addr(_Label10+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1291 :: 		CircleButton2.OwnerScreen     = &Screen6;
MOVW	R1, #lo_addr(_Screen6+0)
MOVT	R1, #hi_addr(_Screen6+0)
MOVW	R0, #lo_addr(_CircleButton2+0)
MOVT	R0, #hi_addr(_CircleButton2+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1292 :: 		CircleButton2.Order          = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_CircleButton2+4)
MOVT	R0, #hi_addr(_CircleButton2+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1293 :: 		CircleButton2.Left           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_CircleButton2+6)
MOVT	R0, #hi_addr(_CircleButton2+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1294 :: 		CircleButton2.Top            = 180;
MOVS	R1, #180
MOVW	R0, #lo_addr(_CircleButton2+8)
MOVT	R0, #hi_addr(_CircleButton2+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1295 :: 		CircleButton2.Radius         = 34;
MOVS	R1, #34
MOVW	R0, #lo_addr(_CircleButton2+10)
MOVT	R0, #hi_addr(_CircleButton2+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1296 :: 		CircleButton2.Pen_Width      = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton2+12)
MOVT	R0, #hi_addr(_CircleButton2+12)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1297 :: 		CircleButton2.Pen_Color      = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_CircleButton2+14)
MOVT	R0, #hi_addr(_CircleButton2+14)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1298 :: 		CircleButton2.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton2+16)
MOVT	R0, #hi_addr(_CircleButton2+16)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1299 :: 		CircleButton2.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton2+17)
MOVT	R0, #hi_addr(_CircleButton2+17)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1300 :: 		CircleButton2.Transparent    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton2+18)
MOVT	R0, #hi_addr(_CircleButton2+18)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1301 :: 		CircleButton2.Caption        = CircleButton2_Caption;
MOVW	R1, #lo_addr(_CircleButton2_Caption+0)
MOVT	R1, #hi_addr(_CircleButton2_Caption+0)
MOVW	R0, #lo_addr(_CircleButton2+20)
MOVT	R0, #hi_addr(_CircleButton2+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1302 :: 		CircleButton2.TextAlign             = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton2+24)
MOVT	R0, #hi_addr(_CircleButton2+24)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1303 :: 		CircleButton2.FontName       = Tahoma11x13_Regular;
MOVW	R1, #944
MOVT	R1, #1
MOVW	R0, #lo_addr(_CircleButton2+28)
MOVT	R0, #hi_addr(_CircleButton2+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1304 :: 		CircleButton2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton2+42)
MOVT	R0, #hi_addr(_CircleButton2+42)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1305 :: 		CircleButton2.Font_Color     = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton2+32)
MOVT	R0, #hi_addr(_CircleButton2+32)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1306 :: 		CircleButton2.Gradient       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton2+34)
MOVT	R0, #hi_addr(_CircleButton2+34)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1307 :: 		CircleButton2.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton2+35)
MOVT	R0, #hi_addr(_CircleButton2+35)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1308 :: 		CircleButton2.Gradient_Start_Color    = 0x87FF;
MOVW	R1, #34815
MOVW	R0, #lo_addr(_CircleButton2+36)
MOVT	R0, #hi_addr(_CircleButton2+36)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1309 :: 		CircleButton2.Gradient_End_Color      = 0x041F;
MOVW	R1, #1055
MOVW	R0, #lo_addr(_CircleButton2+38)
MOVT	R0, #hi_addr(_CircleButton2+38)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1310 :: 		CircleButton2.Color          = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CircleButton2+40)
MOVT	R0, #hi_addr(_CircleButton2+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1311 :: 		CircleButton2.Press_Color    = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_CircleButton2+44)
MOVT	R0, #hi_addr(_CircleButton2+44)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1312 :: 		CircleButton2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton2+48)
MOVT	R0, #hi_addr(_CircleButton2+48)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1313 :: 		CircleButton2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton2+52)
MOVT	R0, #hi_addr(_CircleButton2+52)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1314 :: 		CircleButton2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton2+56)
MOVT	R0, #hi_addr(_CircleButton2+56)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1315 :: 		CircleButton2.OnPressPtr      = PCA_TRAINING_START;
MOVW	R1, #lo_addr(_PCA_TRAINING_START+0)
MOVT	R1, #hi_addr(_PCA_TRAINING_START+0)
MOVW	R0, #lo_addr(_CircleButton2+60)
MOVT	R0, #hi_addr(_CircleButton2+60)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1317 :: 		Label11.OwnerScreen     = &Screen7;
MOVW	R1, #lo_addr(_Screen7+0)
MOVT	R1, #hi_addr(_Screen7+0)
MOVW	R0, #lo_addr(_Label11+0)
MOVT	R0, #hi_addr(_Label11+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1318 :: 		Label11.Order          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label11+4)
MOVT	R0, #hi_addr(_Label11+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1319 :: 		Label11.Left           = 74;
MOVS	R1, #74
MOVW	R0, #lo_addr(_Label11+6)
MOVT	R0, #hi_addr(_Label11+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1320 :: 		Label11.Top            = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label11+8)
MOVT	R0, #hi_addr(_Label11+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1321 :: 		Label11.Width          = 97;
MOVS	R1, #97
MOVW	R0, #lo_addr(_Label11+10)
MOVT	R0, #hi_addr(_Label11+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1322 :: 		Label11.Height         = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label11+12)
MOVT	R0, #hi_addr(_Label11+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1323 :: 		Label11.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label11+26)
MOVT	R0, #hi_addr(_Label11+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1324 :: 		Label11.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label11+27)
MOVT	R0, #hi_addr(_Label11+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1325 :: 		Label11.Caption        = Label11_Caption;
MOVW	R1, #lo_addr(_Label11_Caption+0)
MOVT	R1, #hi_addr(_Label11_Caption+0)
MOVW	R0, #lo_addr(_Label11+16)
MOVT	R0, #hi_addr(_Label11+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1326 :: 		Label11.FontName       = Arial13x16_Bold;
MOVW	R1, #2666
MOVW	R0, #lo_addr(_Label11+20)
MOVT	R0, #hi_addr(_Label11+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1327 :: 		Label11.Font_Color     = 0xFFE0;
MOVW	R1, #65504
MOVW	R0, #lo_addr(_Label11+24)
MOVT	R0, #hi_addr(_Label11+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1328 :: 		Label11.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label11+28)
MOVT	R0, #hi_addr(_Label11+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1329 :: 		Label11.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label11+32)
MOVT	R0, #hi_addr(_Label11+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1330 :: 		Label11.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label11+36)
MOVT	R0, #hi_addr(_Label11+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1331 :: 		Label11.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label11+40)
MOVT	R0, #hi_addr(_Label11+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1333 :: 		Label12.OwnerScreen     = &Screen8;
MOVW	R1, #lo_addr(_Screen8+0)
MOVT	R1, #hi_addr(_Screen8+0)
MOVW	R0, #lo_addr(_Label12+0)
MOVT	R0, #hi_addr(_Label12+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1334 :: 		Label12.Order          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label12+4)
MOVT	R0, #hi_addr(_Label12+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1335 :: 		Label12.Left           = 62;
MOVS	R1, #62
MOVW	R0, #lo_addr(_Label12+6)
MOVT	R0, #hi_addr(_Label12+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1336 :: 		Label12.Top            = 78;
MOVS	R1, #78
MOVW	R0, #lo_addr(_Label12+8)
MOVT	R0, #hi_addr(_Label12+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1337 :: 		Label12.Width          = 108;
MOVS	R1, #108
MOVW	R0, #lo_addr(_Label12+10)
MOVT	R0, #hi_addr(_Label12+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1338 :: 		Label12.Height         = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label12+12)
MOVT	R0, #hi_addr(_Label12+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1339 :: 		Label12.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label12+26)
MOVT	R0, #hi_addr(_Label12+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1340 :: 		Label12.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label12+27)
MOVT	R0, #hi_addr(_Label12+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1341 :: 		Label12.Caption        = Label12_Caption;
MOVW	R1, #lo_addr(_Label12_Caption+0)
MOVT	R1, #hi_addr(_Label12_Caption+0)
MOVW	R0, #lo_addr(_Label12+16)
MOVT	R0, #hi_addr(_Label12+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1342 :: 		Label12.FontName       = Tahoma23x29_Regular;
MOVW	R1, #53248
MOVW	R0, #lo_addr(_Label12+20)
MOVT	R0, #hi_addr(_Label12+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1343 :: 		Label12.Font_Color     = 0x37E0;
MOVW	R1, #14304
MOVW	R0, #lo_addr(_Label12+24)
MOVT	R0, #hi_addr(_Label12+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1344 :: 		Label12.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label12+28)
MOVT	R0, #hi_addr(_Label12+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1345 :: 		Label12.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label12+32)
MOVT	R0, #hi_addr(_Label12+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1346 :: 		Label12.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label12+36)
MOVT	R0, #hi_addr(_Label12+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1347 :: 		Label12.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label12+40)
MOVT	R0, #hi_addr(_Label12+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1349 :: 		ButtonRound5.OwnerScreen     = &Screen8;
MOVW	R1, #lo_addr(_Screen8+0)
MOVT	R1, #hi_addr(_Screen8+0)
MOVW	R0, #lo_addr(_ButtonRound5+0)
MOVT	R0, #hi_addr(_ButtonRound5+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1350 :: 		ButtonRound5.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+4)
MOVT	R0, #hi_addr(_ButtonRound5+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1351 :: 		ButtonRound5.Left            = 61;
MOVS	R1, #61
MOVW	R0, #lo_addr(_ButtonRound5+6)
MOVT	R0, #hi_addr(_ButtonRound5+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1352 :: 		ButtonRound5.Top             = 166;
MOVS	R1, #166
MOVW	R0, #lo_addr(_ButtonRound5+8)
MOVT	R0, #hi_addr(_ButtonRound5+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1353 :: 		ButtonRound5.Width           = 107;
MOVS	R1, #107
MOVW	R0, #lo_addr(_ButtonRound5+10)
MOVT	R0, #hi_addr(_ButtonRound5+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1354 :: 		ButtonRound5.Height          = 46;
MOVS	R1, #46
MOVW	R0, #lo_addr(_ButtonRound5+12)
MOVT	R0, #hi_addr(_ButtonRound5+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1355 :: 		ButtonRound5.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+14)
MOVT	R0, #hi_addr(_ButtonRound5+14)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1356 :: 		ButtonRound5.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound5+16)
MOVT	R0, #hi_addr(_ButtonRound5+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1357 :: 		ButtonRound5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+18)
MOVT	R0, #hi_addr(_ButtonRound5+18)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1358 :: 		ButtonRound5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+19)
MOVT	R0, #hi_addr(_ButtonRound5+19)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1359 :: 		ButtonRound5.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+20)
MOVT	R0, #hi_addr(_ButtonRound5+20)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1360 :: 		ButtonRound5.Caption         = ButtonRound5_Caption;
MOVW	R1, #lo_addr(_ButtonRound5_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound5_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound5+24)
MOVT	R0, #hi_addr(_ButtonRound5+24)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1361 :: 		ButtonRound5.TextAlign             = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+28)
MOVT	R0, #hi_addr(_ButtonRound5+28)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1362 :: 		ButtonRound5.FontName        = Tahoma19x23_Regular;
MOVW	R1, #40234
MOVW	R0, #lo_addr(_ButtonRound5+32)
MOVT	R0, #hi_addr(_ButtonRound5+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1363 :: 		ButtonRound5.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+47)
MOVT	R0, #hi_addr(_ButtonRound5+47)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1364 :: 		ButtonRound5.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound5+36)
MOVT	R0, #hi_addr(_ButtonRound5+36)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1365 :: 		ButtonRound5.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+38)
MOVT	R0, #hi_addr(_ButtonRound5+38)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1366 :: 		ButtonRound5.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound5+39)
MOVT	R0, #hi_addr(_ButtonRound5+39)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1367 :: 		ButtonRound5.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound5+40)
MOVT	R0, #hi_addr(_ButtonRound5+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1368 :: 		ButtonRound5.Gradient_End_Color      = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound5+42)
MOVT	R0, #hi_addr(_ButtonRound5+42)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1369 :: 		ButtonRound5.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound5+44)
MOVT	R0, #hi_addr(_ButtonRound5+44)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1370 :: 		ButtonRound5.Press_Color     = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_ButtonRound5+48)
MOVT	R0, #hi_addr(_ButtonRound5+48)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1371 :: 		ButtonRound5.Corner_Radius      = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound5+46)
MOVT	R0, #hi_addr(_ButtonRound5+46)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1372 :: 		ButtonRound5.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound5+52)
MOVT	R0, #hi_addr(_ButtonRound5+52)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1373 :: 		ButtonRound5.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound5+56)
MOVT	R0, #hi_addr(_ButtonRound5+56)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1374 :: 		ButtonRound5.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound5+60)
MOVT	R0, #hi_addr(_ButtonRound5+60)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1375 :: 		ButtonRound5.OnPressPtr      = PCA_TEST_START;
MOVW	R1, #lo_addr(_PCA_TEST_START+0)
MOVT	R1, #hi_addr(_PCA_TEST_START+0)
MOVW	R0, #lo_addr(_ButtonRound5+64)
MOVT	R0, #hi_addr(_ButtonRound5+64)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1377 :: 		Label13.OwnerScreen     = &Screen9;
MOVW	R1, #lo_addr(_Screen9+0)
MOVT	R1, #hi_addr(_Screen9+0)
MOVW	R0, #lo_addr(_Label13+0)
MOVT	R0, #hi_addr(_Label13+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1378 :: 		Label13.Order          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label13+4)
MOVT	R0, #hi_addr(_Label13+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1379 :: 		Label13.Left           = 79;
MOVS	R1, #79
MOVW	R0, #lo_addr(_Label13+6)
MOVT	R0, #hi_addr(_Label13+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1380 :: 		Label13.Top            = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label13+8)
MOVT	R0, #hi_addr(_Label13+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1381 :: 		Label13.Width          = 65;
MOVS	R1, #65
MOVW	R0, #lo_addr(_Label13+10)
MOVT	R0, #hi_addr(_Label13+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1382 :: 		Label13.Height         = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label13+12)
MOVT	R0, #hi_addr(_Label13+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1383 :: 		Label13.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label13+26)
MOVT	R0, #hi_addr(_Label13+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1384 :: 		Label13.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label13+27)
MOVT	R0, #hi_addr(_Label13+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1385 :: 		Label13.Caption        = Label13_Caption;
MOVW	R1, #lo_addr(_Label13_Caption+0)
MOVT	R1, #hi_addr(_Label13_Caption+0)
MOVW	R0, #lo_addr(_Label13+16)
MOVT	R0, #hi_addr(_Label13+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1386 :: 		Label13.FontName       = Arial13x16_Regular;
MOVW	R1, #530
MOVW	R0, #lo_addr(_Label13+20)
MOVT	R0, #hi_addr(_Label13+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1387 :: 		Label13.Font_Color     = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label13+24)
MOVT	R0, #hi_addr(_Label13+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1388 :: 		Label13.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label13+28)
MOVT	R0, #hi_addr(_Label13+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1389 :: 		Label13.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label13+32)
MOVT	R0, #hi_addr(_Label13+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1390 :: 		Label13.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label13+36)
MOVT	R0, #hi_addr(_Label13+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1391 :: 		Label13.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label13+40)
MOVT	R0, #hi_addr(_Label13+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1393 :: 		CircleButton3.OwnerScreen     = &Screen10;
MOVW	R1, #lo_addr(_Screen10+0)
MOVT	R1, #hi_addr(_Screen10+0)
MOVW	R0, #lo_addr(_CircleButton3+0)
MOVT	R0, #hi_addr(_CircleButton3+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1394 :: 		CircleButton3.Order          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton3+4)
MOVT	R0, #hi_addr(_CircleButton3+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1395 :: 		CircleButton3.Left           = 87;
MOVS	R1, #87
MOVW	R0, #lo_addr(_CircleButton3+6)
MOVT	R0, #hi_addr(_CircleButton3+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1396 :: 		CircleButton3.Top            = 204;
MOVS	R1, #204
MOVW	R0, #lo_addr(_CircleButton3+8)
MOVT	R0, #hi_addr(_CircleButton3+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1397 :: 		CircleButton3.Radius         = 33;
MOVS	R1, #33
MOVW	R0, #lo_addr(_CircleButton3+10)
MOVT	R0, #hi_addr(_CircleButton3+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1398 :: 		CircleButton3.Pen_Width      = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton3+12)
MOVT	R0, #hi_addr(_CircleButton3+12)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1399 :: 		CircleButton3.Pen_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton3+14)
MOVT	R0, #hi_addr(_CircleButton3+14)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1400 :: 		CircleButton3.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton3+16)
MOVT	R0, #hi_addr(_CircleButton3+16)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1401 :: 		CircleButton3.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton3+17)
MOVT	R0, #hi_addr(_CircleButton3+17)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1402 :: 		CircleButton3.Transparent    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton3+18)
MOVT	R0, #hi_addr(_CircleButton3+18)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1403 :: 		CircleButton3.Caption        = CircleButton3_Caption;
MOVW	R1, #lo_addr(_CircleButton3_Caption+0)
MOVT	R1, #hi_addr(_CircleButton3_Caption+0)
MOVW	R0, #lo_addr(_CircleButton3+20)
MOVT	R0, #hi_addr(_CircleButton3+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1404 :: 		CircleButton3.TextAlign             = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton3+24)
MOVT	R0, #hi_addr(_CircleButton3+24)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1405 :: 		CircleButton3.FontName       = Tahoma11x13_Regular;
MOVW	R1, #944
MOVT	R1, #1
MOVW	R0, #lo_addr(_CircleButton3+28)
MOVT	R0, #hi_addr(_CircleButton3+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1406 :: 		CircleButton3.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton3+42)
MOVT	R0, #hi_addr(_CircleButton3+42)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1407 :: 		CircleButton3.Font_Color     = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton3+32)
MOVT	R0, #hi_addr(_CircleButton3+32)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1408 :: 		CircleButton3.Gradient       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton3+34)
MOVT	R0, #hi_addr(_CircleButton3+34)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1409 :: 		CircleButton3.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton3+35)
MOVT	R0, #hi_addr(_CircleButton3+35)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1410 :: 		CircleButton3.Gradient_Start_Color    = 0x8000;
MOVW	R1, #32768
MOVW	R0, #lo_addr(_CircleButton3+36)
MOVT	R0, #hi_addr(_CircleButton3+36)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1411 :: 		CircleButton3.Gradient_End_Color      = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_CircleButton3+38)
MOVT	R0, #hi_addr(_CircleButton3+38)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1412 :: 		CircleButton3.Color          = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CircleButton3+40)
MOVT	R0, #hi_addr(_CircleButton3+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1413 :: 		CircleButton3.Press_Color    = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_CircleButton3+44)
MOVT	R0, #hi_addr(_CircleButton3+44)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1414 :: 		CircleButton3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton3+48)
MOVT	R0, #hi_addr(_CircleButton3+48)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1415 :: 		CircleButton3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton3+52)
MOVT	R0, #hi_addr(_CircleButton3+52)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1416 :: 		CircleButton3.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton3+56)
MOVT	R0, #hi_addr(_CircleButton3+56)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1417 :: 		CircleButton3.OnPressPtr      = PCA_RESULTS_MAIN;
MOVW	R1, #lo_addr(_PCA_RESULTS_MAIN+0)
MOVT	R1, #hi_addr(_PCA_RESULTS_MAIN+0)
MOVW	R0, #lo_addr(_CircleButton3+60)
MOVT	R0, #hi_addr(_CircleButton3+60)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1419 :: 		Label14.OwnerScreen     = &Screen10;
MOVW	R1, #lo_addr(_Screen10+0)
MOVT	R1, #hi_addr(_Screen10+0)
MOVW	R0, #lo_addr(_Label14+0)
MOVT	R0, #hi_addr(_Label14+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1420 :: 		Label14.Order          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label14+4)
MOVT	R0, #hi_addr(_Label14+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1421 :: 		Label14.Left           = 74;
MOVS	R1, #74
MOVW	R0, #lo_addr(_Label14+6)
MOVT	R0, #hi_addr(_Label14+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1422 :: 		Label14.Top            = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label14+8)
MOVT	R0, #hi_addr(_Label14+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1423 :: 		Label14.Width          = 82;
MOVS	R1, #82
MOVW	R0, #lo_addr(_Label14+10)
MOVT	R0, #hi_addr(_Label14+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1424 :: 		Label14.Height         = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label14+12)
MOVT	R0, #hi_addr(_Label14+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1425 :: 		Label14.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label14+26)
MOVT	R0, #hi_addr(_Label14+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1426 :: 		Label14.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label14+27)
MOVT	R0, #hi_addr(_Label14+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1427 :: 		Label14.Caption        = Label14_Caption;
MOVW	R1, #lo_addr(_Label14_Caption+0)
MOVT	R1, #hi_addr(_Label14_Caption+0)
MOVW	R0, #lo_addr(_Label14+16)
MOVT	R0, #hi_addr(_Label14+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1428 :: 		Label14.FontName       = Tahoma12x16_Regular;
MOVW	R1, #29900
MOVW	R0, #lo_addr(_Label14+20)
MOVT	R0, #hi_addr(_Label14+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1429 :: 		Label14.Font_Color     = 0x37E0;
MOVW	R1, #14304
MOVW	R0, #lo_addr(_Label14+24)
MOVT	R0, #hi_addr(_Label14+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1430 :: 		Label14.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label14+28)
MOVT	R0, #hi_addr(_Label14+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1431 :: 		Label14.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label14+32)
MOVT	R0, #hi_addr(_Label14+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1432 :: 		Label14.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label14+36)
MOVT	R0, #hi_addr(_Label14+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1433 :: 		Label14.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label14+40)
MOVT	R0, #hi_addr(_Label14+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1435 :: 		ProgressBar1.OwnerScreen     = &Screen10;
MOVW	R1, #lo_addr(_Screen10+0)
MOVT	R1, #hi_addr(_Screen10+0)
MOVW	R0, #lo_addr(_ProgressBar1+0)
MOVT	R0, #hi_addr(_ProgressBar1+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1436 :: 		ProgressBar1.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_ProgressBar1+4)
MOVT	R0, #hi_addr(_ProgressBar1+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1437 :: 		ProgressBar1.Left            = 68;
MOVS	R1, #68
MOVW	R0, #lo_addr(_ProgressBar1+6)
MOVT	R0, #hi_addr(_ProgressBar1+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1438 :: 		ProgressBar1.Top             = 158;
MOVS	R1, #158
MOVW	R0, #lo_addr(_ProgressBar1+8)
MOVT	R0, #hi_addr(_ProgressBar1+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1439 :: 		ProgressBar1.Width           = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_ProgressBar1+10)
MOVT	R0, #hi_addr(_ProgressBar1+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1440 :: 		ProgressBar1.Height          = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_ProgressBar1+12)
MOVT	R0, #hi_addr(_ProgressBar1+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1441 :: 		ProgressBar1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar1+14)
MOVT	R0, #hi_addr(_ProgressBar1+14)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1442 :: 		ProgressBar1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar1+16)
MOVT	R0, #hi_addr(_ProgressBar1+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1443 :: 		ProgressBar1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar1+18)
MOVT	R0, #hi_addr(_ProgressBar1+18)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1444 :: 		ProgressBar1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar1+19)
MOVT	R0, #hi_addr(_ProgressBar1+19)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1445 :: 		ProgressBar1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar1+20)
MOVT	R0, #hi_addr(_ProgressBar1+20)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1446 :: 		ProgressBar1.Caption         = ProgressBar1_Caption;
MOVW	R1, #lo_addr(_ProgressBar1_Caption+0)
MOVT	R1, #hi_addr(_ProgressBar1_Caption+0)
MOVW	R0, #lo_addr(_ProgressBar1+24)
MOVT	R0, #hi_addr(_ProgressBar1+24)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1447 :: 		ProgressBar1.FontName        = Tahoma11x13_Regular;
MOVW	R1, #944
MOVT	R1, #1
MOVW	R0, #lo_addr(_ProgressBar1+28)
MOVT	R0, #hi_addr(_ProgressBar1+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1448 :: 		ProgressBar1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar1+32)
MOVT	R0, #hi_addr(_ProgressBar1+32)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1449 :: 		ProgressBar1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar1+34)
MOVT	R0, #hi_addr(_ProgressBar1+34)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1450 :: 		ProgressBar1.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar1+35)
MOVT	R0, #hi_addr(_ProgressBar1+35)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1451 :: 		ProgressBar1.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ProgressBar1+36)
MOVT	R0, #hi_addr(_ProgressBar1+36)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1452 :: 		ProgressBar1.Gradient_End_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ProgressBar1+38)
MOVT	R0, #hi_addr(_ProgressBar1+38)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1453 :: 		ProgressBar1.Color           = 0xA65E;
MOVW	R1, #42590
MOVW	R0, #lo_addr(_ProgressBar1+40)
MOVT	R0, #hi_addr(_ProgressBar1+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1454 :: 		ProgressBar1.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_ProgressBar1+42)
MOVT	R0, #hi_addr(_ProgressBar1+42)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1455 :: 		ProgressBar1.Min             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1456 :: 		ProgressBar1.Max             = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_ProgressBar1+46)
MOVT	R0, #hi_addr(_ProgressBar1+46)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1457 :: 		ProgressBar1.Position        = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_ProgressBar1+48)
MOVT	R0, #hi_addr(_ProgressBar1+48)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1458 :: 		ProgressBar1.Show_Position   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar1+50)
MOVT	R0, #hi_addr(_ProgressBar1+50)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1459 :: 		ProgressBar1.Show_Percentage = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar1+51)
MOVT	R0, #hi_addr(_ProgressBar1+51)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1460 :: 		ProgressBar1.Smooth          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar1+52)
MOVT	R0, #hi_addr(_ProgressBar1+52)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1461 :: 		ProgressBar1.Rounded         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar1+53)
MOVT	R0, #hi_addr(_ProgressBar1+53)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1462 :: 		ProgressBar1.Corner_Radius      = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ProgressBar1+54)
MOVT	R0, #hi_addr(_ProgressBar1+54)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1464 :: 		Label15.OwnerScreen     = &Screen10;
MOVW	R1, #lo_addr(_Screen10+0)
MOVT	R1, #hi_addr(_Screen10+0)
MOVW	R0, #lo_addr(_Label15+0)
MOVT	R0, #hi_addr(_Label15+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1465 :: 		Label15.Order          = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Label15+4)
MOVT	R0, #hi_addr(_Label15+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1466 :: 		Label15.Left           = 93;
MOVS	R1, #93
MOVW	R0, #lo_addr(_Label15+6)
MOVT	R0, #hi_addr(_Label15+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1467 :: 		Label15.Top            = 131;
MOVS	R1, #131
MOVW	R0, #lo_addr(_Label15+8)
MOVT	R0, #hi_addr(_Label15+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1468 :: 		Label15.Width          = 55;
MOVS	R1, #55
MOVW	R0, #lo_addr(_Label15+10)
MOVT	R0, #hi_addr(_Label15+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1469 :: 		Label15.Height         = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label15+12)
MOVT	R0, #hi_addr(_Label15+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1470 :: 		Label15.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label15+26)
MOVT	R0, #hi_addr(_Label15+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1471 :: 		Label15.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label15+27)
MOVT	R0, #hi_addr(_Label15+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1472 :: 		Label15.Caption        = Label15_Caption;
MOVW	R1, #lo_addr(_Label15_Caption+0)
MOVT	R1, #hi_addr(_Label15_Caption+0)
MOVW	R0, #lo_addr(_Label15+16)
MOVT	R0, #hi_addr(_Label15+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1473 :: 		Label15.FontName       = Tahoma12x16_Regular;
MOVW	R1, #29900
MOVW	R0, #lo_addr(_Label15+20)
MOVT	R0, #hi_addr(_Label15+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1474 :: 		Label15.Font_Color     = 0x37E0;
MOVW	R1, #14304
MOVW	R0, #lo_addr(_Label15+24)
MOVT	R0, #hi_addr(_Label15+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1475 :: 		Label15.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label15+28)
MOVT	R0, #hi_addr(_Label15+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1476 :: 		Label15.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label15+32)
MOVT	R0, #hi_addr(_Label15+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1477 :: 		Label15.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label15+36)
MOVT	R0, #hi_addr(_Label15+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1478 :: 		Label15.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label15+40)
MOVT	R0, #hi_addr(_Label15+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1480 :: 		Label16.OwnerScreen     = &Screen11;
MOVW	R1, #lo_addr(_Screen11+0)
MOVT	R1, #hi_addr(_Screen11+0)
MOVW	R0, #lo_addr(_Label16+0)
MOVT	R0, #hi_addr(_Label16+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1481 :: 		Label16.Order          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label16+4)
MOVT	R0, #hi_addr(_Label16+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1482 :: 		Label16.Left           = 83;
MOVS	R1, #83
MOVW	R0, #lo_addr(_Label16+6)
MOVT	R0, #hi_addr(_Label16+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1483 :: 		Label16.Top            = 51;
MOVS	R1, #51
MOVW	R0, #lo_addr(_Label16+8)
MOVT	R0, #hi_addr(_Label16+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1484 :: 		Label16.Width          = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Label16+10)
MOVT	R0, #hi_addr(_Label16+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1485 :: 		Label16.Height         = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label16+12)
MOVT	R0, #hi_addr(_Label16+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1486 :: 		Label16.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label16+26)
MOVT	R0, #hi_addr(_Label16+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1487 :: 		Label16.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label16+27)
MOVT	R0, #hi_addr(_Label16+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1488 :: 		Label16.Caption        = Label16_Caption;
MOVW	R1, #lo_addr(_Label16_Caption+0)
MOVT	R1, #hi_addr(_Label16_Caption+0)
MOVW	R0, #lo_addr(_Label16+16)
MOVT	R0, #hi_addr(_Label16+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1489 :: 		Label16.FontName       = Arial30x33_Regular;
MOVW	R1, #14350
MOVW	R0, #lo_addr(_Label16+20)
MOVT	R0, #hi_addr(_Label16+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1490 :: 		Label16.Font_Color     = 0x9FE0;
MOVW	R1, #40928
MOVW	R0, #lo_addr(_Label16+24)
MOVT	R0, #hi_addr(_Label16+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1491 :: 		Label16.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label16+28)
MOVT	R0, #hi_addr(_Label16+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1492 :: 		Label16.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label16+32)
MOVT	R0, #hi_addr(_Label16+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1493 :: 		Label16.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label16+36)
MOVT	R0, #hi_addr(_Label16+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1494 :: 		Label16.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label16+40)
MOVT	R0, #hi_addr(_Label16+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1496 :: 		Label17.OwnerScreen     = &Screen11;
MOVW	R1, #lo_addr(_Screen11+0)
MOVT	R1, #hi_addr(_Screen11+0)
MOVW	R0, #lo_addr(_Label17+0)
MOVT	R0, #hi_addr(_Label17+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1497 :: 		Label17.Order          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label17+4)
MOVT	R0, #hi_addr(_Label17+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1498 :: 		Label17.Left           = 71;
MOVS	R1, #71
MOVW	R0, #lo_addr(_Label17+6)
MOVT	R0, #hi_addr(_Label17+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1499 :: 		Label17.Top            = 106;
MOVS	R1, #106
MOVW	R0, #lo_addr(_Label17+8)
MOVT	R0, #hi_addr(_Label17+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1500 :: 		Label17.Width          = 98;
MOVS	R1, #98
MOVW	R0, #lo_addr(_Label17+10)
MOVT	R0, #hi_addr(_Label17+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1501 :: 		Label17.Height         = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label17+12)
MOVT	R0, #hi_addr(_Label17+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1502 :: 		Label17.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label17+26)
MOVT	R0, #hi_addr(_Label17+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1503 :: 		Label17.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label17+27)
MOVT	R0, #hi_addr(_Label17+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1504 :: 		Label17.Caption        = Label17_Caption;
MOVW	R1, #lo_addr(_Label17_Caption+0)
MOVT	R1, #hi_addr(_Label17_Caption+0)
MOVW	R0, #lo_addr(_Label17+16)
MOVT	R0, #hi_addr(_Label17+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1505 :: 		Label17.FontName       = Arial30x33_Regular;
MOVW	R1, #14350
MOVW	R0, #lo_addr(_Label17+20)
MOVT	R0, #hi_addr(_Label17+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1506 :: 		Label17.Font_Color     = 0x9FE0;
MOVW	R1, #40928
MOVW	R0, #lo_addr(_Label17+24)
MOVT	R0, #hi_addr(_Label17+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1507 :: 		Label17.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label17+28)
MOVT	R0, #hi_addr(_Label17+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1508 :: 		Label17.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label17+32)
MOVT	R0, #hi_addr(_Label17+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1509 :: 		Label17.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label17+36)
MOVT	R0, #hi_addr(_Label17+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1510 :: 		Label17.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label17+40)
MOVT	R0, #hi_addr(_Label17+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1512 :: 		Label18.OwnerScreen     = &Screen11;
MOVW	R1, #lo_addr(_Screen11+0)
MOVT	R1, #hi_addr(_Screen11+0)
MOVW	R0, #lo_addr(_Label18+0)
MOVT	R0, #hi_addr(_Label18+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1513 :: 		Label18.Order          = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label18+4)
MOVT	R0, #hi_addr(_Label18+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1514 :: 		Label18.Left           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Label18+6)
MOVT	R0, #hi_addr(_Label18+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1515 :: 		Label18.Top            = 163;
MOVS	R1, #163
MOVW	R0, #lo_addr(_Label18+8)
MOVT	R0, #hi_addr(_Label18+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1516 :: 		Label18.Width          = 221;
MOVS	R1, #221
MOVW	R0, #lo_addr(_Label18+10)
MOVT	R0, #hi_addr(_Label18+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1517 :: 		Label18.Height         = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label18+12)
MOVT	R0, #hi_addr(_Label18+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1518 :: 		Label18.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label18+26)
MOVT	R0, #hi_addr(_Label18+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1519 :: 		Label18.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label18+27)
MOVT	R0, #hi_addr(_Label18+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1520 :: 		Label18.Caption        = Label18_Caption;
MOVW	R1, #lo_addr(_Label18_Caption+0)
MOVT	R1, #hi_addr(_Label18_Caption+0)
MOVW	R0, #lo_addr(_Label18+16)
MOVT	R0, #hi_addr(_Label18+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1521 :: 		Label18.FontName       = Arial19x22_Regular;
MOVW	R1, #4818
MOVW	R0, #lo_addr(_Label18+20)
MOVT	R0, #hi_addr(_Label18+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1522 :: 		Label18.Font_Color     = 0x9FE0;
MOVW	R1, #40928
MOVW	R0, #lo_addr(_Label18+24)
MOVT	R0, #hi_addr(_Label18+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1523 :: 		Label18.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label18+28)
MOVT	R0, #hi_addr(_Label18+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1524 :: 		Label18.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label18+32)
MOVT	R0, #hi_addr(_Label18+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1525 :: 		Label18.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label18+36)
MOVT	R0, #hi_addr(_Label18+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1526 :: 		Label18.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label18+40)
MOVT	R0, #hi_addr(_Label18+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1528 :: 		ButtonRound6.OwnerScreen     = &Screen11;
MOVW	R1, #lo_addr(_Screen11+0)
MOVT	R1, #hi_addr(_Screen11+0)
MOVW	R0, #lo_addr(_ButtonRound6+0)
MOVT	R0, #hi_addr(_ButtonRound6+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1529 :: 		ButtonRound6.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound6+4)
MOVT	R0, #hi_addr(_ButtonRound6+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1530 :: 		ButtonRound6.Left            = 71;
MOVS	R1, #71
MOVW	R0, #lo_addr(_ButtonRound6+6)
MOVT	R0, #hi_addr(_ButtonRound6+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1531 :: 		ButtonRound6.Top             = 218;
MOVS	R1, #218
MOVW	R0, #lo_addr(_ButtonRound6+8)
MOVT	R0, #hi_addr(_ButtonRound6+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1532 :: 		ButtonRound6.Width           = 105;
MOVS	R1, #105
MOVW	R0, #lo_addr(_ButtonRound6+10)
MOVT	R0, #hi_addr(_ButtonRound6+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1533 :: 		ButtonRound6.Height          = 41;
MOVS	R1, #41
MOVW	R0, #lo_addr(_ButtonRound6+12)
MOVT	R0, #hi_addr(_ButtonRound6+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1534 :: 		ButtonRound6.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+14)
MOVT	R0, #hi_addr(_ButtonRound6+14)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1535 :: 		ButtonRound6.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound6+16)
MOVT	R0, #hi_addr(_ButtonRound6+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1536 :: 		ButtonRound6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+18)
MOVT	R0, #hi_addr(_ButtonRound6+18)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1537 :: 		ButtonRound6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+19)
MOVT	R0, #hi_addr(_ButtonRound6+19)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1538 :: 		ButtonRound6.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+20)
MOVT	R0, #hi_addr(_ButtonRound6+20)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1539 :: 		ButtonRound6.Caption         = ButtonRound6_Caption;
MOVW	R1, #lo_addr(_ButtonRound6_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound6_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound6+24)
MOVT	R0, #hi_addr(_ButtonRound6+24)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1540 :: 		ButtonRound6.TextAlign             = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+28)
MOVT	R0, #hi_addr(_ButtonRound6+28)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1541 :: 		ButtonRound6.FontName        = Tahoma16x19_Regular;
MOVW	R1, #34092
MOVW	R0, #lo_addr(_ButtonRound6+32)
MOVT	R0, #hi_addr(_ButtonRound6+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1542 :: 		ButtonRound6.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+47)
MOVT	R0, #hi_addr(_ButtonRound6+47)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1543 :: 		ButtonRound6.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound6+36)
MOVT	R0, #hi_addr(_ButtonRound6+36)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1544 :: 		ButtonRound6.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+38)
MOVT	R0, #hi_addr(_ButtonRound6+38)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1545 :: 		ButtonRound6.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound6+39)
MOVT	R0, #hi_addr(_ButtonRound6+39)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1546 :: 		ButtonRound6.Gradient_Start_Color    = 0xFFF0;
MOVW	R1, #65520
MOVW	R0, #lo_addr(_ButtonRound6+40)
MOVT	R0, #hi_addr(_ButtonRound6+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1547 :: 		ButtonRound6.Gradient_End_Color      = 0x8400;
MOVW	R1, #33792
MOVW	R0, #lo_addr(_ButtonRound6+42)
MOVT	R0, #hi_addr(_ButtonRound6+42)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1548 :: 		ButtonRound6.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound6+44)
MOVT	R0, #hi_addr(_ButtonRound6+44)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1549 :: 		ButtonRound6.Press_Color     = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_ButtonRound6+48)
MOVT	R0, #hi_addr(_ButtonRound6+48)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1550 :: 		ButtonRound6.Corner_Radius      = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound6+46)
MOVT	R0, #hi_addr(_ButtonRound6+46)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1551 :: 		ButtonRound6.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound6+52)
MOVT	R0, #hi_addr(_ButtonRound6+52)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1552 :: 		ButtonRound6.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound6+56)
MOVT	R0, #hi_addr(_ButtonRound6+56)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1553 :: 		ButtonRound6.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound6+60)
MOVT	R0, #hi_addr(_ButtonRound6+60)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1554 :: 		ButtonRound6.OnPressPtr      = FLDA_PART_1_START;
MOVW	R1, #lo_addr(_FLDA_PART_1_START+0)
MOVT	R1, #hi_addr(_FLDA_PART_1_START+0)
MOVW	R0, #lo_addr(_ButtonRound6+64)
MOVT	R0, #hi_addr(_ButtonRound6+64)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1556 :: 		Label19.OwnerScreen     = &Screen12;
MOVW	R1, #lo_addr(_Screen12+0)
MOVT	R1, #hi_addr(_Screen12+0)
MOVW	R0, #lo_addr(_Label19+0)
MOVT	R0, #hi_addr(_Label19+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1557 :: 		Label19.Order          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label19+4)
MOVT	R0, #hi_addr(_Label19+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1558 :: 		Label19.Left           = 70;
MOVS	R1, #70
MOVW	R0, #lo_addr(_Label19+6)
MOVT	R0, #hi_addr(_Label19+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1559 :: 		Label19.Top            = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Label19+8)
MOVT	R0, #hi_addr(_Label19+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1560 :: 		Label19.Width          = 104;
MOVS	R1, #104
MOVW	R0, #lo_addr(_Label19+10)
MOVT	R0, #hi_addr(_Label19+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1561 :: 		Label19.Height         = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label19+12)
MOVT	R0, #hi_addr(_Label19+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1562 :: 		Label19.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label19+26)
MOVT	R0, #hi_addr(_Label19+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1563 :: 		Label19.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label19+27)
MOVT	R0, #hi_addr(_Label19+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1564 :: 		Label19.Caption        = Label19_Caption;
MOVW	R1, #lo_addr(_Label19_Caption+0)
MOVT	R1, #hi_addr(_Label19_Caption+0)
MOVW	R0, #lo_addr(_Label19+16)
MOVT	R0, #hi_addr(_Label19+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1565 :: 		Label19.FontName       = Arial13x16_Bold;
MOVW	R1, #2666
MOVW	R0, #lo_addr(_Label19+20)
MOVT	R0, #hi_addr(_Label19+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1566 :: 		Label19.Font_Color     = 0xFFE0;
MOVW	R1, #65504
MOVW	R0, #lo_addr(_Label19+24)
MOVT	R0, #hi_addr(_Label19+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1567 :: 		Label19.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label19+28)
MOVT	R0, #hi_addr(_Label19+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1568 :: 		Label19.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label19+32)
MOVT	R0, #hi_addr(_Label19+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1569 :: 		Label19.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label19+36)
MOVT	R0, #hi_addr(_Label19+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1570 :: 		Label19.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label19+40)
MOVT	R0, #hi_addr(_Label19+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1572 :: 		Label31.OwnerScreen     = &Screen12;
MOVW	R1, #lo_addr(_Screen12+0)
MOVT	R1, #hi_addr(_Screen12+0)
MOVW	R0, #lo_addr(_Label31+0)
MOVT	R0, #hi_addr(_Label31+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1573 :: 		Label31.Order          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label31+4)
MOVT	R0, #hi_addr(_Label31+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1574 :: 		Label31.Left           = 97;
MOVS	R1, #97
MOVW	R0, #lo_addr(_Label31+6)
MOVT	R0, #hi_addr(_Label31+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1575 :: 		Label31.Top            = 287;
MOVW	R1, #287
MOVW	R0, #lo_addr(_Label31+8)
MOVT	R0, #hi_addr(_Label31+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1576 :: 		Label31.Width          = 45;
MOVS	R1, #45
MOVW	R0, #lo_addr(_Label31+10)
MOVT	R0, #hi_addr(_Label31+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1577 :: 		Label31.Height         = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label31+12)
MOVT	R0, #hi_addr(_Label31+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1578 :: 		Label31.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label31+26)
MOVT	R0, #hi_addr(_Label31+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1579 :: 		Label31.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label31+27)
MOVT	R0, #hi_addr(_Label31+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1580 :: 		Label31.Caption        = Label31_Caption;
MOVW	R1, #lo_addr(_Label31_Caption+0)
MOVT	R1, #hi_addr(_Label31_Caption+0)
MOVW	R0, #lo_addr(_Label31+16)
MOVT	R0, #hi_addr(_Label31+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1581 :: 		Label31.FontName       = Arial13x16_Bold;
MOVW	R1, #2666
MOVW	R0, #lo_addr(_Label31+20)
MOVT	R0, #hi_addr(_Label31+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1582 :: 		Label31.Font_Color     = 0xFFE0;
MOVW	R1, #65504
MOVW	R0, #lo_addr(_Label31+24)
MOVT	R0, #hi_addr(_Label31+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1583 :: 		Label31.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label31+28)
MOVT	R0, #hi_addr(_Label31+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1584 :: 		Label31.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label31+32)
MOVT	R0, #hi_addr(_Label31+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1585 :: 		Label31.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label31+36)
MOVT	R0, #hi_addr(_Label31+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1586 :: 		Label31.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label31+40)
MOVT	R0, #hi_addr(_Label31+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1588 :: 		Label20.OwnerScreen     = &Screen13;
MOVW	R1, #lo_addr(_Screen13+0)
MOVT	R1, #hi_addr(_Screen13+0)
MOVW	R0, #lo_addr(_Label20+0)
MOVT	R0, #hi_addr(_Label20+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1589 :: 		Label20.Order          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label20+4)
MOVT	R0, #hi_addr(_Label20+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1590 :: 		Label20.Left           = 95;
MOVS	R1, #95
MOVW	R0, #lo_addr(_Label20+6)
MOVT	R0, #hi_addr(_Label20+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1591 :: 		Label20.Top            = 47;
MOVS	R1, #47
MOVW	R0, #lo_addr(_Label20+8)
MOVT	R0, #hi_addr(_Label20+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1592 :: 		Label20.Width          = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_Label20+10)
MOVT	R0, #hi_addr(_Label20+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1593 :: 		Label20.Height         = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label20+12)
MOVT	R0, #hi_addr(_Label20+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1594 :: 		Label20.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label20+26)
MOVT	R0, #hi_addr(_Label20+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1595 :: 		Label20.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label20+27)
MOVT	R0, #hi_addr(_Label20+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1596 :: 		Label20.Caption        = Label20_Caption;
MOVW	R1, #lo_addr(_Label20_Caption+0)
MOVT	R1, #hi_addr(_Label20_Caption+0)
MOVW	R0, #lo_addr(_Label20+16)
MOVT	R0, #hi_addr(_Label20+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1597 :: 		Label20.FontName       = Tahoma23x29_Regular;
MOVW	R1, #53248
MOVW	R0, #lo_addr(_Label20+20)
MOVT	R0, #hi_addr(_Label20+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1598 :: 		Label20.Font_Color     = 0x001F;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label20+24)
MOVT	R0, #hi_addr(_Label20+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1599 :: 		Label20.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label20+28)
MOVT	R0, #hi_addr(_Label20+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1600 :: 		Label20.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label20+32)
MOVT	R0, #hi_addr(_Label20+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1601 :: 		Label20.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label20+36)
MOVT	R0, #hi_addr(_Label20+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1602 :: 		Label20.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label20+40)
MOVT	R0, #hi_addr(_Label20+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1604 :: 		Label21.OwnerScreen     = &Screen13;
MOVW	R1, #lo_addr(_Screen13+0)
MOVT	R1, #hi_addr(_Screen13+0)
MOVW	R0, #lo_addr(_Label21+0)
MOVT	R0, #hi_addr(_Label21+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1605 :: 		Label21.Order          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label21+4)
MOVT	R0, #hi_addr(_Label21+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1606 :: 		Label21.Left           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Label21+6)
MOVT	R0, #hi_addr(_Label21+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1607 :: 		Label21.Top            = 88;
MOVS	R1, #88
MOVW	R0, #lo_addr(_Label21+8)
MOVT	R0, #hi_addr(_Label21+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1608 :: 		Label21.Width          = 197;
MOVS	R1, #197
MOVW	R0, #lo_addr(_Label21+10)
MOVT	R0, #hi_addr(_Label21+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1609 :: 		Label21.Height         = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label21+12)
MOVT	R0, #hi_addr(_Label21+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1610 :: 		Label21.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label21+26)
MOVT	R0, #hi_addr(_Label21+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1611 :: 		Label21.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label21+27)
MOVT	R0, #hi_addr(_Label21+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1612 :: 		Label21.Caption        = Label21_Caption;
MOVW	R1, #lo_addr(_Label21_Caption+0)
MOVT	R1, #hi_addr(_Label21_Caption+0)
MOVW	R0, #lo_addr(_Label21+16)
MOVT	R0, #hi_addr(_Label21+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1613 :: 		Label21.FontName       = Tahoma23x29_Regular;
MOVW	R1, #53248
MOVW	R0, #lo_addr(_Label21+20)
MOVT	R0, #hi_addr(_Label21+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1614 :: 		Label21.Font_Color     = 0x001F;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label21+24)
MOVT	R0, #hi_addr(_Label21+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1615 :: 		Label21.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label21+28)
MOVT	R0, #hi_addr(_Label21+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1616 :: 		Label21.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label21+32)
MOVT	R0, #hi_addr(_Label21+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1617 :: 		Label21.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label21+36)
MOVT	R0, #hi_addr(_Label21+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1618 :: 		Label21.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label21+40)
MOVT	R0, #hi_addr(_Label21+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1620 :: 		Label22.OwnerScreen     = &Screen13;
MOVW	R1, #lo_addr(_Screen13+0)
MOVT	R1, #hi_addr(_Screen13+0)
MOVW	R0, #lo_addr(_Label22+0)
MOVT	R0, #hi_addr(_Label22+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1621 :: 		Label22.Order          = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label22+4)
MOVT	R0, #hi_addr(_Label22+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1622 :: 		Label22.Left           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Label22+6)
MOVT	R0, #hi_addr(_Label22+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1623 :: 		Label22.Top            = 131;
MOVS	R1, #131
MOVW	R0, #lo_addr(_Label22+8)
MOVT	R0, #hi_addr(_Label22+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1624 :: 		Label22.Width          = 78;
MOVS	R1, #78
MOVW	R0, #lo_addr(_Label22+10)
MOVT	R0, #hi_addr(_Label22+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1625 :: 		Label22.Height         = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label22+12)
MOVT	R0, #hi_addr(_Label22+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1626 :: 		Label22.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label22+26)
MOVT	R0, #hi_addr(_Label22+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1627 :: 		Label22.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label22+27)
MOVT	R0, #hi_addr(_Label22+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1628 :: 		Label22.Caption        = Label22_Caption;
MOVW	R1, #lo_addr(_Label22_Caption+0)
MOVT	R1, #hi_addr(_Label22_Caption+0)
MOVW	R0, #lo_addr(_Label22+16)
MOVT	R0, #hi_addr(_Label22+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1629 :: 		Label22.FontName       = Tahoma23x29_Regular;
MOVW	R1, #53248
MOVW	R0, #lo_addr(_Label22+20)
MOVT	R0, #hi_addr(_Label22+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1630 :: 		Label22.Font_Color     = 0x001F;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label22+24)
MOVT	R0, #hi_addr(_Label22+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1631 :: 		Label22.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label22+28)
MOVT	R0, #hi_addr(_Label22+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1632 :: 		Label22.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label22+32)
MOVT	R0, #hi_addr(_Label22+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1633 :: 		Label22.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label22+36)
MOVT	R0, #hi_addr(_Label22+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1634 :: 		Label22.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label22+40)
MOVT	R0, #hi_addr(_Label22+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1636 :: 		ButtonRound7.OwnerScreen     = &Screen13;
MOVW	R1, #lo_addr(_Screen13+0)
MOVT	R1, #hi_addr(_Screen13+0)
MOVW	R0, #lo_addr(_ButtonRound7+0)
MOVT	R0, #hi_addr(_ButtonRound7+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1637 :: 		ButtonRound7.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound7+4)
MOVT	R0, #hi_addr(_ButtonRound7+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1638 :: 		ButtonRound7.Left            = 58;
MOVS	R1, #58
MOVW	R0, #lo_addr(_ButtonRound7+6)
MOVT	R0, #hi_addr(_ButtonRound7+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1639 :: 		ButtonRound7.Top             = 199;
MOVS	R1, #199
MOVW	R0, #lo_addr(_ButtonRound7+8)
MOVT	R0, #hi_addr(_ButtonRound7+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1640 :: 		ButtonRound7.Width           = 122;
MOVS	R1, #122
MOVW	R0, #lo_addr(_ButtonRound7+10)
MOVT	R0, #hi_addr(_ButtonRound7+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1641 :: 		ButtonRound7.Height          = 51;
MOVS	R1, #51
MOVW	R0, #lo_addr(_ButtonRound7+12)
MOVT	R0, #hi_addr(_ButtonRound7+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1642 :: 		ButtonRound7.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+14)
MOVT	R0, #hi_addr(_ButtonRound7+14)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1643 :: 		ButtonRound7.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound7+16)
MOVT	R0, #hi_addr(_ButtonRound7+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1644 :: 		ButtonRound7.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+18)
MOVT	R0, #hi_addr(_ButtonRound7+18)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1645 :: 		ButtonRound7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+19)
MOVT	R0, #hi_addr(_ButtonRound7+19)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1646 :: 		ButtonRound7.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+20)
MOVT	R0, #hi_addr(_ButtonRound7+20)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1647 :: 		ButtonRound7.Caption         = ButtonRound7_Caption;
MOVW	R1, #lo_addr(_ButtonRound7_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound7_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound7+24)
MOVT	R0, #hi_addr(_ButtonRound7+24)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1648 :: 		ButtonRound7.TextAlign             = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+28)
MOVT	R0, #hi_addr(_ButtonRound7+28)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1649 :: 		ButtonRound7.FontName        = Tahoma16x19_Regular;
MOVW	R1, #34092
MOVW	R0, #lo_addr(_ButtonRound7+32)
MOVT	R0, #hi_addr(_ButtonRound7+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1650 :: 		ButtonRound7.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+47)
MOVT	R0, #hi_addr(_ButtonRound7+47)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1651 :: 		ButtonRound7.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound7+36)
MOVT	R0, #hi_addr(_ButtonRound7+36)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1652 :: 		ButtonRound7.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+38)
MOVT	R0, #hi_addr(_ButtonRound7+38)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1653 :: 		ButtonRound7.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound7+39)
MOVT	R0, #hi_addr(_ButtonRound7+39)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1654 :: 		ButtonRound7.Gradient_Start_Color    = 0xFC08;
MOVW	R1, #64520
MOVW	R0, #lo_addr(_ButtonRound7+40)
MOVT	R0, #hi_addr(_ButtonRound7+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1655 :: 		ButtonRound7.Gradient_End_Color      = 0x8408;
MOVW	R1, #33800
MOVW	R0, #lo_addr(_ButtonRound7+42)
MOVT	R0, #hi_addr(_ButtonRound7+42)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1656 :: 		ButtonRound7.Color           = 0x8400;
MOVW	R1, #33792
MOVW	R0, #lo_addr(_ButtonRound7+44)
MOVT	R0, #hi_addr(_ButtonRound7+44)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1657 :: 		ButtonRound7.Press_Color     = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_ButtonRound7+48)
MOVT	R0, #hi_addr(_ButtonRound7+48)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1658 :: 		ButtonRound7.Corner_Radius      = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound7+46)
MOVT	R0, #hi_addr(_ButtonRound7+46)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1659 :: 		ButtonRound7.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound7+52)
MOVT	R0, #hi_addr(_ButtonRound7+52)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1660 :: 		ButtonRound7.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound7+56)
MOVT	R0, #hi_addr(_ButtonRound7+56)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1661 :: 		ButtonRound7.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound7+60)
MOVT	R0, #hi_addr(_ButtonRound7+60)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1662 :: 		ButtonRound7.OnPressPtr      = FLDA_PART_2_START;
MOVW	R1, #lo_addr(_FLDA_PART_2_START+0)
MOVT	R1, #hi_addr(_FLDA_PART_2_START+0)
MOVW	R0, #lo_addr(_ButtonRound7+64)
MOVT	R0, #hi_addr(_ButtonRound7+64)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1664 :: 		Label23.OwnerScreen     = &Screen14;
MOVW	R1, #lo_addr(_Screen14+0)
MOVT	R1, #hi_addr(_Screen14+0)
MOVW	R0, #lo_addr(_Label23+0)
MOVT	R0, #hi_addr(_Label23+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1665 :: 		Label23.Order          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label23+4)
MOVT	R0, #hi_addr(_Label23+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1666 :: 		Label23.Left           = 60;
MOVS	R1, #60
MOVW	R0, #lo_addr(_Label23+6)
MOVT	R0, #hi_addr(_Label23+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1667 :: 		Label23.Top            = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Label23+8)
MOVT	R0, #hi_addr(_Label23+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1668 :: 		Label23.Width          = 124;
MOVS	R1, #124
MOVW	R0, #lo_addr(_Label23+10)
MOVT	R0, #hi_addr(_Label23+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1669 :: 		Label23.Height         = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Label23+12)
MOVT	R0, #hi_addr(_Label23+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1670 :: 		Label23.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label23+26)
MOVT	R0, #hi_addr(_Label23+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1671 :: 		Label23.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label23+27)
MOVT	R0, #hi_addr(_Label23+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1672 :: 		Label23.Caption        = Label23_Caption;
MOVW	R1, #lo_addr(_Label23_Caption+0)
MOVT	R1, #hi_addr(_Label23_Caption+0)
MOVW	R0, #lo_addr(_Label23+16)
MOVT	R0, #hi_addr(_Label23+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1673 :: 		Label23.FontName       = Tahoma19x19_Bold;
MOVW	R1, #36840
MOVW	R0, #lo_addr(_Label23+20)
MOVT	R0, #hi_addr(_Label23+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1674 :: 		Label23.Font_Color     = 0x3186;
MOVW	R1, #12678
MOVW	R0, #lo_addr(_Label23+24)
MOVT	R0, #hi_addr(_Label23+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1675 :: 		Label23.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label23+28)
MOVT	R0, #hi_addr(_Label23+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1676 :: 		Label23.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label23+32)
MOVT	R0, #hi_addr(_Label23+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1677 :: 		Label23.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label23+36)
MOVT	R0, #hi_addr(_Label23+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1678 :: 		Label23.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label23+40)
MOVT	R0, #hi_addr(_Label23+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1680 :: 		Label24.OwnerScreen     = &Screen14;
MOVW	R1, #lo_addr(_Screen14+0)
MOVT	R1, #hi_addr(_Screen14+0)
MOVW	R0, #lo_addr(_Label24+0)
MOVT	R0, #hi_addr(_Label24+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1681 :: 		Label24.Order          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label24+4)
MOVT	R0, #hi_addr(_Label24+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1682 :: 		Label24.Left           = 69;
MOVS	R1, #69
MOVW	R0, #lo_addr(_Label24+6)
MOVT	R0, #hi_addr(_Label24+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1683 :: 		Label24.Top            = 33;
MOVS	R1, #33
MOVW	R0, #lo_addr(_Label24+8)
MOVT	R0, #hi_addr(_Label24+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1684 :: 		Label24.Width          = 103;
MOVS	R1, #103
MOVW	R0, #lo_addr(_Label24+10)
MOVT	R0, #hi_addr(_Label24+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1685 :: 		Label24.Height         = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label24+12)
MOVT	R0, #hi_addr(_Label24+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1686 :: 		Label24.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label24+26)
MOVT	R0, #hi_addr(_Label24+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1687 :: 		Label24.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label24+27)
MOVT	R0, #hi_addr(_Label24+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1688 :: 		Label24.Caption        = Label24_Caption;
MOVW	R1, #lo_addr(_Label24_Caption+0)
MOVT	R1, #hi_addr(_Label24_Caption+0)
MOVW	R0, #lo_addr(_Label24+16)
MOVT	R0, #hi_addr(_Label24+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1689 :: 		Label24.FontName       = Tahoma14x16_Bold;
MOVW	R1, #31940
MOVW	R0, #lo_addr(_Label24+20)
MOVT	R0, #hi_addr(_Label24+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1690 :: 		Label24.Font_Color     = 0x3186;
MOVW	R1, #12678
MOVW	R0, #lo_addr(_Label24+24)
MOVT	R0, #hi_addr(_Label24+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1691 :: 		Label24.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label24+28)
MOVT	R0, #hi_addr(_Label24+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1692 :: 		Label24.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label24+32)
MOVT	R0, #hi_addr(_Label24+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1693 :: 		Label24.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label24+36)
MOVT	R0, #hi_addr(_Label24+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1694 :: 		Label24.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label24+40)
MOVT	R0, #hi_addr(_Label24+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1696 :: 		Label25.OwnerScreen     = &Screen14;
MOVW	R1, #lo_addr(_Screen14+0)
MOVT	R1, #hi_addr(_Screen14+0)
MOVW	R0, #lo_addr(_Label25+0)
MOVT	R0, #hi_addr(_Label25+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1697 :: 		Label25.Order          = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label25+4)
MOVT	R0, #hi_addr(_Label25+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1698 :: 		Label25.Left           = 88;
MOVS	R1, #88
MOVW	R0, #lo_addr(_Label25+6)
MOVT	R0, #hi_addr(_Label25+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1699 :: 		Label25.Top            = 53;
MOVS	R1, #53
MOVW	R0, #lo_addr(_Label25+8)
MOVT	R0, #hi_addr(_Label25+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1700 :: 		Label25.Width          = 55;
MOVS	R1, #55
MOVW	R0, #lo_addr(_Label25+10)
MOVT	R0, #hi_addr(_Label25+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1701 :: 		Label25.Height         = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label25+12)
MOVT	R0, #hi_addr(_Label25+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1702 :: 		Label25.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label25+26)
MOVT	R0, #hi_addr(_Label25+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1703 :: 		Label25.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label25+27)
MOVT	R0, #hi_addr(_Label25+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1704 :: 		Label25.Caption        = Label25_Caption;
MOVW	R1, #lo_addr(_Label25_Caption+0)
MOVT	R1, #hi_addr(_Label25_Caption+0)
MOVW	R0, #lo_addr(_Label25+16)
MOVT	R0, #hi_addr(_Label25+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1705 :: 		Label25.FontName       = Tahoma14x16_Bold;
MOVW	R1, #31940
MOVW	R0, #lo_addr(_Label25+20)
MOVT	R0, #hi_addr(_Label25+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1706 :: 		Label25.Font_Color     = 0x3186;
MOVW	R1, #12678
MOVW	R0, #lo_addr(_Label25+24)
MOVT	R0, #hi_addr(_Label25+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1707 :: 		Label25.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label25+28)
MOVT	R0, #hi_addr(_Label25+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1708 :: 		Label25.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label25+32)
MOVT	R0, #hi_addr(_Label25+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1709 :: 		Label25.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label25+36)
MOVT	R0, #hi_addr(_Label25+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1710 :: 		Label25.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label25+40)
MOVT	R0, #hi_addr(_Label25+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1712 :: 		RadioButton12.OwnerScreen     = &Screen14;
MOVW	R1, #lo_addr(_Screen14+0)
MOVT	R1, #hi_addr(_Screen14+0)
MOVW	R0, #lo_addr(_RadioButton12+0)
MOVT	R0, #hi_addr(_RadioButton12+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1713 :: 		RadioButton12.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_RadioButton12+4)
MOVT	R0, #hi_addr(_RadioButton12+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1714 :: 		RadioButton12.Left            = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_RadioButton12+6)
MOVT	R0, #hi_addr(_RadioButton12+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1715 :: 		RadioButton12.Top             = 104;
MOVS	R1, #104
MOVW	R0, #lo_addr(_RadioButton12+8)
MOVT	R0, #hi_addr(_RadioButton12+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1716 :: 		RadioButton12.Width           = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_RadioButton12+10)
MOVT	R0, #hi_addr(_RadioButton12+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1717 :: 		RadioButton12.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_RadioButton12+12)
MOVT	R0, #hi_addr(_RadioButton12+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1718 :: 		RadioButton12.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton12+14)
MOVT	R0, #hi_addr(_RadioButton12+14)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1719 :: 		RadioButton12.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton12+16)
MOVT	R0, #hi_addr(_RadioButton12+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1720 :: 		RadioButton12.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton12+18)
MOVT	R0, #hi_addr(_RadioButton12+18)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1721 :: 		RadioButton12.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton12+19)
MOVT	R0, #hi_addr(_RadioButton12+19)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1722 :: 		RadioButton12.Checked          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton12+20)
MOVT	R0, #hi_addr(_RadioButton12+20)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1723 :: 		RadioButton12.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton12+21)
MOVT	R0, #hi_addr(_RadioButton12+21)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1724 :: 		RadioButton12.Caption         = RadioButton12_Caption;
MOVW	R1, #lo_addr(_RadioButton12_Caption+0)
MOVT	R1, #hi_addr(_RadioButton12_Caption+0)
MOVW	R0, #lo_addr(_RadioButton12+24)
MOVT	R0, #hi_addr(_RadioButton12+24)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1725 :: 		RadioButton12.TextAlign            = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton12+28)
MOVT	R0, #hi_addr(_RadioButton12+28)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1726 :: 		RadioButton12.FontName        = Tahoma11x13_Regular;
MOVW	R1, #944
MOVT	R1, #1
MOVW	R0, #lo_addr(_RadioButton12+32)
MOVT	R0, #hi_addr(_RadioButton12+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1727 :: 		RadioButton12.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton12+48)
MOVT	R0, #hi_addr(_RadioButton12+48)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1728 :: 		RadioButton12.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton12+36)
MOVT	R0, #hi_addr(_RadioButton12+36)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1729 :: 		RadioButton12.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton12+38)
MOVT	R0, #hi_addr(_RadioButton12+38)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1730 :: 		RadioButton12.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton12+39)
MOVT	R0, #hi_addr(_RadioButton12+39)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1731 :: 		RadioButton12.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton12+40)
MOVT	R0, #hi_addr(_RadioButton12+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1732 :: 		RadioButton12.Gradient_End_Color      = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton12+42)
MOVT	R0, #hi_addr(_RadioButton12+42)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1733 :: 		RadioButton12.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton12+44)
MOVT	R0, #hi_addr(_RadioButton12+44)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1734 :: 		RadioButton12.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton12+50)
MOVT	R0, #hi_addr(_RadioButton12+50)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1735 :: 		RadioButton12.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_RadioButton12+46)
MOVT	R0, #hi_addr(_RadioButton12+46)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1736 :: 		RadioButton12.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton12+52)
MOVT	R0, #hi_addr(_RadioButton12+52)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1737 :: 		RadioButton12.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton12+56)
MOVT	R0, #hi_addr(_RadioButton12+56)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1738 :: 		RadioButton12.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton12+60)
MOVT	R0, #hi_addr(_RadioButton12+60)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1739 :: 		RadioButton12.OnPressPtr      = QR2_10;
MOVW	R1, #lo_addr(_QR2_10+0)
MOVT	R1, #hi_addr(_QR2_10+0)
MOVW	R0, #lo_addr(_RadioButton12+64)
MOVT	R0, #hi_addr(_RadioButton12+64)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1741 :: 		RadioButton13.OwnerScreen     = &Screen14;
MOVW	R1, #lo_addr(_Screen14+0)
MOVT	R1, #hi_addr(_Screen14+0)
MOVW	R0, #lo_addr(_RadioButton13+0)
MOVT	R0, #hi_addr(_RadioButton13+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1742 :: 		RadioButton13.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_RadioButton13+4)
MOVT	R0, #hi_addr(_RadioButton13+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1743 :: 		RadioButton13.Left            = 179;
MOVS	R1, #179
MOVW	R0, #lo_addr(_RadioButton13+6)
MOVT	R0, #hi_addr(_RadioButton13+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1744 :: 		RadioButton13.Top             = 105;
MOVS	R1, #105
MOVW	R0, #lo_addr(_RadioButton13+8)
MOVT	R0, #hi_addr(_RadioButton13+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1745 :: 		RadioButton13.Width           = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_RadioButton13+10)
MOVT	R0, #hi_addr(_RadioButton13+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1746 :: 		RadioButton13.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_RadioButton13+12)
MOVT	R0, #hi_addr(_RadioButton13+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1747 :: 		RadioButton13.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton13+14)
MOVT	R0, #hi_addr(_RadioButton13+14)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1748 :: 		RadioButton13.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton13+16)
MOVT	R0, #hi_addr(_RadioButton13+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1749 :: 		RadioButton13.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton13+18)
MOVT	R0, #hi_addr(_RadioButton13+18)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1750 :: 		RadioButton13.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton13+19)
MOVT	R0, #hi_addr(_RadioButton13+19)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1751 :: 		RadioButton13.Checked          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton13+20)
MOVT	R0, #hi_addr(_RadioButton13+20)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1752 :: 		RadioButton13.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton13+21)
MOVT	R0, #hi_addr(_RadioButton13+21)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1753 :: 		RadioButton13.Caption         = RadioButton13_Caption;
MOVW	R1, #lo_addr(_RadioButton13_Caption+0)
MOVT	R1, #hi_addr(_RadioButton13_Caption+0)
MOVW	R0, #lo_addr(_RadioButton13+24)
MOVT	R0, #hi_addr(_RadioButton13+24)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1754 :: 		RadioButton13.TextAlign            = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton13+28)
MOVT	R0, #hi_addr(_RadioButton13+28)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1755 :: 		RadioButton13.FontName        = Tahoma11x13_Regular;
MOVW	R1, #944
MOVT	R1, #1
MOVW	R0, #lo_addr(_RadioButton13+32)
MOVT	R0, #hi_addr(_RadioButton13+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1756 :: 		RadioButton13.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton13+48)
MOVT	R0, #hi_addr(_RadioButton13+48)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1757 :: 		RadioButton13.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton13+36)
MOVT	R0, #hi_addr(_RadioButton13+36)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1758 :: 		RadioButton13.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton13+38)
MOVT	R0, #hi_addr(_RadioButton13+38)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1759 :: 		RadioButton13.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton13+39)
MOVT	R0, #hi_addr(_RadioButton13+39)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1760 :: 		RadioButton13.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton13+40)
MOVT	R0, #hi_addr(_RadioButton13+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1761 :: 		RadioButton13.Gradient_End_Color      = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton13+42)
MOVT	R0, #hi_addr(_RadioButton13+42)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1762 :: 		RadioButton13.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton13+44)
MOVT	R0, #hi_addr(_RadioButton13+44)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1763 :: 		RadioButton13.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton13+50)
MOVT	R0, #hi_addr(_RadioButton13+50)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1764 :: 		RadioButton13.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_RadioButton13+46)
MOVT	R0, #hi_addr(_RadioButton13+46)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1765 :: 		RadioButton13.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton13+52)
MOVT	R0, #hi_addr(_RadioButton13+52)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1766 :: 		RadioButton13.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton13+56)
MOVT	R0, #hi_addr(_RadioButton13+56)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1767 :: 		RadioButton13.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton13+60)
MOVT	R0, #hi_addr(_RadioButton13+60)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1768 :: 		RadioButton13.OnPressPtr      = QR2_15;
MOVW	R1, #lo_addr(_QR2_15+0)
MOVT	R1, #hi_addr(_QR2_15+0)
MOVW	R0, #lo_addr(_RadioButton13+64)
MOVT	R0, #hi_addr(_RadioButton13+64)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1770 :: 		RadioButton14.OwnerScreen     = &Screen14;
MOVW	R1, #lo_addr(_Screen14+0)
MOVT	R1, #hi_addr(_Screen14+0)
MOVW	R0, #lo_addr(_RadioButton14+0)
MOVT	R0, #hi_addr(_RadioButton14+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1771 :: 		RadioButton14.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_RadioButton14+4)
MOVT	R0, #hi_addr(_RadioButton14+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1772 :: 		RadioButton14.Left            = 77;
MOVS	R1, #77
MOVW	R0, #lo_addr(_RadioButton14+6)
MOVT	R0, #hi_addr(_RadioButton14+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1773 :: 		RadioButton14.Top             = 173;
MOVS	R1, #173
MOVW	R0, #lo_addr(_RadioButton14+8)
MOVT	R0, #hi_addr(_RadioButton14+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1774 :: 		RadioButton14.Width           = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_RadioButton14+10)
MOVT	R0, #hi_addr(_RadioButton14+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1775 :: 		RadioButton14.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_RadioButton14+12)
MOVT	R0, #hi_addr(_RadioButton14+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1776 :: 		RadioButton14.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton14+14)
MOVT	R0, #hi_addr(_RadioButton14+14)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1777 :: 		RadioButton14.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton14+16)
MOVT	R0, #hi_addr(_RadioButton14+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1778 :: 		RadioButton14.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton14+18)
MOVT	R0, #hi_addr(_RadioButton14+18)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1779 :: 		RadioButton14.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton14+19)
MOVT	R0, #hi_addr(_RadioButton14+19)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1780 :: 		RadioButton14.Checked          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton14+20)
MOVT	R0, #hi_addr(_RadioButton14+20)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1781 :: 		RadioButton14.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton14+21)
MOVT	R0, #hi_addr(_RadioButton14+21)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1782 :: 		RadioButton14.Caption         = RadioButton14_Caption;
MOVW	R1, #lo_addr(_RadioButton14_Caption+0)
MOVT	R1, #hi_addr(_RadioButton14_Caption+0)
MOVW	R0, #lo_addr(_RadioButton14+24)
MOVT	R0, #hi_addr(_RadioButton14+24)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1783 :: 		RadioButton14.TextAlign            = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton14+28)
MOVT	R0, #hi_addr(_RadioButton14+28)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1784 :: 		RadioButton14.FontName        = Tahoma11x13_Regular;
MOVW	R1, #944
MOVT	R1, #1
MOVW	R0, #lo_addr(_RadioButton14+32)
MOVT	R0, #hi_addr(_RadioButton14+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1785 :: 		RadioButton14.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton14+48)
MOVT	R0, #hi_addr(_RadioButton14+48)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1786 :: 		RadioButton14.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton14+36)
MOVT	R0, #hi_addr(_RadioButton14+36)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1787 :: 		RadioButton14.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton14+38)
MOVT	R0, #hi_addr(_RadioButton14+38)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1788 :: 		RadioButton14.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton14+39)
MOVT	R0, #hi_addr(_RadioButton14+39)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1789 :: 		RadioButton14.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton14+40)
MOVT	R0, #hi_addr(_RadioButton14+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1790 :: 		RadioButton14.Gradient_End_Color      = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton14+42)
MOVT	R0, #hi_addr(_RadioButton14+42)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1791 :: 		RadioButton14.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton14+44)
MOVT	R0, #hi_addr(_RadioButton14+44)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1792 :: 		RadioButton14.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton14+50)
MOVT	R0, #hi_addr(_RadioButton14+50)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1793 :: 		RadioButton14.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_RadioButton14+46)
MOVT	R0, #hi_addr(_RadioButton14+46)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1794 :: 		RadioButton14.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton14+52)
MOVT	R0, #hi_addr(_RadioButton14+52)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1795 :: 		RadioButton14.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton14+56)
MOVT	R0, #hi_addr(_RadioButton14+56)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1796 :: 		RadioButton14.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton14+60)
MOVT	R0, #hi_addr(_RadioButton14+60)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1797 :: 		RadioButton14.OnPressPtr      = QR2_25;
MOVW	R1, #lo_addr(_QR2_25+0)
MOVT	R1, #hi_addr(_QR2_25+0)
MOVW	R0, #lo_addr(_RadioButton14+64)
MOVT	R0, #hi_addr(_RadioButton14+64)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1799 :: 		RadioButton15.OwnerScreen     = &Screen14;
MOVW	R1, #lo_addr(_Screen14+0)
MOVT	R1, #hi_addr(_Screen14+0)
MOVW	R0, #lo_addr(_RadioButton15+0)
MOVT	R0, #hi_addr(_RadioButton15+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1800 :: 		RadioButton15.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_RadioButton15+4)
MOVT	R0, #hi_addr(_RadioButton15+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1801 :: 		RadioButton15.Left            = 135;
MOVS	R1, #135
MOVW	R0, #lo_addr(_RadioButton15+6)
MOVT	R0, #hi_addr(_RadioButton15+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1802 :: 		RadioButton15.Top             = 172;
MOVS	R1, #172
MOVW	R0, #lo_addr(_RadioButton15+8)
MOVT	R0, #hi_addr(_RadioButton15+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1803 :: 		RadioButton15.Width           = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_RadioButton15+10)
MOVT	R0, #hi_addr(_RadioButton15+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1804 :: 		RadioButton15.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_RadioButton15+12)
MOVT	R0, #hi_addr(_RadioButton15+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1805 :: 		RadioButton15.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton15+14)
MOVT	R0, #hi_addr(_RadioButton15+14)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1806 :: 		RadioButton15.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton15+16)
MOVT	R0, #hi_addr(_RadioButton15+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1807 :: 		RadioButton15.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton15+18)
MOVT	R0, #hi_addr(_RadioButton15+18)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1808 :: 		RadioButton15.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton15+19)
MOVT	R0, #hi_addr(_RadioButton15+19)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1809 :: 		RadioButton15.Checked          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton15+20)
MOVT	R0, #hi_addr(_RadioButton15+20)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1810 :: 		RadioButton15.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton15+21)
MOVT	R0, #hi_addr(_RadioButton15+21)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1811 :: 		RadioButton15.Caption         = RadioButton15_Caption;
MOVW	R1, #lo_addr(_RadioButton15_Caption+0)
MOVT	R1, #hi_addr(_RadioButton15_Caption+0)
MOVW	R0, #lo_addr(_RadioButton15+24)
MOVT	R0, #hi_addr(_RadioButton15+24)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1812 :: 		RadioButton15.TextAlign            = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton15+28)
MOVT	R0, #hi_addr(_RadioButton15+28)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1813 :: 		RadioButton15.FontName        = Tahoma11x13_Regular;
MOVW	R1, #944
MOVT	R1, #1
MOVW	R0, #lo_addr(_RadioButton15+32)
MOVT	R0, #hi_addr(_RadioButton15+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1814 :: 		RadioButton15.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton15+48)
MOVT	R0, #hi_addr(_RadioButton15+48)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1815 :: 		RadioButton15.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton15+36)
MOVT	R0, #hi_addr(_RadioButton15+36)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1816 :: 		RadioButton15.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton15+38)
MOVT	R0, #hi_addr(_RadioButton15+38)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1817 :: 		RadioButton15.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton15+39)
MOVT	R0, #hi_addr(_RadioButton15+39)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1818 :: 		RadioButton15.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton15+40)
MOVT	R0, #hi_addr(_RadioButton15+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1819 :: 		RadioButton15.Gradient_End_Color      = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton15+42)
MOVT	R0, #hi_addr(_RadioButton15+42)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1820 :: 		RadioButton15.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton15+44)
MOVT	R0, #hi_addr(_RadioButton15+44)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1821 :: 		RadioButton15.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton15+50)
MOVT	R0, #hi_addr(_RadioButton15+50)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1822 :: 		RadioButton15.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_RadioButton15+46)
MOVT	R0, #hi_addr(_RadioButton15+46)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1823 :: 		RadioButton15.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton15+52)
MOVT	R0, #hi_addr(_RadioButton15+52)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1824 :: 		RadioButton15.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton15+56)
MOVT	R0, #hi_addr(_RadioButton15+56)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1825 :: 		RadioButton15.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton15+60)
MOVT	R0, #hi_addr(_RadioButton15+60)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1826 :: 		RadioButton15.OnPressPtr      = QR2_50;
MOVW	R1, #lo_addr(_QR2_50+0)
MOVT	R1, #hi_addr(_QR2_50+0)
MOVW	R0, #lo_addr(_RadioButton15+64)
MOVT	R0, #hi_addr(_RadioButton15+64)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1828 :: 		RadioButton16.OwnerScreen     = &Screen14;
MOVW	R1, #lo_addr(_Screen14+0)
MOVT	R1, #hi_addr(_Screen14+0)
MOVW	R0, #lo_addr(_RadioButton16+0)
MOVT	R0, #hi_addr(_RadioButton16+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1829 :: 		RadioButton16.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_RadioButton16+4)
MOVT	R0, #hi_addr(_RadioButton16+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1830 :: 		RadioButton16.Left            = 29;
MOVS	R1, #29
MOVW	R0, #lo_addr(_RadioButton16+6)
MOVT	R0, #hi_addr(_RadioButton16+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1831 :: 		RadioButton16.Top             = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_RadioButton16+8)
MOVT	R0, #hi_addr(_RadioButton16+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1832 :: 		RadioButton16.Width           = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_RadioButton16+10)
MOVT	R0, #hi_addr(_RadioButton16+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1833 :: 		RadioButton16.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_RadioButton16+12)
MOVT	R0, #hi_addr(_RadioButton16+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1834 :: 		RadioButton16.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton16+14)
MOVT	R0, #hi_addr(_RadioButton16+14)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1835 :: 		RadioButton16.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton16+16)
MOVT	R0, #hi_addr(_RadioButton16+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1836 :: 		RadioButton16.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton16+18)
MOVT	R0, #hi_addr(_RadioButton16+18)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1837 :: 		RadioButton16.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton16+19)
MOVT	R0, #hi_addr(_RadioButton16+19)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1838 :: 		RadioButton16.Checked          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton16+20)
MOVT	R0, #hi_addr(_RadioButton16+20)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1839 :: 		RadioButton16.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton16+21)
MOVT	R0, #hi_addr(_RadioButton16+21)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1840 :: 		RadioButton16.Caption         = RadioButton16_Caption;
MOVW	R1, #lo_addr(_RadioButton16_Caption+0)
MOVT	R1, #hi_addr(_RadioButton16_Caption+0)
MOVW	R0, #lo_addr(_RadioButton16+24)
MOVT	R0, #hi_addr(_RadioButton16+24)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1841 :: 		RadioButton16.TextAlign            = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton16+28)
MOVT	R0, #hi_addr(_RadioButton16+28)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1842 :: 		RadioButton16.FontName        = Tahoma11x13_Regular;
MOVW	R1, #944
MOVT	R1, #1
MOVW	R0, #lo_addr(_RadioButton16+32)
MOVT	R0, #hi_addr(_RadioButton16+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1843 :: 		RadioButton16.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton16+48)
MOVT	R0, #hi_addr(_RadioButton16+48)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1844 :: 		RadioButton16.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton16+36)
MOVT	R0, #hi_addr(_RadioButton16+36)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1845 :: 		RadioButton16.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton16+38)
MOVT	R0, #hi_addr(_RadioButton16+38)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1846 :: 		RadioButton16.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton16+39)
MOVT	R0, #hi_addr(_RadioButton16+39)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1847 :: 		RadioButton16.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton16+40)
MOVT	R0, #hi_addr(_RadioButton16+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1848 :: 		RadioButton16.Gradient_End_Color      = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton16+42)
MOVT	R0, #hi_addr(_RadioButton16+42)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1849 :: 		RadioButton16.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton16+44)
MOVT	R0, #hi_addr(_RadioButton16+44)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1850 :: 		RadioButton16.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton16+50)
MOVT	R0, #hi_addr(_RadioButton16+50)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1851 :: 		RadioButton16.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_RadioButton16+46)
MOVT	R0, #hi_addr(_RadioButton16+46)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1852 :: 		RadioButton16.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton16+52)
MOVT	R0, #hi_addr(_RadioButton16+52)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1853 :: 		RadioButton16.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton16+56)
MOVT	R0, #hi_addr(_RadioButton16+56)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1854 :: 		RadioButton16.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton16+60)
MOVT	R0, #hi_addr(_RadioButton16+60)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1855 :: 		RadioButton16.OnPressPtr      = QR2_75;
MOVW	R1, #lo_addr(_QR2_75+0)
MOVT	R1, #hi_addr(_QR2_75+0)
MOVW	R0, #lo_addr(_RadioButton16+64)
MOVT	R0, #hi_addr(_RadioButton16+64)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1857 :: 		RadioButton17.OwnerScreen     = &Screen14;
MOVW	R1, #lo_addr(_Screen14+0)
MOVT	R1, #hi_addr(_Screen14+0)
MOVW	R0, #lo_addr(_RadioButton17+0)
MOVT	R0, #hi_addr(_RadioButton17+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1858 :: 		RadioButton17.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_RadioButton17+4)
MOVT	R0, #hi_addr(_RadioButton17+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1859 :: 		RadioButton17.Left            = 176;
MOVS	R1, #176
MOVW	R0, #lo_addr(_RadioButton17+6)
MOVT	R0, #hi_addr(_RadioButton17+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1860 :: 		RadioButton17.Top             = 252;
MOVS	R1, #252
MOVW	R0, #lo_addr(_RadioButton17+8)
MOVT	R0, #hi_addr(_RadioButton17+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1861 :: 		RadioButton17.Width           = 39;
MOVS	R1, #39
MOVW	R0, #lo_addr(_RadioButton17+10)
MOVT	R0, #hi_addr(_RadioButton17+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1862 :: 		RadioButton17.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_RadioButton17+12)
MOVT	R0, #hi_addr(_RadioButton17+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1863 :: 		RadioButton17.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton17+14)
MOVT	R0, #hi_addr(_RadioButton17+14)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1864 :: 		RadioButton17.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton17+16)
MOVT	R0, #hi_addr(_RadioButton17+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1865 :: 		RadioButton17.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton17+18)
MOVT	R0, #hi_addr(_RadioButton17+18)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1866 :: 		RadioButton17.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton17+19)
MOVT	R0, #hi_addr(_RadioButton17+19)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1867 :: 		RadioButton17.Checked          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton17+20)
MOVT	R0, #hi_addr(_RadioButton17+20)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1868 :: 		RadioButton17.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton17+21)
MOVT	R0, #hi_addr(_RadioButton17+21)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1869 :: 		RadioButton17.Caption         = RadioButton17_Caption;
MOVW	R1, #lo_addr(_RadioButton17_Caption+0)
MOVT	R1, #hi_addr(_RadioButton17_Caption+0)
MOVW	R0, #lo_addr(_RadioButton17+24)
MOVT	R0, #hi_addr(_RadioButton17+24)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1870 :: 		RadioButton17.TextAlign            = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton17+28)
MOVT	R0, #hi_addr(_RadioButton17+28)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1871 :: 		RadioButton17.FontName        = Tahoma11x13_Regular;
MOVW	R1, #944
MOVT	R1, #1
MOVW	R0, #lo_addr(_RadioButton17+32)
MOVT	R0, #hi_addr(_RadioButton17+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1872 :: 		RadioButton17.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton17+48)
MOVT	R0, #hi_addr(_RadioButton17+48)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1873 :: 		RadioButton17.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton17+36)
MOVT	R0, #hi_addr(_RadioButton17+36)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1874 :: 		RadioButton17.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton17+38)
MOVT	R0, #hi_addr(_RadioButton17+38)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1875 :: 		RadioButton17.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton17+39)
MOVT	R0, #hi_addr(_RadioButton17+39)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1876 :: 		RadioButton17.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton17+40)
MOVT	R0, #hi_addr(_RadioButton17+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1877 :: 		RadioButton17.Gradient_End_Color      = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton17+42)
MOVT	R0, #hi_addr(_RadioButton17+42)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1878 :: 		RadioButton17.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton17+44)
MOVT	R0, #hi_addr(_RadioButton17+44)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1879 :: 		RadioButton17.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton17+50)
MOVT	R0, #hi_addr(_RadioButton17+50)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1880 :: 		RadioButton17.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_RadioButton17+46)
MOVT	R0, #hi_addr(_RadioButton17+46)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1881 :: 		RadioButton17.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton17+52)
MOVT	R0, #hi_addr(_RadioButton17+52)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1882 :: 		RadioButton17.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton17+56)
MOVT	R0, #hi_addr(_RadioButton17+56)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1883 :: 		RadioButton17.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton17+60)
MOVT	R0, #hi_addr(_RadioButton17+60)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1884 :: 		RadioButton17.OnPressPtr      = QR2_100;
MOVW	R1, #lo_addr(_QR2_100+0)
MOVT	R1, #hi_addr(_QR2_100+0)
MOVW	R0, #lo_addr(_RadioButton17+64)
MOVT	R0, #hi_addr(_RadioButton17+64)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1886 :: 		Label26.OwnerScreen     = &Screen15;
MOVW	R1, #lo_addr(_Screen15+0)
MOVT	R1, #hi_addr(_Screen15+0)
MOVW	R0, #lo_addr(_Label26+0)
MOVT	R0, #hi_addr(_Label26+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1887 :: 		Label26.Order          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label26+4)
MOVT	R0, #hi_addr(_Label26+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1888 :: 		Label26.Left           = 86;
MOVS	R1, #86
MOVW	R0, #lo_addr(_Label26+6)
MOVT	R0, #hi_addr(_Label26+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1889 :: 		Label26.Top            = 35;
MOVS	R1, #35
MOVW	R0, #lo_addr(_Label26+8)
MOVT	R0, #hi_addr(_Label26+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1890 :: 		Label26.Width          = 69;
MOVS	R1, #69
MOVW	R0, #lo_addr(_Label26+10)
MOVT	R0, #hi_addr(_Label26+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1891 :: 		Label26.Height         = 39;
MOVS	R1, #39
MOVW	R0, #lo_addr(_Label26+12)
MOVT	R0, #hi_addr(_Label26+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1892 :: 		Label26.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label26+26)
MOVT	R0, #hi_addr(_Label26+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1893 :: 		Label26.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label26+27)
MOVT	R0, #hi_addr(_Label26+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1894 :: 		Label26.Caption        = Label26_Caption;
MOVW	R1, #lo_addr(_Label26_Caption+0)
MOVT	R1, #hi_addr(_Label26_Caption+0)
MOVW	R0, #lo_addr(_Label26+16)
MOVT	R0, #hi_addr(_Label26+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1895 :: 		Label26.FontName       = Tahoma28x35_Regular;
MOVW	R1, #58773
MOVW	R0, #lo_addr(_Label26+20)
MOVT	R0, #hi_addr(_Label26+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1896 :: 		Label26.Font_Color     = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label26+24)
MOVT	R0, #hi_addr(_Label26+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1897 :: 		Label26.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label26+28)
MOVT	R0, #hi_addr(_Label26+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1898 :: 		Label26.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label26+32)
MOVT	R0, #hi_addr(_Label26+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1899 :: 		Label26.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label26+36)
MOVT	R0, #hi_addr(_Label26+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1900 :: 		Label26.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label26+40)
MOVT	R0, #hi_addr(_Label26+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1902 :: 		Label27.OwnerScreen     = &Screen15;
MOVW	R1, #lo_addr(_Screen15+0)
MOVT	R1, #hi_addr(_Screen15+0)
MOVW	R0, #lo_addr(_Label27+0)
MOVT	R0, #hi_addr(_Label27+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1903 :: 		Label27.Order          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label27+4)
MOVT	R0, #hi_addr(_Label27+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1904 :: 		Label27.Left           = 47;
MOVS	R1, #47
MOVW	R0, #lo_addr(_Label27+6)
MOVT	R0, #hi_addr(_Label27+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1905 :: 		Label27.Top            = 85;
MOVS	R1, #85
MOVW	R0, #lo_addr(_Label27+8)
MOVT	R0, #hi_addr(_Label27+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1906 :: 		Label27.Width          = 136;
MOVS	R1, #136
MOVW	R0, #lo_addr(_Label27+10)
MOVT	R0, #hi_addr(_Label27+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1907 :: 		Label27.Height         = 39;
MOVS	R1, #39
MOVW	R0, #lo_addr(_Label27+12)
MOVT	R0, #hi_addr(_Label27+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1908 :: 		Label27.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label27+26)
MOVT	R0, #hi_addr(_Label27+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1909 :: 		Label27.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label27+27)
MOVT	R0, #hi_addr(_Label27+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1910 :: 		Label27.Caption        = Label27_Caption;
MOVW	R1, #lo_addr(_Label27_Caption+0)
MOVT	R1, #hi_addr(_Label27_Caption+0)
MOVW	R0, #lo_addr(_Label27+16)
MOVT	R0, #hi_addr(_Label27+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1911 :: 		Label27.FontName       = Tahoma28x35_Regular;
MOVW	R1, #58773
MOVW	R0, #lo_addr(_Label27+20)
MOVT	R0, #hi_addr(_Label27+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1912 :: 		Label27.Font_Color     = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label27+24)
MOVT	R0, #hi_addr(_Label27+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1913 :: 		Label27.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label27+28)
MOVT	R0, #hi_addr(_Label27+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1914 :: 		Label27.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label27+32)
MOVT	R0, #hi_addr(_Label27+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1915 :: 		Label27.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label27+36)
MOVT	R0, #hi_addr(_Label27+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1916 :: 		Label27.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label27+40)
MOVT	R0, #hi_addr(_Label27+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1918 :: 		Label28.OwnerScreen     = &Screen15;
MOVW	R1, #lo_addr(_Screen15+0)
MOVT	R1, #hi_addr(_Screen15+0)
MOVW	R0, #lo_addr(_Label28+0)
MOVT	R0, #hi_addr(_Label28+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1919 :: 		Label28.Order          = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label28+4)
MOVT	R0, #hi_addr(_Label28+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1920 :: 		Label28.Left           = 63;
MOVS	R1, #63
MOVW	R0, #lo_addr(_Label28+6)
MOVT	R0, #hi_addr(_Label28+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1921 :: 		Label28.Top            = 136;
MOVS	R1, #136
MOVW	R0, #lo_addr(_Label28+8)
MOVT	R0, #hi_addr(_Label28+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1922 :: 		Label28.Width          = 102;
MOVS	R1, #102
MOVW	R0, #lo_addr(_Label28+10)
MOVT	R0, #hi_addr(_Label28+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1923 :: 		Label28.Height         = 39;
MOVS	R1, #39
MOVW	R0, #lo_addr(_Label28+12)
MOVT	R0, #hi_addr(_Label28+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1924 :: 		Label28.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label28+26)
MOVT	R0, #hi_addr(_Label28+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1925 :: 		Label28.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label28+27)
MOVT	R0, #hi_addr(_Label28+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1926 :: 		Label28.Caption        = Label28_Caption;
MOVW	R1, #lo_addr(_Label28_Caption+0)
MOVT	R1, #hi_addr(_Label28_Caption+0)
MOVW	R0, #lo_addr(_Label28+16)
MOVT	R0, #hi_addr(_Label28+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1927 :: 		Label28.FontName       = Tahoma28x35_Regular;
MOVW	R1, #58773
MOVW	R0, #lo_addr(_Label28+20)
MOVT	R0, #hi_addr(_Label28+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1928 :: 		Label28.Font_Color     = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label28+24)
MOVT	R0, #hi_addr(_Label28+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1929 :: 		Label28.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label28+28)
MOVT	R0, #hi_addr(_Label28+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1930 :: 		Label28.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label28+32)
MOVT	R0, #hi_addr(_Label28+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1931 :: 		Label28.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label28+36)
MOVT	R0, #hi_addr(_Label28+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1932 :: 		Label28.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label28+40)
MOVT	R0, #hi_addr(_Label28+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1934 :: 		CircleButton4.OwnerScreen     = &Screen15;
MOVW	R1, #lo_addr(_Screen15+0)
MOVT	R1, #hi_addr(_Screen15+0)
MOVW	R0, #lo_addr(_CircleButton4+0)
MOVT	R0, #hi_addr(_CircleButton4+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1935 :: 		CircleButton4.Order          = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_CircleButton4+4)
MOVT	R0, #hi_addr(_CircleButton4+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1936 :: 		CircleButton4.Left           = 74;
MOVS	R1, #74
MOVW	R0, #lo_addr(_CircleButton4+6)
MOVT	R0, #hi_addr(_CircleButton4+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1937 :: 		CircleButton4.Top            = 190;
MOVS	R1, #190
MOVW	R0, #lo_addr(_CircleButton4+8)
MOVT	R0, #hi_addr(_CircleButton4+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1938 :: 		CircleButton4.Radius         = 41;
MOVS	R1, #41
MOVW	R0, #lo_addr(_CircleButton4+10)
MOVT	R0, #hi_addr(_CircleButton4+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1939 :: 		CircleButton4.Pen_Width      = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton4+12)
MOVT	R0, #hi_addr(_CircleButton4+12)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1940 :: 		CircleButton4.Pen_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton4+14)
MOVT	R0, #hi_addr(_CircleButton4+14)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1941 :: 		CircleButton4.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton4+16)
MOVT	R0, #hi_addr(_CircleButton4+16)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1942 :: 		CircleButton4.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton4+17)
MOVT	R0, #hi_addr(_CircleButton4+17)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1943 :: 		CircleButton4.Transparent    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton4+18)
MOVT	R0, #hi_addr(_CircleButton4+18)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1944 :: 		CircleButton4.Caption        = CircleButton4_Caption;
MOVW	R1, #lo_addr(_CircleButton4_Caption+0)
MOVT	R1, #hi_addr(_CircleButton4_Caption+0)
MOVW	R0, #lo_addr(_CircleButton4+20)
MOVT	R0, #hi_addr(_CircleButton4+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1945 :: 		CircleButton4.TextAlign             = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton4+24)
MOVT	R0, #hi_addr(_CircleButton4+24)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1946 :: 		CircleButton4.FontName       = Tahoma16x19_Regular;
MOVW	R1, #34092
MOVW	R0, #lo_addr(_CircleButton4+28)
MOVT	R0, #hi_addr(_CircleButton4+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1947 :: 		CircleButton4.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton4+42)
MOVT	R0, #hi_addr(_CircleButton4+42)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1948 :: 		CircleButton4.Font_Color     = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton4+32)
MOVT	R0, #hi_addr(_CircleButton4+32)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1949 :: 		CircleButton4.Gradient       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton4+34)
MOVT	R0, #hi_addr(_CircleButton4+34)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1950 :: 		CircleButton4.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton4+35)
MOVT	R0, #hi_addr(_CircleButton4+35)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1951 :: 		CircleButton4.Gradient_Start_Color    = 0x0408;
MOVW	R1, #1032
MOVW	R0, #lo_addr(_CircleButton4+36)
MOVT	R0, #hi_addr(_CircleButton4+36)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1952 :: 		CircleButton4.Gradient_End_Color      = 0xFC1F;
MOVW	R1, #64543
MOVW	R0, #lo_addr(_CircleButton4+38)
MOVT	R0, #hi_addr(_CircleButton4+38)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1953 :: 		CircleButton4.Color          = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CircleButton4+40)
MOVT	R0, #hi_addr(_CircleButton4+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1954 :: 		CircleButton4.Press_Color    = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_CircleButton4+44)
MOVT	R0, #hi_addr(_CircleButton4+44)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1955 :: 		CircleButton4.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton4+48)
MOVT	R0, #hi_addr(_CircleButton4+48)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1956 :: 		CircleButton4.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton4+52)
MOVT	R0, #hi_addr(_CircleButton4+52)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1957 :: 		CircleButton4.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton4+56)
MOVT	R0, #hi_addr(_CircleButton4+56)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1958 :: 		CircleButton4.OnPressPtr      = FLDA_CONTINUE;
MOVW	R1, #lo_addr(_FLDA_CONTINUE+0)
MOVT	R1, #hi_addr(_FLDA_CONTINUE+0)
MOVW	R0, #lo_addr(_CircleButton4+60)
MOVT	R0, #hi_addr(_CircleButton4+60)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1960 :: 		Label29.OwnerScreen     = &Screen16;
MOVW	R1, #lo_addr(_Screen16+0)
MOVT	R1, #hi_addr(_Screen16+0)
MOVW	R0, #lo_addr(_Label29+0)
MOVT	R0, #hi_addr(_Label29+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1961 :: 		Label29.Order          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label29+4)
MOVT	R0, #hi_addr(_Label29+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1962 :: 		Label29.Left           = 63;
MOVS	R1, #63
MOVW	R0, #lo_addr(_Label29+6)
MOVT	R0, #hi_addr(_Label29+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1963 :: 		Label29.Top            = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Label29+8)
MOVT	R0, #hi_addr(_Label29+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1964 :: 		Label29.Width          = 104;
MOVS	R1, #104
MOVW	R0, #lo_addr(_Label29+10)
MOVT	R0, #hi_addr(_Label29+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1965 :: 		Label29.Height         = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label29+12)
MOVT	R0, #hi_addr(_Label29+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1966 :: 		Label29.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label29+26)
MOVT	R0, #hi_addr(_Label29+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1967 :: 		Label29.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label29+27)
MOVT	R0, #hi_addr(_Label29+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1968 :: 		Label29.Caption        = Label29_Caption;
MOVW	R1, #lo_addr(_Label29_Caption+0)
MOVT	R1, #hi_addr(_Label29_Caption+0)
MOVW	R0, #lo_addr(_Label29+16)
MOVT	R0, #hi_addr(_Label29+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1969 :: 		Label29.FontName       = Arial13x16_Bold;
MOVW	R1, #2666
MOVW	R0, #lo_addr(_Label29+20)
MOVT	R0, #hi_addr(_Label29+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1970 :: 		Label29.Font_Color     = 0xFFE0;
MOVW	R1, #65504
MOVW	R0, #lo_addr(_Label29+24)
MOVT	R0, #hi_addr(_Label29+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1971 :: 		Label29.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label29+28)
MOVT	R0, #hi_addr(_Label29+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1972 :: 		Label29.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label29+32)
MOVT	R0, #hi_addr(_Label29+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1973 :: 		Label29.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label29+36)
MOVT	R0, #hi_addr(_Label29+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1974 :: 		Label29.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label29+40)
MOVT	R0, #hi_addr(_Label29+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1976 :: 		Label30.OwnerScreen     = &Screen16;
MOVW	R1, #lo_addr(_Screen16+0)
MOVT	R1, #hi_addr(_Screen16+0)
MOVW	R0, #lo_addr(_Label30+0)
MOVT	R0, #hi_addr(_Label30+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1977 :: 		Label30.Order          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label30+4)
MOVT	R0, #hi_addr(_Label30+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1978 :: 		Label30.Left           = 95;
MOVS	R1, #95
MOVW	R0, #lo_addr(_Label30+6)
MOVT	R0, #hi_addr(_Label30+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1979 :: 		Label30.Top            = 290;
MOVW	R1, #290
MOVW	R0, #lo_addr(_Label30+8)
MOVT	R0, #hi_addr(_Label30+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1980 :: 		Label30.Width          = 48;
MOVS	R1, #48
MOVW	R0, #lo_addr(_Label30+10)
MOVT	R0, #hi_addr(_Label30+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1981 :: 		Label30.Height         = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label30+12)
MOVT	R0, #hi_addr(_Label30+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1982 :: 		Label30.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label30+26)
MOVT	R0, #hi_addr(_Label30+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1983 :: 		Label30.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label30+27)
MOVT	R0, #hi_addr(_Label30+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1984 :: 		Label30.Caption        = Label30_Caption;
MOVW	R1, #lo_addr(_Label30_Caption+0)
MOVT	R1, #hi_addr(_Label30_Caption+0)
MOVW	R0, #lo_addr(_Label30+16)
MOVT	R0, #hi_addr(_Label30+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1985 :: 		Label30.FontName       = Arial13x16_Bold;
MOVW	R1, #2666
MOVW	R0, #lo_addr(_Label30+20)
MOVT	R0, #hi_addr(_Label30+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1986 :: 		Label30.Font_Color     = 0xFFE0;
MOVW	R1, #65504
MOVW	R0, #lo_addr(_Label30+24)
MOVT	R0, #hi_addr(_Label30+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1987 :: 		Label30.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label30+28)
MOVT	R0, #hi_addr(_Label30+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1988 :: 		Label30.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label30+32)
MOVT	R0, #hi_addr(_Label30+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1989 :: 		Label30.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label30+36)
MOVT	R0, #hi_addr(_Label30+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1990 :: 		Label30.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label30+40)
MOVT	R0, #hi_addr(_Label30+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1992 :: 		Label32.OwnerScreen     = &Screen17;
MOVW	R1, #lo_addr(_Screen17+0)
MOVT	R1, #hi_addr(_Screen17+0)
MOVW	R0, #lo_addr(_Label32+0)
MOVT	R0, #hi_addr(_Label32+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1993 :: 		Label32.Order          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label32+4)
MOVT	R0, #hi_addr(_Label32+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1994 :: 		Label32.Left           = 87;
MOVS	R1, #87
MOVW	R0, #lo_addr(_Label32+6)
MOVT	R0, #hi_addr(_Label32+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1995 :: 		Label32.Top            = 47;
MOVS	R1, #47
MOVW	R0, #lo_addr(_Label32+8)
MOVT	R0, #hi_addr(_Label32+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1996 :: 		Label32.Width          = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_Label32+10)
MOVT	R0, #hi_addr(_Label32+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1997 :: 		Label32.Height         = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label32+12)
MOVT	R0, #hi_addr(_Label32+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1998 :: 		Label32.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label32+26)
MOVT	R0, #hi_addr(_Label32+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,1999 :: 		Label32.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label32+27)
MOVT	R0, #hi_addr(_Label32+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2000 :: 		Label32.Caption        = Label32_Caption;
MOVW	R1, #lo_addr(_Label32_Caption+0)
MOVT	R1, #hi_addr(_Label32_Caption+0)
MOVW	R0, #lo_addr(_Label32+16)
MOVT	R0, #hi_addr(_Label32+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2001 :: 		Label32.FontName       = Tahoma23x29_Regular;
MOVW	R1, #53248
MOVW	R0, #lo_addr(_Label32+20)
MOVT	R0, #hi_addr(_Label32+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2002 :: 		Label32.Font_Color     = 0x001F;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label32+24)
MOVT	R0, #hi_addr(_Label32+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2003 :: 		Label32.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label32+28)
MOVT	R0, #hi_addr(_Label32+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2004 :: 		Label32.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label32+32)
MOVT	R0, #hi_addr(_Label32+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2005 :: 		Label32.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label32+36)
MOVT	R0, #hi_addr(_Label32+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2006 :: 		Label32.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label32+40)
MOVT	R0, #hi_addr(_Label32+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2008 :: 		Label33.OwnerScreen     = &Screen17;
MOVW	R1, #lo_addr(_Screen17+0)
MOVT	R1, #hi_addr(_Screen17+0)
MOVW	R0, #lo_addr(_Label33+0)
MOVT	R0, #hi_addr(_Label33+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2009 :: 		Label33.Order          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label33+4)
MOVT	R0, #hi_addr(_Label33+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2010 :: 		Label33.Left           = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Label33+6)
MOVT	R0, #hi_addr(_Label33+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2011 :: 		Label33.Top            = 87;
MOVS	R1, #87
MOVW	R0, #lo_addr(_Label33+8)
MOVT	R0, #hi_addr(_Label33+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2012 :: 		Label33.Width          = 206;
MOVS	R1, #206
MOVW	R0, #lo_addr(_Label33+10)
MOVT	R0, #hi_addr(_Label33+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2013 :: 		Label33.Height         = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label33+12)
MOVT	R0, #hi_addr(_Label33+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2014 :: 		Label33.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label33+26)
MOVT	R0, #hi_addr(_Label33+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2015 :: 		Label33.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label33+27)
MOVT	R0, #hi_addr(_Label33+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2016 :: 		Label33.Caption        = Label33_Caption;
MOVW	R1, #lo_addr(_Label33_Caption+0)
MOVT	R1, #hi_addr(_Label33_Caption+0)
MOVW	R0, #lo_addr(_Label33+16)
MOVT	R0, #hi_addr(_Label33+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2017 :: 		Label33.FontName       = Tahoma23x29_Regular;
MOVW	R1, #53248
MOVW	R0, #lo_addr(_Label33+20)
MOVT	R0, #hi_addr(_Label33+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2018 :: 		Label33.Font_Color     = 0x001F;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label33+24)
MOVT	R0, #hi_addr(_Label33+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2019 :: 		Label33.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label33+28)
MOVT	R0, #hi_addr(_Label33+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2020 :: 		Label33.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label33+32)
MOVT	R0, #hi_addr(_Label33+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2021 :: 		Label33.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label33+36)
MOVT	R0, #hi_addr(_Label33+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2022 :: 		Label33.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label33+40)
MOVT	R0, #hi_addr(_Label33+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2024 :: 		Label34.OwnerScreen     = &Screen17;
MOVW	R1, #lo_addr(_Screen17+0)
MOVT	R1, #hi_addr(_Screen17+0)
MOVW	R0, #lo_addr(_Label34+0)
MOVT	R0, #hi_addr(_Label34+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2025 :: 		Label34.Order          = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label34+4)
MOVT	R0, #hi_addr(_Label34+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2026 :: 		Label34.Left           = 77;
MOVS	R1, #77
MOVW	R0, #lo_addr(_Label34+6)
MOVT	R0, #hi_addr(_Label34+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2027 :: 		Label34.Top            = 130;
MOVS	R1, #130
MOVW	R0, #lo_addr(_Label34+8)
MOVT	R0, #hi_addr(_Label34+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2028 :: 		Label34.Width          = 78;
MOVS	R1, #78
MOVW	R0, #lo_addr(_Label34+10)
MOVT	R0, #hi_addr(_Label34+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2029 :: 		Label34.Height         = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label34+12)
MOVT	R0, #hi_addr(_Label34+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2030 :: 		Label34.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label34+26)
MOVT	R0, #hi_addr(_Label34+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2031 :: 		Label34.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label34+27)
MOVT	R0, #hi_addr(_Label34+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2032 :: 		Label34.Caption        = Label34_Caption;
MOVW	R1, #lo_addr(_Label34_Caption+0)
MOVT	R1, #hi_addr(_Label34_Caption+0)
MOVW	R0, #lo_addr(_Label34+16)
MOVT	R0, #hi_addr(_Label34+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2033 :: 		Label34.FontName       = Tahoma23x29_Regular;
MOVW	R1, #53248
MOVW	R0, #lo_addr(_Label34+20)
MOVT	R0, #hi_addr(_Label34+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2034 :: 		Label34.Font_Color     = 0x001F;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label34+24)
MOVT	R0, #hi_addr(_Label34+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2035 :: 		Label34.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label34+28)
MOVT	R0, #hi_addr(_Label34+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2036 :: 		Label34.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label34+32)
MOVT	R0, #hi_addr(_Label34+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2037 :: 		Label34.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label34+36)
MOVT	R0, #hi_addr(_Label34+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2038 :: 		Label34.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label34+40)
MOVT	R0, #hi_addr(_Label34+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2040 :: 		CircleButton5.OwnerScreen     = &Screen17;
MOVW	R1, #lo_addr(_Screen17+0)
MOVT	R1, #hi_addr(_Screen17+0)
MOVW	R0, #lo_addr(_CircleButton5+0)
MOVT	R0, #hi_addr(_CircleButton5+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2041 :: 		CircleButton5.Order          = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_CircleButton5+4)
MOVT	R0, #hi_addr(_CircleButton5+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2042 :: 		CircleButton5.Left           = 82;
MOVS	R1, #82
MOVW	R0, #lo_addr(_CircleButton5+6)
MOVT	R0, #hi_addr(_CircleButton5+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2043 :: 		CircleButton5.Top            = 194;
MOVS	R1, #194
MOVW	R0, #lo_addr(_CircleButton5+8)
MOVT	R0, #hi_addr(_CircleButton5+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2044 :: 		CircleButton5.Radius         = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_CircleButton5+10)
MOVT	R0, #hi_addr(_CircleButton5+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2045 :: 		CircleButton5.Pen_Width      = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton5+12)
MOVT	R0, #hi_addr(_CircleButton5+12)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2046 :: 		CircleButton5.Pen_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton5+14)
MOVT	R0, #hi_addr(_CircleButton5+14)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2047 :: 		CircleButton5.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton5+16)
MOVT	R0, #hi_addr(_CircleButton5+16)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2048 :: 		CircleButton5.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton5+17)
MOVT	R0, #hi_addr(_CircleButton5+17)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2049 :: 		CircleButton5.Transparent    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton5+18)
MOVT	R0, #hi_addr(_CircleButton5+18)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2050 :: 		CircleButton5.Caption        = CircleButton5_Caption;
MOVW	R1, #lo_addr(_CircleButton5_Caption+0)
MOVT	R1, #hi_addr(_CircleButton5_Caption+0)
MOVW	R0, #lo_addr(_CircleButton5+20)
MOVT	R0, #hi_addr(_CircleButton5+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2051 :: 		CircleButton5.TextAlign             = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton5+24)
MOVT	R0, #hi_addr(_CircleButton5+24)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2052 :: 		CircleButton5.FontName       = Tahoma19x23_Regular;
MOVW	R1, #40234
MOVW	R0, #lo_addr(_CircleButton5+28)
MOVT	R0, #hi_addr(_CircleButton5+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2053 :: 		CircleButton5.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton5+42)
MOVT	R0, #hi_addr(_CircleButton5+42)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2054 :: 		CircleButton5.Font_Color     = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton5+32)
MOVT	R0, #hi_addr(_CircleButton5+32)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2055 :: 		CircleButton5.Gradient       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton5+34)
MOVT	R0, #hi_addr(_CircleButton5+34)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2056 :: 		CircleButton5.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton5+35)
MOVT	R0, #hi_addr(_CircleButton5+35)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2057 :: 		CircleButton5.Gradient_Start_Color    = 0xFFE0;
MOVW	R1, #65504
MOVW	R0, #lo_addr(_CircleButton5+36)
MOVT	R0, #hi_addr(_CircleButton5+36)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2058 :: 		CircleButton5.Gradient_End_Color      = 0x07E8;
MOVW	R1, #2024
MOVW	R0, #lo_addr(_CircleButton5+38)
MOVT	R0, #hi_addr(_CircleButton5+38)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2059 :: 		CircleButton5.Color          = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CircleButton5+40)
MOVT	R0, #hi_addr(_CircleButton5+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2060 :: 		CircleButton5.Press_Color    = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_CircleButton5+44)
MOVT	R0, #hi_addr(_CircleButton5+44)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2061 :: 		CircleButton5.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton5+48)
MOVT	R0, #hi_addr(_CircleButton5+48)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2062 :: 		CircleButton5.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton5+52)
MOVT	R0, #hi_addr(_CircleButton5+52)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2063 :: 		CircleButton5.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton5+56)
MOVT	R0, #hi_addr(_CircleButton5+56)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2064 :: 		CircleButton5.OnPressPtr      = FLDA_TEST;
MOVW	R1, #lo_addr(_FLDA_TEST+0)
MOVT	R1, #hi_addr(_FLDA_TEST+0)
MOVW	R0, #lo_addr(_CircleButton5+60)
MOVT	R0, #hi_addr(_CircleButton5+60)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2066 :: 		Label35.OwnerScreen     = &Screen18;
MOVW	R1, #lo_addr(_Screen18+0)
MOVT	R1, #hi_addr(_Screen18+0)
MOVW	R0, #lo_addr(_Label35+0)
MOVT	R0, #hi_addr(_Label35+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2067 :: 		Label35.Order          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label35+4)
MOVT	R0, #hi_addr(_Label35+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2068 :: 		Label35.Left           = 81;
MOVS	R1, #81
MOVW	R0, #lo_addr(_Label35+6)
MOVT	R0, #hi_addr(_Label35+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2069 :: 		Label35.Top            = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_Label35+8)
MOVT	R0, #hi_addr(_Label35+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2070 :: 		Label35.Width          = 66;
MOVS	R1, #66
MOVW	R0, #lo_addr(_Label35+10)
MOVT	R0, #hi_addr(_Label35+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2071 :: 		Label35.Height         = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label35+12)
MOVT	R0, #hi_addr(_Label35+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2072 :: 		Label35.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label35+26)
MOVT	R0, #hi_addr(_Label35+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2073 :: 		Label35.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label35+27)
MOVT	R0, #hi_addr(_Label35+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2074 :: 		Label35.Caption        = Label35_Caption;
MOVW	R1, #lo_addr(_Label35_Caption+0)
MOVT	R1, #hi_addr(_Label35_Caption+0)
MOVW	R0, #lo_addr(_Label35+16)
MOVT	R0, #hi_addr(_Label35+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2075 :: 		Label35.FontName       = Tahoma12x16_Regular;
MOVW	R1, #29900
MOVW	R0, #lo_addr(_Label35+20)
MOVT	R0, #hi_addr(_Label35+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2076 :: 		Label35.Font_Color     = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label35+24)
MOVT	R0, #hi_addr(_Label35+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2077 :: 		Label35.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label35+28)
MOVT	R0, #hi_addr(_Label35+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2078 :: 		Label35.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label35+32)
MOVT	R0, #hi_addr(_Label35+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2079 :: 		Label35.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label35+36)
MOVT	R0, #hi_addr(_Label35+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2080 :: 		Label35.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label35+40)
MOVT	R0, #hi_addr(_Label35+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2082 :: 		Label36.OwnerScreen     = &Screen19;
MOVW	R1, #lo_addr(_Screen19+0)
MOVT	R1, #hi_addr(_Screen19+0)
MOVW	R0, #lo_addr(_Label36+0)
MOVT	R0, #hi_addr(_Label36+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2083 :: 		Label36.Order          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label36+4)
MOVT	R0, #hi_addr(_Label36+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2084 :: 		Label36.Left           = 66;
MOVS	R1, #66
MOVW	R0, #lo_addr(_Label36+6)
MOVT	R0, #hi_addr(_Label36+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2085 :: 		Label36.Top            = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label36+8)
MOVT	R0, #hi_addr(_Label36+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2086 :: 		Label36.Width          = 109;
MOVS	R1, #109
MOVW	R0, #lo_addr(_Label36+10)
MOVT	R0, #hi_addr(_Label36+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2087 :: 		Label36.Height         = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Label36+12)
MOVT	R0, #hi_addr(_Label36+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2088 :: 		Label36.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label36+26)
MOVT	R0, #hi_addr(_Label36+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2089 :: 		Label36.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label36+27)
MOVT	R0, #hi_addr(_Label36+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2090 :: 		Label36.Caption        = Label36_Caption;
MOVW	R1, #lo_addr(_Label36_Caption+0)
MOVT	R1, #hi_addr(_Label36_Caption+0)
MOVW	R0, #lo_addr(_Label36+16)
MOVT	R0, #hi_addr(_Label36+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2091 :: 		Label36.FontName       = Tahoma16x19_Regular;
MOVW	R1, #34092
MOVW	R0, #lo_addr(_Label36+20)
MOVT	R0, #hi_addr(_Label36+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2092 :: 		Label36.Font_Color     = 0xFFE6;
MOVW	R1, #65510
MOVW	R0, #lo_addr(_Label36+24)
MOVT	R0, #hi_addr(_Label36+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2093 :: 		Label36.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label36+28)
MOVT	R0, #hi_addr(_Label36+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2094 :: 		Label36.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label36+32)
MOVT	R0, #hi_addr(_Label36+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2095 :: 		Label36.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label36+36)
MOVT	R0, #hi_addr(_Label36+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2096 :: 		Label36.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label36+40)
MOVT	R0, #hi_addr(_Label36+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2098 :: 		ProgressBar2.OwnerScreen     = &Screen19;
MOVW	R1, #lo_addr(_Screen19+0)
MOVT	R1, #hi_addr(_Screen19+0)
MOVW	R0, #lo_addr(_ProgressBar2+0)
MOVT	R0, #hi_addr(_ProgressBar2+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2099 :: 		ProgressBar2.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar2+4)
MOVT	R0, #hi_addr(_ProgressBar2+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2100 :: 		ProgressBar2.Left            = 64;
MOVS	R1, #64
MOVW	R0, #lo_addr(_ProgressBar2+6)
MOVT	R0, #hi_addr(_ProgressBar2+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2101 :: 		ProgressBar2.Top             = 176;
MOVS	R1, #176
MOVW	R0, #lo_addr(_ProgressBar2+8)
MOVT	R0, #hi_addr(_ProgressBar2+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2102 :: 		ProgressBar2.Width           = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_ProgressBar2+10)
MOVT	R0, #hi_addr(_ProgressBar2+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2103 :: 		ProgressBar2.Height          = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_ProgressBar2+12)
MOVT	R0, #hi_addr(_ProgressBar2+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2104 :: 		ProgressBar2.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar2+14)
MOVT	R0, #hi_addr(_ProgressBar2+14)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2105 :: 		ProgressBar2.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar2+16)
MOVT	R0, #hi_addr(_ProgressBar2+16)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2106 :: 		ProgressBar2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar2+18)
MOVT	R0, #hi_addr(_ProgressBar2+18)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2107 :: 		ProgressBar2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar2+19)
MOVT	R0, #hi_addr(_ProgressBar2+19)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2108 :: 		ProgressBar2.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar2+20)
MOVT	R0, #hi_addr(_ProgressBar2+20)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2109 :: 		ProgressBar2.Caption         = ProgressBar2_Caption;
MOVW	R1, #lo_addr(_ProgressBar2_Caption+0)
MOVT	R1, #hi_addr(_ProgressBar2_Caption+0)
MOVW	R0, #lo_addr(_ProgressBar2+24)
MOVT	R0, #hi_addr(_ProgressBar2+24)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2110 :: 		ProgressBar2.FontName        = Tahoma11x13_Regular;
MOVW	R1, #944
MOVT	R1, #1
MOVW	R0, #lo_addr(_ProgressBar2+28)
MOVT	R0, #hi_addr(_ProgressBar2+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2111 :: 		ProgressBar2.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar2+32)
MOVT	R0, #hi_addr(_ProgressBar2+32)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2112 :: 		ProgressBar2.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar2+34)
MOVT	R0, #hi_addr(_ProgressBar2+34)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2113 :: 		ProgressBar2.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar2+35)
MOVT	R0, #hi_addr(_ProgressBar2+35)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2114 :: 		ProgressBar2.Gradient_Start_Color    = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ProgressBar2+36)
MOVT	R0, #hi_addr(_ProgressBar2+36)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2115 :: 		ProgressBar2.Gradient_End_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ProgressBar2+38)
MOVT	R0, #hi_addr(_ProgressBar2+38)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2116 :: 		ProgressBar2.Color           = 0xA65E;
MOVW	R1, #42590
MOVW	R0, #lo_addr(_ProgressBar2+40)
MOVT	R0, #hi_addr(_ProgressBar2+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2117 :: 		ProgressBar2.Background_Color = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_ProgressBar2+42)
MOVT	R0, #hi_addr(_ProgressBar2+42)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2118 :: 		ProgressBar2.Min             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar2+44)
MOVT	R0, #hi_addr(_ProgressBar2+44)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2119 :: 		ProgressBar2.Max             = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_ProgressBar2+46)
MOVT	R0, #hi_addr(_ProgressBar2+46)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2120 :: 		ProgressBar2.Position        = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_ProgressBar2+48)
MOVT	R0, #hi_addr(_ProgressBar2+48)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2121 :: 		ProgressBar2.Show_Position   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar2+50)
MOVT	R0, #hi_addr(_ProgressBar2+50)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2122 :: 		ProgressBar2.Show_Percentage = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar2+51)
MOVT	R0, #hi_addr(_ProgressBar2+51)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2123 :: 		ProgressBar2.Smooth          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar2+52)
MOVT	R0, #hi_addr(_ProgressBar2+52)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2124 :: 		ProgressBar2.Rounded         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar2+53)
MOVT	R0, #hi_addr(_ProgressBar2+53)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2125 :: 		ProgressBar2.Corner_Radius      = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ProgressBar2+54)
MOVT	R0, #hi_addr(_ProgressBar2+54)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2127 :: 		Label37.OwnerScreen     = &Screen19;
MOVW	R1, #lo_addr(_Screen19+0)
MOVT	R1, #hi_addr(_Screen19+0)
MOVW	R0, #lo_addr(_Label37+0)
MOVT	R0, #hi_addr(_Label37+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2128 :: 		Label37.Order          = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label37+4)
MOVT	R0, #hi_addr(_Label37+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2129 :: 		Label37.Left           = 91;
MOVS	R1, #91
MOVW	R0, #lo_addr(_Label37+6)
MOVT	R0, #hi_addr(_Label37+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2130 :: 		Label37.Top            = 149;
MOVS	R1, #149
MOVW	R0, #lo_addr(_Label37+8)
MOVT	R0, #hi_addr(_Label37+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2131 :: 		Label37.Width          = 55;
MOVS	R1, #55
MOVW	R0, #lo_addr(_Label37+10)
MOVT	R0, #hi_addr(_Label37+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2132 :: 		Label37.Height         = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label37+12)
MOVT	R0, #hi_addr(_Label37+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2133 :: 		Label37.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label37+26)
MOVT	R0, #hi_addr(_Label37+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2134 :: 		Label37.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label37+27)
MOVT	R0, #hi_addr(_Label37+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2135 :: 		Label37.Caption        = Label37_Caption;
MOVW	R1, #lo_addr(_Label37_Caption+0)
MOVT	R1, #hi_addr(_Label37_Caption+0)
MOVW	R0, #lo_addr(_Label37+16)
MOVT	R0, #hi_addr(_Label37+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2136 :: 		Label37.FontName       = Tahoma12x16_Regular;
MOVW	R1, #29900
MOVW	R0, #lo_addr(_Label37+20)
MOVT	R0, #hi_addr(_Label37+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2137 :: 		Label37.Font_Color     = 0xFFE6;
MOVW	R1, #65510
MOVW	R0, #lo_addr(_Label37+24)
MOVT	R0, #hi_addr(_Label37+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2138 :: 		Label37.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label37+28)
MOVT	R0, #hi_addr(_Label37+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2139 :: 		Label37.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label37+32)
MOVT	R0, #hi_addr(_Label37+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2140 :: 		Label37.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label37+36)
MOVT	R0, #hi_addr(_Label37+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2141 :: 		Label37.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label37+40)
MOVT	R0, #hi_addr(_Label37+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2143 :: 		CircleButton6.OwnerScreen     = &Screen19;
MOVW	R1, #lo_addr(_Screen19+0)
MOVT	R1, #hi_addr(_Screen19+0)
MOVW	R0, #lo_addr(_CircleButton6+0)
MOVT	R0, #hi_addr(_CircleButton6+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2144 :: 		CircleButton6.Order          = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_CircleButton6+4)
MOVT	R0, #hi_addr(_CircleButton6+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2145 :: 		CircleButton6.Left           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_CircleButton6+6)
MOVT	R0, #hi_addr(_CircleButton6+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2146 :: 		CircleButton6.Top            = 218;
MOVS	R1, #218
MOVW	R0, #lo_addr(_CircleButton6+8)
MOVT	R0, #hi_addr(_CircleButton6+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2147 :: 		CircleButton6.Radius         = 33;
MOVS	R1, #33
MOVW	R0, #lo_addr(_CircleButton6+10)
MOVT	R0, #hi_addr(_CircleButton6+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2148 :: 		CircleButton6.Pen_Width      = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton6+12)
MOVT	R0, #hi_addr(_CircleButton6+12)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2149 :: 		CircleButton6.Pen_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton6+14)
MOVT	R0, #hi_addr(_CircleButton6+14)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2150 :: 		CircleButton6.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton6+16)
MOVT	R0, #hi_addr(_CircleButton6+16)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2151 :: 		CircleButton6.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton6+17)
MOVT	R0, #hi_addr(_CircleButton6+17)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2152 :: 		CircleButton6.Transparent    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton6+18)
MOVT	R0, #hi_addr(_CircleButton6+18)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2153 :: 		CircleButton6.Caption        = CircleButton6_Caption;
MOVW	R1, #lo_addr(_CircleButton6_Caption+0)
MOVT	R1, #hi_addr(_CircleButton6_Caption+0)
MOVW	R0, #lo_addr(_CircleButton6+20)
MOVT	R0, #hi_addr(_CircleButton6+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2154 :: 		CircleButton6.TextAlign             = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton6+24)
MOVT	R0, #hi_addr(_CircleButton6+24)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2155 :: 		CircleButton6.FontName       = Tahoma16x19_Regular;
MOVW	R1, #34092
MOVW	R0, #lo_addr(_CircleButton6+28)
MOVT	R0, #hi_addr(_CircleButton6+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2156 :: 		CircleButton6.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton6+42)
MOVT	R0, #hi_addr(_CircleButton6+42)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2157 :: 		CircleButton6.Font_Color     = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton6+32)
MOVT	R0, #hi_addr(_CircleButton6+32)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2158 :: 		CircleButton6.Gradient       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CircleButton6+34)
MOVT	R0, #hi_addr(_CircleButton6+34)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2159 :: 		CircleButton6.Gradient_Orientation    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton6+35)
MOVT	R0, #hi_addr(_CircleButton6+35)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2160 :: 		CircleButton6.Gradient_Start_Color    = 0xFC10;
MOVW	R1, #64528
MOVW	R0, #lo_addr(_CircleButton6+36)
MOVT	R0, #hi_addr(_CircleButton6+36)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2161 :: 		CircleButton6.Gradient_End_Color      = 0xFFE0;
MOVW	R1, #65504
MOVW	R0, #lo_addr(_CircleButton6+38)
MOVT	R0, #hi_addr(_CircleButton6+38)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2162 :: 		CircleButton6.Color          = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CircleButton6+40)
MOVT	R0, #hi_addr(_CircleButton6+40)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2163 :: 		CircleButton6.Press_Color    = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_CircleButton6+44)
MOVT	R0, #hi_addr(_CircleButton6+44)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2164 :: 		CircleButton6.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton6+48)
MOVT	R0, #hi_addr(_CircleButton6+48)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2165 :: 		CircleButton6.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton6+52)
MOVT	R0, #hi_addr(_CircleButton6+52)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2166 :: 		CircleButton6.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CircleButton6+56)
MOVT	R0, #hi_addr(_CircleButton6+56)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2167 :: 		CircleButton6.OnPressPtr      = FLDA_RESULTS_MAIN;
MOVW	R1, #lo_addr(_FLDA_RESULTS_MAIN+0)
MOVT	R1, #hi_addr(_FLDA_RESULTS_MAIN+0)
MOVW	R0, #lo_addr(_CircleButton6+60)
MOVT	R0, #hi_addr(_CircleButton6+60)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2169 :: 		Label38.OwnerScreen     = &Screen20;
MOVW	R1, #lo_addr(_Screen20+0)
MOVT	R1, #hi_addr(_Screen20+0)
MOVW	R0, #lo_addr(_Label38+0)
MOVT	R0, #hi_addr(_Label38+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2170 :: 		Label38.Order          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label38+4)
MOVT	R0, #hi_addr(_Label38+4)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2171 :: 		Label38.Left           = 45;
MOVS	R1, #45
MOVW	R0, #lo_addr(_Label38+6)
MOVT	R0, #hi_addr(_Label38+6)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2172 :: 		Label38.Top            = 43;
MOVS	R1, #43
MOVW	R0, #lo_addr(_Label38+8)
MOVT	R0, #hi_addr(_Label38+8)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2173 :: 		Label38.Width          = 150;
MOVS	R1, #150
MOVW	R0, #lo_addr(_Label38+10)
MOVT	R0, #hi_addr(_Label38+10)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2174 :: 		Label38.Height         = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Label38+12)
MOVT	R0, #hi_addr(_Label38+12)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2175 :: 		Label38.Visible        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label38+26)
MOVT	R0, #hi_addr(_Label38+26)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2176 :: 		Label38.Active         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label38+27)
MOVT	R0, #hi_addr(_Label38+27)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2177 :: 		Label38.Caption        = Label38_Caption;
MOVW	R1, #lo_addr(_Label38_Caption+0)
MOVT	R1, #hi_addr(_Label38_Caption+0)
MOVW	R0, #lo_addr(_Label38+16)
MOVT	R0, #hi_addr(_Label38+16)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2178 :: 		Label38.FontName       = Tahoma23x23_Bold;
MOVW	R1, #44283
MOVW	R0, #lo_addr(_Label38+20)
MOVT	R0, #hi_addr(_Label38+20)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2179 :: 		Label38.Font_Color     = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label38+24)
MOVT	R0, #hi_addr(_Label38+24)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2180 :: 		Label38.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label38+28)
MOVT	R0, #hi_addr(_Label38+28)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2181 :: 		Label38.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label38+32)
MOVT	R0, #hi_addr(_Label38+32)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2182 :: 		Label38.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label38+36)
MOVT	R0, #hi_addr(_Label38+36)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2183 :: 		Label38.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label38+40)
MOVT	R0, #hi_addr(_Label38+40)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2184 :: 		}
L_end_InitializeObjects:
ADD	SP, SP, #4
BX	LR
; end of PCA_FLDA_GUI_driver_InitializeObjects
PCA_FLDA_GUI_driver_IsInsideObject:
;PCA_FLDA_GUI_driver.c,2186 :: 		static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
; Top start address is: 12 (R3)
; Left start address is: 8 (R2)
; Y start address is: 4 (R1)
SUB	SP, SP, #4
; Top end address is: 12 (R3)
; Left end address is: 8 (R2)
; Y end address is: 4 (R1)
; Y start address is: 4 (R1)
; Left start address is: 8 (R2)
; Top start address is: 12 (R3)
; Width start address is: 20 (R5)
LDRH	R5, [SP, #4]
; Height start address is: 24 (R6)
LDRH	R6, [SP, #8]
;PCA_FLDA_GUI_driver.c,2187 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
CMP	R2, R0
IT	HI
BHI	L_PCA_FLDA_GUI_driver_IsInsideObject212
ADDS	R4, R2, R5
UXTH	R4, R4
; Left end address is: 8 (R2)
; Width end address is: 20 (R5)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R0
IT	CC
BCC	L_PCA_FLDA_GUI_driver_IsInsideObject211
;PCA_FLDA_GUI_driver.c,2188 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
CMP	R3, R1
IT	HI
BHI	L_PCA_FLDA_GUI_driver_IsInsideObject210
ADDS	R4, R3, R6
UXTH	R4, R4
; Top end address is: 12 (R3)
; Height end address is: 24 (R6)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R1
IT	CC
BCC	L_PCA_FLDA_GUI_driver_IsInsideObject209
; Y end address is: 4 (R1)
L_PCA_FLDA_GUI_driver_IsInsideObject208:
;PCA_FLDA_GUI_driver.c,2189 :: 		return 1;
MOVS	R0, #1
IT	AL
BAL	L_end_IsInsideObject
;PCA_FLDA_GUI_driver.c,2187 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
L_PCA_FLDA_GUI_driver_IsInsideObject212:
L_PCA_FLDA_GUI_driver_IsInsideObject211:
;PCA_FLDA_GUI_driver.c,2188 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
L_PCA_FLDA_GUI_driver_IsInsideObject210:
L_PCA_FLDA_GUI_driver_IsInsideObject209:
;PCA_FLDA_GUI_driver.c,2191 :: 		return 0;
MOVS	R0, #0
;PCA_FLDA_GUI_driver.c,2192 :: 		}
L_end_IsInsideObject:
ADD	SP, SP, #4
BX	LR
; end of PCA_FLDA_GUI_driver_IsInsideObject
_DeleteTrailingSpaces:
;PCA_FLDA_GUI_driver.c,2201 :: 		void DeleteTrailingSpaces(char* str){
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R4, R0
;PCA_FLDA_GUI_driver.c,2204 :: 		while(1) {
L_DeleteTrailingSpaces16:
;PCA_FLDA_GUI_driver.c,2205 :: 		if(str[0] == ' ') {
; str start address is: 16 (R4)
LDRB	R1, [R4, #0]
CMP	R1, #32
IT	NE
BNE	L_DeleteTrailingSpaces18
;PCA_FLDA_GUI_driver.c,2206 :: 		for(i = 0; i < strlen(str); i++) {
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
;PCA_FLDA_GUI_driver.c,2207 :: 		str[i] = str[i+1];
ADDS	R2, R4, R5
ADDS	R1, R5, #1
SXTH	R1, R1
ADDS	R1, R4, R1
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;PCA_FLDA_GUI_driver.c,2206 :: 		for(i = 0; i < strlen(str); i++) {
ADDS	R5, R5, #1
UXTB	R5, R5
;PCA_FLDA_GUI_driver.c,2208 :: 		}
; i end address is: 20 (R5)
IT	AL
BAL	L_DeleteTrailingSpaces19
L_DeleteTrailingSpaces20:
;PCA_FLDA_GUI_driver.c,2209 :: 		}
IT	AL
BAL	L_DeleteTrailingSpaces22
; str end address is: 16 (R4)
L_DeleteTrailingSpaces18:
;PCA_FLDA_GUI_driver.c,2211 :: 		break;
IT	AL
BAL	L_DeleteTrailingSpaces17
L_DeleteTrailingSpaces22:
;PCA_FLDA_GUI_driver.c,2212 :: 		}
; str start address is: 16 (R4)
; str end address is: 16 (R4)
IT	AL
BAL	L_DeleteTrailingSpaces16
L_DeleteTrailingSpaces17:
;PCA_FLDA_GUI_driver.c,2213 :: 		}
L_end_DeleteTrailingSpaces:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DeleteTrailingSpaces
_DrawRoundButton:
;PCA_FLDA_GUI_driver.c,2215 :: 		void DrawRoundButton(TButton_Round *Around_button) {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;PCA_FLDA_GUI_driver.c,2216 :: 		if (Around_button->Visible == 1) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton23
;PCA_FLDA_GUI_driver.c,2217 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton24
;PCA_FLDA_GUI_driver.c,2218 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;PCA_FLDA_GUI_driver.c,2220 :: 		Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R5, R1
;PCA_FLDA_GUI_driver.c,2219 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
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
;PCA_FLDA_GUI_driver.c,2220 :: 		Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PCA_FLDA_GUI_driver.c,2219 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;PCA_FLDA_GUI_driver.c,2221 :: 		}
IT	AL
BAL	L_DrawRoundButton25
L_DrawRoundButton24:
;PCA_FLDA_GUI_driver.c,2224 :: 		Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R5, R1
;PCA_FLDA_GUI_driver.c,2223 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
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
;PCA_FLDA_GUI_driver.c,2224 :: 		Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PCA_FLDA_GUI_driver.c,2223 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;PCA_FLDA_GUI_driver.c,2225 :: 		}
L_DrawRoundButton25:
;PCA_FLDA_GUI_driver.c,2226 :: 		TFT_Set_Pen(Around_button->Pen_Color, Around_button->Pen_Width);
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
;PCA_FLDA_GUI_driver.c,2227 :: 		if (Around_button->Height > Around_button->Width) {
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
CMP	R2, R1
IT	LS
BLS	L_DrawRoundButton26
;PCA_FLDA_GUI_driver.c,2230 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
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
;PCA_FLDA_GUI_driver.c,2229 :: 		Around_button->Left + Around_button->Width - 2,
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #2
;PCA_FLDA_GUI_driver.c,2228 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
ADDS	R2, R2, #1
ADDS	R1, R4, #1
;PCA_FLDA_GUI_driver.c,2230 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
STR	R0, [SP, #4]
;PCA_FLDA_GUI_driver.c,2228 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
UXTH	R0, R1
UXTH	R1, R2
;PCA_FLDA_GUI_driver.c,2229 :: 		Around_button->Left + Around_button->Width - 2,
UXTH	R2, R3
;PCA_FLDA_GUI_driver.c,2230 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
UXTH	R3, R5
PUSH	(R6)
BL	_TFT_Rectangle_Round_Edges+0
ADD	SP, SP, #4
LDR	R0, [SP, #4]
;PCA_FLDA_GUI_driver.c,2231 :: 		}
IT	AL
BAL	L_DrawRoundButton27
L_DrawRoundButton26:
;PCA_FLDA_GUI_driver.c,2236 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
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
;PCA_FLDA_GUI_driver.c,2235 :: 		Around_button->Left + Around_button->Width - 2,
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #2
;PCA_FLDA_GUI_driver.c,2234 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
ADDS	R2, R2, #1
ADDS	R1, R4, #1
;PCA_FLDA_GUI_driver.c,2236 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
STR	R0, [SP, #4]
;PCA_FLDA_GUI_driver.c,2234 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
UXTH	R0, R1
UXTH	R1, R2
;PCA_FLDA_GUI_driver.c,2235 :: 		Around_button->Left + Around_button->Width - 2,
UXTH	R2, R3
;PCA_FLDA_GUI_driver.c,2236 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
UXTH	R3, R5
PUSH	(R6)
BL	_TFT_Rectangle_Round_Edges+0
ADD	SP, SP, #4
LDR	R0, [SP, #4]
;PCA_FLDA_GUI_driver.c,2237 :: 		}
L_DrawRoundButton27:
;PCA_FLDA_GUI_driver.c,2238 :: 		TFT_Set_Ext_Font(Around_button->FontName, Around_button->Font_Color, FO_HORIZONTAL);
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
;PCA_FLDA_GUI_driver.c,2239 :: 		TFT_Write_Text_Return_Pos(Around_button->Caption, Around_button->Left, Around_button->Top);
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
;PCA_FLDA_GUI_driver.c,2240 :: 		if (Around_button->TextAlign == _taLeft)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawRoundButton28
;PCA_FLDA_GUI_driver.c,2241 :: 		TFT_Write_Text(Around_button->Caption, Around_button->Left + 4, (Around_button->Top + ((Around_button->Height - caption_height) / 2)));
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
BAL	L_DrawRoundButton29
L_DrawRoundButton28:
;PCA_FLDA_GUI_driver.c,2242 :: 		else if (Around_button->TextAlign == _taCenter)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton30
;PCA_FLDA_GUI_driver.c,2243 :: 		TFT_Write_Text(Around_button->Caption, (Around_button->Left + (Around_button->Width - caption_length) / 2), (Around_button->Top + ((Around_button->Height - caption_height) / 2)));
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
BAL	L_DrawRoundButton31
L_DrawRoundButton30:
;PCA_FLDA_GUI_driver.c,2244 :: 		else if (Around_button->TextAlign == _taRight)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawRoundButton32
;PCA_FLDA_GUI_driver.c,2245 :: 		TFT_Write_Text(Around_button->Caption, Around_button->Left + (Around_button->Width - caption_length - 4), (Around_button->Top + (Around_button->Height - caption_height) / 2));
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
L_DrawRoundButton32:
L_DrawRoundButton31:
L_DrawRoundButton29:
;PCA_FLDA_GUI_driver.c,2246 :: 		}
L_DrawRoundButton23:
;PCA_FLDA_GUI_driver.c,2247 :: 		}
L_end_DrawRoundButton:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawRoundButton
_DrawLabel:
;PCA_FLDA_GUI_driver.c,2249 :: 		void DrawLabel(TLabel *ALabel) {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;PCA_FLDA_GUI_driver.c,2250 :: 		if (ALabel->Visible == 1) {
ADDW	R1, R0, #26
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawLabel33
;PCA_FLDA_GUI_driver.c,2251 :: 		TFT_Set_Ext_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
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
;PCA_FLDA_GUI_driver.c,2252 :: 		TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
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
;PCA_FLDA_GUI_driver.c,2253 :: 		}
L_DrawLabel33:
;PCA_FLDA_GUI_driver.c,2254 :: 		}
L_end_DrawLabel:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawLabel
_DrawCircleButton:
;PCA_FLDA_GUI_driver.c,2256 :: 		void DrawCircleButton(TCircleButton *ACircle_button) {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;PCA_FLDA_GUI_driver.c,2257 :: 		if (ACircle_button->Visible == 1) {
ADDW	R1, R0, #16
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCircleButton34
;PCA_FLDA_GUI_driver.c,2258 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCircleButton35
;PCA_FLDA_GUI_driver.c,2259 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;PCA_FLDA_GUI_driver.c,2261 :: 		ACircle_button->Gradient_End_Color, ACircle_button->Gradient_Start_Color);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #38
LDRH	R1, [R1, #0]
UXTH	R5, R1
;PCA_FLDA_GUI_driver.c,2260 :: 		TFT_Set_Brush(ACircle_button->Transparent, ACircle_button->Press_Color, ACircle_button->Gradient, ACircle_button->Gradient_Orientation,
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
;PCA_FLDA_GUI_driver.c,2261 :: 		ACircle_button->Gradient_End_Color, ACircle_button->Gradient_Start_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PCA_FLDA_GUI_driver.c,2260 :: 		TFT_Set_Brush(ACircle_button->Transparent, ACircle_button->Press_Color, ACircle_button->Gradient, ACircle_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;PCA_FLDA_GUI_driver.c,2262 :: 		}
IT	AL
BAL	L_DrawCircleButton36
L_DrawCircleButton35:
;PCA_FLDA_GUI_driver.c,2265 :: 		ACircle_button->Gradient_Start_Color, ACircle_button->Gradient_End_Color);
ADDW	R1, R0, #38
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R5, R1
;PCA_FLDA_GUI_driver.c,2264 :: 		TFT_Set_Brush(ACircle_button->Transparent, ACircle_button->Color, ACircle_button->Gradient, ACircle_button->Gradient_Orientation,
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
;PCA_FLDA_GUI_driver.c,2265 :: 		ACircle_button->Gradient_Start_Color, ACircle_button->Gradient_End_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;PCA_FLDA_GUI_driver.c,2264 :: 		TFT_Set_Brush(ACircle_button->Transparent, ACircle_button->Color, ACircle_button->Gradient, ACircle_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;PCA_FLDA_GUI_driver.c,2266 :: 		}
L_DrawCircleButton36:
;PCA_FLDA_GUI_driver.c,2267 :: 		TFT_Set_Pen(ACircle_button->Pen_Color, ACircle_button->Pen_Width);
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
;PCA_FLDA_GUI_driver.c,2270 :: 		ACircle_button->Radius);
ADDW	R1, R0, #10
LDRH	R4, [R1, #0]
SXTH	R3, R4
;PCA_FLDA_GUI_driver.c,2269 :: 		ACircle_button->Top + ACircle_button->Radius,
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
ADDS	R2, R1, R4
;PCA_FLDA_GUI_driver.c,2268 :: 		TFT_Circle(ACircle_button->Left + ACircle_button->Radius,
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R1, R1, R4
;PCA_FLDA_GUI_driver.c,2270 :: 		ACircle_button->Radius);
STR	R0, [SP, #4]
;PCA_FLDA_GUI_driver.c,2268 :: 		TFT_Circle(ACircle_button->Left + ACircle_button->Radius,
SXTH	R0, R1
;PCA_FLDA_GUI_driver.c,2269 :: 		ACircle_button->Top + ACircle_button->Radius,
SXTH	R1, R2
;PCA_FLDA_GUI_driver.c,2270 :: 		ACircle_button->Radius);
SXTH	R2, R3
BL	_TFT_Circle+0
LDR	R0, [SP, #4]
;PCA_FLDA_GUI_driver.c,2271 :: 		TFT_Set_Ext_Font(ACircle_button->FontName, ACircle_button->Font_Color, FO_HORIZONTAL);
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
;PCA_FLDA_GUI_driver.c,2272 :: 		TFT_Write_Text_Return_Pos(ACircle_button->Caption, ACircle_button->Left, ACircle_button->Top);
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
;PCA_FLDA_GUI_driver.c,2273 :: 		if (ACircle_button->TextAlign == _taLeft)
ADDW	R1, R0, #24
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawCircleButton37
;PCA_FLDA_GUI_driver.c,2274 :: 		TFT_Write_Text(ACircle_button->Caption, ACircle_button->Left + 4, (ACircle_button->Top + ACircle_button->Radius - caption_height / 2));
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
BAL	L_DrawCircleButton38
L_DrawCircleButton37:
;PCA_FLDA_GUI_driver.c,2275 :: 		else if (ACircle_button->TextAlign == _taCenter)
ADDW	R1, R0, #24
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCircleButton39
;PCA_FLDA_GUI_driver.c,2276 :: 		TFT_Write_Text(ACircle_button->Caption, (ACircle_button->Left + (ACircle_button->Radius*2 - caption_length) / 2), (ACircle_button->Top + ACircle_button->Radius - caption_height / 2));
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
BAL	L_DrawCircleButton40
L_DrawCircleButton39:
;PCA_FLDA_GUI_driver.c,2277 :: 		else if (ACircle_button->TextAlign == _taRight)
ADDW	R1, R0, #24
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawCircleButton41
;PCA_FLDA_GUI_driver.c,2278 :: 		TFT_Write_Text(ACircle_button->Caption, ACircle_button->Left + (ACircle_button->Radius*2 - caption_length - 4), (ACircle_button->Top + ACircle_button->Radius - caption_height / 2));
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
L_DrawCircleButton41:
L_DrawCircleButton40:
L_DrawCircleButton38:
;PCA_FLDA_GUI_driver.c,2279 :: 		}
L_DrawCircleButton34:
;PCA_FLDA_GUI_driver.c,2280 :: 		}
L_end_DrawCircleButton:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawCircleButton
_DrawRadioButton:
;PCA_FLDA_GUI_driver.c,2282 :: 		void DrawRadioButton(TRadioButton *ARadioButton) {
SUB	SP, SP, #12
STR	LR, [SP, #0]
;PCA_FLDA_GUI_driver.c,2283 :: 		int circleOffset = 0;
;PCA_FLDA_GUI_driver.c,2284 :: 		if (ARadioButton->Visible == 1) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRadioButton42
;PCA_FLDA_GUI_driver.c,2285 :: 		circleOffset = ARadioButton->Height / 5;
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVS	R1, #5
UDIV	R1, R2, R1
; circleOffset start address is: 28 (R7)
SXTH	R7, R1
;PCA_FLDA_GUI_driver.c,2286 :: 		TFT_Set_Pen(ARadioButton->Pen_Color, ARadioButton->Pen_Width);
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
;PCA_FLDA_GUI_driver.c,2287 :: 		if (ARadioButton->TextAlign == _taLeft) {
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawRadioButton43
;PCA_FLDA_GUI_driver.c,2288 :: 		TFT_Set_Brush(ARadioButton->Transparent,ARadioButton->Background_Color,0,0,0,0);
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
;PCA_FLDA_GUI_driver.c,2289 :: 		TFT_Circle(ARadioButton->Left + ARadioButton->Height / 2, ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2);
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
;PCA_FLDA_GUI_driver.c,2290 :: 		if (ARadioButton->Checked == 1) {
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRadioButton44
;PCA_FLDA_GUI_driver.c,2291 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRadioButton45
;PCA_FLDA_GUI_driver.c,2292 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;PCA_FLDA_GUI_driver.c,2293 :: 		TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Press_Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_End_Color, ARadioButton->Gradient_Start_Color);
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
;PCA_FLDA_GUI_driver.c,2294 :: 		}
IT	AL
BAL	L_DrawRadioButton46
L_DrawRadioButton45:
;PCA_FLDA_GUI_driver.c,2296 :: 		TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_Start_Color, ARadioButton->Gradient_End_Color);
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
L_DrawRadioButton46:
;PCA_FLDA_GUI_driver.c,2297 :: 		TFT_Circle(ARadioButton->Left + ARadioButton->Height / 2 , ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2 - circleOffset);
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
;PCA_FLDA_GUI_driver.c,2298 :: 		}
L_DrawRadioButton44:
;PCA_FLDA_GUI_driver.c,2299 :: 		TFT_Set_Ext_Font(ARadioButton->FontName, ARadioButton->Font_Color, FO_HORIZONTAL);
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
;PCA_FLDA_GUI_driver.c,2300 :: 		TFT_Write_Text_Return_Pos(ARadioButton->Caption, ARadioButton->Left + ARadioButton->Height + 4, ARadioButton->Top);
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
;PCA_FLDA_GUI_driver.c,2301 :: 		TFT_Write_Text(ARadioButton->Caption, ARadioButton->Left + ARadioButton->Height + 4, (ARadioButton->Top + ((ARadioButton->Height - caption_height) / 2)));
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
;PCA_FLDA_GUI_driver.c,2302 :: 		}
IT	AL
BAL	L_DrawRadioButton47
L_DrawRadioButton43:
;PCA_FLDA_GUI_driver.c,2303 :: 		else if (ARadioButton->TextAlign == _taRight) {
; circleOffset start address is: 28 (R7)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawRadioButton48
;PCA_FLDA_GUI_driver.c,2304 :: 		TFT_Set_Brush(ARadioButton->Transparent,ARadioButton->Background_Color,0,0,0,0);
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
;PCA_FLDA_GUI_driver.c,2305 :: 		TFT_Circle(ARadioButton->Left  + ARadioButton->Width - ARadioButton->Height / 2, ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2);
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
;PCA_FLDA_GUI_driver.c,2306 :: 		if (ARadioButton->Checked == 1) {
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRadioButton49
;PCA_FLDA_GUI_driver.c,2307 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRadioButton50
;PCA_FLDA_GUI_driver.c,2308 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;PCA_FLDA_GUI_driver.c,2309 :: 		TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Press_Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_End_Color, ARadioButton->Gradient_Start_Color);
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
;PCA_FLDA_GUI_driver.c,2310 :: 		}
IT	AL
BAL	L_DrawRadioButton51
L_DrawRadioButton50:
;PCA_FLDA_GUI_driver.c,2312 :: 		TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_Start_Color, ARadioButton->Gradient_End_Color);
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
L_DrawRadioButton51:
;PCA_FLDA_GUI_driver.c,2313 :: 		TFT_Circle(ARadioButton->Left  + ARadioButton->Width - ARadioButton->Height / 2, ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2 - circleOffset);
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
;PCA_FLDA_GUI_driver.c,2314 :: 		}
L_DrawRadioButton49:
;PCA_FLDA_GUI_driver.c,2315 :: 		TFT_Set_Ext_Font(ARadioButton->FontName, ARadioButton->Font_Color, FO_HORIZONTAL);
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
;PCA_FLDA_GUI_driver.c,2316 :: 		TFT_Write_Text_Return_Pos(ARadioButton->Caption, ARadioButton->Left + 3, ARadioButton->Top);
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
;PCA_FLDA_GUI_driver.c,2317 :: 		TFT_Write_Text(ARadioButton->Caption, ARadioButton->Left + 3, ARadioButton->Top + (ARadioButton->Height - caption_height) / 2);
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
;PCA_FLDA_GUI_driver.c,2318 :: 		}
L_DrawRadioButton48:
L_DrawRadioButton47:
;PCA_FLDA_GUI_driver.c,2319 :: 		}
L_DrawRadioButton42:
;PCA_FLDA_GUI_driver.c,2320 :: 		}
L_end_DrawRadioButton:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DrawRadioButton
_UpdatePBPosition:
;PCA_FLDA_GUI_driver.c,2322 :: 		void UpdatePBPosition(TProgressBar *AProgressBar) {
SUB	SP, SP, #28
STR	LR, [SP, #0]
;PCA_FLDA_GUI_driver.c,2324 :: 		unsigned int locPosition = 0;
;PCA_FLDA_GUI_driver.c,2325 :: 		unsigned cnt = 0;
;PCA_FLDA_GUI_driver.c,2327 :: 		unsigned int tmpWidth = 0;
;PCA_FLDA_GUI_driver.c,2328 :: 		unsigned int tmpRound = 0;
;PCA_FLDA_GUI_driver.c,2329 :: 		move_offset = 10;
; move_offset start address is: 32 (R8)
MOVW	R8, #10
SXTH	R8, R8
;PCA_FLDA_GUI_driver.c,2330 :: 		locPosition = (float)(AProgressBar->Position - AProgressBar->Min) / (float)(AProgressBar->Max - AProgressBar->Min) * 100;
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
;PCA_FLDA_GUI_driver.c,2331 :: 		if (AProgressBar->Visible == 1) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_UpdatePBPosition52
;PCA_FLDA_GUI_driver.c,2332 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
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
;PCA_FLDA_GUI_driver.c,2333 :: 		TFT_Set_Pen(AProgressBar->Background_Color, AProgressBar->Pen_Width);
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
;PCA_FLDA_GUI_driver.c,2334 :: 		TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
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
;PCA_FLDA_GUI_driver.c,2335 :: 		if (caption_height >  AProgressBar->Height)
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	LS
BLS	L_UpdatePBPosition53
;PCA_FLDA_GUI_driver.c,2336 :: 		caption_height =  AProgressBar->Height;
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
STRH	R2, [R1, #0]
L_UpdatePBPosition53:
;PCA_FLDA_GUI_driver.c,2337 :: 		if (caption_length >  AProgressBar->Width)
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	LS
BLS	L_UpdatePBPosition54
;PCA_FLDA_GUI_driver.c,2338 :: 		caption_length =  AProgressBar->Width;
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
STRH	R2, [R1, #0]
L_UpdatePBPosition54:
;PCA_FLDA_GUI_driver.c,2339 :: 		if (AProgressBar->Position < (AProgressBar->Left + (AProgressBar->Width - caption_length) / 2)) {
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
BCS	L_UpdatePBPosition55
;PCA_FLDA_GUI_driver.c,2343 :: 		AProgressBar->Top +(AProgressBar->Height - caption_height) / 2 + caption_height);
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
;PCA_FLDA_GUI_driver.c,2342 :: 		AProgressBar->Left + (AProgressBar->Width - caption_length) / 2 + caption_length,
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
;PCA_FLDA_GUI_driver.c,2343 :: 		AProgressBar->Top +(AProgressBar->Height - caption_height) / 2 + caption_height);
STRH	R7, [SP, #4]
STRH	R8, [SP, #6]
STR	R0, [SP, #8]
SXTH	R3, R5
;PCA_FLDA_GUI_driver.c,2340 :: 		TFT_Rectangle(AProgressBar->Left + (AProgressBar->Width - caption_length) / 2,
SXTH	R0, R2
;PCA_FLDA_GUI_driver.c,2342 :: 		AProgressBar->Left + (AProgressBar->Width - caption_length) / 2 + caption_length,
SXTH	R2, R1
;PCA_FLDA_GUI_driver.c,2341 :: 		AProgressBar->Top +(AProgressBar->Height - caption_height) / 2,
SXTH	R1, R6
;PCA_FLDA_GUI_driver.c,2343 :: 		AProgressBar->Top +(AProgressBar->Height - caption_height) / 2 + caption_height);
BL	_TFT_Rectangle+0
LDR	R0, [SP, #8]
LDRSH	R8, [SP, #6]
LDRH	R7, [SP, #4]
;PCA_FLDA_GUI_driver.c,2344 :: 		}
L_UpdatePBPosition55:
;PCA_FLDA_GUI_driver.c,2345 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
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
;PCA_FLDA_GUI_driver.c,2346 :: 		TFT_Set_Pen(AProgressBar->Pen_Color, AProgressBar->Pen_Width);
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
;PCA_FLDA_GUI_driver.c,2347 :: 		if (AProgressBar->Rounded == 1) {
ADDW	R1, R0, #53
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_UpdatePBPosition56
;PCA_FLDA_GUI_driver.c,2348 :: 		if (locPosition > 0) {
CMP	R7, #0
IT	LS
BLS	L_UpdatePBPosition57
;PCA_FLDA_GUI_driver.c,2350 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
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
;PCA_FLDA_GUI_driver.c,2351 :: 		TFT_Rectangle(AProgressBar->Left + AProgressBar->Corner_Radius, AProgressBar->Top,  AProgressBar->Left + AProgressBar->Corner_Radius  + locPosition *  (AProgressBar->Width-AProgressBar->Corner_Radius*2) / 100 , AProgressBar->Top + AProgressBar->Height);
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
;PCA_FLDA_GUI_driver.c,2352 :: 		}
L_UpdatePBPosition57:
;PCA_FLDA_GUI_driver.c,2353 :: 		}
IT	AL
BAL	L_UpdatePBPosition58
L_UpdatePBPosition56:
;PCA_FLDA_GUI_driver.c,2355 :: 		if (locPosition > 0) {
CMP	R7, #0
IT	LS
BLS	L_UpdatePBPosition59
;PCA_FLDA_GUI_driver.c,2356 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
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
;PCA_FLDA_GUI_driver.c,2357 :: 		TFT_Rectangle(AProgressBar->Left, AProgressBar->Top,  AProgressBar->Left + (locPosition * AProgressBar->Width) / 100, AProgressBar->Top + AProgressBar->Height);
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
;PCA_FLDA_GUI_driver.c,2358 :: 		}
L_UpdatePBPosition59:
;PCA_FLDA_GUI_driver.c,2359 :: 		}
L_UpdatePBPosition58:
;PCA_FLDA_GUI_driver.c,2361 :: 		if (AProgressBar->Smooth != 1) {
ADDW	R1, R0, #52
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	EQ
BEQ	L__UpdatePBPosition213
;PCA_FLDA_GUI_driver.c,2362 :: 		if(AProgressBar->Rounded == 1) {
ADDW	R1, R0, #53
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_UpdatePBPosition61
;PCA_FLDA_GUI_driver.c,2363 :: 		tmpRound = AProgressBar->Corner_Radius;
ADDW	R1, R0, #54
LDRB	R3, [R1, #0]
; tmpRound start address is: 16 (R4)
UXTB	R4, R3
;PCA_FLDA_GUI_driver.c,2364 :: 		cnt = move_offset + tmpRound;
ADD	R10, R8, R4, LSL #0
UXTH	R10, R10
; cnt start address is: 40 (R10)
;PCA_FLDA_GUI_driver.c,2365 :: 		tmpWidth = AProgressBar->Width - AProgressBar->Corner_Radius * 2;
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
LSLS	R1, R3, #1
SXTH	R1, R1
SUB	R9, R2, R1, LSL #0
UXTH	R9, R9
; tmpWidth start address is: 36 (R9)
;PCA_FLDA_GUI_driver.c,2366 :: 		}
UXTH	R5, R4
; tmpRound end address is: 16 (R4)
; tmpWidth end address is: 36 (R9)
; cnt end address is: 40 (R10)
IT	AL
BAL	L_UpdatePBPosition62
L_UpdatePBPosition61:
;PCA_FLDA_GUI_driver.c,2368 :: 		tmpRound = 0;
; tmpRound start address is: 20 (R5)
MOVS	R5, #0
;PCA_FLDA_GUI_driver.c,2369 :: 		cnt = move_offset;
; cnt start address is: 40 (R10)
UXTH	R10, R8
;PCA_FLDA_GUI_driver.c,2370 :: 		tmpWidth = AProgressBar->Width;
ADDW	R1, R0, #10
LDRH	R9, [R1, #0]
; tmpWidth start address is: 36 (R9)
; tmpRound end address is: 20 (R5)
; tmpWidth end address is: 36 (R9)
; cnt end address is: 40 (R10)
;PCA_FLDA_GUI_driver.c,2371 :: 		}
L_UpdatePBPosition62:
;PCA_FLDA_GUI_driver.c,2372 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
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
LDR	R0, [SP, #8]
LDRH	R5, [SP, #4]
SXTH	R11, R8
UXTH	R8, R5
;PCA_FLDA_GUI_driver.c,2373 :: 		while (cnt-tmpRound < (locPosition * tmpWidth) / 100) {
L_UpdatePBPosition63:
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
BCS	L_UpdatePBPosition64
; move_offset end address is: 44 (R11)
;PCA_FLDA_GUI_driver.c,2374 :: 		if  (cnt - tmpRound + 3 >=  tmpWidth * locPosition)
; move_offset start address is: 44 (R11)
SUB	R1, R10, R8, LSL #0
UXTH	R1, R1
ADDS	R2, R1, #3
UXTH	R2, R2
MUL	R1, R9, R7
UXTH	R1, R1
CMP	R2, R1
IT	CC
BCC	L_UpdatePBPosition65
;PCA_FLDA_GUI_driver.c,2375 :: 		TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top, AProgressBar->Left + tmpRound  + tmpWidth * locPosition , AProgressBar->Top + AProgressBar->Height);
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
BAL	L_UpdatePBPosition66
L_UpdatePBPosition65:
;PCA_FLDA_GUI_driver.c,2377 :: 		TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top,  AProgressBar->Left + cnt + 3, AProgressBar->Top + AProgressBar->Height);
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
L_UpdatePBPosition66:
;PCA_FLDA_GUI_driver.c,2378 :: 		cnt = cnt + move_offset + 3;
ADD	R1, R10, R11, LSL #0
UXTH	R1, R1
; cnt end address is: 40 (R10)
ADDS	R1, R1, #3
; cnt start address is: 40 (R10)
UXTH	R10, R1
;PCA_FLDA_GUI_driver.c,2379 :: 		}
; tmpRound end address is: 32 (R8)
; tmpWidth end address is: 36 (R9)
; move_offset end address is: 44 (R11)
; cnt end address is: 40 (R10)
IT	AL
BAL	L_UpdatePBPosition63
L_UpdatePBPosition64:
;PCA_FLDA_GUI_driver.c,2380 :: 		}
UXTH	R2, R7
IT	AL
BAL	L_UpdatePBPosition60
; locPosition end address is: 28 (R7)
L__UpdatePBPosition213:
;PCA_FLDA_GUI_driver.c,2361 :: 		if (AProgressBar->Smooth != 1) {
UXTH	R2, R7
;PCA_FLDA_GUI_driver.c,2380 :: 		}
L_UpdatePBPosition60:
;PCA_FLDA_GUI_driver.c,2382 :: 		if (AProgressBar->Show_Position == 1){
; locPosition start address is: 8 (R2)
ADDW	R1, R0, #50
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_UpdatePBPosition67
;PCA_FLDA_GUI_driver.c,2383 :: 		if (AProgressBar->Show_Percentage == 1) {
ADDW	R1, R0, #51
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_UpdatePBPosition68
;PCA_FLDA_GUI_driver.c,2384 :: 		IntToStr(locPosition , tmpStr);
ADD	R1, SP, #18
STR	R0, [SP, #4]
SXTH	R0, R2
; locPosition end address is: 8 (R2)
BL	_IntToStr+0
;PCA_FLDA_GUI_driver.c,2385 :: 		DeleteTrailingSpaces(tmpStr);
ADD	R1, SP, #18
MOV	R0, R1
BL	_DeleteTrailingSpaces+0
LDR	R0, [SP, #4]
;PCA_FLDA_GUI_driver.c,2386 :: 		strcpy(AProgressBar->Caption, tmpStr);
ADD	R2, SP, #18
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
BL	_strcpy+0
LDR	R0, [SP, #4]
;PCA_FLDA_GUI_driver.c,2387 :: 		strcat(AProgressBar->Caption, "\%");
MOVW	R2, #lo_addr(?lstr5_PCA_FLDA_GUI_driver+0)
MOVT	R2, #hi_addr(?lstr5_PCA_FLDA_GUI_driver+0)
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
LDR	R0, [SP, #4]
;PCA_FLDA_GUI_driver.c,2388 :: 		}
IT	AL
BAL	L_UpdatePBPosition69
L_UpdatePBPosition68:
;PCA_FLDA_GUI_driver.c,2390 :: 		IntToStr(AProgressBar->Position , tmpStr);
ADD	R2, SP, #18
ADDW	R1, R0, #48
LDRH	R1, [R1, #0]
SXTH	R1, R1
STR	R0, [SP, #4]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
;PCA_FLDA_GUI_driver.c,2391 :: 		DeleteTrailingSpaces(tmpStr);
ADD	R1, SP, #18
MOV	R0, R1
BL	_DeleteTrailingSpaces+0
LDR	R0, [SP, #4]
;PCA_FLDA_GUI_driver.c,2392 :: 		strcpy(AProgressBar->Caption, tmpStr);
ADD	R2, SP, #18
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
BL	_strcpy+0
LDR	R0, [SP, #4]
;PCA_FLDA_GUI_driver.c,2393 :: 		}
L_UpdatePBPosition69:
;PCA_FLDA_GUI_driver.c,2394 :: 		TFT_Set_Ext_Font(AProgressBar->FontName, AProgressBar->Font_Color, FO_HORIZONTAL);
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
;PCA_FLDA_GUI_driver.c,2395 :: 		TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
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
;PCA_FLDA_GUI_driver.c,2396 :: 		TFT_Write_Text(AProgressBar->Caption, AProgressBar->Left + (AProgressBar->Width - caption_length) / 2, AProgressBar->Top + (AProgressBar->Height - caption_height) / 2);
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
;PCA_FLDA_GUI_driver.c,2397 :: 		}
L_UpdatePBPosition67:
;PCA_FLDA_GUI_driver.c,2398 :: 		}
L_UpdatePBPosition52:
;PCA_FLDA_GUI_driver.c,2399 :: 		}
L_end_UpdatePBPosition:
LDR	LR, [SP, #0]
ADD	SP, SP, #28
BX	LR
; end of _UpdatePBPosition
_DrawProgressBar:
;PCA_FLDA_GUI_driver.c,2401 :: 		void DrawProgressBar(TProgressBar *AProgressBar) {
SUB	SP, SP, #28
STR	LR, [SP, #0]
;PCA_FLDA_GUI_driver.c,2402 :: 		int move_offset = 0;
;PCA_FLDA_GUI_driver.c,2403 :: 		unsigned int locPosition = 0;
;PCA_FLDA_GUI_driver.c,2404 :: 		unsigned cnt = 0;
;PCA_FLDA_GUI_driver.c,2406 :: 		unsigned int tmpWidth = 0;
;PCA_FLDA_GUI_driver.c,2407 :: 		unsigned int tmpRound = 0;
;PCA_FLDA_GUI_driver.c,2408 :: 		move_offset = 10;
MOVS	R1, #10
SXTH	R1, R1
STRH	R1, [SP, #18]
;PCA_FLDA_GUI_driver.c,2409 :: 		locPosition = (float)(AProgressBar->Position - AProgressBar->Min) / (float)(AProgressBar->Max - AProgressBar->Min) * 100;
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
;PCA_FLDA_GUI_driver.c,2410 :: 		if (AProgressBar->Visible == 1) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawProgressBar70
;PCA_FLDA_GUI_driver.c,2411 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
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
;PCA_FLDA_GUI_driver.c,2412 :: 		TFT_Set_Pen(AProgressBar->Pen_Color, AProgressBar->Pen_Width);
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
;PCA_FLDA_GUI_driver.c,2413 :: 		if (AProgressBar->Rounded == 1) {
ADDW	R1, R0, #53
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawProgressBar71
;PCA_FLDA_GUI_driver.c,2415 :: 		TFT_Rectangle_Round_Edges(AProgressBar->Left, AProgressBar->Top,  AProgressBar->Left + AProgressBar->Width, AProgressBar->Top + AProgressBar->Height, AProgressBar->Corner_Radius);
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
;PCA_FLDA_GUI_driver.c,2416 :: 		if (locPosition > 0) {
LDRH	R1, [SP, #20]
CMP	R1, #0
IT	LS
BLS	L_DrawProgressBar72
;PCA_FLDA_GUI_driver.c,2418 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
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
;PCA_FLDA_GUI_driver.c,2419 :: 		TFT_Rectangle(AProgressBar->Left + AProgressBar->Corner_Radius, AProgressBar->Top,  AProgressBar->Left + AProgressBar->Corner_Radius   + locPosition *  (AProgressBar->Width-AProgressBar->Corner_Radius*2) / 100, AProgressBar->Top + AProgressBar->Height);
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
;PCA_FLDA_GUI_driver.c,2420 :: 		}
L_DrawProgressBar72:
;PCA_FLDA_GUI_driver.c,2421 :: 		}
IT	AL
BAL	L_DrawProgressBar73
L_DrawProgressBar71:
;PCA_FLDA_GUI_driver.c,2424 :: 		TFT_Rectangle(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + AProgressBar->Width, AProgressBar->Top + AProgressBar->Height);
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
;PCA_FLDA_GUI_driver.c,2425 :: 		if (locPosition > 0) {
LDRH	R1, [SP, #20]
CMP	R1, #0
IT	LS
BLS	L_DrawProgressBar74
;PCA_FLDA_GUI_driver.c,2427 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
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
;PCA_FLDA_GUI_driver.c,2428 :: 		TFT_Rectangle(AProgressBar->Left, AProgressBar->Top,  AProgressBar->Left + (locPosition * AProgressBar->Width) / 100, AProgressBar->Top + AProgressBar->Height);
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
;PCA_FLDA_GUI_driver.c,2429 :: 		}
L_DrawProgressBar74:
;PCA_FLDA_GUI_driver.c,2430 :: 		}
L_DrawProgressBar73:
;PCA_FLDA_GUI_driver.c,2432 :: 		if (AProgressBar->Smooth != 1) {
ADDW	R1, R0, #52
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	EQ
BEQ	L__DrawProgressBar214
;PCA_FLDA_GUI_driver.c,2433 :: 		if(AProgressBar->Rounded == 1) {
ADDW	R1, R0, #53
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawProgressBar76
;PCA_FLDA_GUI_driver.c,2434 :: 		tmpRound = AProgressBar->Corner_Radius;
ADDW	R1, R0, #54
LDRB	R3, [R1, #0]
STRH	R3, [SP, #24]
;PCA_FLDA_GUI_driver.c,2435 :: 		cnt = move_offset + tmpRound;
LDRH	R2, [SP, #24]
LDRSH	R1, [SP, #18]
ADD	R10, R1, R2, LSL #0
UXTH	R10, R10
; cnt start address is: 40 (R10)
;PCA_FLDA_GUI_driver.c,2436 :: 		tmpWidth = AProgressBar->Width - AProgressBar->Corner_Radius * 2;
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
LSLS	R1, R3, #1
SXTH	R1, R1
SUB	R1, R2, R1
STRH	R1, [SP, #22]
;PCA_FLDA_GUI_driver.c,2437 :: 		}
; cnt end address is: 40 (R10)
IT	AL
BAL	L_DrawProgressBar77
L_DrawProgressBar76:
;PCA_FLDA_GUI_driver.c,2439 :: 		tmpRound = 0;
MOVS	R1, #0
STRH	R1, [SP, #24]
;PCA_FLDA_GUI_driver.c,2440 :: 		cnt = move_offset;
; cnt start address is: 40 (R10)
LDRSH	R10, [SP, #18]
;PCA_FLDA_GUI_driver.c,2441 :: 		tmpWidth = AProgressBar->Width;
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
STRH	R1, [SP, #22]
; cnt end address is: 40 (R10)
;PCA_FLDA_GUI_driver.c,2442 :: 		}
L_DrawProgressBar77:
;PCA_FLDA_GUI_driver.c,2443 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
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
LDR	R0, [SP, #4]
MOV	R8, R0
UXTH	R7, R10
;PCA_FLDA_GUI_driver.c,2444 :: 		while (cnt-tmpRound < (locPosition * tmpWidth) / 100) {
L_DrawProgressBar78:
; cnt start address is: 28 (R7)
; AProgressBar start address is: 32 (R8)
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
BCS	L_DrawProgressBar79
;PCA_FLDA_GUI_driver.c,2445 :: 		if  (cnt - tmpRound + 3 >=  tmpWidth * locPosition)
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
BCC	L_DrawProgressBar80
;PCA_FLDA_GUI_driver.c,2446 :: 		TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top, AProgressBar->Left + tmpRound  + tmpWidth * locPosition , AProgressBar->Top + AProgressBar->Height);
ADD	R1, R8, #8
LDRH	R6, [R1, #0]
ADD	R1, R8, #12
LDRH	R1, [R1, #0]
ADDS	R5, R6, R1
ADD	R1, R8, #6
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
BAL	L_DrawProgressBar81
L_DrawProgressBar80:
;PCA_FLDA_GUI_driver.c,2448 :: 		TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top,  AProgressBar->Left + cnt + 3, AProgressBar->Top + AProgressBar->Height);
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
L_DrawProgressBar81:
;PCA_FLDA_GUI_driver.c,2449 :: 		cnt = cnt + move_offset + 3;
LDRSH	R1, [SP, #18]
ADDS	R1, R7, R1
UXTH	R1, R1
; cnt end address is: 28 (R7)
ADDS	R1, R1, #3
; cnt start address is: 40 (R10)
UXTH	R10, R1
;PCA_FLDA_GUI_driver.c,2450 :: 		}
; cnt end address is: 40 (R10)
UXTH	R7, R10
IT	AL
BAL	L_DrawProgressBar78
L_DrawProgressBar79:
;PCA_FLDA_GUI_driver.c,2451 :: 		}
MOV	R0, R8
IT	AL
BAL	L_DrawProgressBar75
; AProgressBar end address is: 32 (R8)
L__DrawProgressBar214:
;PCA_FLDA_GUI_driver.c,2432 :: 		if (AProgressBar->Smooth != 1) {
;PCA_FLDA_GUI_driver.c,2451 :: 		}
L_DrawProgressBar75:
;PCA_FLDA_GUI_driver.c,2453 :: 		if (AProgressBar->Show_Position == 1){
ADDW	R1, R0, #50
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawProgressBar82
;PCA_FLDA_GUI_driver.c,2454 :: 		if (AProgressBar->Show_Percentage == 1) {
ADDW	R1, R0, #51
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawProgressBar83
;PCA_FLDA_GUI_driver.c,2455 :: 		IntToStr(locPosition , tmpStr);
ADD	R1, SP, #10
STR	R0, [SP, #4]
LDRH	R0, [SP, #20]
BL	_IntToStr+0
;PCA_FLDA_GUI_driver.c,2456 :: 		DeleteTrailingSpaces(tmpStr);
ADD	R1, SP, #10
MOV	R0, R1
BL	_DeleteTrailingSpaces+0
LDR	R0, [SP, #4]
;PCA_FLDA_GUI_driver.c,2457 :: 		strcpy(AProgressBar->Caption, tmpStr);
ADD	R2, SP, #10
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
BL	_strcpy+0
LDR	R0, [SP, #4]
;PCA_FLDA_GUI_driver.c,2458 :: 		strcat(AProgressBar->Caption, "\%");
MOVW	R2, #lo_addr(?lstr6_PCA_FLDA_GUI_driver+0)
MOVT	R2, #hi_addr(?lstr6_PCA_FLDA_GUI_driver+0)
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
LDR	R0, [SP, #4]
;PCA_FLDA_GUI_driver.c,2459 :: 		}
IT	AL
BAL	L_DrawProgressBar84
L_DrawProgressBar83:
;PCA_FLDA_GUI_driver.c,2461 :: 		IntToStr(AProgressBar->Position , tmpStr);
ADD	R2, SP, #10
ADDW	R1, R0, #48
LDRH	R1, [R1, #0]
SXTH	R1, R1
STR	R0, [SP, #4]
SXTH	R0, R1
MOV	R1, R2
BL	_IntToStr+0
;PCA_FLDA_GUI_driver.c,2462 :: 		DeleteTrailingSpaces(tmpStr);
ADD	R1, SP, #10
MOV	R0, R1
BL	_DeleteTrailingSpaces+0
LDR	R0, [SP, #4]
;PCA_FLDA_GUI_driver.c,2463 :: 		strcpy(AProgressBar->Caption, tmpStr);
ADD	R2, SP, #10
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
MOV	R1, R2
BL	_strcpy+0
LDR	R0, [SP, #4]
;PCA_FLDA_GUI_driver.c,2464 :: 		}
L_DrawProgressBar84:
;PCA_FLDA_GUI_driver.c,2465 :: 		TFT_Set_Ext_Font(AProgressBar->FontName, AProgressBar->Font_Color, FO_HORIZONTAL);
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
;PCA_FLDA_GUI_driver.c,2466 :: 		TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
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
;PCA_FLDA_GUI_driver.c,2467 :: 		TFT_Write_Text(AProgressBar->Caption, AProgressBar->Left + (AProgressBar->Width - caption_length) / 2, AProgressBar->Top + (AProgressBar->Height - caption_height) / 2);
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
;PCA_FLDA_GUI_driver.c,2468 :: 		}
L_DrawProgressBar82:
;PCA_FLDA_GUI_driver.c,2469 :: 		}
L_DrawProgressBar70:
;PCA_FLDA_GUI_driver.c,2470 :: 		}
L_end_DrawProgressBar:
LDR	LR, [SP, #0]
ADD	SP, SP, #28
BX	LR
; end of _DrawProgressBar
_DrawScreen:
;PCA_FLDA_GUI_driver.c,2472 :: 		void DrawScreen(TScreen *aScreen) {
SUB	SP, SP, #64
STR	LR, [SP, #0]
;PCA_FLDA_GUI_driver.c,2486 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;PCA_FLDA_GUI_driver.c,2487 :: 		order = 0;
MOVS	R1, #0
SXTH	R1, R1
STRH	R1, [SP, #4]
;PCA_FLDA_GUI_driver.c,2488 :: 		round_button_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #6]
;PCA_FLDA_GUI_driver.c,2489 :: 		label_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #12]
;PCA_FLDA_GUI_driver.c,2490 :: 		circle_button_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #20]
;PCA_FLDA_GUI_driver.c,2491 :: 		radio_button_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #28]
;PCA_FLDA_GUI_driver.c,2492 :: 		progress_bar_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #36]
;PCA_FLDA_GUI_driver.c,2493 :: 		CurrentScreen = aScreen;
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
STR	R0, [R1, #0]
;PCA_FLDA_GUI_driver.c,2495 :: 		if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
ADDS	R1, R0, #2
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen217
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
BNE	L__DrawScreen216
IT	AL
BAL	L_DrawScreen87
L__DrawScreen217:
L__DrawScreen216:
;PCA_FLDA_GUI_driver.c,2496 :: 		save_bled = TFT_BLED;
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
STR	R2, [SP, #60]
LDR	R1, [R2, #0]
STRB	R1, [SP, #44]
;PCA_FLDA_GUI_driver.c,2497 :: 		TFT_BLED           = 0;
MOVS	R1, #0
SXTB	R1, R1
STR	R1, [R2, #0]
;PCA_FLDA_GUI_driver.c,2498 :: 		TFT_Init(CurrentScreen->Width, CurrentScreen->Height);
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
;PCA_FLDA_GUI_driver.c,2499 :: 		TFT_Set_Ext_Buffer(TFT_Get_Data);
MOVW	R1, #lo_addr(_TFT_Get_Data+0)
MOVT	R1, #hi_addr(_TFT_Get_Data+0)
MOV	R0, R1
BL	_TFT_Set_Ext_Buffer+0
;PCA_FLDA_GUI_driver.c,2500 :: 		TP_TFT_Init(CurrentScreen->Width, CurrentScreen->Height, 8, 9);                                  // Initialize touch panel
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
;PCA_FLDA_GUI_driver.c,2501 :: 		TP_TFT_Set_ADC_Threshold(ADC_THRESHOLD);                              // Set touch panel ADC threshold
MOVW	R0, #1500
SXTH	R0, R0
BL	_TP_TFT_Set_ADC_Threshold+0
;PCA_FLDA_GUI_driver.c,2502 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
;PCA_FLDA_GUI_driver.c,2503 :: 		display_width = CurrentScreen->Width;
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
STRH	R2, [R1, #0]
;PCA_FLDA_GUI_driver.c,2504 :: 		display_height = CurrentScreen->Height;
LDR	R1, [SP, #56]
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
STRH	R2, [R1, #0]
;PCA_FLDA_GUI_driver.c,2505 :: 		TFT_BLED           = save_bled;
LDRB	R2, [SP, #44]
LDR	R1, [SP, #60]
STR	R2, [R1, #0]
;PCA_FLDA_GUI_driver.c,2506 :: 		}
IT	AL
BAL	L_DrawScreen88
L_DrawScreen87:
;PCA_FLDA_GUI_driver.c,2508 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
L_DrawScreen88:
;PCA_FLDA_GUI_driver.c,2511 :: 		while (order < CurrentScreen->ObjectsCount) {
L_DrawScreen89:
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #6
LDRB	R2, [R1, #0]
LDRSH	R1, [SP, #4]
CMP	R1, R2
IT	GE
BGE	L_DrawScreen90
;PCA_FLDA_GUI_driver.c,2512 :: 		if (round_button_idx < CurrentScreen->Buttons_RoundCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #8
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #6]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen91
;PCA_FLDA_GUI_driver.c,2513 :: 		local_round_button = GetRoundButton(round_button_idx);
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
;PCA_FLDA_GUI_driver.c,2514 :: 		if (order == local_round_button->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRSH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen92
;PCA_FLDA_GUI_driver.c,2515 :: 		order++;
LDRSH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;PCA_FLDA_GUI_driver.c,2516 :: 		round_button_idx++;
LDRB	R1, [SP, #6]
ADDS	R1, R1, #1
STRB	R1, [SP, #6]
;PCA_FLDA_GUI_driver.c,2517 :: 		DrawRoundButton(local_round_button);
LDR	R0, [SP, #8]
BL	_DrawRoundButton+0
;PCA_FLDA_GUI_driver.c,2518 :: 		}
L_DrawScreen92:
;PCA_FLDA_GUI_driver.c,2519 :: 		}
L_DrawScreen91:
;PCA_FLDA_GUI_driver.c,2521 :: 		if (label_idx < CurrentScreen->LabelsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #16
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #12]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen93
;PCA_FLDA_GUI_driver.c,2522 :: 		local_label = GetLabel(label_idx);
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
;PCA_FLDA_GUI_driver.c,2523 :: 		if (order == local_label->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRSH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen94
;PCA_FLDA_GUI_driver.c,2524 :: 		label_idx++;
LDRB	R1, [SP, #12]
ADDS	R1, R1, #1
STRB	R1, [SP, #12]
;PCA_FLDA_GUI_driver.c,2525 :: 		order++;
LDRSH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;PCA_FLDA_GUI_driver.c,2526 :: 		DrawLabel(local_label);
LDR	R0, [SP, #16]
BL	_DrawLabel+0
;PCA_FLDA_GUI_driver.c,2527 :: 		}
L_DrawScreen94:
;PCA_FLDA_GUI_driver.c,2528 :: 		}
L_DrawScreen93:
;PCA_FLDA_GUI_driver.c,2530 :: 		if (circle_button_idx < CurrentScreen->CircleButtonsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #24
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #20]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen95
;PCA_FLDA_GUI_driver.c,2531 :: 		local_circle_button = GetCircleButton(circle_button_idx);
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
;PCA_FLDA_GUI_driver.c,2532 :: 		if (order == local_circle_button->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRSH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen96
;PCA_FLDA_GUI_driver.c,2533 :: 		circle_button_idx++;
LDRB	R1, [SP, #20]
ADDS	R1, R1, #1
STRB	R1, [SP, #20]
;PCA_FLDA_GUI_driver.c,2534 :: 		order++;
LDRSH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;PCA_FLDA_GUI_driver.c,2535 :: 		DrawCircleButton(local_circle_button);
LDR	R0, [SP, #24]
BL	_DrawCircleButton+0
;PCA_FLDA_GUI_driver.c,2536 :: 		}
L_DrawScreen96:
;PCA_FLDA_GUI_driver.c,2537 :: 		}
L_DrawScreen95:
;PCA_FLDA_GUI_driver.c,2539 :: 		if (radio_button_idx  < CurrentScreen->RadioButtonsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #32
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #28]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen97
;PCA_FLDA_GUI_driver.c,2540 :: 		local_radio_button = GetRadioButton(radio_button_idx);
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
;PCA_FLDA_GUI_driver.c,2541 :: 		if (order == local_radio_button->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRSH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen98
;PCA_FLDA_GUI_driver.c,2542 :: 		radio_button_idx++;
LDRB	R1, [SP, #28]
ADDS	R1, R1, #1
STRB	R1, [SP, #28]
;PCA_FLDA_GUI_driver.c,2543 :: 		order++;
LDRSH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;PCA_FLDA_GUI_driver.c,2544 :: 		DrawRadioButton(local_radio_button);
LDR	R0, [SP, #32]
BL	_DrawRadioButton+0
;PCA_FLDA_GUI_driver.c,2545 :: 		}
L_DrawScreen98:
;PCA_FLDA_GUI_driver.c,2546 :: 		}
L_DrawScreen97:
;PCA_FLDA_GUI_driver.c,2548 :: 		if (progress_bar_idx  < CurrentScreen->ProgressBarsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #40
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #36]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen99
;PCA_FLDA_GUI_driver.c,2549 :: 		local_progress_bar = GetProgressBar(progress_bar_idx);
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
;PCA_FLDA_GUI_driver.c,2550 :: 		if (order == local_progress_bar->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRSH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen100
;PCA_FLDA_GUI_driver.c,2551 :: 		progress_bar_idx++;
LDRB	R1, [SP, #36]
ADDS	R1, R1, #1
STRB	R1, [SP, #36]
;PCA_FLDA_GUI_driver.c,2552 :: 		order++;
LDRSH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;PCA_FLDA_GUI_driver.c,2553 :: 		DrawProgressBar(local_progress_bar);
LDR	R0, [SP, #40]
BL	_DrawProgressBar+0
;PCA_FLDA_GUI_driver.c,2554 :: 		}
L_DrawScreen100:
;PCA_FLDA_GUI_driver.c,2555 :: 		}
L_DrawScreen99:
;PCA_FLDA_GUI_driver.c,2557 :: 		}
IT	AL
BAL	L_DrawScreen89
L_DrawScreen90:
;PCA_FLDA_GUI_driver.c,2558 :: 		}
L_end_DrawScreen:
LDR	LR, [SP, #0]
ADD	SP, SP, #64
BX	LR
; end of _DrawScreen
_Get_Object:
;PCA_FLDA_GUI_driver.c,2560 :: 		void Get_Object(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; Y start address is: 4 (R1)
;PCA_FLDA_GUI_driver.c,2561 :: 		round_button_order  = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
STRH	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2562 :: 		label_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2563 :: 		circle_button_order = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_circle_button_order+0)
MOVT	R2, #hi_addr(_circle_button_order+0)
STRH	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2564 :: 		radio_button_order    = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
STRH	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2565 :: 		progress_bar_order    = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_progress_bar_order+0)
MOVT	R2, #hi_addr(_progress_bar_order+0)
STRH	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2567 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 4 (R1)
UXTH	R8, R0
UXTH	R7, R1
L_Get_Object101:
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
BCS	L_Get_Object102
;PCA_FLDA_GUI_driver.c,2568 :: 		local_round_button = GetRoundButton(_object_count);
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
;PCA_FLDA_GUI_driver.c,2569 :: 		if (local_round_button->Active == 1) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object104
;PCA_FLDA_GUI_driver.c,2571 :: 		local_round_button->Width, local_round_button->Height) == 1) {
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
;PCA_FLDA_GUI_driver.c,2570 :: 		if (IsInsideObject(X, Y, local_round_button->Left, local_round_button->Top,
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
;PCA_FLDA_GUI_driver.c,2571 :: 		local_round_button->Width, local_round_button->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	PCA_FLDA_GUI_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object105
;PCA_FLDA_GUI_driver.c,2572 :: 		round_button_order = local_round_button->Order;
MOVW	R4, #lo_addr(_local_round_button+0)
MOVT	R4, #hi_addr(_local_round_button+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
STRH	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2573 :: 		exec_round_button = local_round_button;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2574 :: 		}
L_Get_Object105:
;PCA_FLDA_GUI_driver.c,2575 :: 		}
L_Get_Object104:
;PCA_FLDA_GUI_driver.c,2567 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;PCA_FLDA_GUI_driver.c,2576 :: 		}
IT	AL
BAL	L_Get_Object101
L_Get_Object102:
;PCA_FLDA_GUI_driver.c,2579 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
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
L_Get_Object106:
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
BCS	L_Get_Object107
;PCA_FLDA_GUI_driver.c,2580 :: 		local_label = GetLabel(_object_count);
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
;PCA_FLDA_GUI_driver.c,2581 :: 		if (local_label->Active == 1) {
ADDW	R2, R3, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object109
;PCA_FLDA_GUI_driver.c,2583 :: 		local_label->Width, local_label->Height) == 1) {
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
;PCA_FLDA_GUI_driver.c,2582 :: 		if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
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
;PCA_FLDA_GUI_driver.c,2583 :: 		local_label->Width, local_label->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	PCA_FLDA_GUI_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object110
;PCA_FLDA_GUI_driver.c,2584 :: 		label_order = local_label->Order;
MOVW	R4, #lo_addr(_local_label+0)
MOVT	R4, #hi_addr(_local_label+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2585 :: 		exec_label = local_label;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2586 :: 		}
L_Get_Object110:
;PCA_FLDA_GUI_driver.c,2587 :: 		}
L_Get_Object109:
;PCA_FLDA_GUI_driver.c,2579 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;PCA_FLDA_GUI_driver.c,2588 :: 		}
IT	AL
BAL	L_Get_Object106
L_Get_Object107:
;PCA_FLDA_GUI_driver.c,2591 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CircleButtonsCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
L_Get_Object111:
; Y start address is: 32 (R8)
; X start address is: 28 (R7)
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
BCS	L_Get_Object112
;PCA_FLDA_GUI_driver.c,2592 :: 		local_circle_button = GetCircleButton(_object_count);
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
MOVW	R2, #lo_addr(_local_circle_button+0)
MOVT	R2, #hi_addr(_local_circle_button+0)
STR	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2593 :: 		if (local_circle_button->Active == 1) {
ADDW	R2, R3, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object114
;PCA_FLDA_GUI_driver.c,2595 :: 		(local_circle_button->Radius * 2), (local_circle_button->Radius * 2)) == 1) {
MOVW	R5, #lo_addr(_local_circle_button+0)
MOVT	R5, #hi_addr(_local_circle_button+0)
LDR	R2, [R5, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
LSLS	R4, R2, #1
UXTH	R4, R4
;PCA_FLDA_GUI_driver.c,2594 :: 		if (IsInsideObject(X, Y, local_circle_button->Left, local_circle_button->Top,
MOV	R2, R5
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R5
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R8
UXTH	R0, R7
;PCA_FLDA_GUI_driver.c,2595 :: 		(local_circle_button->Radius * 2), (local_circle_button->Radius * 2)) == 1) {
PUSH	(R4)
PUSH	(R4)
BL	PCA_FLDA_GUI_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object115
;PCA_FLDA_GUI_driver.c,2596 :: 		circle_button_order = local_circle_button->Order;
MOVW	R4, #lo_addr(_local_circle_button+0)
MOVT	R4, #hi_addr(_local_circle_button+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_circle_button_order+0)
MOVT	R2, #hi_addr(_circle_button_order+0)
STRH	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2597 :: 		exec_circle_button = local_circle_button;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
STR	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2598 :: 		}
L_Get_Object115:
;PCA_FLDA_GUI_driver.c,2599 :: 		}
L_Get_Object114:
;PCA_FLDA_GUI_driver.c,2591 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CircleButtonsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;PCA_FLDA_GUI_driver.c,2600 :: 		}
IT	AL
BAL	L_Get_Object111
L_Get_Object112:
;PCA_FLDA_GUI_driver.c,2603 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->RadioButtonsCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
L_Get_Object116:
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
BCS	L_Get_Object117
;PCA_FLDA_GUI_driver.c,2604 :: 		local_radio_button = GetRadioButton(_object_count);
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
;PCA_FLDA_GUI_driver.c,2605 :: 		if (local_radio_button->Active == 1) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object119
;PCA_FLDA_GUI_driver.c,2607 :: 		local_radio_button->Width, local_radio_button->Height) == 1) {
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
;PCA_FLDA_GUI_driver.c,2606 :: 		if (IsInsideObject(X, Y, local_radio_button->Left, local_radio_button->Top,
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
;PCA_FLDA_GUI_driver.c,2607 :: 		local_radio_button->Width, local_radio_button->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	PCA_FLDA_GUI_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object120
;PCA_FLDA_GUI_driver.c,2608 :: 		radio_button_order = local_radio_button->Order;
MOVW	R4, #lo_addr(_local_radio_button+0)
MOVT	R4, #hi_addr(_local_radio_button+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
STRH	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2609 :: 		exec_radio_button = local_radio_button;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
STR	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2610 :: 		}
L_Get_Object120:
;PCA_FLDA_GUI_driver.c,2611 :: 		}
L_Get_Object119:
;PCA_FLDA_GUI_driver.c,2603 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->RadioButtonsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;PCA_FLDA_GUI_driver.c,2612 :: 		}
IT	AL
BAL	L_Get_Object116
L_Get_Object117:
;PCA_FLDA_GUI_driver.c,2615 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ProgressBarsCount ; _object_count++ ) {
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
L_Get_Object121:
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
BCS	L_Get_Object122
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
;PCA_FLDA_GUI_driver.c,2616 :: 		local_progress_bar = GetProgressBar(_object_count);
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
;PCA_FLDA_GUI_driver.c,2617 :: 		if (local_progress_bar->Active == 1) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object124
;PCA_FLDA_GUI_driver.c,2619 :: 		local_progress_bar->Width, local_progress_bar->Height) == 1) {
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
;PCA_FLDA_GUI_driver.c,2618 :: 		if (IsInsideObject(X, Y, local_progress_bar->Left, local_progress_bar->Top,
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
;PCA_FLDA_GUI_driver.c,2619 :: 		local_progress_bar->Width, local_progress_bar->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	PCA_FLDA_GUI_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object125
;PCA_FLDA_GUI_driver.c,2620 :: 		progress_bar_order = local_progress_bar->Order;
MOVW	R4, #lo_addr(_local_progress_bar+0)
MOVT	R4, #hi_addr(_local_progress_bar+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_progress_bar_order+0)
MOVT	R2, #hi_addr(_progress_bar_order+0)
STRH	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2621 :: 		exec_progress_bar = local_progress_bar;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_progress_bar+0)
MOVT	R2, #hi_addr(_exec_progress_bar+0)
STR	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2622 :: 		}
L_Get_Object125:
;PCA_FLDA_GUI_driver.c,2623 :: 		}
L_Get_Object124:
;PCA_FLDA_GUI_driver.c,2615 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ProgressBarsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;PCA_FLDA_GUI_driver.c,2624 :: 		}
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
IT	AL
BAL	L_Get_Object121
L_Get_Object122:
;PCA_FLDA_GUI_driver.c,2626 :: 		_object_count = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2627 :: 		if (round_button_order > _object_count)
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	LE
BLE	L_Get_Object126
;PCA_FLDA_GUI_driver.c,2628 :: 		_object_count = round_button_order;
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object126:
;PCA_FLDA_GUI_driver.c,2629 :: 		if (label_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object127
;PCA_FLDA_GUI_driver.c,2630 :: 		_object_count = label_order;
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object127:
;PCA_FLDA_GUI_driver.c,2631 :: 		if (circle_button_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_circle_button_order+0)
MOVT	R2, #hi_addr(_circle_button_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object128
;PCA_FLDA_GUI_driver.c,2632 :: 		_object_count = circle_button_order;
MOVW	R2, #lo_addr(_circle_button_order+0)
MOVT	R2, #hi_addr(_circle_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object128:
;PCA_FLDA_GUI_driver.c,2633 :: 		if (radio_button_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object129
;PCA_FLDA_GUI_driver.c,2634 :: 		_object_count = radio_button_order;
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object129:
;PCA_FLDA_GUI_driver.c,2635 :: 		if (progress_bar_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_progress_bar_order+0)
MOVT	R2, #hi_addr(_progress_bar_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object130
;PCA_FLDA_GUI_driver.c,2636 :: 		_object_count = progress_bar_order;
MOVW	R2, #lo_addr(_progress_bar_order+0)
MOVT	R2, #hi_addr(_progress_bar_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object130:
;PCA_FLDA_GUI_driver.c,2637 :: 		}
L_end_Get_Object:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Get_Object
PCA_FLDA_GUI_driver_Process_TP_Press:
;PCA_FLDA_GUI_driver.c,2640 :: 		static void Process_TP_Press(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; Y start address is: 4 (R1)
;PCA_FLDA_GUI_driver.c,2641 :: 		exec_round_button   = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2642 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2643 :: 		exec_circle_button  = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
STR	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2644 :: 		exec_radio_button     = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
STR	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2645 :: 		exec_progress_bar     = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_progress_bar+0)
MOVT	R2, #hi_addr(_exec_progress_bar+0)
STR	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2647 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
BL	_Get_Object+0
;PCA_FLDA_GUI_driver.c,2650 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_PCA_FLDA_GUI_driver_Process_TP_Press131
;PCA_FLDA_GUI_driver.c,2651 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Press132
;PCA_FLDA_GUI_driver.c,2652 :: 		if (exec_round_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Press133
;PCA_FLDA_GUI_driver.c,2653 :: 		if (exec_round_button->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_PCA_FLDA_GUI_driver_Process_TP_Press134
;PCA_FLDA_GUI_driver.c,2654 :: 		exec_round_button->OnPressPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R2, [R4, #0]
BLX	R2
;PCA_FLDA_GUI_driver.c,2655 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;PCA_FLDA_GUI_driver.c,2656 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Press134:
;PCA_FLDA_GUI_driver.c,2657 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Press133:
;PCA_FLDA_GUI_driver.c,2658 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Press132:
;PCA_FLDA_GUI_driver.c,2660 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Press135
;PCA_FLDA_GUI_driver.c,2661 :: 		if (exec_label->Active == 1) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Press136
;PCA_FLDA_GUI_driver.c,2662 :: 		if (exec_label->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_PCA_FLDA_GUI_driver_Process_TP_Press137
;PCA_FLDA_GUI_driver.c,2663 :: 		exec_label->OnPressPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
;PCA_FLDA_GUI_driver.c,2664 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;PCA_FLDA_GUI_driver.c,2665 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Press137:
;PCA_FLDA_GUI_driver.c,2666 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Press136:
;PCA_FLDA_GUI_driver.c,2667 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Press135:
;PCA_FLDA_GUI_driver.c,2669 :: 		if (_object_count == circle_button_order) {
MOVW	R2, #lo_addr(_circle_button_order+0)
MOVT	R2, #hi_addr(_circle_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Press138
;PCA_FLDA_GUI_driver.c,2670 :: 		if (exec_circle_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Press139
;PCA_FLDA_GUI_driver.c,2671 :: 		if (exec_circle_button->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_PCA_FLDA_GUI_driver_Process_TP_Press140
;PCA_FLDA_GUI_driver.c,2672 :: 		exec_circle_button->OnPressPtr();
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R2, [R4, #0]
BLX	R2
;PCA_FLDA_GUI_driver.c,2673 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;PCA_FLDA_GUI_driver.c,2674 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Press140:
;PCA_FLDA_GUI_driver.c,2675 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Press139:
;PCA_FLDA_GUI_driver.c,2676 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Press138:
;PCA_FLDA_GUI_driver.c,2678 :: 		if (_object_count == radio_button_order) {
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Press141
;PCA_FLDA_GUI_driver.c,2679 :: 		if (exec_radio_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Press142
;PCA_FLDA_GUI_driver.c,2680 :: 		if (exec_radio_button->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_PCA_FLDA_GUI_driver_Process_TP_Press143
;PCA_FLDA_GUI_driver.c,2681 :: 		exec_radio_button->OnPressPtr();
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R2, [R4, #0]
BLX	R2
;PCA_FLDA_GUI_driver.c,2682 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;PCA_FLDA_GUI_driver.c,2683 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Press143:
;PCA_FLDA_GUI_driver.c,2684 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Press142:
;PCA_FLDA_GUI_driver.c,2685 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Press141:
;PCA_FLDA_GUI_driver.c,2687 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Press131:
;PCA_FLDA_GUI_driver.c,2688 :: 		}
L_end_Process_TP_Press:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of PCA_FLDA_GUI_driver_Process_TP_Press
PCA_FLDA_GUI_driver_Process_TP_Up:
;PCA_FLDA_GUI_driver.c,2690 :: 		static void Process_TP_Up(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; Y start address is: 4 (R1)
;PCA_FLDA_GUI_driver.c,2692 :: 		switch (PressedObjectType) {
IT	AL
BAL	L_PCA_FLDA_GUI_driver_Process_TP_Up144
;PCA_FLDA_GUI_driver.c,2694 :: 		case 1: {
L_PCA_FLDA_GUI_driver_Process_TP_Up146:
;PCA_FLDA_GUI_driver.c,2695 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_PCA_FLDA_GUI_driver_Process_TP_Up147
;PCA_FLDA_GUI_driver.c,2696 :: 		exec_round_button = (TButton_Round*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2697 :: 		if ((exec_round_button->PressColEnabled == 1) && (exec_round_button->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #47
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Up222
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Up221
L_PCA_FLDA_GUI_driver_Process_TP_Up220:
;PCA_FLDA_GUI_driver.c,2698 :: 		DrawRoundButton(exec_round_button);
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawRoundButton+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;PCA_FLDA_GUI_driver.c,2697 :: 		if ((exec_round_button->PressColEnabled == 1) && (exec_round_button->OwnerScreen == CurrentScreen)) {
L_PCA_FLDA_GUI_driver_Process_TP_Up222:
L_PCA_FLDA_GUI_driver_Process_TP_Up221:
;PCA_FLDA_GUI_driver.c,2700 :: 		break;
IT	AL
BAL	L_PCA_FLDA_GUI_driver_Process_TP_Up145
;PCA_FLDA_GUI_driver.c,2701 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Up147:
;PCA_FLDA_GUI_driver.c,2702 :: 		break;
IT	AL
BAL	L_PCA_FLDA_GUI_driver_Process_TP_Up145
;PCA_FLDA_GUI_driver.c,2705 :: 		case 5: {
L_PCA_FLDA_GUI_driver_Process_TP_Up151:
;PCA_FLDA_GUI_driver.c,2706 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_PCA_FLDA_GUI_driver_Process_TP_Up152
;PCA_FLDA_GUI_driver.c,2707 :: 		exec_circle_button = (TCircleButton*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
STR	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2708 :: 		if ((exec_circle_button->PressColEnabled == 1) && (exec_circle_button->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #42
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Up224
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Up223
L_PCA_FLDA_GUI_driver_Process_TP_Up219:
;PCA_FLDA_GUI_driver.c,2709 :: 		DrawCircleButton(exec_circle_button);
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawCircleButton+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;PCA_FLDA_GUI_driver.c,2708 :: 		if ((exec_circle_button->PressColEnabled == 1) && (exec_circle_button->OwnerScreen == CurrentScreen)) {
L_PCA_FLDA_GUI_driver_Process_TP_Up224:
L_PCA_FLDA_GUI_driver_Process_TP_Up223:
;PCA_FLDA_GUI_driver.c,2711 :: 		break;
IT	AL
BAL	L_PCA_FLDA_GUI_driver_Process_TP_Up145
;PCA_FLDA_GUI_driver.c,2712 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Up152:
;PCA_FLDA_GUI_driver.c,2713 :: 		break;
IT	AL
BAL	L_PCA_FLDA_GUI_driver_Process_TP_Up145
;PCA_FLDA_GUI_driver.c,2716 :: 		case 17: {
L_PCA_FLDA_GUI_driver_Process_TP_Up156:
;PCA_FLDA_GUI_driver.c,2717 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_PCA_FLDA_GUI_driver_Process_TP_Up157
;PCA_FLDA_GUI_driver.c,2718 :: 		exec_radio_button = (TRadioButton*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
STR	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2719 :: 		if ((exec_radio_button->PressColEnabled == 1) && (exec_radio_button->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #48
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Up226
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Up225
L_PCA_FLDA_GUI_driver_Process_TP_Up218:
;PCA_FLDA_GUI_driver.c,2720 :: 		DrawRadioButton(exec_radio_button);
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawRadioButton+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;PCA_FLDA_GUI_driver.c,2719 :: 		if ((exec_radio_button->PressColEnabled == 1) && (exec_radio_button->OwnerScreen == CurrentScreen)) {
L_PCA_FLDA_GUI_driver_Process_TP_Up226:
L_PCA_FLDA_GUI_driver_Process_TP_Up225:
;PCA_FLDA_GUI_driver.c,2722 :: 		break;
IT	AL
BAL	L_PCA_FLDA_GUI_driver_Process_TP_Up145
;PCA_FLDA_GUI_driver.c,2723 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Up157:
;PCA_FLDA_GUI_driver.c,2724 :: 		break;
IT	AL
BAL	L_PCA_FLDA_GUI_driver_Process_TP_Up145
;PCA_FLDA_GUI_driver.c,2726 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Up144:
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #1
IT	EQ
BEQ	L_PCA_FLDA_GUI_driver_Process_TP_Up146
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #5
IT	EQ
BEQ	L_PCA_FLDA_GUI_driver_Process_TP_Up151
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #17
IT	EQ
BEQ	L_PCA_FLDA_GUI_driver_Process_TP_Up156
; Y end address is: 4 (R1)
L_PCA_FLDA_GUI_driver_Process_TP_Up145:
;PCA_FLDA_GUI_driver.c,2728 :: 		exec_label          = 0;
; Y start address is: 4 (R1)
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2730 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
BL	_Get_Object+0
;PCA_FLDA_GUI_driver.c,2733 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_PCA_FLDA_GUI_driver_Process_TP_Up161
;PCA_FLDA_GUI_driver.c,2735 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Up162
;PCA_FLDA_GUI_driver.c,2736 :: 		if (exec_round_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Up163
;PCA_FLDA_GUI_driver.c,2737 :: 		if (exec_round_button->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_PCA_FLDA_GUI_driver_Process_TP_Up164
;PCA_FLDA_GUI_driver.c,2738 :: 		exec_round_button->OnUpPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R2, [R4, #0]
BLX	R2
L_PCA_FLDA_GUI_driver_Process_TP_Up164:
;PCA_FLDA_GUI_driver.c,2739 :: 		if (PressedObject == (void *)exec_round_button)
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Up165
;PCA_FLDA_GUI_driver.c,2740 :: 		if (exec_round_button->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_PCA_FLDA_GUI_driver_Process_TP_Up166
;PCA_FLDA_GUI_driver.c,2741 :: 		exec_round_button->OnClickPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R2, [R4, #0]
BLX	R2
L_PCA_FLDA_GUI_driver_Process_TP_Up166:
L_PCA_FLDA_GUI_driver_Process_TP_Up165:
;PCA_FLDA_GUI_driver.c,2742 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2743 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2744 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;PCA_FLDA_GUI_driver.c,2745 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Up163:
;PCA_FLDA_GUI_driver.c,2746 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Up162:
;PCA_FLDA_GUI_driver.c,2749 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Up167
;PCA_FLDA_GUI_driver.c,2750 :: 		if (exec_label->Active == 1) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Up168
;PCA_FLDA_GUI_driver.c,2751 :: 		if (exec_label->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_PCA_FLDA_GUI_driver_Process_TP_Up169
;PCA_FLDA_GUI_driver.c,2752 :: 		exec_label->OnUpPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R2, [R4, #0]
BLX	R2
L_PCA_FLDA_GUI_driver_Process_TP_Up169:
;PCA_FLDA_GUI_driver.c,2753 :: 		if (PressedObject == (void *)exec_label)
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Up170
;PCA_FLDA_GUI_driver.c,2754 :: 		if (exec_label->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_PCA_FLDA_GUI_driver_Process_TP_Up171
;PCA_FLDA_GUI_driver.c,2755 :: 		exec_label->OnClickPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
L_PCA_FLDA_GUI_driver_Process_TP_Up171:
L_PCA_FLDA_GUI_driver_Process_TP_Up170:
;PCA_FLDA_GUI_driver.c,2756 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2757 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2758 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;PCA_FLDA_GUI_driver.c,2759 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Up168:
;PCA_FLDA_GUI_driver.c,2760 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Up167:
;PCA_FLDA_GUI_driver.c,2763 :: 		if (_object_count == circle_button_order) {
MOVW	R2, #lo_addr(_circle_button_order+0)
MOVT	R2, #hi_addr(_circle_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Up172
;PCA_FLDA_GUI_driver.c,2764 :: 		if (exec_circle_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Up173
;PCA_FLDA_GUI_driver.c,2765 :: 		if (exec_circle_button->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_PCA_FLDA_GUI_driver_Process_TP_Up174
;PCA_FLDA_GUI_driver.c,2766 :: 		exec_circle_button->OnUpPtr();
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R2, [R4, #0]
BLX	R2
L_PCA_FLDA_GUI_driver_Process_TP_Up174:
;PCA_FLDA_GUI_driver.c,2767 :: 		if (PressedObject == (void *)exec_circle_button)
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Up175
;PCA_FLDA_GUI_driver.c,2768 :: 		if (exec_circle_button->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_PCA_FLDA_GUI_driver_Process_TP_Up176
;PCA_FLDA_GUI_driver.c,2769 :: 		exec_circle_button->OnClickPtr();
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R2, [R4, #0]
BLX	R2
L_PCA_FLDA_GUI_driver_Process_TP_Up176:
L_PCA_FLDA_GUI_driver_Process_TP_Up175:
;PCA_FLDA_GUI_driver.c,2770 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2771 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2772 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;PCA_FLDA_GUI_driver.c,2773 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Up173:
;PCA_FLDA_GUI_driver.c,2774 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Up172:
;PCA_FLDA_GUI_driver.c,2777 :: 		if (_object_count == radio_button_order) {
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Up177
;PCA_FLDA_GUI_driver.c,2778 :: 		if (exec_radio_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Up178
;PCA_FLDA_GUI_driver.c,2779 :: 		if (exec_radio_button->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_PCA_FLDA_GUI_driver_Process_TP_Up179
;PCA_FLDA_GUI_driver.c,2780 :: 		exec_radio_button->OnUpPtr();
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R2, [R4, #0]
BLX	R2
L_PCA_FLDA_GUI_driver_Process_TP_Up179:
;PCA_FLDA_GUI_driver.c,2781 :: 		if (PressedObject == (void *)exec_radio_button)
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Up180
;PCA_FLDA_GUI_driver.c,2782 :: 		if (exec_radio_button->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_PCA_FLDA_GUI_driver_Process_TP_Up181
;PCA_FLDA_GUI_driver.c,2783 :: 		exec_radio_button->OnClickPtr();
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R2, [R4, #0]
BLX	R2
L_PCA_FLDA_GUI_driver_Process_TP_Up181:
L_PCA_FLDA_GUI_driver_Process_TP_Up180:
;PCA_FLDA_GUI_driver.c,2784 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2785 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2786 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;PCA_FLDA_GUI_driver.c,2787 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Up178:
;PCA_FLDA_GUI_driver.c,2788 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Up177:
;PCA_FLDA_GUI_driver.c,2790 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Up161:
;PCA_FLDA_GUI_driver.c,2791 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2792 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2793 :: 		}
L_end_Process_TP_Up:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of PCA_FLDA_GUI_driver_Process_TP_Up
PCA_FLDA_GUI_driver_Process_TP_Down:
;PCA_FLDA_GUI_driver.c,2795 :: 		static void Process_TP_Down(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; Y start address is: 4 (R1)
;PCA_FLDA_GUI_driver.c,2797 :: 		object_pressed      = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2798 :: 		exec_round_button   = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2799 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2800 :: 		exec_circle_button  = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
STR	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2801 :: 		exec_radio_button     = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
STR	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2803 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
BL	_Get_Object+0
;PCA_FLDA_GUI_driver.c,2805 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_PCA_FLDA_GUI_driver_Process_TP_Down182
;PCA_FLDA_GUI_driver.c,2806 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Down183
;PCA_FLDA_GUI_driver.c,2807 :: 		if (exec_round_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Down184
;PCA_FLDA_GUI_driver.c,2808 :: 		if (exec_round_button->PressColEnabled == 1) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #47
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Down185
;PCA_FLDA_GUI_driver.c,2809 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2810 :: 		DrawRoundButton(exec_round_button);
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawRoundButton+0
;PCA_FLDA_GUI_driver.c,2811 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Down185:
;PCA_FLDA_GUI_driver.c,2812 :: 		PressedObject = (void *)exec_round_button;
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2813 :: 		PressedObjectType = 1;
MOVS	R3, #1
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2814 :: 		if (exec_round_button->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_PCA_FLDA_GUI_driver_Process_TP_Down186
;PCA_FLDA_GUI_driver.c,2815 :: 		exec_round_button->OnDownPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R2, [R4, #0]
BLX	R2
;PCA_FLDA_GUI_driver.c,2816 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;PCA_FLDA_GUI_driver.c,2817 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Down186:
;PCA_FLDA_GUI_driver.c,2818 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Down184:
;PCA_FLDA_GUI_driver.c,2819 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Down183:
;PCA_FLDA_GUI_driver.c,2821 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Down187
;PCA_FLDA_GUI_driver.c,2822 :: 		if (exec_label->Active == 1) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Down188
;PCA_FLDA_GUI_driver.c,2823 :: 		PressedObject = (void *)exec_label;
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2824 :: 		PressedObjectType = 2;
MOVS	R3, #2
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2825 :: 		if (exec_label->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_PCA_FLDA_GUI_driver_Process_TP_Down189
;PCA_FLDA_GUI_driver.c,2826 :: 		exec_label->OnDownPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
;PCA_FLDA_GUI_driver.c,2827 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;PCA_FLDA_GUI_driver.c,2828 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Down189:
;PCA_FLDA_GUI_driver.c,2829 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Down188:
;PCA_FLDA_GUI_driver.c,2830 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Down187:
;PCA_FLDA_GUI_driver.c,2832 :: 		if (_object_count == circle_button_order) {
MOVW	R2, #lo_addr(_circle_button_order+0)
MOVT	R2, #hi_addr(_circle_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Down190
;PCA_FLDA_GUI_driver.c,2833 :: 		if (exec_circle_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Down191
;PCA_FLDA_GUI_driver.c,2834 :: 		if (exec_circle_button->PressColEnabled == 1) {
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #42
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Down192
;PCA_FLDA_GUI_driver.c,2835 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2836 :: 		DrawCircleButton(exec_circle_button);
MOVW	R2, #lo_addr(_exec_circle_button+0)
MOVT	R2, #hi_addr(_exec_circle_button+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawCircleButton+0
;PCA_FLDA_GUI_driver.c,2837 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Down192:
;PCA_FLDA_GUI_driver.c,2838 :: 		PressedObject = (void *)exec_circle_button;
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2839 :: 		PressedObjectType = 5;
MOVS	R3, #5
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2840 :: 		if (exec_circle_button->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_PCA_FLDA_GUI_driver_Process_TP_Down193
;PCA_FLDA_GUI_driver.c,2841 :: 		exec_circle_button->OnDownPtr();
MOVW	R4, #lo_addr(_exec_circle_button+0)
MOVT	R4, #hi_addr(_exec_circle_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R2, [R4, #0]
BLX	R2
;PCA_FLDA_GUI_driver.c,2842 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;PCA_FLDA_GUI_driver.c,2843 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Down193:
;PCA_FLDA_GUI_driver.c,2844 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Down191:
;PCA_FLDA_GUI_driver.c,2845 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Down190:
;PCA_FLDA_GUI_driver.c,2847 :: 		if (_object_count == radio_button_order) {
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Down194
;PCA_FLDA_GUI_driver.c,2848 :: 		if (exec_radio_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Down195
;PCA_FLDA_GUI_driver.c,2849 :: 		if (exec_radio_button->PressColEnabled == 1) {
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #48
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_PCA_FLDA_GUI_driver_Process_TP_Down196
;PCA_FLDA_GUI_driver.c,2850 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2851 :: 		DrawRadioButton(exec_radio_button);
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawRadioButton+0
;PCA_FLDA_GUI_driver.c,2852 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Down196:
;PCA_FLDA_GUI_driver.c,2853 :: 		PressedObject = (void *)exec_radio_button;
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2854 :: 		PressedObjectType = 17;
MOVS	R3, #17
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;PCA_FLDA_GUI_driver.c,2855 :: 		if (exec_radio_button->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_PCA_FLDA_GUI_driver_Process_TP_Down197
;PCA_FLDA_GUI_driver.c,2856 :: 		exec_radio_button->OnDownPtr();
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R2, [R4, #0]
BLX	R2
;PCA_FLDA_GUI_driver.c,2857 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;PCA_FLDA_GUI_driver.c,2858 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Down197:
;PCA_FLDA_GUI_driver.c,2859 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Down195:
;PCA_FLDA_GUI_driver.c,2860 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Down194:
;PCA_FLDA_GUI_driver.c,2862 :: 		}
L_PCA_FLDA_GUI_driver_Process_TP_Down182:
;PCA_FLDA_GUI_driver.c,2863 :: 		}
L_end_Process_TP_Down:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of PCA_FLDA_GUI_driver_Process_TP_Down
_Check_TP:
;PCA_FLDA_GUI_driver.c,2865 :: 		void Check_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PCA_FLDA_GUI_driver.c,2866 :: 		if (TP_TFT_Press_Detect()) {
BL	_TP_TFT_Press_Detect+0
CMP	R0, #0
IT	EQ
BEQ	L_Check_TP198
;PCA_FLDA_GUI_driver.c,2868 :: 		if (TP_TFT_Get_Coordinates(&Xcoord, &Ycoord) == 0) {
MOVW	R1, #lo_addr(_Ycoord+0)
MOVT	R1, #hi_addr(_Ycoord+0)
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
BL	_TP_TFT_Get_Coordinates+0
CMP	R0, #0
IT	NE
BNE	L_Check_TP199
;PCA_FLDA_GUI_driver.c,2869 :: 		Process_TP_Press(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	PCA_FLDA_GUI_driver_Process_TP_Press+0
;PCA_FLDA_GUI_driver.c,2870 :: 		if (PenDown == 0) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Check_TP200
;PCA_FLDA_GUI_driver.c,2871 :: 		PenDown = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2872 :: 		Process_TP_Down(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	PCA_FLDA_GUI_driver_Process_TP_Down+0
;PCA_FLDA_GUI_driver.c,2873 :: 		}
L_Check_TP200:
;PCA_FLDA_GUI_driver.c,2874 :: 		}
L_Check_TP199:
;PCA_FLDA_GUI_driver.c,2875 :: 		}
IT	AL
BAL	L_Check_TP201
L_Check_TP198:
;PCA_FLDA_GUI_driver.c,2876 :: 		else if (PenDown == 1) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Check_TP202
;PCA_FLDA_GUI_driver.c,2877 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2878 :: 		Process_TP_Up(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	PCA_FLDA_GUI_driver_Process_TP_Up+0
;PCA_FLDA_GUI_driver.c,2879 :: 		}
L_Check_TP202:
L_Check_TP201:
;PCA_FLDA_GUI_driver.c,2880 :: 		}
L_end_Check_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Check_TP
_Init_MCU:
;PCA_FLDA_GUI_driver.c,2882 :: 		void Init_MCU() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PCA_FLDA_GUI_driver.c,2883 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_9);
MOVW	R1, #512
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;PCA_FLDA_GUI_driver.c,2884 :: 		TFT_BLED = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2885 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;PCA_FLDA_GUI_driver.c,2886 :: 		TP_TFT_Set_Default_Mode();
BL	_TP_TFT_Set_Default_Mode+0
;PCA_FLDA_GUI_driver.c,2887 :: 		}
L_end_Init_MCU:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_MCU
_Init_Ext_Mem:
;PCA_FLDA_GUI_driver.c,2889 :: 		void Init_Ext_Mem() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PCA_FLDA_GUI_driver.c,2894 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
MOVW	R2, #lo_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
;PCA_FLDA_GUI_driver.c,2893 :: 		_SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
MOVW	R1, #772
;PCA_FLDA_GUI_driver.c,2891 :: 		SPI3_Init_Advanced(_SPI_FPCLK_DIV64, _SPI_MASTER | _SPI_8_BIT |
MOVS	R0, #5
;PCA_FLDA_GUI_driver.c,2894 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
BL	_SPI3_Init_Advanced+0
;PCA_FLDA_GUI_driver.c,2895 :: 		Delay_ms(10);
MOVW	R7, #35710
MOVT	R7, #8
NOP
NOP
L_Init_Ext_Mem203:
SUBS	R7, R7, #1
BNE	L_Init_Ext_Mem203
NOP
NOP
NOP
;PCA_FLDA_GUI_driver.c,2897 :: 		if (!Mmc_Fat_Init()) {
BL	_Mmc_Fat_Init+0
CMP	R0, #0
IT	NE
BNE	L_Init_Ext_Mem205
;PCA_FLDA_GUI_driver.c,2898 :: 		SPI3_CR1 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(SPI3_CR1+0)
MOVT	R0, #hi_addr(SPI3_CR1+0)
STR	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2903 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
MOVW	R2, #lo_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
;PCA_FLDA_GUI_driver.c,2902 :: 		_SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
MOVW	R1, #772
;PCA_FLDA_GUI_driver.c,2900 :: 		SPI3_Init_Advanced(_SPI_FPCLK_DIV2, _SPI_MASTER | _SPI_8_BIT |
MOVS	R0, #0
;PCA_FLDA_GUI_driver.c,2903 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
BL	_SPI3_Init_Advanced+0
;PCA_FLDA_GUI_driver.c,2905 :: 		Mmc_Fat_Assign("PCA_FLDA.RES", 0);
MOVW	R0, #lo_addr(?lstr7_PCA_FLDA_GUI_driver+0)
MOVT	R0, #hi_addr(?lstr7_PCA_FLDA_GUI_driver+0)
MOVS	R1, #0
BL	_Mmc_Fat_Assign+0
;PCA_FLDA_GUI_driver.c,2906 :: 		Mmc_Fat_Reset(&res_file_size);
MOVW	R0, #lo_addr(_res_file_size+0)
MOVT	R0, #hi_addr(_res_file_size+0)
BL	_Mmc_Fat_Reset+0
;PCA_FLDA_GUI_driver.c,2907 :: 		}
L_Init_Ext_Mem205:
;PCA_FLDA_GUI_driver.c,2908 :: 		}
L_end_Init_Ext_Mem:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_Ext_Mem
_Start_TP:
;PCA_FLDA_GUI_driver.c,2910 :: 		void Start_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;PCA_FLDA_GUI_driver.c,2911 :: 		Init_MCU();
BL	_Init_MCU+0
;PCA_FLDA_GUI_driver.c,2913 :: 		Init_Ext_Mem();
BL	_Init_Ext_Mem+0
;PCA_FLDA_GUI_driver.c,2915 :: 		InitializeTouchPanel();
BL	PCA_FLDA_GUI_driver_InitializeTouchPanel+0
;PCA_FLDA_GUI_driver.c,2917 :: 		Delay_ms(1000);
MOVW	R7, #32254
MOVT	R7, #854
NOP
NOP
L_Start_TP206:
SUBS	R7, R7, #1
BNE	L_Start_TP206
NOP
NOP
NOP
;PCA_FLDA_GUI_driver.c,2918 :: 		TFT_Fill_Screen(0);
MOVS	R0, #0
BL	_TFT_Fill_Screen+0
;PCA_FLDA_GUI_driver.c,2919 :: 		Calibrate();
BL	_Calibrate+0
;PCA_FLDA_GUI_driver.c,2920 :: 		TFT_Fill_Screen(0);
MOVS	R0, #0
BL	_TFT_Fill_Screen+0
;PCA_FLDA_GUI_driver.c,2922 :: 		InitializeObjects();
BL	PCA_FLDA_GUI_driver_InitializeObjects+0
;PCA_FLDA_GUI_driver.c,2923 :: 		display_width = Screen1.Width;
MOVW	R0, #lo_addr(_Screen1+2)
MOVT	R0, #hi_addr(_Screen1+2)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_width+0)
MOVT	R0, #hi_addr(_display_width+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2924 :: 		display_height = Screen1.Height;
MOVW	R0, #lo_addr(_Screen1+4)
MOVT	R0, #hi_addr(_Screen1+4)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_height+0)
MOVT	R0, #hi_addr(_display_height+0)
STRH	R1, [R0, #0]
;PCA_FLDA_GUI_driver.c,2925 :: 		DrawScreen(&Screen1);
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;PCA_FLDA_GUI_driver.c,2926 :: 		}
L_end_Start_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Start_TP
PCA_FLDA_GUI_driver____?ag:
SUB	SP, SP, #4
L_end_PCA_FLDA_GUI_driver___?ag:
ADD	SP, SP, #4
BX	LR
; end of PCA_FLDA_GUI_driver____?ag
