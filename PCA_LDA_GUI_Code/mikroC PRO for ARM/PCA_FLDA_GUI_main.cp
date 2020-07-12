#line 1 "X:/›T‹/MikroC TEZ/MAKALE_GUI/PCA_FLDA_GUI_Code/mikroC PRO for ARM/PCA_FLDA_GUI_main.c"
#line 1 "x:/›t‹/mikroc tez/makale_gui/pca_flda_gui_code/mikroc pro for arm/pca_flda_gui_objects.h"
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
#line 21 "X:/›T‹/MikroC TEZ/MAKALE_GUI/PCA_FLDA_GUI_Code/mikroC PRO for ARM/PCA_FLDA_GUI_main.c"
void main() {

 Start_TP();

 while (1) {
 Check_TP();

 }

}
