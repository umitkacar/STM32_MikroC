#line 1 "X:/ÝTÜ/MikroC TEZ/MAKALE_GUI/PCA_FLDA_GUI_Code/mikroC PRO for ARM/PCA_FLDA_GUI_driver.c"
#line 1 "x:/ÝtÜ/mikroc tez/makale_gui/pca_flda_gui_code/mikroc pro for arm/pca_flda_gui_objects.h"
typedef enum {_taLeft, _taCenter, _taRight} TTextAlign;

typedef struct Screen TScreen;

typedef struct Button_Round {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char *Caption;
 TTextAlign TextAlign;
 const char *FontName;
 unsigned int Font_Color;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char Corner_Radius;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TButton_Round;

typedef struct Label {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char *Caption;
 const char *FontName;
 unsigned int Font_Color;
 char Visible;
 char Active;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TLabel;

typedef struct CircleButton {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Radius;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char *Caption;
 TTextAlign TextAlign;
 const char *FontName;
 unsigned int Font_Color;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TCircleButton;

typedef struct RadioButton {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Checked;
 char Transparent;
 char *Caption;
 TTextAlign TextAlign;
 const char *FontName;
 unsigned int Font_Color;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 unsigned int Background_Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TRadioButton;

typedef struct ProgressBar {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char *Caption;
 const char *FontName;
 unsigned int Font_Color;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 unsigned int Background_Color;
 unsigned int Min;
 unsigned int Max;
 unsigned int Position;
 char Show_Position;
 char Show_Percentage;
 char Smooth;
 char Rounded;
 char Corner_Radius;
} TProgressBar;

struct Screen {
 unsigned int Color;
 unsigned int Width;
 unsigned int Height;
 unsigned short ObjectsCount;
 unsigned int Buttons_RoundCount;
 TButton_Round * const code *Buttons_Round;
 unsigned int LabelsCount;
 TLabel * const code *Labels;
 unsigned int CircleButtonsCount;
 TCircleButton * const code *CircleButtons;
 unsigned int RadioButtonsCount;
 TRadioButton * const code *RadioButtons;
 unsigned int ProgressBarsCount;
 TProgressBar * const code *ProgressBars;
};

extern TScreen Screen1;
extern TLabel Label1;
extern TLabel Label2;
extern TLabel Label3;
extern TLabel Label4;
extern TCircleButton CircleButton1;
extern TLabel * const code Screen1_Labels[4];
extern TCircleButton * const code Screen1_CircleButtons[1];


extern TScreen Screen2;
extern TButton_Round ButtonRound1;
extern TButton_Round ButtonRound2;
extern TLabel Label8;
extern TButton_Round ButtonRound8;
extern TButton_Round * const code Screen2_Buttons_Round[3];
extern TLabel * const code Screen2_Labels[1];


extern TScreen Screen3;
extern TButton_Round ButtonRound4;
extern TLabel Label7;
extern TLabel Label5;
extern TButton_Round * const code Screen3_Buttons_Round[1];
extern TLabel * const code Screen3_Labels[2];


extern TScreen Screen5;
extern TLabel Label6;
extern TRadioButton RadioButton7;
extern TRadioButton RadioButton8;
extern TRadioButton RadioButton9;
extern TRadioButton RadioButton10;
extern TRadioButton RadioButton11;
extern TRadioButton RadioButton1;
extern TRadioButton RadioButton2;
extern TLabel * const code Screen4_Labels[1];
extern TRadioButton * const code Screen4_RadioButtons[7];


extern TScreen Screen6;
extern TLabel Label9;
extern TLabel Label10;
extern TCircleButton CircleButton2;
extern TLabel * const code Screen5_Labels[2];
extern TCircleButton * const code Screen5_CircleButtons[1];


extern TScreen Screen7;
extern TLabel Label11;
extern TLabel * const code Screen6_Labels[1];


extern TScreen Screen8;
extern TLabel Label12;
extern TButton_Round ButtonRound5;
extern TButton_Round * const code Screen7_Buttons_Round[1];
extern TLabel * const code Screen7_Labels[1];


extern TScreen Screen9;
extern TLabel Label13;
extern TLabel * const code Screen8_Labels[1];


extern TScreen Screen10;
extern TCircleButton CircleButton3;
extern TLabel Label14;
extern TProgressBar ProgressBar1;
extern TLabel Label15;
extern TLabel * const code Screen9_Labels[2];
extern TCircleButton * const code Screen9_CircleButtons[1];
extern TProgressBar * const code Screen9_ProgressBars[1];


extern TScreen Screen11;
extern TLabel Label16;
extern TLabel Label17;
extern TLabel Label18;
extern TButton_Round ButtonRound6;
extern TButton_Round * const code Screen10_Buttons_Round[1];
extern TLabel * const code Screen10_Labels[3];


extern TScreen Screen12;
extern TLabel Label19;
extern TLabel Label31;
extern TLabel * const code Screen11_Labels[2];


extern TScreen Screen13;
extern TLabel Label20;
extern TLabel Label21;
extern TLabel Label22;
extern TButton_Round ButtonRound7;
extern TButton_Round * const code Screen12_Buttons_Round[1];
extern TLabel * const code Screen12_Labels[3];


extern TScreen Screen14;
extern TLabel Label23;
extern TLabel Label24;
extern TLabel Label25;
extern TRadioButton RadioButton12;
extern TRadioButton RadioButton13;
extern TRadioButton RadioButton14;
extern TRadioButton RadioButton15;
extern TRadioButton RadioButton16;
extern TRadioButton RadioButton17;
extern TLabel * const code Screen13_Labels[3];
extern TRadioButton * const code Screen13_RadioButtons[6];


extern TScreen Screen15;
extern TLabel Label26;
extern TLabel Label27;
extern TLabel Label28;
extern TCircleButton CircleButton4;
extern TLabel * const code Screen14_Labels[3];
extern TCircleButton * const code Screen14_CircleButtons[1];


extern TScreen Screen16;
extern TLabel Label29;
extern TLabel Label30;
extern TLabel * const code Screen15_Labels[2];


extern TScreen Screen17;
extern TLabel Label32;
extern TLabel Label33;
extern TLabel Label34;
extern TCircleButton CircleButton5;
extern TLabel * const code Screen16_Labels[3];
extern TCircleButton * const code Screen16_CircleButtons[1];


extern TScreen Screen18;
extern TLabel Label35;
extern TLabel * const code Screen17_Labels[1];


extern TScreen Screen19;
extern TLabel Label36;
extern TProgressBar ProgressBar2;
extern TLabel Label37;
extern TCircleButton CircleButton6;
extern TLabel * const code Screen18_Labels[2];
extern TCircleButton * const code Screen18_CircleButtons[1];
extern TProgressBar * const code Screen18_ProgressBars[1];


extern TScreen Screen20;
extern TLabel Label38;
extern TLabel * const code Screen19_Labels[1];





void DATABASE_SHOW();
void FLDA_CONTINUE();
void FLDA_PART_1_START();
void FLDA_PART_2_START();
void FLDA_RESULTS_MAIN();
void FLDA_SELECT();
void FLDA_TEST();
void J_E_2();
void J_E_3();
void J_E_4();
void J_E_5();
void J_E_6();
void J_E_7();
void J_E_8();
void JACOBI_SELECT();
void PCA_RESULTS_MAIN();
void PCA_SELECT();
void PCA_TEST_START();
void PCA_TRAINING_START();
void QR_SELECT();
void QR1_10();
void QR1_100();
void QR1_15();
void QR1_25();
void QR1_50();
void QR1_75();
void QR2_10();
void QR2_100();
void QR2_15();
void QR2_25();
void QR2_50();
void QR2_75();
void S1_START();




extern char Label1_Caption[];
extern char Label2_Caption[];
extern char Label3_Caption[];
extern char Label4_Caption[];
extern char CircleButton1_Caption[];
extern char ButtonRound1_Caption[];
extern char ButtonRound2_Caption[];
extern char Label8_Caption[];
extern char ButtonRound8_Caption[];
extern char ButtonRound4_Caption[];
extern char Label7_Caption[];
extern char Label5_Caption[];
extern char Label6_Caption[];
extern char RadioButton7_Caption[];
extern char RadioButton8_Caption[];
extern char RadioButton9_Caption[];
extern char RadioButton10_Caption[];
extern char RadioButton11_Caption[];
extern char RadioButton1_Caption[];
extern char RadioButton2_Caption[];
extern char Label9_Caption[];
extern char Label10_Caption[];
extern char CircleButton2_Caption[];
extern char Label11_Caption[];
extern char Label12_Caption[];
extern char ButtonRound5_Caption[];
extern char Label13_Caption[];
extern char CircleButton3_Caption[];
extern char Label14_Caption[];
extern char ProgressBar1_Caption[];
extern char Label15_Caption[];
extern char Label16_Caption[];
extern char Label17_Caption[];
extern char Label18_Caption[];
extern char ButtonRound6_Caption[];
extern char Label19_Caption[];
extern char Label31_Caption[];
extern char Label20_Caption[];
extern char Label21_Caption[];
extern char Label22_Caption[];
extern char ButtonRound7_Caption[];
extern char Label23_Caption[];
extern char Label24_Caption[];
extern char Label25_Caption[];
extern char RadioButton12_Caption[];
extern char RadioButton13_Caption[];
extern char RadioButton14_Caption[];
extern char RadioButton15_Caption[];
extern char RadioButton16_Caption[];
extern char RadioButton17_Caption[];
extern char Label26_Caption[];
extern char Label27_Caption[];
extern char Label28_Caption[];
extern char CircleButton4_Caption[];
extern char Label29_Caption[];
extern char Label30_Caption[];
extern char Label32_Caption[];
extern char Label33_Caption[];
extern char Label34_Caption[];
extern char CircleButton5_Caption[];
extern char Label35_Caption[];
extern char Label36_Caption[];
extern char ProgressBar2_Caption[];
extern char Label37_Caption[];
extern char CircleButton6_Caption[];
extern char Label38_Caption[];


void DrawScreen(TScreen *aScreen);
void DrawRoundButton(TButton_Round *Around_button);
void DrawLabel(TLabel *ALabel);
void DrawCircleButton(TCircleButton *ACircle_button);
void DrawRadioButton(TRadioButton *ARadioButton);
void DrawProgressBar(TProgressBar *AProgressBar);
void UpdatePBPosition(TProgressBar *AProgressBar);
void Check_TP();
void Start_TP();
#line 1 "x:/ÝtÜ/mikroc tez/makale_gui/pca_flda_gui_code/mikroc pro for arm/pca_flda_gui_resources.h"
#line 1 "c:/program files/mikroelektronika/mikroc pro for arm/include/built_in.h"
#line 7 "X:/ÝTÜ/MikroC TEZ/MAKALE_GUI/PCA_FLDA_GUI_Code/mikroC PRO for ARM/PCA_FLDA_GUI_driver.c"
sbit Mmc_Chip_Select at GPIOD_ODR.B3;


char Ext_Data_Buffer[512];
unsigned long currentSector = -1, res_file_size;





unsigned int TFT_DataPort at GPIOE_ODR;
sbit TFT_RST at GPIOE_ODR.B8;
sbit TFT_RS at GPIOE_ODR.B12;
sbit TFT_CS at GPIOE_ODR.B15;
sbit TFT_RD at GPIOE_ODR.B10;
sbit TFT_WR at GPIOE_ODR.B11;
sbit TFT_BLED at GPIOE_ODR.B9;



sbit DRIVEX_LEFT at GPIOB_ODR.B1;
sbit DRIVEX_RIGHT at GPIOB_ODR.B8;
sbit DRIVEY_UP at GPIOB_ODR.B9;
sbit DRIVEY_DOWN at GPIOB_ODR.B0;



unsigned int Xcoord, Ycoord;
const ADC_THRESHOLD = 1500;
char PenDown;
void *PressedObject;
int PressedObjectType;
unsigned int caption_length, caption_height;
unsigned int display_width, display_height;

int _object_count;
unsigned short object_pressed;
TButton_Round *local_round_button;
TButton_Round *exec_round_button;
int round_button_order;
TLabel *local_label;
TLabel *exec_label;
int label_order;
TCircleButton *local_circle_button;
TCircleButton *exec_circle_button;
int circle_button_order;
TRadioButton *local_radio_button;
TRadioButton *exec_radio_button;
int radio_button_order;
TProgressBar *local_progress_bar;
TProgressBar *exec_progress_bar;
int progress_bar_order;


void Init_ADC() {
 ADC_Set_Input_Channel(_ADC_CHANNEL_8 | _ADC_CHANNEL_9);
 ADC1_Init();
 Delay_ms(100);
}

char* TFT_Get_Data(unsigned long offset, unsigned long count, unsigned long *num) {
unsigned long start_sector;
unsigned int pos;

 start_sector = Mmc_Get_File_Write_Sector() + offset/512;
 pos = (unsigned long)offset%512;

 if(start_sector == currentSector+1) {
 Mmc_Multi_Read_Sector(Ext_Data_Buffer);
 currentSector = start_sector;
 } else if (start_sector != currentSector) {
 if(currentSector != -1)
 Mmc_Multi_Read_Stop();
 Mmc_Multi_Read_Start(start_sector);
 Mmc_Multi_Read_Sector(Ext_Data_Buffer);
 currentSector = start_sector;
 }

 if(count>512-pos)
 *num = 512-pos;
 else
 *num = count;

 return Ext_Data_Buffer+pos;
}
static void InitializeTouchPanel() {
 Init_ADC();
 TFT_Init(240, 320);
 TFT_Set_Ext_Buffer(TFT_Get_Data);

 TP_TFT_Init(240, 320, 8, 9);
 TP_TFT_Set_ADC_Threshold(ADC_THRESHOLD);

 PenDown = 0;
 PressedObject = 0;
 PressedObjectType = -1;
}

void Calibrate() {
 TFT_Set_Pen(CL_WHITE, 3);
 TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
 TFT_Write_Text("Touch selected corners for calibration", 1, 150);
 TFT_Line(0, 319, 5, 319);
 TFT_Line(0, 319, 0, 314);
 TFT_Line(0, 319, 10, 309);
 TFT_Write_Text("first here", 20, 290);

 TP_TFT_Calibrate_Min();
 Delay_ms(500);

 TFT_Set_Pen(CL_BLACK, 3);
 TFT_Set_Font(TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
 TFT_Line(0, 319, 5, 319);
 TFT_Line(0, 319, 0, 314);
 TFT_Line(0, 319, 10, 309);
 TFT_Write_Text("first here", 20, 290);

 TFT_Set_Pen(CL_WHITE, 3);
 TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
 TFT_Write_Text("now here ", 180, 15);
 TFT_Line(239, 0, 234, 0);
 TFT_Line(239, 0, 239, 5);
 TFT_Line(239, 0, 229, 10);

 TP_TFT_Calibrate_Max();
 Delay_ms(500);
}



 TScreen* CurrentScreen;

 TScreen Screen1;
 TLabel Label1;
char Label1_Caption[4] = "EAR";

 TLabel Label2;
char Label2_Caption[12] = "RECOGNITION";

 TLabel Label3;
char Label3_Caption[5] = "WITH";

 TLabel Label4;
char Label4_Caption[14] = "STM32F407VGT6";

 TCircleButton CircleButton1;
char CircleButton1_Caption[6] = "START";

 TLabel * const code Screen1_Labels[4]=
 {
 &Label1,
 &Label2,
 &Label3,
 &Label4
 };
 TCircleButton * const code Screen1_CircleButtons[1]=
 {
 &CircleButton1
 };


 TScreen Screen2;
 TButton_Round ButtonRound1;
char ButtonRound1_Caption[4] = "PCA";

 TButton_Round ButtonRound2;
char ButtonRound2_Caption[5] = "FLDA";

 TLabel Label8;
char Label8_Caption[10] = "ALGORITHM";

 TButton_Round ButtonRound8;
char ButtonRound8_Caption[14] = "DATABASE SHOW";

 TButton_Round * const code Screen2_Buttons_Round[3]=
 {
 &ButtonRound1,
 &ButtonRound2,
 &ButtonRound8
 };
 TLabel * const code Screen2_Labels[1]=
 {
 &Label8
 };


 TScreen Screen3;
 TButton_Round ButtonRound4;
char ButtonRound4_Caption[7] = "JACOBI";

 TLabel Label7;
char Label7_Caption[10] = "ITERATION";

 TLabel Label5;
char Label5_Caption[17] = "SYMMETRIC MATRIX";

 TButton_Round * const code Screen3_Buttons_Round[1]=
 {
 &ButtonRound4
 };
 TLabel * const code Screen3_Labels[2]=
 {
 &Label7,
 &Label5
 };


 TScreen Screen5;
 TLabel Label6;
char Label6_Caption[29] = "JACOBI ITERATION COEFFICIENT";

 TRadioButton RadioButton7;
char RadioButton7_Caption[5] = "0.01";

 TRadioButton RadioButton8;
char RadioButton8_Caption[6] = "0.001";

 TRadioButton RadioButton9;
char RadioButton9_Caption[7] = "0.0001";

 TRadioButton RadioButton10;
char RadioButton10_Caption[8] = "0.00001";

 TRadioButton RadioButton11;
char RadioButton11_Caption[9] = "0.000001";

 TRadioButton RadioButton1;
char RadioButton1_Caption[10] = "0.0000001";

 TRadioButton RadioButton2;
char RadioButton2_Caption[11] = "0.00000001";

 TLabel * const code Screen4_Labels[1]=
 {
 &Label6
 };
 TRadioButton * const code Screen4_RadioButtons[7]=
 {
 &RadioButton7,
 &RadioButton8,
 &RadioButton9,
 &RadioButton10,
 &RadioButton11,
 &RadioButton1,
 &RadioButton2
 };


 TScreen Screen6;
 TLabel Label9;
char Label9_Caption[4] = "PCA";

 TLabel Label10;
char Label10_Caption[9] = "TRAINING";

 TCircleButton CircleButton2;
char CircleButton2_Caption[6] = "START";

 TLabel * const code Screen5_Labels[2]=
 {
 &Label9,
 &Label10
 };
 TCircleButton * const code Screen5_CircleButtons[1]=
 {
 &CircleButton2
 };


 TScreen Screen7;
 TLabel Label11;
char Label11_Caption[13] = "PCA TRAINING";

 TLabel * const code Screen6_Labels[1]=
 {
 &Label11
 };


 TScreen Screen8;
 TLabel Label12;
char Label12_Caption[9] = "PCA TEST";

 TButton_Round ButtonRound5;
char ButtonRound5_Caption[6] = "START";

 TButton_Round * const code Screen7_Buttons_Round[1]=
 {
 &ButtonRound5
 };
 TLabel * const code Screen7_Labels[1]=
 {
 &Label12
 };


 TScreen Screen9;
 TLabel Label13;
char Label13_Caption[9] = "PCA TEST";

 TLabel * const code Screen8_Labels[1]=
 {
 &Label13
 };


 TScreen Screen10;
 TCircleButton CircleButton3;
char CircleButton3_Caption[5] = "MAIN";

 TLabel Label14;
char Label14_Caption[12] = "PCA RESULTS";

 TProgressBar ProgressBar1;
char ProgressBar1_Caption[8] = "50\%";

 TLabel Label15;
char Label15_Caption[8] = "SUCCESS";

 TLabel * const code Screen9_Labels[2]=
 {
 &Label14,
 &Label15
 };
 TCircleButton * const code Screen9_CircleButtons[1]=
 {
 &CircleButton3
 };
 TProgressBar * const code Screen9_ProgressBars[1]=
 {
 &ProgressBar1
 };


 TScreen Screen11;
 TLabel Label16;
char Label16_Caption[5] = "FLDA";

 TLabel Label17;
char Label17_Caption[7] = "PART-I";

 TLabel Label18;
char Label18_Caption[19] = "REDUCING DIMENSION";

 TButton_Round ButtonRound6;
char ButtonRound6_Caption[6] = "START";

 TButton_Round * const code Screen10_Buttons_Round[1]=
 {
 &ButtonRound6
 };
 TLabel * const code Screen10_Labels[3]=
 {
 &Label16,
 &Label17,
 &Label18
 };


 TScreen Screen12;
 TLabel Label19;
char Label19_Caption[14] = "FLDA TRAINING";

 TLabel Label31;
char Label31_Caption[7] = "PART-I";

 TLabel * const code Screen11_Labels[2]=
 {
 &Label19,
 &Label31
 };


 TScreen Screen13;
 TLabel Label20;
char Label20_Caption[5] = "FLDA";

 TLabel Label21;
char Label21_Caption[16] = "TRAINING PART-I";

 TLabel Label22;
char Label22_Caption[7] = "FINISH";

 TButton_Round ButtonRound7;
char ButtonRound7_Caption[13] = "FLDA PART II";

 TButton_Round * const code Screen12_Buttons_Round[1]=
 {
 &ButtonRound7
 };
 TLabel * const code Screen12_Labels[3]=
 {
 &Label20,
 &Label21,
 &Label22
 };


 TScreen Screen14;
 TLabel Label23;
char Label23_Caption[13] = "QR ITERATION";

 TLabel Label24;
char Label24_Caption[12] = "UNSYMMETRIC";

 TLabel Label25;
char Label25_Caption[7] = "MATRIX";

 TRadioButton RadioButton12;
char RadioButton12_Caption[3] = "10";

 TRadioButton RadioButton13;
char RadioButton13_Caption[3] = "15";

 TRadioButton RadioButton14;
char RadioButton14_Caption[3] = "25";

 TRadioButton RadioButton15;
char RadioButton15_Caption[3] = "50";

 TRadioButton RadioButton16;
char RadioButton16_Caption[3] = "75";

 TRadioButton RadioButton17;
char RadioButton17_Caption[4] = "100";

 TLabel * const code Screen13_Labels[3]=
 {
 &Label23,
 &Label24,
 &Label25
 };
 TRadioButton * const code Screen13_RadioButtons[6]=
 {
 &RadioButton12,
 &RadioButton13,
 &RadioButton14,
 &RadioButton15,
 &RadioButton16,
 &RadioButton17
 };


 TScreen Screen15;
 TLabel Label26;
char Label26_Caption[6] = "FLDA ";

 TLabel Label27;
char Label27_Caption[9] = "TRAINING";

 TLabel Label28;
char Label28_Caption[8] = "PART II";

 TCircleButton CircleButton4;
char CircleButton4_Caption[9] = "CONTINUE";

 TLabel * const code Screen14_Labels[3]=
 {
 &Label26,
 &Label27,
 &Label28
 };
 TCircleButton * const code Screen14_CircleButtons[1]=
 {
 &CircleButton4
 };


 TScreen Screen16;
 TLabel Label29;
char Label29_Caption[14] = "FLDA TRAINING";

 TLabel Label30;
char Label30_Caption[8] = "PART-II";

 TLabel * const code Screen15_Labels[2]=
 {
 &Label29,
 &Label30
 };


 TScreen Screen17;
 TLabel Label32;
char Label32_Caption[5] = "FLDA";

 TLabel Label33;
char Label33_Caption[17] = "TRAINING PART-II";

 TLabel Label34;
char Label34_Caption[7] = "FINISH";

 TCircleButton CircleButton5;
char CircleButton5_Caption[5] = "TEST";

 TLabel * const code Screen16_Labels[3]=
 {
 &Label32,
 &Label33,
 &Label34
 };
 TCircleButton * const code Screen16_CircleButtons[1]=
 {
 &CircleButton5
 };


 TScreen Screen18;
 TLabel Label35;
char Label35_Caption[10] = "FLDA TEST";

 TLabel * const code Screen17_Labels[1]=
 {
 &Label35
 };


 TScreen Screen19;
 TLabel Label36;
char Label36_Caption[13] = "FLDA RESULTS";

 TProgressBar ProgressBar2;
char ProgressBar2_Caption[8] = "50\%";

 TLabel Label37;
char Label37_Caption[8] = "SUCCESS";

 TCircleButton CircleButton6;
char CircleButton6_Caption[5] = "MAIN";

 TLabel * const code Screen18_Labels[2]=
 {
 &Label36,
 &Label37
 };
 TCircleButton * const code Screen18_CircleButtons[1]=
 {
 &CircleButton6
 };
 TProgressBar * const code Screen18_ProgressBars[1]=
 {
 &ProgressBar2
 };


 TScreen Screen20;
 TLabel Label38;
char Label38_Caption[13] = "EAR DATABASE";

 TLabel * const code Screen19_Labels[1]=
 {
 &Label38
 };




static void InitializeObjects() {
 Screen1.Color = 0x87FF;
 Screen1.Width = 240;
 Screen1.Height = 320;
 Screen1.Buttons_RoundCount = 0;
 Screen1.LabelsCount = 4;
 Screen1.Labels = Screen1_Labels;
 Screen1.CircleButtonsCount = 1;
 Screen1.CircleButtons = Screen1_CircleButtons;
 Screen1.RadioButtonsCount = 0;
 Screen1.ProgressBarsCount = 0;
 Screen1.ObjectsCount = 5;

 Screen2.Color = 0x07F0;
 Screen2.Width = 240;
 Screen2.Height = 320;
 Screen2.Buttons_RoundCount = 3;
 Screen2.Buttons_Round = Screen2_Buttons_Round;
 Screen2.LabelsCount = 1;
 Screen2.Labels = Screen2_Labels;
 Screen2.CircleButtonsCount = 0;
 Screen2.RadioButtonsCount = 0;
 Screen2.ProgressBarsCount = 0;
 Screen2.ObjectsCount = 4;

 Screen3.Color = 0x4410;
 Screen3.Width = 240;
 Screen3.Height = 320;
 Screen3.Buttons_RoundCount = 1;
 Screen3.Buttons_Round = Screen3_Buttons_Round;
 Screen3.LabelsCount = 2;
 Screen3.Labels = Screen3_Labels;
 Screen3.CircleButtonsCount = 0;
 Screen3.RadioButtonsCount = 0;
 Screen3.ProgressBarsCount = 0;
 Screen3.ObjectsCount = 3;

 Screen5.Color = 0xAEBF;
 Screen5.Width = 240;
 Screen5.Height = 320;
 Screen5.Buttons_RoundCount = 0;
 Screen5.LabelsCount = 1;
 Screen5.Labels = Screen4_Labels;
 Screen5.CircleButtonsCount = 0;
 Screen5.RadioButtonsCount = 7;
 Screen5.RadioButtons = Screen4_RadioButtons;
 Screen5.ProgressBarsCount = 0;
 Screen5.ObjectsCount = 8;

 Screen6.Color = 0xFFE3;
 Screen6.Width = 240;
 Screen6.Height = 320;
 Screen6.Buttons_RoundCount = 0;
 Screen6.LabelsCount = 2;
 Screen6.Labels = Screen5_Labels;
 Screen6.CircleButtonsCount = 1;
 Screen6.CircleButtons = Screen5_CircleButtons;
 Screen6.RadioButtonsCount = 0;
 Screen6.ProgressBarsCount = 0;
 Screen6.ObjectsCount = 3;

 Screen7.Color = 0x001F;
 Screen7.Width = 240;
 Screen7.Height = 320;
 Screen7.Buttons_RoundCount = 0;
 Screen7.LabelsCount = 1;
 Screen7.Labels = Screen6_Labels;
 Screen7.CircleButtonsCount = 0;
 Screen7.RadioButtonsCount = 0;
 Screen7.ProgressBarsCount = 0;
 Screen7.ObjectsCount = 1;

 Screen8.Color = 0x8008;
 Screen8.Width = 240;
 Screen8.Height = 320;
 Screen8.Buttons_RoundCount = 1;
 Screen8.Buttons_Round = Screen7_Buttons_Round;
 Screen8.LabelsCount = 1;
 Screen8.Labels = Screen7_Labels;
 Screen8.CircleButtonsCount = 0;
 Screen8.RadioButtonsCount = 0;
 Screen8.ProgressBarsCount = 0;
 Screen8.ObjectsCount = 2;

 Screen9.Color = 0xFFFF;
 Screen9.Width = 240;
 Screen9.Height = 320;
 Screen9.Buttons_RoundCount = 0;
 Screen9.LabelsCount = 1;
 Screen9.Labels = Screen8_Labels;
 Screen9.CircleButtonsCount = 0;
 Screen9.RadioButtonsCount = 0;
 Screen9.ProgressBarsCount = 0;
 Screen9.ObjectsCount = 1;

 Screen10.Color = 0x8408;
 Screen10.Width = 240;
 Screen10.Height = 320;
 Screen10.Buttons_RoundCount = 0;
 Screen10.LabelsCount = 2;
 Screen10.Labels = Screen9_Labels;
 Screen10.CircleButtonsCount = 1;
 Screen10.CircleButtons = Screen9_CircleButtons;
 Screen10.RadioButtonsCount = 0;
 Screen10.ProgressBarsCount = 1;
 Screen10.ProgressBars = Screen9_ProgressBars;
 Screen10.ObjectsCount = 4;

 Screen11.Color = 0x801F;
 Screen11.Width = 240;
 Screen11.Height = 320;
 Screen11.Buttons_RoundCount = 1;
 Screen11.Buttons_Round = Screen10_Buttons_Round;
 Screen11.LabelsCount = 3;
 Screen11.Labels = Screen10_Labels;
 Screen11.CircleButtonsCount = 0;
 Screen11.RadioButtonsCount = 0;
 Screen11.ProgressBarsCount = 0;
 Screen11.ObjectsCount = 4;

 Screen12.Color = 0x001F;
 Screen12.Width = 240;
 Screen12.Height = 320;
 Screen12.Buttons_RoundCount = 0;
 Screen12.LabelsCount = 2;
 Screen12.Labels = Screen11_Labels;
 Screen12.CircleButtonsCount = 0;
 Screen12.RadioButtonsCount = 0;
 Screen12.ProgressBarsCount = 0;
 Screen12.ObjectsCount = 2;

 Screen13.Color = 0xF81F;
 Screen13.Width = 240;
 Screen13.Height = 320;
 Screen13.Buttons_RoundCount = 1;
 Screen13.Buttons_Round = Screen12_Buttons_Round;
 Screen13.LabelsCount = 3;
 Screen13.Labels = Screen12_Labels;
 Screen13.CircleButtonsCount = 0;
 Screen13.RadioButtonsCount = 0;
 Screen13.ProgressBarsCount = 0;
 Screen13.ObjectsCount = 4;

 Screen14.Color = 0x841F;
 Screen14.Width = 240;
 Screen14.Height = 320;
 Screen14.Buttons_RoundCount = 0;
 Screen14.LabelsCount = 3;
 Screen14.Labels = Screen13_Labels;
 Screen14.CircleButtonsCount = 0;
 Screen14.RadioButtonsCount = 6;
 Screen14.RadioButtons = Screen13_RadioButtons;
 Screen14.ProgressBarsCount = 0;
 Screen14.ObjectsCount = 9;

 Screen15.Color = 0xA280;
 Screen15.Width = 240;
 Screen15.Height = 320;
 Screen15.Buttons_RoundCount = 0;
 Screen15.LabelsCount = 3;
 Screen15.Labels = Screen14_Labels;
 Screen15.CircleButtonsCount = 1;
 Screen15.CircleButtons = Screen14_CircleButtons;
 Screen15.RadioButtonsCount = 0;
 Screen15.ProgressBarsCount = 0;
 Screen15.ObjectsCount = 4;

 Screen16.Color = 0x001F;
 Screen16.Width = 240;
 Screen16.Height = 320;
 Screen16.Buttons_RoundCount = 0;
 Screen16.LabelsCount = 2;
 Screen16.Labels = Screen15_Labels;
 Screen16.CircleButtonsCount = 0;
 Screen16.RadioButtonsCount = 0;
 Screen16.ProgressBarsCount = 0;
 Screen16.ObjectsCount = 2;

 Screen17.Color = 0xC618;
 Screen17.Width = 240;
 Screen17.Height = 320;
 Screen17.Buttons_RoundCount = 0;
 Screen17.LabelsCount = 3;
 Screen17.Labels = Screen16_Labels;
 Screen17.CircleButtonsCount = 1;
 Screen17.CircleButtons = Screen16_CircleButtons;
 Screen17.RadioButtonsCount = 0;
 Screen17.ProgressBarsCount = 0;
 Screen17.ObjectsCount = 4;

 Screen18.Color = 0x4000;
 Screen18.Width = 240;
 Screen18.Height = 320;
 Screen18.Buttons_RoundCount = 0;
 Screen18.LabelsCount = 1;
 Screen18.Labels = Screen17_Labels;
 Screen18.CircleButtonsCount = 0;
 Screen18.RadioButtonsCount = 0;
 Screen18.ProgressBarsCount = 0;
 Screen18.ObjectsCount = 1;

 Screen19.Color = 0x0200;
 Screen19.Width = 240;
 Screen19.Height = 320;
 Screen19.Buttons_RoundCount = 0;
 Screen19.LabelsCount = 2;
 Screen19.Labels = Screen18_Labels;
 Screen19.CircleButtonsCount = 1;
 Screen19.CircleButtons = Screen18_CircleButtons;
 Screen19.RadioButtonsCount = 0;
 Screen19.ProgressBarsCount = 1;
 Screen19.ProgressBars = Screen18_ProgressBars;
 Screen19.ObjectsCount = 4;

 Screen20.Color = 0x8418;
 Screen20.Width = 240;
 Screen20.Height = 320;
 Screen20.Buttons_RoundCount = 0;
 Screen20.LabelsCount = 1;
 Screen20.Labels = Screen19_Labels;
 Screen20.CircleButtonsCount = 0;
 Screen20.RadioButtonsCount = 0;
 Screen20.ProgressBarsCount = 0;
 Screen20.ObjectsCount = 1;


 Label1.OwnerScreen = &Screen1;
 Label1.Order = 0;
 Label1.Left = 86;
 Label1.Top = 45;
 Label1.Width = 52;
 Label1.Height = 30;
 Label1.Visible = 1;
 Label1.Active = 1;
 Label1.Caption = Label1_Caption;
 Label1.FontName =  0x0000225C ;
 Label1.Font_Color = 0xF800;
 Label1.OnUpPtr = 0;
 Label1.OnDownPtr = 0;
 Label1.OnClickPtr = 0;
 Label1.OnPressPtr = 0;

 Label2.OwnerScreen = &Screen1;
 Label2.Order = 1;
 Label2.Left = 33;
 Label2.Top = 78;
 Label2.Width = 174;
 Label2.Height = 30;
 Label2.Visible = 1;
 Label2.Active = 1;
 Label2.Caption = Label2_Caption;
 Label2.FontName =  0x0000225C ;
 Label2.Font_Color = 0xF800;
 Label2.OnUpPtr = 0;
 Label2.OnDownPtr = 0;
 Label2.OnClickPtr = 0;
 Label2.OnPressPtr = 0;

 Label3.OwnerScreen = &Screen1;
 Label3.Order = 2;
 Label3.Left = 81;
 Label3.Top = 117;
 Label3.Width = 63;
 Label3.Height = 30;
 Label3.Visible = 1;
 Label3.Active = 1;
 Label3.Caption = Label3_Caption;
 Label3.FontName =  0x0000225C ;
 Label3.Font_Color = 0xF800;
 Label3.OnUpPtr = 0;
 Label3.OnDownPtr = 0;
 Label3.OnClickPtr = 0;
 Label3.OnPressPtr = 0;

 Label4.OwnerScreen = &Screen1;
 Label4.Order = 3;
 Label4.Left = 22;
 Label4.Top = 153;
 Label4.Width = 201;
 Label4.Height = 30;
 Label4.Visible = 1;
 Label4.Active = 1;
 Label4.Caption = Label4_Caption;
 Label4.FontName =  0x0000225C ;
 Label4.Font_Color = 0xF800;
 Label4.OnUpPtr = 0;
 Label4.OnDownPtr = 0;
 Label4.OnClickPtr = 0;
 Label4.OnPressPtr = 0;

 CircleButton1.OwnerScreen = &Screen1;
 CircleButton1.Order = 4;
 CircleButton1.Left = 86;
 CircleButton1.Top = 202;
 CircleButton1.Radius = 30;
 CircleButton1.Pen_Width = 1;
 CircleButton1.Pen_Color = 0x0000;
 CircleButton1.Visible = 1;
 CircleButton1.Active = 1;
 CircleButton1.Transparent = 1;
 CircleButton1.Caption = CircleButton1_Caption;
 CircleButton1.TextAlign = _taCenter;
 CircleButton1.FontName =  0x000103B0 ;
 CircleButton1.PressColEnabled = 1;
 CircleButton1.Font_Color = 0x0000;
 CircleButton1.Gradient = 1;
 CircleButton1.Gradient_Orientation = 0;
 CircleButton1.Gradient_Start_Color = 0x8208;
 CircleButton1.Gradient_End_Color = 0xFC08;
 CircleButton1.Color = 0xFC00;
 CircleButton1.Press_Color = 0xF800;
 CircleButton1.OnUpPtr = 0;
 CircleButton1.OnDownPtr = 0;
 CircleButton1.OnClickPtr = 0;
 CircleButton1.OnPressPtr = S1_START;

 ButtonRound1.OwnerScreen = &Screen2;
 ButtonRound1.Order = 0;
 ButtonRound1.Left = 68;
 ButtonRound1.Top = 75;
 ButtonRound1.Width = 91;
 ButtonRound1.Height = 48;
 ButtonRound1.Pen_Width = 1;
 ButtonRound1.Pen_Color = 0x0000;
 ButtonRound1.Visible = 1;
 ButtonRound1.Active = 1;
 ButtonRound1.Transparent = 1;
 ButtonRound1.Caption = ButtonRound1_Caption;
 ButtonRound1.TextAlign = _taCenter;
 ButtonRound1.FontName =  0x0000852C ;
 ButtonRound1.PressColEnabled = 1;
 ButtonRound1.Font_Color = 0xFFFF;
 ButtonRound1.Gradient = 1;
 ButtonRound1.Gradient_Orientation = 0;
 ButtonRound1.Gradient_Start_Color = 0x041F;
 ButtonRound1.Gradient_End_Color = 0xF810;
 ButtonRound1.Color = 0xC618;
 ButtonRound1.Press_Color = 0xF810;
 ButtonRound1.Corner_Radius = 3;
 ButtonRound1.OnUpPtr = 0;
 ButtonRound1.OnDownPtr = 0;
 ButtonRound1.OnClickPtr = 0;
 ButtonRound1.OnPressPtr = PCA_SELECT;

 ButtonRound2.OwnerScreen = &Screen2;
 ButtonRound2.Order = 1;
 ButtonRound2.Left = 70;
 ButtonRound2.Top = 151;
 ButtonRound2.Width = 91;
 ButtonRound2.Height = 49;
 ButtonRound2.Pen_Width = 1;
 ButtonRound2.Pen_Color = 0x0000;
 ButtonRound2.Visible = 1;
 ButtonRound2.Active = 1;
 ButtonRound2.Transparent = 1;
 ButtonRound2.Caption = ButtonRound2_Caption;
 ButtonRound2.TextAlign = _taCenter;
 ButtonRound2.FontName =  0x0000852C ;
 ButtonRound2.PressColEnabled = 1;
 ButtonRound2.Font_Color = 0xFFFF;
 ButtonRound2.Gradient = 1;
 ButtonRound2.Gradient_Orientation = 0;
 ButtonRound2.Gradient_Start_Color = 0x87F0;
 ButtonRound2.Gradient_End_Color = 0x0418;
 ButtonRound2.Color = 0xC618;
 ButtonRound2.Press_Color = 0x8410;
 ButtonRound2.Corner_Radius = 3;
 ButtonRound2.OnUpPtr = 0;
 ButtonRound2.OnDownPtr = 0;
 ButtonRound2.OnClickPtr = 0;
 ButtonRound2.OnPressPtr = FLDA_SELECT;

 Label8.OwnerScreen = &Screen2;
 Label8.Order = 2;
 Label8.Left = 55;
 Label8.Top = 27;
 Label8.Width = 119;
 Label8.Height = 28;
 Label8.Visible = 1;
 Label8.Active = 1;
 Label8.Caption = Label8_Caption;
 Label8.FontName =  0x0000BDF7 ;
 Label8.Font_Color = 0x001F;
 Label8.OnUpPtr = 0;
 Label8.OnDownPtr = 0;
 Label8.OnClickPtr = 0;
 Label8.OnPressPtr = 0;

 ButtonRound8.OwnerScreen = &Screen2;
 ButtonRound8.Order = 3;
 ButtonRound8.Left = 68;
 ButtonRound8.Top = 234;
 ButtonRound8.Width = 99;
 ButtonRound8.Height = 49;
 ButtonRound8.Pen_Width = 1;
 ButtonRound8.Pen_Color = 0x0000;
 ButtonRound8.Visible = 1;
 ButtonRound8.Active = 1;
 ButtonRound8.Transparent = 1;
 ButtonRound8.Caption = ButtonRound8_Caption;
 ButtonRound8.TextAlign = _taCenter;
 ButtonRound8.FontName =  0x000103B0 ;
 ButtonRound8.PressColEnabled = 1;
 ButtonRound8.Font_Color = 0x0000;
 ButtonRound8.Gradient = 1;
 ButtonRound8.Gradient_Orientation = 0;
 ButtonRound8.Gradient_Start_Color = 0xFFF0;
 ButtonRound8.Gradient_End_Color = 0x07FF;
 ButtonRound8.Color = 0xC618;
 ButtonRound8.Press_Color = 0x8410;
 ButtonRound8.Corner_Radius = 3;
 ButtonRound8.OnUpPtr = 0;
 ButtonRound8.OnDownPtr = 0;
 ButtonRound8.OnClickPtr = 0;
 ButtonRound8.OnPressPtr = DATABASE_SHOW;

 ButtonRound4.OwnerScreen = &Screen3;
 ButtonRound4.Order = 0;
 ButtonRound4.Left = 67;
 ButtonRound4.Top = 146;
 ButtonRound4.Width = 102;
 ButtonRound4.Height = 42;
 ButtonRound4.Pen_Width = 1;
 ButtonRound4.Pen_Color = 0x0000;
 ButtonRound4.Visible = 1;
 ButtonRound4.Active = 1;
 ButtonRound4.Transparent = 1;
 ButtonRound4.Caption = ButtonRound4_Caption;
 ButtonRound4.TextAlign = _taCenter;
 ButtonRound4.FontName =  0x000103B0 ;
 ButtonRound4.PressColEnabled = 1;
 ButtonRound4.Font_Color = 0x0000;
 ButtonRound4.Gradient = 1;
 ButtonRound4.Gradient_Orientation = 0;
 ButtonRound4.Gradient_Start_Color = 0xFFFF;
 ButtonRound4.Gradient_End_Color = 0xC618;
 ButtonRound4.Color = 0xC618;
 ButtonRound4.Press_Color = 0xF800;
 ButtonRound4.Corner_Radius = 3;
 ButtonRound4.OnUpPtr = 0;
 ButtonRound4.OnDownPtr = 0;
 ButtonRound4.OnClickPtr = 0;
 ButtonRound4.OnPressPtr = JACOBI_SELECT;

 Label7.OwnerScreen = &Screen3;
 Label7.Order = 1;
 Label7.Left = 72;
 Label7.Top = 33;
 Label7.Width = 99;
 Label7.Height = 25;
 Label7.Visible = 1;
 Label7.Active = 1;
 Label7.Caption = Label7_Caption;
 Label7.FontName =  0x00009D2A ;
 Label7.Font_Color = 0x9FE0;
 Label7.OnUpPtr = 0;
 Label7.OnDownPtr = 0;
 Label7.OnClickPtr = 0;
 Label7.OnPressPtr = 0;

 Label5.OwnerScreen = &Screen3;
 Label5.Order = 2;
 Label5.Left = 31;
 Label5.Top = 69;
 Label5.Width = 181;
 Label5.Height = 25;
 Label5.Visible = 1;
 Label5.Active = 1;
 Label5.Caption = Label5_Caption;
 Label5.FontName =  0x00009D2A ;
 Label5.Font_Color = 0x9FE0;
 Label5.OnUpPtr = 0;
 Label5.OnDownPtr = 0;
 Label5.OnClickPtr = 0;
 Label5.OnPressPtr = 0;

 Label6.OwnerScreen = &Screen5;
 Label6.Order = 0;
 Label6.Left = 13;
 Label6.Top = 28;
 Label6.Width = 219;
 Label6.Height = 16;
 Label6.Visible = 1;
 Label6.Active = 1;
 Label6.Caption = Label6_Caption;
 Label6.FontName =  0x00000A6A ;
 Label6.Font_Color = 0x6000;
 Label6.OnUpPtr = 0;
 Label6.OnDownPtr = 0;
 Label6.OnClickPtr = 0;
 Label6.OnPressPtr = 0;

 RadioButton7.OwnerScreen = &Screen5;
 RadioButton7.Order = 1;
 RadioButton7.Left = 31;
 RadioButton7.Top = 59;
 RadioButton7.Width = 42;
 RadioButton7.Height = 16;
 RadioButton7.Pen_Width = 1;
 RadioButton7.Pen_Color = 0x0000;
 RadioButton7.Visible = 1;
 RadioButton7.Active = 1;
 RadioButton7.Checked = 1;
 RadioButton7.Transparent = 1;
 RadioButton7.Caption = RadioButton7_Caption;
 RadioButton7.TextAlign = _taLeft;
 RadioButton7.FontName =  0x000103B0 ;
 RadioButton7.PressColEnabled = 1;
 RadioButton7.Font_Color = 0x0000;
 RadioButton7.Gradient = 1;
 RadioButton7.Gradient_Orientation = 0;
 RadioButton7.Gradient_Start_Color = 0xFFFF;
 RadioButton7.Gradient_End_Color = 0xC618;
 RadioButton7.Color = 0xC618;
 RadioButton7.Press_Color = 0xC618;
 RadioButton7.Background_Color = 0x8410;
 RadioButton7.OnUpPtr = 0;
 RadioButton7.OnDownPtr = 0;
 RadioButton7.OnClickPtr = 0;
 RadioButton7.OnPressPtr = J_E_2;

 RadioButton8.OwnerScreen = &Screen5;
 RadioButton8.Order = 2;
 RadioButton8.Left = 110;
 RadioButton8.Top = 85;
 RadioButton8.Width = 48;
 RadioButton8.Height = 16;
 RadioButton8.Pen_Width = 1;
 RadioButton8.Pen_Color = 0x0000;
 RadioButton8.Visible = 1;
 RadioButton8.Active = 1;
 RadioButton8.Checked = 1;
 RadioButton8.Transparent = 1;
 RadioButton8.Caption = RadioButton8_Caption;
 RadioButton8.TextAlign = _taLeft;
 RadioButton8.FontName =  0x000103B0 ;
 RadioButton8.PressColEnabled = 1;
 RadioButton8.Font_Color = 0x0000;
 RadioButton8.Gradient = 1;
 RadioButton8.Gradient_Orientation = 0;
 RadioButton8.Gradient_Start_Color = 0xFFFF;
 RadioButton8.Gradient_End_Color = 0xC618;
 RadioButton8.Color = 0xC618;
 RadioButton8.Press_Color = 0xC618;
 RadioButton8.Background_Color = 0x8410;
 RadioButton8.OnUpPtr = 0;
 RadioButton8.OnDownPtr = 0;
 RadioButton8.OnClickPtr = 0;
 RadioButton8.OnPressPtr = J_E_3;

 RadioButton9.OwnerScreen = &Screen5;
 RadioButton9.Order = 3;
 RadioButton9.Left = 176;
 RadioButton9.Top = 123;
 RadioButton9.Width = 54;
 RadioButton9.Height = 16;
 RadioButton9.Pen_Width = 1;
 RadioButton9.Pen_Color = 0x0000;
 RadioButton9.Visible = 1;
 RadioButton9.Active = 1;
 RadioButton9.Checked = 1;
 RadioButton9.Transparent = 1;
 RadioButton9.Caption = RadioButton9_Caption;
 RadioButton9.TextAlign = _taLeft;
 RadioButton9.FontName =  0x000103B0 ;
 RadioButton9.PressColEnabled = 1;
 RadioButton9.Font_Color = 0x0000;
 RadioButton9.Gradient = 1;
 RadioButton9.Gradient_Orientation = 0;
 RadioButton9.Gradient_Start_Color = 0xFFFF;
 RadioButton9.Gradient_End_Color = 0xC618;
 RadioButton9.Color = 0xC618;
 RadioButton9.Press_Color = 0xC618;
 RadioButton9.Background_Color = 0x8410;
 RadioButton9.OnUpPtr = 0;
 RadioButton9.OnDownPtr = 0;
 RadioButton9.OnClickPtr = 0;
 RadioButton9.OnPressPtr = J_E_4;

 RadioButton10.OwnerScreen = &Screen5;
 RadioButton10.Order = 4;
 RadioButton10.Left = 104;
 RadioButton10.Top = 151;
 RadioButton10.Width = 61;
 RadioButton10.Height = 16;
 RadioButton10.Pen_Width = 1;
 RadioButton10.Pen_Color = 0x0000;
 RadioButton10.Visible = 1;
 RadioButton10.Active = 1;
 RadioButton10.Checked = 1;
 RadioButton10.Transparent = 1;
 RadioButton10.Caption = RadioButton10_Caption;
 RadioButton10.TextAlign = _taLeft;
 RadioButton10.FontName =  0x000103B0 ;
 RadioButton10.PressColEnabled = 1;
 RadioButton10.Font_Color = 0x0000;
 RadioButton10.Gradient = 1;
 RadioButton10.Gradient_Orientation = 0;
 RadioButton10.Gradient_Start_Color = 0xFFFF;
 RadioButton10.Gradient_End_Color = 0xC618;
 RadioButton10.Color = 0xC618;
 RadioButton10.Press_Color = 0xC618;
 RadioButton10.Background_Color = 0x8410;
 RadioButton10.OnUpPtr = 0;
 RadioButton10.OnDownPtr = 0;
 RadioButton10.OnClickPtr = 0;
 RadioButton10.OnPressPtr = J_E_5;

 RadioButton11.OwnerScreen = &Screen5;
 RadioButton11.Order = 5;
 RadioButton11.Left = 26;
 RadioButton11.Top = 187;
 RadioButton11.Width = 67;
 RadioButton11.Height = 16;
 RadioButton11.Pen_Width = 1;
 RadioButton11.Pen_Color = 0x0000;
 RadioButton11.Visible = 1;
 RadioButton11.Active = 1;
 RadioButton11.Checked = 1;
 RadioButton11.Transparent = 1;
 RadioButton11.Caption = RadioButton11_Caption;
 RadioButton11.TextAlign = _taLeft;
 RadioButton11.FontName =  0x000103B0 ;
 RadioButton11.PressColEnabled = 1;
 RadioButton11.Font_Color = 0x0000;
 RadioButton11.Gradient = 1;
 RadioButton11.Gradient_Orientation = 0;
 RadioButton11.Gradient_Start_Color = 0xFFFF;
 RadioButton11.Gradient_End_Color = 0xC618;
 RadioButton11.Color = 0xC618;
 RadioButton11.Press_Color = 0xC618;
 RadioButton11.Background_Color = 0x8410;
 RadioButton11.OnUpPtr = 0;
 RadioButton11.OnDownPtr = 0;
 RadioButton11.OnClickPtr = 0;
 RadioButton11.OnPressPtr = J_E_6;

 RadioButton1.OwnerScreen = &Screen5;
 RadioButton1.Order = 6;
 RadioButton1.Left = 88;
 RadioButton1.Top = 228;
 RadioButton1.Width = 73;
 RadioButton1.Height = 16;
 RadioButton1.Pen_Width = 1;
 RadioButton1.Pen_Color = 0x0000;
 RadioButton1.Visible = 1;
 RadioButton1.Active = 1;
 RadioButton1.Checked = 1;
 RadioButton1.Transparent = 1;
 RadioButton1.Caption = RadioButton1_Caption;
 RadioButton1.TextAlign = _taLeft;
 RadioButton1.FontName =  0x000103B0 ;
 RadioButton1.PressColEnabled = 1;
 RadioButton1.Font_Color = 0x0000;
 RadioButton1.Gradient = 1;
 RadioButton1.Gradient_Orientation = 0;
 RadioButton1.Gradient_Start_Color = 0xFFFF;
 RadioButton1.Gradient_End_Color = 0xC618;
 RadioButton1.Color = 0xC618;
 RadioButton1.Press_Color = 0xC618;
 RadioButton1.Background_Color = 0x8410;
 RadioButton1.OnUpPtr = 0;
 RadioButton1.OnDownPtr = 0;
 RadioButton1.OnClickPtr = 0;
 RadioButton1.OnPressPtr = J_E_7;

 RadioButton2.OwnerScreen = &Screen5;
 RadioButton2.Order = 7;
 RadioButton2.Left = 151;
 RadioButton2.Top = 272;
 RadioButton2.Width = 79;
 RadioButton2.Height = 16;
 RadioButton2.Pen_Width = 1;
 RadioButton2.Pen_Color = 0x0000;
 RadioButton2.Visible = 1;
 RadioButton2.Active = 1;
 RadioButton2.Checked = 1;
 RadioButton2.Transparent = 1;
 RadioButton2.Caption = RadioButton2_Caption;
 RadioButton2.TextAlign = _taLeft;
 RadioButton2.FontName =  0x000103B0 ;
 RadioButton2.PressColEnabled = 1;
 RadioButton2.Font_Color = 0x0000;
 RadioButton2.Gradient = 1;
 RadioButton2.Gradient_Orientation = 0;
 RadioButton2.Gradient_Start_Color = 0xFFFF;
 RadioButton2.Gradient_End_Color = 0xC618;
 RadioButton2.Color = 0xC618;
 RadioButton2.Press_Color = 0xC618;
 RadioButton2.Background_Color = 0x8410;
 RadioButton2.OnUpPtr = 0;
 RadioButton2.OnDownPtr = 0;
 RadioButton2.OnClickPtr = 0;
 RadioButton2.OnPressPtr = J_E_8;

 Label9.OwnerScreen = &Screen6;
 Label9.Order = 0;
 Label9.Left = 79;
 Label9.Top = 46;
 Label9.Width = 68;
 Label9.Height = 40;
 Label9.Visible = 1;
 Label9.Active = 1;
 Label9.Caption = Label9_Caption;
 Label9.FontName =  0x000053A0 ;
 Label9.Font_Color = 0x001F;
 Label9.OnUpPtr = 0;
 Label9.OnDownPtr = 0;
 Label9.OnClickPtr = 0;
 Label9.OnPressPtr = 0;

 Label10.OwnerScreen = &Screen6;
 Label10.Order = 1;
 Label10.Left = 43;
 Label10.Top = 105;
 Label10.Width = 157;
 Label10.Height = 40;
 Label10.Visible = 1;
 Label10.Active = 1;
 Label10.Caption = Label10_Caption;
 Label10.FontName =  0x000053A0 ;
 Label10.Font_Color = 0x001F;
 Label10.OnUpPtr = 0;
 Label10.OnDownPtr = 0;
 Label10.OnClickPtr = 0;
 Label10.OnPressPtr = 0;

 CircleButton2.OwnerScreen = &Screen6;
 CircleButton2.Order = 2;
 CircleButton2.Left = 80;
 CircleButton2.Top = 180;
 CircleButton2.Radius = 34;
 CircleButton2.Pen_Width = 1;
 CircleButton2.Pen_Color = 0xF800;
 CircleButton2.Visible = 1;
 CircleButton2.Active = 1;
 CircleButton2.Transparent = 1;
 CircleButton2.Caption = CircleButton2_Caption;
 CircleButton2.TextAlign = _taCenter;
 CircleButton2.FontName =  0x000103B0 ;
 CircleButton2.PressColEnabled = 1;
 CircleButton2.Font_Color = 0x0000;
 CircleButton2.Gradient = 1;
 CircleButton2.Gradient_Orientation = 0;
 CircleButton2.Gradient_Start_Color = 0x87FF;
 CircleButton2.Gradient_End_Color = 0x041F;
 CircleButton2.Color = 0xC618;
 CircleButton2.Press_Color = 0xF800;
 CircleButton2.OnUpPtr = 0;
 CircleButton2.OnDownPtr = 0;
 CircleButton2.OnClickPtr = 0;
 CircleButton2.OnPressPtr = PCA_TRAINING_START;

 Label11.OwnerScreen = &Screen7;
 Label11.Order = 0;
 Label11.Left = 74;
 Label11.Top = 16;
 Label11.Width = 97;
 Label11.Height = 16;
 Label11.Visible = 1;
 Label11.Active = 1;
 Label11.Caption = Label11_Caption;
 Label11.FontName =  0x00000A6A ;
 Label11.Font_Color = 0xFFE0;
 Label11.OnUpPtr = 0;
 Label11.OnDownPtr = 0;
 Label11.OnClickPtr = 0;
 Label11.OnPressPtr = 0;

 Label12.OwnerScreen = &Screen8;
 Label12.Order = 0;
 Label12.Left = 62;
 Label12.Top = 78;
 Label12.Width = 108;
 Label12.Height = 32;
 Label12.Visible = 1;
 Label12.Active = 1;
 Label12.Caption = Label12_Caption;
 Label12.FontName =  0x0000D000 ;
 Label12.Font_Color = 0x37E0;
 Label12.OnUpPtr = 0;
 Label12.OnDownPtr = 0;
 Label12.OnClickPtr = 0;
 Label12.OnPressPtr = 0;

 ButtonRound5.OwnerScreen = &Screen8;
 ButtonRound5.Order = 1;
 ButtonRound5.Left = 61;
 ButtonRound5.Top = 166;
 ButtonRound5.Width = 107;
 ButtonRound5.Height = 46;
 ButtonRound5.Pen_Width = 1;
 ButtonRound5.Pen_Color = 0x0000;
 ButtonRound5.Visible = 1;
 ButtonRound5.Active = 1;
 ButtonRound5.Transparent = 1;
 ButtonRound5.Caption = ButtonRound5_Caption;
 ButtonRound5.TextAlign = _taCenter;
 ButtonRound5.FontName =  0x00009D2A ;
 ButtonRound5.PressColEnabled = 1;
 ButtonRound5.Font_Color = 0x0000;
 ButtonRound5.Gradient = 1;
 ButtonRound5.Gradient_Orientation = 0;
 ButtonRound5.Gradient_Start_Color = 0xFFFF;
 ButtonRound5.Gradient_End_Color = 0xC618;
 ButtonRound5.Color = 0xC618;
 ButtonRound5.Press_Color = 0x8410;
 ButtonRound5.Corner_Radius = 3;
 ButtonRound5.OnUpPtr = 0;
 ButtonRound5.OnDownPtr = 0;
 ButtonRound5.OnClickPtr = 0;
 ButtonRound5.OnPressPtr = PCA_TEST_START;

 Label13.OwnerScreen = &Screen9;
 Label13.Order = 0;
 Label13.Left = 79;
 Label13.Top = 20;
 Label13.Width = 65;
 Label13.Height = 16;
 Label13.Visible = 1;
 Label13.Active = 1;
 Label13.Caption = Label13_Caption;
 Label13.FontName =  0x00000212 ;
 Label13.Font_Color = 0xF800;
 Label13.OnUpPtr = 0;
 Label13.OnDownPtr = 0;
 Label13.OnClickPtr = 0;
 Label13.OnPressPtr = 0;

 CircleButton3.OwnerScreen = &Screen10;
 CircleButton3.Order = 0;
 CircleButton3.Left = 87;
 CircleButton3.Top = 204;
 CircleButton3.Radius = 33;
 CircleButton3.Pen_Width = 1;
 CircleButton3.Pen_Color = 0x0000;
 CircleButton3.Visible = 1;
 CircleButton3.Active = 1;
 CircleButton3.Transparent = 1;
 CircleButton3.Caption = CircleButton3_Caption;
 CircleButton3.TextAlign = _taCenter;
 CircleButton3.FontName =  0x000103B0 ;
 CircleButton3.PressColEnabled = 1;
 CircleButton3.Font_Color = 0x0000;
 CircleButton3.Gradient = 1;
 CircleButton3.Gradient_Orientation = 0;
 CircleButton3.Gradient_Start_Color = 0x8000;
 CircleButton3.Gradient_End_Color = 0x8410;
 CircleButton3.Color = 0xC618;
 CircleButton3.Press_Color = 0x8410;
 CircleButton3.OnUpPtr = 0;
 CircleButton3.OnDownPtr = 0;
 CircleButton3.OnClickPtr = 0;
 CircleButton3.OnPressPtr = PCA_RESULTS_MAIN;

 Label14.OwnerScreen = &Screen10;
 Label14.Order = 1;
 Label14.Left = 74;
 Label14.Top = 16;
 Label14.Width = 82;
 Label14.Height = 17;
 Label14.Visible = 1;
 Label14.Active = 1;
 Label14.Caption = Label14_Caption;
 Label14.FontName =  0x000074CC ;
 Label14.Font_Color = 0x37E0;
 Label14.OnUpPtr = 0;
 Label14.OnDownPtr = 0;
 Label14.OnClickPtr = 0;
 Label14.OnPressPtr = 0;

 ProgressBar1.OwnerScreen = &Screen10;
 ProgressBar1.Order = 2;
 ProgressBar1.Left = 68;
 ProgressBar1.Top = 158;
 ProgressBar1.Width = 100;
 ProgressBar1.Height = 17;
 ProgressBar1.Pen_Width = 1;
 ProgressBar1.Pen_Color = 0x0000;
 ProgressBar1.Visible = 1;
 ProgressBar1.Active = 1;
 ProgressBar1.Transparent = 1;
 ProgressBar1.Caption = ProgressBar1_Caption;
 ProgressBar1.FontName =  0x000103B0 ;
 ProgressBar1.Font_Color = 0x0000;
 ProgressBar1.Gradient = 1;
 ProgressBar1.Gradient_Orientation = 0;
 ProgressBar1.Gradient_Start_Color = 0xFFFF;
 ProgressBar1.Gradient_End_Color = 0x07E0;
 ProgressBar1.Color = 0xA65E;
 ProgressBar1.Background_Color = 0x8410;
 ProgressBar1.Min = 0;
 ProgressBar1.Max = 100;
 ProgressBar1.Position = 50;
 ProgressBar1.Show_Position = 1;
 ProgressBar1.Show_Percentage = 1;
 ProgressBar1.Smooth = 1;
 ProgressBar1.Rounded = 1;
 ProgressBar1.Corner_Radius = 3;

 Label15.OwnerScreen = &Screen10;
 Label15.Order = 3;
 Label15.Left = 93;
 Label15.Top = 131;
 Label15.Width = 55;
 Label15.Height = 17;
 Label15.Visible = 1;
 Label15.Active = 1;
 Label15.Caption = Label15_Caption;
 Label15.FontName =  0x000074CC ;
 Label15.Font_Color = 0x37E0;
 Label15.OnUpPtr = 0;
 Label15.OnDownPtr = 0;
 Label15.OnClickPtr = 0;
 Label15.OnPressPtr = 0;

 Label16.OwnerScreen = &Screen11;
 Label16.Order = 0;
 Label16.Left = 83;
 Label16.Top = 51;
 Label16.Width = 76;
 Label16.Height = 36;
 Label16.Visible = 1;
 Label16.Active = 1;
 Label16.Caption = Label16_Caption;
 Label16.FontName =  0x0000380E ;
 Label16.Font_Color = 0x9FE0;
 Label16.OnUpPtr = 0;
 Label16.OnDownPtr = 0;
 Label16.OnClickPtr = 0;
 Label16.OnPressPtr = 0;

 Label17.OwnerScreen = &Screen11;
 Label17.Order = 1;
 Label17.Left = 71;
 Label17.Top = 106;
 Label17.Width = 98;
 Label17.Height = 36;
 Label17.Visible = 1;
 Label17.Active = 1;
 Label17.Caption = Label17_Caption;
 Label17.FontName =  0x0000380E ;
 Label17.Font_Color = 0x9FE0;
 Label17.OnUpPtr = 0;
 Label17.OnDownPtr = 0;
 Label17.OnClickPtr = 0;
 Label17.OnPressPtr = 0;

 Label18.OwnerScreen = &Screen11;
 Label18.Order = 2;
 Label18.Left = 11;
 Label18.Top = 163;
 Label18.Width = 221;
 Label18.Height = 24;
 Label18.Visible = 1;
 Label18.Active = 1;
 Label18.Caption = Label18_Caption;
 Label18.FontName =  0x000012D2 ;
 Label18.Font_Color = 0x9FE0;
 Label18.OnUpPtr = 0;
 Label18.OnDownPtr = 0;
 Label18.OnClickPtr = 0;
 Label18.OnPressPtr = 0;

 ButtonRound6.OwnerScreen = &Screen11;
 ButtonRound6.Order = 3;
 ButtonRound6.Left = 71;
 ButtonRound6.Top = 218;
 ButtonRound6.Width = 105;
 ButtonRound6.Height = 41;
 ButtonRound6.Pen_Width = 1;
 ButtonRound6.Pen_Color = 0x0000;
 ButtonRound6.Visible = 1;
 ButtonRound6.Active = 1;
 ButtonRound6.Transparent = 1;
 ButtonRound6.Caption = ButtonRound6_Caption;
 ButtonRound6.TextAlign = _taCenter;
 ButtonRound6.FontName =  0x0000852C ;
 ButtonRound6.PressColEnabled = 1;
 ButtonRound6.Font_Color = 0x0000;
 ButtonRound6.Gradient = 1;
 ButtonRound6.Gradient_Orientation = 0;
 ButtonRound6.Gradient_Start_Color = 0xFFF0;
 ButtonRound6.Gradient_End_Color = 0x8400;
 ButtonRound6.Color = 0xC618;
 ButtonRound6.Press_Color = 0x8410;
 ButtonRound6.Corner_Radius = 3;
 ButtonRound6.OnUpPtr = 0;
 ButtonRound6.OnDownPtr = 0;
 ButtonRound6.OnClickPtr = 0;
 ButtonRound6.OnPressPtr = FLDA_PART_1_START;

 Label19.OwnerScreen = &Screen12;
 Label19.Order = 0;
 Label19.Left = 70;
 Label19.Top = 9;
 Label19.Width = 104;
 Label19.Height = 16;
 Label19.Visible = 1;
 Label19.Active = 1;
 Label19.Caption = Label19_Caption;
 Label19.FontName =  0x00000A6A ;
 Label19.Font_Color = 0xFFE0;
 Label19.OnUpPtr = 0;
 Label19.OnDownPtr = 0;
 Label19.OnClickPtr = 0;
 Label19.OnPressPtr = 0;

 Label31.OwnerScreen = &Screen12;
 Label31.Order = 1;
 Label31.Left = 97;
 Label31.Top = 287;
 Label31.Width = 45;
 Label31.Height = 16;
 Label31.Visible = 1;
 Label31.Active = 1;
 Label31.Caption = Label31_Caption;
 Label31.FontName =  0x00000A6A ;
 Label31.Font_Color = 0xFFE0;
 Label31.OnUpPtr = 0;
 Label31.OnDownPtr = 0;
 Label31.OnClickPtr = 0;
 Label31.OnPressPtr = 0;

 Label20.OwnerScreen = &Screen13;
 Label20.Order = 0;
 Label20.Left = 95;
 Label20.Top = 47;
 Label20.Width = 57;
 Label20.Height = 32;
 Label20.Visible = 1;
 Label20.Active = 1;
 Label20.Caption = Label20_Caption;
 Label20.FontName =  0x0000D000 ;
 Label20.Font_Color = 0x001F;
 Label20.OnUpPtr = 0;
 Label20.OnDownPtr = 0;
 Label20.OnClickPtr = 0;
 Label20.OnPressPtr = 0;

 Label21.OwnerScreen = &Screen13;
 Label21.Order = 1;
 Label21.Left = 22;
 Label21.Top = 88;
 Label21.Width = 197;
 Label21.Height = 32;
 Label21.Visible = 1;
 Label21.Active = 1;
 Label21.Caption = Label21_Caption;
 Label21.FontName =  0x0000D000 ;
 Label21.Font_Color = 0x001F;
 Label21.OnUpPtr = 0;
 Label21.OnDownPtr = 0;
 Label21.OnClickPtr = 0;
 Label21.OnPressPtr = 0;

 Label22.OwnerScreen = &Screen13;
 Label22.Order = 2;
 Label22.Left = 80;
 Label22.Top = 131;
 Label22.Width = 78;
 Label22.Height = 32;
 Label22.Visible = 1;
 Label22.Active = 1;
 Label22.Caption = Label22_Caption;
 Label22.FontName =  0x0000D000 ;
 Label22.Font_Color = 0x001F;
 Label22.OnUpPtr = 0;
 Label22.OnDownPtr = 0;
 Label22.OnClickPtr = 0;
 Label22.OnPressPtr = 0;

 ButtonRound7.OwnerScreen = &Screen13;
 ButtonRound7.Order = 3;
 ButtonRound7.Left = 58;
 ButtonRound7.Top = 199;
 ButtonRound7.Width = 122;
 ButtonRound7.Height = 51;
 ButtonRound7.Pen_Width = 1;
 ButtonRound7.Pen_Color = 0x0000;
 ButtonRound7.Visible = 1;
 ButtonRound7.Active = 1;
 ButtonRound7.Transparent = 1;
 ButtonRound7.Caption = ButtonRound7_Caption;
 ButtonRound7.TextAlign = _taCenter;
 ButtonRound7.FontName =  0x0000852C ;
 ButtonRound7.PressColEnabled = 1;
 ButtonRound7.Font_Color = 0x0000;
 ButtonRound7.Gradient = 1;
 ButtonRound7.Gradient_Orientation = 0;
 ButtonRound7.Gradient_Start_Color = 0xFC08;
 ButtonRound7.Gradient_End_Color = 0x8408;
 ButtonRound7.Color = 0x8400;
 ButtonRound7.Press_Color = 0x8410;
 ButtonRound7.Corner_Radius = 3;
 ButtonRound7.OnUpPtr = 0;
 ButtonRound7.OnDownPtr = 0;
 ButtonRound7.OnClickPtr = 0;
 ButtonRound7.OnPressPtr = FLDA_PART_2_START;

 Label23.OwnerScreen = &Screen14;
 Label23.Order = 0;
 Label23.Left = 60;
 Label23.Top = 9;
 Label23.Width = 124;
 Label23.Height = 21;
 Label23.Visible = 1;
 Label23.Active = 1;
 Label23.Caption = Label23_Caption;
 Label23.FontName =  0x00008FE8 ;
 Label23.Font_Color = 0x3186;
 Label23.OnUpPtr = 0;
 Label23.OnDownPtr = 0;
 Label23.OnClickPtr = 0;
 Label23.OnPressPtr = 0;

 Label24.OwnerScreen = &Screen14;
 Label24.Order = 1;
 Label24.Left = 69;
 Label24.Top = 33;
 Label24.Width = 103;
 Label24.Height = 17;
 Label24.Visible = 1;
 Label24.Active = 1;
 Label24.Caption = Label24_Caption;
 Label24.FontName =  0x00007CC4 ;
 Label24.Font_Color = 0x3186;
 Label24.OnUpPtr = 0;
 Label24.OnDownPtr = 0;
 Label24.OnClickPtr = 0;
 Label24.OnPressPtr = 0;

 Label25.OwnerScreen = &Screen14;
 Label25.Order = 2;
 Label25.Left = 88;
 Label25.Top = 53;
 Label25.Width = 55;
 Label25.Height = 17;
 Label25.Visible = 1;
 Label25.Active = 1;
 Label25.Caption = Label25_Caption;
 Label25.FontName =  0x00007CC4 ;
 Label25.Font_Color = 0x3186;
 Label25.OnUpPtr = 0;
 Label25.OnDownPtr = 0;
 Label25.OnClickPtr = 0;
 Label25.OnPressPtr = 0;

 RadioButton12.OwnerScreen = &Screen14;
 RadioButton12.Order = 3;
 RadioButton12.Left = 32;
 RadioButton12.Top = 104;
 RadioButton12.Width = 32;
 RadioButton12.Height = 16;
 RadioButton12.Pen_Width = 1;
 RadioButton12.Pen_Color = 0x0000;
 RadioButton12.Visible = 1;
 RadioButton12.Active = 1;
 RadioButton12.Checked = 1;
 RadioButton12.Transparent = 1;
 RadioButton12.Caption = RadioButton12_Caption;
 RadioButton12.TextAlign = _taLeft;
 RadioButton12.FontName =  0x000103B0 ;
 RadioButton12.PressColEnabled = 1;
 RadioButton12.Font_Color = 0x0000;
 RadioButton12.Gradient = 1;
 RadioButton12.Gradient_Orientation = 0;
 RadioButton12.Gradient_Start_Color = 0xFFFF;
 RadioButton12.Gradient_End_Color = 0xC618;
 RadioButton12.Color = 0xC618;
 RadioButton12.Press_Color = 0xC618;
 RadioButton12.Background_Color = 0x8410;
 RadioButton12.OnUpPtr = 0;
 RadioButton12.OnDownPtr = 0;
 RadioButton12.OnClickPtr = 0;
 RadioButton12.OnPressPtr = QR2_10;

 RadioButton13.OwnerScreen = &Screen14;
 RadioButton13.Order = 4;
 RadioButton13.Left = 179;
 RadioButton13.Top = 105;
 RadioButton13.Width = 32;
 RadioButton13.Height = 16;
 RadioButton13.Pen_Width = 1;
 RadioButton13.Pen_Color = 0x0000;
 RadioButton13.Visible = 1;
 RadioButton13.Active = 1;
 RadioButton13.Checked = 1;
 RadioButton13.Transparent = 1;
 RadioButton13.Caption = RadioButton13_Caption;
 RadioButton13.TextAlign = _taLeft;
 RadioButton13.FontName =  0x000103B0 ;
 RadioButton13.PressColEnabled = 1;
 RadioButton13.Font_Color = 0x0000;
 RadioButton13.Gradient = 1;
 RadioButton13.Gradient_Orientation = 0;
 RadioButton13.Gradient_Start_Color = 0xFFFF;
 RadioButton13.Gradient_End_Color = 0xC618;
 RadioButton13.Color = 0xC618;
 RadioButton13.Press_Color = 0xC618;
 RadioButton13.Background_Color = 0x8410;
 RadioButton13.OnUpPtr = 0;
 RadioButton13.OnDownPtr = 0;
 RadioButton13.OnClickPtr = 0;
 RadioButton13.OnPressPtr = QR2_15;

 RadioButton14.OwnerScreen = &Screen14;
 RadioButton14.Order = 5;
 RadioButton14.Left = 77;
 RadioButton14.Top = 173;
 RadioButton14.Width = 32;
 RadioButton14.Height = 16;
 RadioButton14.Pen_Width = 1;
 RadioButton14.Pen_Color = 0x0000;
 RadioButton14.Visible = 1;
 RadioButton14.Active = 1;
 RadioButton14.Checked = 1;
 RadioButton14.Transparent = 1;
 RadioButton14.Caption = RadioButton14_Caption;
 RadioButton14.TextAlign = _taLeft;
 RadioButton14.FontName =  0x000103B0 ;
 RadioButton14.PressColEnabled = 1;
 RadioButton14.Font_Color = 0x0000;
 RadioButton14.Gradient = 1;
 RadioButton14.Gradient_Orientation = 0;
 RadioButton14.Gradient_Start_Color = 0xFFFF;
 RadioButton14.Gradient_End_Color = 0xC618;
 RadioButton14.Color = 0xC618;
 RadioButton14.Press_Color = 0xC618;
 RadioButton14.Background_Color = 0x8410;
 RadioButton14.OnUpPtr = 0;
 RadioButton14.OnDownPtr = 0;
 RadioButton14.OnClickPtr = 0;
 RadioButton14.OnPressPtr = QR2_25;

 RadioButton15.OwnerScreen = &Screen14;
 RadioButton15.Order = 6;
 RadioButton15.Left = 135;
 RadioButton15.Top = 172;
 RadioButton15.Width = 32;
 RadioButton15.Height = 16;
 RadioButton15.Pen_Width = 1;
 RadioButton15.Pen_Color = 0x0000;
 RadioButton15.Visible = 1;
 RadioButton15.Active = 1;
 RadioButton15.Checked = 1;
 RadioButton15.Transparent = 1;
 RadioButton15.Caption = RadioButton15_Caption;
 RadioButton15.TextAlign = _taLeft;
 RadioButton15.FontName =  0x000103B0 ;
 RadioButton15.PressColEnabled = 1;
 RadioButton15.Font_Color = 0x0000;
 RadioButton15.Gradient = 1;
 RadioButton15.Gradient_Orientation = 0;
 RadioButton15.Gradient_Start_Color = 0xFFFF;
 RadioButton15.Gradient_End_Color = 0xC618;
 RadioButton15.Color = 0xC618;
 RadioButton15.Press_Color = 0xC618;
 RadioButton15.Background_Color = 0x8410;
 RadioButton15.OnUpPtr = 0;
 RadioButton15.OnDownPtr = 0;
 RadioButton15.OnClickPtr = 0;
 RadioButton15.OnPressPtr = QR2_50;

 RadioButton16.OwnerScreen = &Screen14;
 RadioButton16.Order = 7;
 RadioButton16.Left = 29;
 RadioButton16.Top = 249;
 RadioButton16.Width = 32;
 RadioButton16.Height = 16;
 RadioButton16.Pen_Width = 1;
 RadioButton16.Pen_Color = 0x0000;
 RadioButton16.Visible = 1;
 RadioButton16.Active = 1;
 RadioButton16.Checked = 1;
 RadioButton16.Transparent = 1;
 RadioButton16.Caption = RadioButton16_Caption;
 RadioButton16.TextAlign = _taLeft;
 RadioButton16.FontName =  0x000103B0 ;
 RadioButton16.PressColEnabled = 1;
 RadioButton16.Font_Color = 0x0000;
 RadioButton16.Gradient = 1;
 RadioButton16.Gradient_Orientation = 0;
 RadioButton16.Gradient_Start_Color = 0xFFFF;
 RadioButton16.Gradient_End_Color = 0xC618;
 RadioButton16.Color = 0xC618;
 RadioButton16.Press_Color = 0xC618;
 RadioButton16.Background_Color = 0x8410;
 RadioButton16.OnUpPtr = 0;
 RadioButton16.OnDownPtr = 0;
 RadioButton16.OnClickPtr = 0;
 RadioButton16.OnPressPtr = QR2_75;

 RadioButton17.OwnerScreen = &Screen14;
 RadioButton17.Order = 8;
 RadioButton17.Left = 176;
 RadioButton17.Top = 252;
 RadioButton17.Width = 39;
 RadioButton17.Height = 16;
 RadioButton17.Pen_Width = 1;
 RadioButton17.Pen_Color = 0x0000;
 RadioButton17.Visible = 1;
 RadioButton17.Active = 1;
 RadioButton17.Checked = 1;
 RadioButton17.Transparent = 1;
 RadioButton17.Caption = RadioButton17_Caption;
 RadioButton17.TextAlign = _taLeft;
 RadioButton17.FontName =  0x000103B0 ;
 RadioButton17.PressColEnabled = 1;
 RadioButton17.Font_Color = 0x0000;
 RadioButton17.Gradient = 1;
 RadioButton17.Gradient_Orientation = 0;
 RadioButton17.Gradient_Start_Color = 0xFFFF;
 RadioButton17.Gradient_End_Color = 0xC618;
 RadioButton17.Color = 0xC618;
 RadioButton17.Press_Color = 0xC618;
 RadioButton17.Background_Color = 0x8410;
 RadioButton17.OnUpPtr = 0;
 RadioButton17.OnDownPtr = 0;
 RadioButton17.OnClickPtr = 0;
 RadioButton17.OnPressPtr = QR2_100;

 Label26.OwnerScreen = &Screen15;
 Label26.Order = 0;
 Label26.Left = 86;
 Label26.Top = 35;
 Label26.Width = 69;
 Label26.Height = 39;
 Label26.Visible = 1;
 Label26.Active = 1;
 Label26.Caption = Label26_Caption;
 Label26.FontName =  0x0000E595 ;
 Label26.Font_Color = 0xFFFF;
 Label26.OnUpPtr = 0;
 Label26.OnDownPtr = 0;
 Label26.OnClickPtr = 0;
 Label26.OnPressPtr = 0;

 Label27.OwnerScreen = &Screen15;
 Label27.Order = 1;
 Label27.Left = 47;
 Label27.Top = 85;
 Label27.Width = 136;
 Label27.Height = 39;
 Label27.Visible = 1;
 Label27.Active = 1;
 Label27.Caption = Label27_Caption;
 Label27.FontName =  0x0000E595 ;
 Label27.Font_Color = 0xFFFF;
 Label27.OnUpPtr = 0;
 Label27.OnDownPtr = 0;
 Label27.OnClickPtr = 0;
 Label27.OnPressPtr = 0;

 Label28.OwnerScreen = &Screen15;
 Label28.Order = 2;
 Label28.Left = 63;
 Label28.Top = 136;
 Label28.Width = 102;
 Label28.Height = 39;
 Label28.Visible = 1;
 Label28.Active = 1;
 Label28.Caption = Label28_Caption;
 Label28.FontName =  0x0000E595 ;
 Label28.Font_Color = 0xFFFF;
 Label28.OnUpPtr = 0;
 Label28.OnDownPtr = 0;
 Label28.OnClickPtr = 0;
 Label28.OnPressPtr = 0;

 CircleButton4.OwnerScreen = &Screen15;
 CircleButton4.Order = 3;
 CircleButton4.Left = 74;
 CircleButton4.Top = 190;
 CircleButton4.Radius = 41;
 CircleButton4.Pen_Width = 1;
 CircleButton4.Pen_Color = 0x0000;
 CircleButton4.Visible = 1;
 CircleButton4.Active = 1;
 CircleButton4.Transparent = 1;
 CircleButton4.Caption = CircleButton4_Caption;
 CircleButton4.TextAlign = _taCenter;
 CircleButton4.FontName =  0x0000852C ;
 CircleButton4.PressColEnabled = 1;
 CircleButton4.Font_Color = 0x0000;
 CircleButton4.Gradient = 1;
 CircleButton4.Gradient_Orientation = 0;
 CircleButton4.Gradient_Start_Color = 0x0408;
 CircleButton4.Gradient_End_Color = 0xFC1F;
 CircleButton4.Color = 0xC618;
 CircleButton4.Press_Color = 0x8410;
 CircleButton4.OnUpPtr = 0;
 CircleButton4.OnDownPtr = 0;
 CircleButton4.OnClickPtr = 0;
 CircleButton4.OnPressPtr = FLDA_CONTINUE;

 Label29.OwnerScreen = &Screen16;
 Label29.Order = 0;
 Label29.Left = 63;
 Label29.Top = 11;
 Label29.Width = 104;
 Label29.Height = 16;
 Label29.Visible = 1;
 Label29.Active = 1;
 Label29.Caption = Label29_Caption;
 Label29.FontName =  0x00000A6A ;
 Label29.Font_Color = 0xFFE0;
 Label29.OnUpPtr = 0;
 Label29.OnDownPtr = 0;
 Label29.OnClickPtr = 0;
 Label29.OnPressPtr = 0;

 Label30.OwnerScreen = &Screen16;
 Label30.Order = 1;
 Label30.Left = 95;
 Label30.Top = 290;
 Label30.Width = 48;
 Label30.Height = 16;
 Label30.Visible = 1;
 Label30.Active = 1;
 Label30.Caption = Label30_Caption;
 Label30.FontName =  0x00000A6A ;
 Label30.Font_Color = 0xFFE0;
 Label30.OnUpPtr = 0;
 Label30.OnDownPtr = 0;
 Label30.OnClickPtr = 0;
 Label30.OnPressPtr = 0;

 Label32.OwnerScreen = &Screen17;
 Label32.Order = 0;
 Label32.Left = 87;
 Label32.Top = 47;
 Label32.Width = 57;
 Label32.Height = 32;
 Label32.Visible = 1;
 Label32.Active = 1;
 Label32.Caption = Label32_Caption;
 Label32.FontName =  0x0000D000 ;
 Label32.Font_Color = 0x001F;
 Label32.OnUpPtr = 0;
 Label32.OnDownPtr = 0;
 Label32.OnClickPtr = 0;
 Label32.OnPressPtr = 0;

 Label33.OwnerScreen = &Screen17;
 Label33.Order = 1;
 Label33.Left = 19;
 Label33.Top = 87;
 Label33.Width = 206;
 Label33.Height = 32;
 Label33.Visible = 1;
 Label33.Active = 1;
 Label33.Caption = Label33_Caption;
 Label33.FontName =  0x0000D000 ;
 Label33.Font_Color = 0x001F;
 Label33.OnUpPtr = 0;
 Label33.OnDownPtr = 0;
 Label33.OnClickPtr = 0;
 Label33.OnPressPtr = 0;

 Label34.OwnerScreen = &Screen17;
 Label34.Order = 2;
 Label34.Left = 77;
 Label34.Top = 130;
 Label34.Width = 78;
 Label34.Height = 32;
 Label34.Visible = 1;
 Label34.Active = 1;
 Label34.Caption = Label34_Caption;
 Label34.FontName =  0x0000D000 ;
 Label34.Font_Color = 0x001F;
 Label34.OnUpPtr = 0;
 Label34.OnDownPtr = 0;
 Label34.OnClickPtr = 0;
 Label34.OnPressPtr = 0;

 CircleButton5.OwnerScreen = &Screen17;
 CircleButton5.Order = 3;
 CircleButton5.Left = 82;
 CircleButton5.Top = 194;
 CircleButton5.Radius = 32;
 CircleButton5.Pen_Width = 1;
 CircleButton5.Pen_Color = 0x0000;
 CircleButton5.Visible = 1;
 CircleButton5.Active = 1;
 CircleButton5.Transparent = 1;
 CircleButton5.Caption = CircleButton5_Caption;
 CircleButton5.TextAlign = _taCenter;
 CircleButton5.FontName =  0x00009D2A ;
 CircleButton5.PressColEnabled = 1;
 CircleButton5.Font_Color = 0x0000;
 CircleButton5.Gradient = 1;
 CircleButton5.Gradient_Orientation = 0;
 CircleButton5.Gradient_Start_Color = 0xFFE0;
 CircleButton5.Gradient_End_Color = 0x07E8;
 CircleButton5.Color = 0xC618;
 CircleButton5.Press_Color = 0x8410;
 CircleButton5.OnUpPtr = 0;
 CircleButton5.OnDownPtr = 0;
 CircleButton5.OnClickPtr = 0;
 CircleButton5.OnPressPtr = FLDA_TEST;

 Label35.OwnerScreen = &Screen18;
 Label35.Order = 0;
 Label35.Left = 81;
 Label35.Top = 28;
 Label35.Width = 66;
 Label35.Height = 17;
 Label35.Visible = 1;
 Label35.Active = 1;
 Label35.Caption = Label35_Caption;
 Label35.FontName =  0x000074CC ;
 Label35.Font_Color = 0xFFFF;
 Label35.OnUpPtr = 0;
 Label35.OnDownPtr = 0;
 Label35.OnClickPtr = 0;
 Label35.OnPressPtr = 0;

 Label36.OwnerScreen = &Screen19;
 Label36.Order = 0;
 Label36.Left = 66;
 Label36.Top = 24;
 Label36.Width = 109;
 Label36.Height = 21;
 Label36.Visible = 1;
 Label36.Active = 1;
 Label36.Caption = Label36_Caption;
 Label36.FontName =  0x0000852C ;
 Label36.Font_Color = 0xFFE6;
 Label36.OnUpPtr = 0;
 Label36.OnDownPtr = 0;
 Label36.OnClickPtr = 0;
 Label36.OnPressPtr = 0;

 ProgressBar2.OwnerScreen = &Screen19;
 ProgressBar2.Order = 1;
 ProgressBar2.Left = 64;
 ProgressBar2.Top = 176;
 ProgressBar2.Width = 100;
 ProgressBar2.Height = 17;
 ProgressBar2.Pen_Width = 1;
 ProgressBar2.Pen_Color = 0x0000;
 ProgressBar2.Visible = 1;
 ProgressBar2.Active = 1;
 ProgressBar2.Transparent = 1;
 ProgressBar2.Caption = ProgressBar2_Caption;
 ProgressBar2.FontName =  0x000103B0 ;
 ProgressBar2.Font_Color = 0x0000;
 ProgressBar2.Gradient = 1;
 ProgressBar2.Gradient_Orientation = 0;
 ProgressBar2.Gradient_Start_Color = 0xFFFF;
 ProgressBar2.Gradient_End_Color = 0x07E0;
 ProgressBar2.Color = 0xA65E;
 ProgressBar2.Background_Color = 0x8410;
 ProgressBar2.Min = 0;
 ProgressBar2.Max = 100;
 ProgressBar2.Position = 50;
 ProgressBar2.Show_Position = 1;
 ProgressBar2.Show_Percentage = 1;
 ProgressBar2.Smooth = 1;
 ProgressBar2.Rounded = 1;
 ProgressBar2.Corner_Radius = 3;

 Label37.OwnerScreen = &Screen19;
 Label37.Order = 2;
 Label37.Left = 91;
 Label37.Top = 149;
 Label37.Width = 55;
 Label37.Height = 17;
 Label37.Visible = 1;
 Label37.Active = 1;
 Label37.Caption = Label37_Caption;
 Label37.FontName =  0x000074CC ;
 Label37.Font_Color = 0xFFE6;
 Label37.OnUpPtr = 0;
 Label37.OnDownPtr = 0;
 Label37.OnClickPtr = 0;
 Label37.OnPressPtr = 0;

 CircleButton6.OwnerScreen = &Screen19;
 CircleButton6.Order = 3;
 CircleButton6.Left = 80;
 CircleButton6.Top = 218;
 CircleButton6.Radius = 33;
 CircleButton6.Pen_Width = 1;
 CircleButton6.Pen_Color = 0x0000;
 CircleButton6.Visible = 1;
 CircleButton6.Active = 1;
 CircleButton6.Transparent = 1;
 CircleButton6.Caption = CircleButton6_Caption;
 CircleButton6.TextAlign = _taCenter;
 CircleButton6.FontName =  0x0000852C ;
 CircleButton6.PressColEnabled = 1;
 CircleButton6.Font_Color = 0x0000;
 CircleButton6.Gradient = 1;
 CircleButton6.Gradient_Orientation = 0;
 CircleButton6.Gradient_Start_Color = 0xFC10;
 CircleButton6.Gradient_End_Color = 0xFFE0;
 CircleButton6.Color = 0xC618;
 CircleButton6.Press_Color = 0x8410;
 CircleButton6.OnUpPtr = 0;
 CircleButton6.OnDownPtr = 0;
 CircleButton6.OnClickPtr = 0;
 CircleButton6.OnPressPtr = FLDA_RESULTS_MAIN;

 Label38.OwnerScreen = &Screen20;
 Label38.Order = 0;
 Label38.Left = 45;
 Label38.Top = 43;
 Label38.Width = 150;
 Label38.Height = 25;
 Label38.Visible = 1;
 Label38.Active = 1;
 Label38.Caption = Label38_Caption;
 Label38.FontName =  0x0000ACFB ;
 Label38.Font_Color = 0xFFFF;
 Label38.OnUpPtr = 0;
 Label38.OnDownPtr = 0;
 Label38.OnClickPtr = 0;
 Label38.OnPressPtr = 0;
}

static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) {
 if ( (Left<= X) && (Left+ Width - 1 >= X) &&
 (Top <= Y) && (Top + Height - 1 >= Y) )
 return 1;
 else
 return 0;
}








 void DeleteTrailingSpaces(char* str){
 char i;
 i = 0;
 while(1) {
 if(str[0] == ' ') {
 for(i = 0; i < strlen(str); i++) {
 str[i] = str[i+1];
 }
 }
 else
 break;
 }
 }

void DrawRoundButton(TButton_Round *Around_button) {
 if (Around_button->Visible == 1) {
 if (object_pressed == 1) {
 object_pressed = 0;
 TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
 Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
 }
 else {
 TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
 Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
 }
 TFT_Set_Pen(Around_button->Pen_Color, Around_button->Pen_Width);
 if (Around_button->Height > Around_button->Width) {
 TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
 Around_button->Left + Around_button->Width - 2,
 Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
 }
 else
 {
 TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
 Around_button->Left + Around_button->Width - 2,
 Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
 }
 TFT_Set_Ext_Font(Around_button->FontName, Around_button->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text_Return_Pos(Around_button->Caption, Around_button->Left, Around_button->Top);
 if (Around_button->TextAlign == _taLeft)
 TFT_Write_Text(Around_button->Caption, Around_button->Left + 4, (Around_button->Top + ((Around_button->Height - caption_height) / 2)));
 else if (Around_button->TextAlign == _taCenter)
 TFT_Write_Text(Around_button->Caption, (Around_button->Left + (Around_button->Width - caption_length) / 2), (Around_button->Top + ((Around_button->Height - caption_height) / 2)));
 else if (Around_button->TextAlign == _taRight)
 TFT_Write_Text(Around_button->Caption, Around_button->Left + (Around_button->Width - caption_length - 4), (Around_button->Top + (Around_button->Height - caption_height) / 2));
 }
}

void DrawLabel(TLabel *ALabel) {
 if (ALabel->Visible == 1) {
 TFT_Set_Ext_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
 }
}

void DrawCircleButton(TCircleButton *ACircle_button) {
 if (ACircle_button->Visible == 1) {
 if (object_pressed == 1) {
 object_pressed = 0;
 TFT_Set_Brush(ACircle_button->Transparent, ACircle_button->Press_Color, ACircle_button->Gradient, ACircle_button->Gradient_Orientation,
 ACircle_button->Gradient_End_Color, ACircle_button->Gradient_Start_Color);
 }
 else {
 TFT_Set_Brush(ACircle_button->Transparent, ACircle_button->Color, ACircle_button->Gradient, ACircle_button->Gradient_Orientation,
 ACircle_button->Gradient_Start_Color, ACircle_button->Gradient_End_Color);
 }
 TFT_Set_Pen(ACircle_button->Pen_Color, ACircle_button->Pen_Width);
 TFT_Circle(ACircle_button->Left + ACircle_button->Radius,
 ACircle_button->Top + ACircle_button->Radius,
 ACircle_button->Radius);
 TFT_Set_Ext_Font(ACircle_button->FontName, ACircle_button->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text_Return_Pos(ACircle_button->Caption, ACircle_button->Left, ACircle_button->Top);
 if (ACircle_button->TextAlign == _taLeft)
 TFT_Write_Text(ACircle_button->Caption, ACircle_button->Left + 4, (ACircle_button->Top + ACircle_button->Radius - caption_height / 2));
 else if (ACircle_button->TextAlign == _taCenter)
 TFT_Write_Text(ACircle_button->Caption, (ACircle_button->Left + (ACircle_button->Radius*2 - caption_length) / 2), (ACircle_button->Top + ACircle_button->Radius - caption_height / 2));
 else if (ACircle_button->TextAlign == _taRight)
 TFT_Write_Text(ACircle_button->Caption, ACircle_button->Left + (ACircle_button->Radius*2 - caption_length - 4), (ACircle_button->Top + ACircle_button->Radius - caption_height / 2));
 }
}

void DrawRadioButton(TRadioButton *ARadioButton) {
 int circleOffset = 0;
 if (ARadioButton->Visible == 1) {
 circleOffset = ARadioButton->Height / 5;
 TFT_Set_Pen(ARadioButton->Pen_Color, ARadioButton->Pen_Width);
 if (ARadioButton->TextAlign == _taLeft) {
 TFT_Set_Brush(ARadioButton->Transparent,ARadioButton->Background_Color,0,0,0,0);
 TFT_Circle(ARadioButton->Left + ARadioButton->Height / 2, ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2);
 if (ARadioButton->Checked == 1) {
 if (object_pressed == 1) {
 object_pressed = 0;
 TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Press_Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_End_Color, ARadioButton->Gradient_Start_Color);
 }
 else
 TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_Start_Color, ARadioButton->Gradient_End_Color);
 TFT_Circle(ARadioButton->Left + ARadioButton->Height / 2 , ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2 - circleOffset);
 }
 TFT_Set_Ext_Font(ARadioButton->FontName, ARadioButton->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text_Return_Pos(ARadioButton->Caption, ARadioButton->Left + ARadioButton->Height + 4, ARadioButton->Top);
 TFT_Write_Text(ARadioButton->Caption, ARadioButton->Left + ARadioButton->Height + 4, (ARadioButton->Top + ((ARadioButton->Height - caption_height) / 2)));
 }
 else if (ARadioButton->TextAlign == _taRight) {
 TFT_Set_Brush(ARadioButton->Transparent,ARadioButton->Background_Color,0,0,0,0);
 TFT_Circle(ARadioButton->Left + ARadioButton->Width - ARadioButton->Height / 2, ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2);
 if (ARadioButton->Checked == 1) {
 if (object_pressed == 1) {
 object_pressed = 0;
 TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Press_Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_End_Color, ARadioButton->Gradient_Start_Color);
 }
 else
 TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_Start_Color, ARadioButton->Gradient_End_Color);
 TFT_Circle(ARadioButton->Left + ARadioButton->Width - ARadioButton->Height / 2, ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2 - circleOffset);
 }
 TFT_Set_Ext_Font(ARadioButton->FontName, ARadioButton->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text_Return_Pos(ARadioButton->Caption, ARadioButton->Left + 3, ARadioButton->Top);
 TFT_Write_Text(ARadioButton->Caption, ARadioButton->Left + 3, ARadioButton->Top + (ARadioButton->Height - caption_height) / 2);
 }
 }
}

void UpdatePBPosition(TProgressBar *AProgressBar) {
 int move_offset;
 unsigned int locPosition = 0;
 unsigned cnt = 0;
 char tmpStr[8];
 unsigned int tmpWidth = 0;
 unsigned int tmpRound = 0;
 move_offset = 10;
 locPosition = (float)(AProgressBar->Position - AProgressBar->Min) / (float)(AProgressBar->Max - AProgressBar->Min) * 100;
 if (AProgressBar->Visible == 1) {
 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
 TFT_Set_Pen(AProgressBar->Background_Color, AProgressBar->Pen_Width);
 TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
 if (caption_height > AProgressBar->Height)
 caption_height = AProgressBar->Height;
 if (caption_length > AProgressBar->Width)
 caption_length = AProgressBar->Width;
 if (AProgressBar->Position < (AProgressBar->Left + (AProgressBar->Width - caption_length) / 2)) {
 TFT_Rectangle(AProgressBar->Left + (AProgressBar->Width - caption_length) / 2,
 AProgressBar->Top +(AProgressBar->Height - caption_height) / 2,
 AProgressBar->Left + (AProgressBar->Width - caption_length) / 2 + caption_length,
 AProgressBar->Top +(AProgressBar->Height - caption_height) / 2 + caption_height);
 }
 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
 TFT_Set_Pen(AProgressBar->Pen_Color, AProgressBar->Pen_Width);
 if (AProgressBar->Rounded == 1) {
 if (locPosition > 0) {

 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
 TFT_Rectangle(AProgressBar->Left + AProgressBar->Corner_Radius, AProgressBar->Top, AProgressBar->Left + AProgressBar->Corner_Radius + locPosition * (AProgressBar->Width-AProgressBar->Corner_Radius*2) / 100 , AProgressBar->Top + AProgressBar->Height);
 }
 }
 else {
 if (locPosition > 0) {
 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
 TFT_Rectangle(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + (locPosition * AProgressBar->Width) / 100, AProgressBar->Top + AProgressBar->Height);
 }
 }

 if (AProgressBar->Smooth != 1) {
 if(AProgressBar->Rounded == 1) {
 tmpRound = AProgressBar->Corner_Radius;
 cnt = move_offset + tmpRound;
 tmpWidth = AProgressBar->Width - AProgressBar->Corner_Radius * 2;
 }
 else {
 tmpRound = 0;
 cnt = move_offset;
 tmpWidth = AProgressBar->Width;
 }
 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
 while (cnt-tmpRound < (locPosition * tmpWidth) / 100) {
 if (cnt - tmpRound + 3 >= tmpWidth * locPosition)
TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top, AProgressBar->Left + tmpRound + tmpWidth * locPosition , AProgressBar->Top + AProgressBar->Height);
 else
 TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top, AProgressBar->Left + cnt + 3, AProgressBar->Top + AProgressBar->Height);
 cnt = cnt + move_offset + 3;
 }
 }

 if (AProgressBar->Show_Position == 1){
 if (AProgressBar->Show_Percentage == 1) {
 IntToStr(locPosition , tmpStr);
 DeleteTrailingSpaces(tmpStr);
 strcpy(AProgressBar->Caption, tmpStr);
 strcat(AProgressBar->Caption, "\%");
 }
 else {
 IntToStr(AProgressBar->Position , tmpStr);
 DeleteTrailingSpaces(tmpStr);
 strcpy(AProgressBar->Caption, tmpStr);
 }
 TFT_Set_Ext_Font(AProgressBar->FontName, AProgressBar->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
 TFT_Write_Text(AProgressBar->Caption, AProgressBar->Left + (AProgressBar->Width - caption_length) / 2, AProgressBar->Top + (AProgressBar->Height - caption_height) / 2);
 }
 }
}

void DrawProgressBar(TProgressBar *AProgressBar) {
 int move_offset = 0;
 unsigned int locPosition = 0;
 unsigned cnt = 0;
 char tmpStr[8];
 unsigned int tmpWidth = 0;
 unsigned int tmpRound = 0;
 move_offset = 10;
 locPosition = (float)(AProgressBar->Position - AProgressBar->Min) / (float)(AProgressBar->Max - AProgressBar->Min) * 100;
 if (AProgressBar->Visible == 1) {
 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
 TFT_Set_Pen(AProgressBar->Pen_Color, AProgressBar->Pen_Width);
 if (AProgressBar->Rounded == 1) {

 TFT_Rectangle_Round_Edges(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + AProgressBar->Width, AProgressBar->Top + AProgressBar->Height, AProgressBar->Corner_Radius);
 if (locPosition > 0) {

 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
 TFT_Rectangle(AProgressBar->Left + AProgressBar->Corner_Radius, AProgressBar->Top, AProgressBar->Left + AProgressBar->Corner_Radius + locPosition * (AProgressBar->Width-AProgressBar->Corner_Radius*2) / 100, AProgressBar->Top + AProgressBar->Height);
 }
 }
 else {

 TFT_Rectangle(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + AProgressBar->Width, AProgressBar->Top + AProgressBar->Height);
 if (locPosition > 0) {

 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
 TFT_Rectangle(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + (locPosition * AProgressBar->Width) / 100, AProgressBar->Top + AProgressBar->Height);
 }
 }

 if (AProgressBar->Smooth != 1) {
 if(AProgressBar->Rounded == 1) {
 tmpRound = AProgressBar->Corner_Radius;
 cnt = move_offset + tmpRound;
 tmpWidth = AProgressBar->Width - AProgressBar->Corner_Radius * 2;
 }
 else {
 tmpRound = 0;
 cnt = move_offset;
 tmpWidth = AProgressBar->Width;
 }
 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
 while (cnt-tmpRound < (locPosition * tmpWidth) / 100) {
 if (cnt - tmpRound + 3 >= tmpWidth * locPosition)
 TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top, AProgressBar->Left + tmpRound + tmpWidth * locPosition , AProgressBar->Top + AProgressBar->Height);
 else
 TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top, AProgressBar->Left + cnt + 3, AProgressBar->Top + AProgressBar->Height);
 cnt = cnt + move_offset + 3;
 }
 }

 if (AProgressBar->Show_Position == 1){
 if (AProgressBar->Show_Percentage == 1) {
 IntToStr(locPosition , tmpStr);
 DeleteTrailingSpaces(tmpStr);
 strcpy(AProgressBar->Caption, tmpStr);
 strcat(AProgressBar->Caption, "\%");
 }
 else {
 IntToStr(AProgressBar->Position , tmpStr);
 DeleteTrailingSpaces(tmpStr);
 strcpy(AProgressBar->Caption, tmpStr);
 }
 TFT_Set_Ext_Font(AProgressBar->FontName, AProgressBar->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
 TFT_Write_Text(AProgressBar->Caption, AProgressBar->Left + (AProgressBar->Width - caption_length) / 2, AProgressBar->Top + (AProgressBar->Height - caption_height) / 2);
 }
 }
}

void DrawScreen(TScreen *aScreen) {
 int order;
 unsigned short round_button_idx;
 TButton_Round *local_round_button;
 unsigned short label_idx;
 TLabel *local_label;
 unsigned short circle_button_idx;
 TCircleButton *local_circle_button;
 unsigned short radio_button_idx;
 TRadioButton *local_radio_button;
 unsigned short progress_bar_idx;
 TProgressBar *local_progress_bar;
 char save_bled, save_bled_direction;

 object_pressed = 0;
 order = 0;
 round_button_idx = 0;
 label_idx = 0;
 circle_button_idx = 0;
 radio_button_idx = 0;
 progress_bar_idx = 0;
 CurrentScreen = aScreen;

 if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
 save_bled = TFT_BLED;
 TFT_BLED = 0;
 TFT_Init(CurrentScreen->Width, CurrentScreen->Height);
 TFT_Set_Ext_Buffer(TFT_Get_Data);
 TP_TFT_Init(CurrentScreen->Width, CurrentScreen->Height, 8, 9);
 TP_TFT_Set_ADC_Threshold(ADC_THRESHOLD);
 TFT_Fill_Screen(CurrentScreen->Color);
 display_width = CurrentScreen->Width;
 display_height = CurrentScreen->Height;
 TFT_BLED = save_bled;
 }
 else
 TFT_Fill_Screen(CurrentScreen->Color);


 while (order < CurrentScreen->ObjectsCount) {
 if (round_button_idx < CurrentScreen->Buttons_RoundCount) {
 local_round_button =  CurrentScreen->Buttons_Round[round_button_idx] ;
 if (order == local_round_button->Order) {
 order++;
 round_button_idx++;
 DrawRoundButton(local_round_button);
 }
 }

 if (label_idx < CurrentScreen->LabelsCount) {
 local_label =  CurrentScreen->Labels[label_idx] ;
 if (order == local_label->Order) {
 label_idx++;
 order++;
 DrawLabel(local_label);
 }
 }

 if (circle_button_idx < CurrentScreen->CircleButtonsCount) {
 local_circle_button =  CurrentScreen->CircleButtons[circle_button_idx] ;
 if (order == local_circle_button->Order) {
 circle_button_idx++;
 order++;
 DrawCircleButton(local_circle_button);
 }
 }

 if (radio_button_idx < CurrentScreen->RadioButtonsCount) {
 local_radio_button =  CurrentScreen->RadioButtons[radio_button_idx] ;
 if (order == local_radio_button->Order) {
 radio_button_idx++;
 order++;
 DrawRadioButton(local_radio_button);
 }
 }

 if (progress_bar_idx < CurrentScreen->ProgressBarsCount) {
 local_progress_bar =  CurrentScreen->ProgressBars[progress_bar_idx] ;
 if (order == local_progress_bar->Order) {
 progress_bar_idx++;
 order++;
 DrawProgressBar(local_progress_bar);
 }
 }

 }
}

void Get_Object(unsigned int X, unsigned int Y) {
 round_button_order = -1;
 label_order = -1;
 circle_button_order = -1;
 radio_button_order = -1;
 progress_bar_order = -1;

 for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
 local_round_button =  CurrentScreen->Buttons_Round[_object_count] ;
 if (local_round_button->Active == 1) {
 if (IsInsideObject(X, Y, local_round_button->Left, local_round_button->Top,
 local_round_button->Width, local_round_button->Height) == 1) {
 round_button_order = local_round_button->Order;
 exec_round_button = local_round_button;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
 local_label =  CurrentScreen->Labels[_object_count] ;
 if (local_label->Active == 1) {
 if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
 local_label->Width, local_label->Height) == 1) {
 label_order = local_label->Order;
 exec_label = local_label;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->CircleButtonsCount ; _object_count++ ) {
 local_circle_button =  CurrentScreen->CircleButtons[_object_count] ;
 if (local_circle_button->Active == 1) {
 if (IsInsideObject(X, Y, local_circle_button->Left, local_circle_button->Top,
 (local_circle_button->Radius * 2), (local_circle_button->Radius * 2)) == 1) {
 circle_button_order = local_circle_button->Order;
 exec_circle_button = local_circle_button;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->RadioButtonsCount ; _object_count++ ) {
 local_radio_button =  CurrentScreen->RadioButtons[_object_count] ;
 if (local_radio_button->Active == 1) {
 if (IsInsideObject(X, Y, local_radio_button->Left, local_radio_button->Top,
 local_radio_button->Width, local_radio_button->Height) == 1) {
 radio_button_order = local_radio_button->Order;
 exec_radio_button = local_radio_button;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->ProgressBarsCount ; _object_count++ ) {
 local_progress_bar =  CurrentScreen->ProgressBars[_object_count] ;
 if (local_progress_bar->Active == 1) {
 if (IsInsideObject(X, Y, local_progress_bar->Left, local_progress_bar->Top,
 local_progress_bar->Width, local_progress_bar->Height) == 1) {
 progress_bar_order = local_progress_bar->Order;
 exec_progress_bar = local_progress_bar;
 }
 }
 }

 _object_count = -1;
 if (round_button_order > _object_count)
 _object_count = round_button_order;
 if (label_order > _object_count )
 _object_count = label_order;
 if (circle_button_order > _object_count )
 _object_count = circle_button_order;
 if (radio_button_order > _object_count )
 _object_count = radio_button_order;
 if (progress_bar_order > _object_count )
 _object_count = progress_bar_order;
}


static void Process_TP_Press(unsigned int X, unsigned int Y) {
 exec_round_button = 0;
 exec_label = 0;
 exec_circle_button = 0;
 exec_radio_button = 0;
 exec_progress_bar = 0;

 Get_Object(X, Y);


 if (_object_count != -1) {
 if (_object_count == round_button_order) {
 if (exec_round_button->Active == 1) {
 if (exec_round_button->OnPressPtr != 0) {
 exec_round_button->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == label_order) {
 if (exec_label->Active == 1) {
 if (exec_label->OnPressPtr != 0) {
 exec_label->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == circle_button_order) {
 if (exec_circle_button->Active == 1) {
 if (exec_circle_button->OnPressPtr != 0) {
 exec_circle_button->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == radio_button_order) {
 if (exec_radio_button->Active == 1) {
 if (exec_radio_button->OnPressPtr != 0) {
 exec_radio_button->OnPressPtr();
 return;
 }
 }
 }

 }
}

static void Process_TP_Up(unsigned int X, unsigned int Y) {

 switch (PressedObjectType) {

 case 1: {
 if (PressedObject != 0) {
 exec_round_button = (TButton_Round*)PressedObject;
 if ((exec_round_button->PressColEnabled == 1) && (exec_round_button->OwnerScreen == CurrentScreen)) {
 DrawRoundButton(exec_round_button);
 }
 break;
 }
 break;
 }

 case 5: {
 if (PressedObject != 0) {
 exec_circle_button = (TCircleButton*)PressedObject;
 if ((exec_circle_button->PressColEnabled == 1) && (exec_circle_button->OwnerScreen == CurrentScreen)) {
 DrawCircleButton(exec_circle_button);
 }
 break;
 }
 break;
 }

 case 17: {
 if (PressedObject != 0) {
 exec_radio_button = (TRadioButton*)PressedObject;
 if ((exec_radio_button->PressColEnabled == 1) && (exec_radio_button->OwnerScreen == CurrentScreen)) {
 DrawRadioButton(exec_radio_button);
 }
 break;
 }
 break;
 }
 }

 exec_label = 0;

 Get_Object(X, Y);


 if (_object_count != -1) {

 if (_object_count == round_button_order) {
 if (exec_round_button->Active == 1) {
 if (exec_round_button->OnUpPtr != 0)
 exec_round_button->OnUpPtr();
 if (PressedObject == (void *)exec_round_button)
 if (exec_round_button->OnClickPtr != 0)
 exec_round_button->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == label_order) {
 if (exec_label->Active == 1) {
 if (exec_label->OnUpPtr != 0)
 exec_label->OnUpPtr();
 if (PressedObject == (void *)exec_label)
 if (exec_label->OnClickPtr != 0)
 exec_label->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == circle_button_order) {
 if (exec_circle_button->Active == 1) {
 if (exec_circle_button->OnUpPtr != 0)
 exec_circle_button->OnUpPtr();
 if (PressedObject == (void *)exec_circle_button)
 if (exec_circle_button->OnClickPtr != 0)
 exec_circle_button->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == radio_button_order) {
 if (exec_radio_button->Active == 1) {
 if (exec_radio_button->OnUpPtr != 0)
 exec_radio_button->OnUpPtr();
 if (PressedObject == (void *)exec_radio_button)
 if (exec_radio_button->OnClickPtr != 0)
 exec_radio_button->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }

 }
 PressedObject = 0;
 PressedObjectType = -1;
}

static void Process_TP_Down(unsigned int X, unsigned int Y) {

 object_pressed = 0;
 exec_round_button = 0;
 exec_label = 0;
 exec_circle_button = 0;
 exec_radio_button = 0;

 Get_Object(X, Y);

 if (_object_count != -1) {
 if (_object_count == round_button_order) {
 if (exec_round_button->Active == 1) {
 if (exec_round_button->PressColEnabled == 1) {
 object_pressed = 1;
 DrawRoundButton(exec_round_button);
 }
 PressedObject = (void *)exec_round_button;
 PressedObjectType = 1;
 if (exec_round_button->OnDownPtr != 0) {
 exec_round_button->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == label_order) {
 if (exec_label->Active == 1) {
 PressedObject = (void *)exec_label;
 PressedObjectType = 2;
 if (exec_label->OnDownPtr != 0) {
 exec_label->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == circle_button_order) {
 if (exec_circle_button->Active == 1) {
 if (exec_circle_button->PressColEnabled == 1) {
 object_pressed = 1;
 DrawCircleButton(exec_circle_button);
 }
 PressedObject = (void *)exec_circle_button;
 PressedObjectType = 5;
 if (exec_circle_button->OnDownPtr != 0) {
 exec_circle_button->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == radio_button_order) {
 if (exec_radio_button->Active == 1) {
 if (exec_radio_button->PressColEnabled == 1) {
 object_pressed = 1;
 DrawRadioButton(exec_radio_button);
 }
 PressedObject = (void *)exec_radio_button;
 PressedObjectType = 17;
 if (exec_radio_button->OnDownPtr != 0) {
 exec_radio_button->OnDownPtr();
 return;
 }
 }
 }

 }
}

void Check_TP() {
 if (TP_TFT_Press_Detect()) {

 if (TP_TFT_Get_Coordinates(&Xcoord, &Ycoord) == 0) {
 Process_TP_Press(Xcoord, Ycoord);
 if (PenDown == 0) {
 PenDown = 1;
 Process_TP_Down(Xcoord, Ycoord);
 }
 }
 }
 else if (PenDown == 1) {
 PenDown = 0;
 Process_TP_Up(Xcoord, Ycoord);
 }
}

void Init_MCU() {
 GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_9);
 TFT_BLED = 1;
 TFT_Set_Default_Mode();
 TP_TFT_Set_Default_Mode();
}

void Init_Ext_Mem() {

 SPI3_Init_Advanced(_SPI_FPCLK_DIV64, _SPI_MASTER | _SPI_8_BIT |
 _SPI_CLK_IDLE_LOW | _SPI_FIRST_CLK_EDGE_TRANSITION |
 _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
 &_GPIO_MODULE_SPI3_PC10_11_12);
 Delay_ms(10);

 if (!Mmc_Fat_Init()) {
 SPI3_CR1 = 0;

 SPI3_Init_Advanced(_SPI_FPCLK_DIV2, _SPI_MASTER | _SPI_8_BIT |
 _SPI_CLK_IDLE_LOW | _SPI_FIRST_CLK_EDGE_TRANSITION |
 _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
 &_GPIO_MODULE_SPI3_PC10_11_12);

 Mmc_Fat_Assign("PCA_FLDA.RES", 0);
 Mmc_Fat_Reset(&res_file_size);
 }
}

void Start_TP() {
 Init_MCU();

 Init_Ext_Mem();

 InitializeTouchPanel();

 Delay_ms(1000);
 TFT_Fill_Screen(0);
 Calibrate();
 TFT_Fill_Screen(0);

 InitializeObjects();
 display_width = Screen1.Width;
 display_height = Screen1.Height;
 DrawScreen(&Screen1);
}
