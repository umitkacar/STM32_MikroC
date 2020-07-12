#include "FISHER_GUI_objects.h"
#include "FISHER_GUI_resources.h"
#include "built_in.h"

// Extern memory interface
// MMC/SD Connections
sbit Mmc_Chip_Select           at GPIOD_ODR.B3;
// end of MMC/SD
// TFT Get Data globals
char Ext_Data_Buffer[512];
unsigned long currentSector = -1, res_file_size;
// end of TFT Get Data
// End of extern memory interface


// TFT module connections
unsigned int TFT_DataPort at GPIOE_ODR;
sbit TFT_RST at GPIOE_ODR.B8;
sbit TFT_RS at GPIOE_ODR.B12;
sbit TFT_CS at GPIOE_ODR.B15;
sbit TFT_RD at GPIOE_ODR.B10;
sbit TFT_WR at GPIOE_ODR.B11;
sbit TFT_BLED at GPIOE_ODR.B9;
// End TFT module connections

// Touch Panel module connections
sbit DRIVEX_LEFT at GPIOB_ODR.B1;
sbit DRIVEX_RIGHT at GPIOB_ODR.B8;
sbit DRIVEY_UP at GPIOB_ODR.B9;
sbit DRIVEY_DOWN at GPIOB_ODR.B0;
// End Touch Panel module connections

// Global variables
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
TImage *local_image;
TImage *exec_image;
int image_order;
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

  TP_TFT_Init(240, 320, 8, 9);                                  // Initialize touch panel
  TP_TFT_Set_ADC_Threshold(ADC_THRESHOLD);                              // Set touch panel ADC threshold

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

  TP_TFT_Calibrate_Min();                      // Calibration of bottom left corner
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

  TP_TFT_Calibrate_Max();                      // Calibration of bottom left corner
  Delay_ms(500);
}


/////////////////////////
  TScreen*  CurrentScreen;

  TScreen                MainScreen1;
  TLabel                 Label1;
char Label1_Caption[29] = "Fisher Discriminant Analysis";

  TButton_Round          Test_ButtonRound1;
char Test_ButtonRound1_Caption[5] = "Test";

  TButton_Round          Training_ButtonRound1;
char Training_ButtonRound1_Caption[9] = "Training";

  TButton_Round          Database_Show_ButtonRound1;
char Database_Show_ButtonRound1_Caption[14] = "Database Show";

  TRadioButton                 CP_2_RadioButton1;
char CP_2_RadioButton1_Caption[5] = "CP=2";

  TRadioButton                 CP_3_RadioButton1;
char CP_3_RadioButton1_Caption[5] = "CP=3";

  TRadioButton                 CP_4_RadioButton1;
char CP_4_RadioButton1_Caption[5] = "CP=4";

  TRadioButton                 CP_5_RadioButton1;
char CP_5_RadioButton1_Caption[5] = "CP=5";

  TProgressBar                 Success_ProgressBar1;
char Success_ProgressBar1_Caption[8] = "0\%";

  TLabel                 Label2;
char Label2_Caption[10] = "% Success";

  TLabel                 Label3;
char Label3_Caption[16] = "Ear Recognition";

  TButton_Round          * const code Screen1_Buttons_Round[3]=
         {
         &Test_ButtonRound1,   
         &Training_ButtonRound1,
         &Database_Show_ButtonRound1
         };
  TLabel                 * const code Screen1_Labels[3]=
         {
         &Label1,              
         &Label2,              
         &Label3               
         };
  TRadioButton               * const code Screen1_RadioButtons[4]=
         {
         &CP_2_RadioButton1,   
         &CP_3_RadioButton1,   
         &CP_4_RadioButton1,   
         &CP_5_RadioButton1    
         };
  TProgressBar               * const code Screen1_ProgressBars[1]=
         {
         &Success_ProgressBar1 
         };


  TScreen                DatabaseScreen2;
  TLabel                 Label4;
char Label4_Caption[14] = "EAR DATABASE ";

  TLabel                 * const code Screen2_Labels[1]=
         {
         &Label4               
         };


  TScreen                TrainingScreen3;
  TImage               Image1;
  TLabel                 Label5;
char Label5_Caption[18] = "TRAINING DATABASE";

  TLabel                 * const code Screen3_Labels[1]=
         {
         &Label5               
         };
  TImage                 * const code Screen3_Images[1]=
         {
         &Image1               
         };


  TScreen                TestScreen4;
  TLabel                 Label6;
char Label6_Caption[5] = "TEST";

  TLabel                 * const code Screen4_Labels[1]=
         {
         &Label6               
         };




static void InitializeObjects() {
  MainScreen1.Color                     = 0xFFF0;
  MainScreen1.Width                     = 240;
  MainScreen1.Height                    = 320;
  MainScreen1.Buttons_RoundCount        = 3;
  MainScreen1.Buttons_Round             = Screen1_Buttons_Round;
  MainScreen1.LabelsCount               = 3;
  MainScreen1.Labels                    = Screen1_Labels;
  MainScreen1.ImagesCount               = 0;
  MainScreen1.RadioButtonsCount           = 4;
  MainScreen1.RadioButtons                = Screen1_RadioButtons;
  MainScreen1.ProgressBarsCount           = 1;
  MainScreen1.ProgressBars                = Screen1_ProgressBars;
  MainScreen1.ObjectsCount              = 11;

  DatabaseScreen2.Color                     = 0x07FF;
  DatabaseScreen2.Width                     = 240;
  DatabaseScreen2.Height                    = 320;
  DatabaseScreen2.Buttons_RoundCount        = 0;
  DatabaseScreen2.LabelsCount               = 1;
  DatabaseScreen2.Labels                    = Screen2_Labels;
  DatabaseScreen2.ImagesCount               = 0;
  DatabaseScreen2.RadioButtonsCount           = 0;
  DatabaseScreen2.ProgressBarsCount           = 0;
  DatabaseScreen2.ObjectsCount              = 1;

  TrainingScreen3.Color                     = 0x07F0;
  TrainingScreen3.Width                     = 240;
  TrainingScreen3.Height                    = 320;
  TrainingScreen3.Buttons_RoundCount        = 0;
  TrainingScreen3.LabelsCount               = 1;
  TrainingScreen3.Labels                    = Screen3_Labels;
  TrainingScreen3.ImagesCount               = 1;
  TrainingScreen3.Images                    = Screen3_Images;
  TrainingScreen3.RadioButtonsCount           = 0;
  TrainingScreen3.ProgressBarsCount           = 0;
  TrainingScreen3.ObjectsCount              = 2;

  TestScreen4.Color                     = 0x8140;
  TestScreen4.Width                     = 240;
  TestScreen4.Height                    = 320;
  TestScreen4.Buttons_RoundCount        = 0;
  TestScreen4.LabelsCount               = 1;
  TestScreen4.Labels                    = Screen4_Labels;
  TestScreen4.ImagesCount               = 0;
  TestScreen4.RadioButtonsCount           = 0;
  TestScreen4.ProgressBarsCount           = 0;
  TestScreen4.ObjectsCount              = 1;


  Label1.OwnerScreen     = &MainScreen1;
  Label1.Order          = 0;
  Label1.Left           = 32;
  Label1.Top            = 26;
  Label1.Width          = 168;
  Label1.Height         = 16;
  Label1.Visible        = 1;
  Label1.Active         = 1;
  Label1.Caption        = Label1_Caption;
  Label1.FontName       = Arial13x16_Italic;
  Label1.Font_Color     = 0xF800;
  Label1.OnUpPtr         = 0;
  Label1.OnDownPtr       = 0;
  Label1.OnClickPtr      = 0;
  Label1.OnPressPtr      = 0;

  Test_ButtonRound1.OwnerScreen     = &MainScreen1;
  Test_ButtonRound1.Order           = 1;
  Test_ButtonRound1.Left            = 31;
  Test_ButtonRound1.Top             = 210;
  Test_ButtonRound1.Width           = 77;
  Test_ButtonRound1.Height          = 31;
  Test_ButtonRound1.Pen_Width       = 1;
  Test_ButtonRound1.Pen_Color       = 0x0000;
  Test_ButtonRound1.Visible         = 1;
  Test_ButtonRound1.Active          = 1;
  Test_ButtonRound1.Transparent     = 1;
  Test_ButtonRound1.Caption         = Test_ButtonRound1_Caption;
  Test_ButtonRound1.TextAlign             = _taCenter;
  Test_ButtonRound1.FontName        = Tahoma11x13_Regular;
  Test_ButtonRound1.PressColEnabled = 1;
  Test_ButtonRound1.Font_Color      = 0x0000;
  Test_ButtonRound1.Gradient        = 1;
  Test_ButtonRound1.Gradient_Orientation    = 0;
  Test_ButtonRound1.Gradient_Start_Color    = 0xFFFF;
  Test_ButtonRound1.Gradient_End_Color      = 0xC618;
  Test_ButtonRound1.Color           = 0xC618;
  Test_ButtonRound1.Press_Color     = 0x8410;
  Test_ButtonRound1.Corner_Radius      = 3;
  Test_ButtonRound1.OnUpPtr         = 0;
  Test_ButtonRound1.OnDownPtr       = 0;
  Test_ButtonRound1.OnClickPtr      = Test;
  Test_ButtonRound1.OnPressPtr      = 0;

  Training_ButtonRound1.OwnerScreen     = &MainScreen1;
  Training_ButtonRound1.Order           = 2;
  Training_ButtonRound1.Left            = 30;
  Training_ButtonRound1.Top             = 145;
  Training_ButtonRound1.Width           = 75;
  Training_ButtonRound1.Height          = 34;
  Training_ButtonRound1.Pen_Width       = 1;
  Training_ButtonRound1.Pen_Color       = 0x0000;
  Training_ButtonRound1.Visible         = 1;
  Training_ButtonRound1.Active          = 1;
  Training_ButtonRound1.Transparent     = 1;
  Training_ButtonRound1.Caption         = Training_ButtonRound1_Caption;
  Training_ButtonRound1.TextAlign             = _taCenter;
  Training_ButtonRound1.FontName        = Tahoma11x13_Regular;
  Training_ButtonRound1.PressColEnabled = 1;
  Training_ButtonRound1.Font_Color      = 0x0000;
  Training_ButtonRound1.Gradient        = 1;
  Training_ButtonRound1.Gradient_Orientation    = 0;
  Training_ButtonRound1.Gradient_Start_Color    = 0xFFFF;
  Training_ButtonRound1.Gradient_End_Color      = 0xC618;
  Training_ButtonRound1.Color           = 0xC618;
  Training_ButtonRound1.Press_Color     = 0x8410;
  Training_ButtonRound1.Corner_Radius      = 3;
  Training_ButtonRound1.OnUpPtr         = 0;
  Training_ButtonRound1.OnDownPtr       = 0;
  Training_ButtonRound1.OnClickPtr      = 0;
  Training_ButtonRound1.OnPressPtr      = Training;

  Database_Show_ButtonRound1.OwnerScreen     = &MainScreen1;
  Database_Show_ButtonRound1.Order           = 3;
  Database_Show_ButtonRound1.Left            = 28;
  Database_Show_ButtonRound1.Top             = 83;
  Database_Show_ButtonRound1.Width           = 89;
  Database_Show_ButtonRound1.Height          = 35;
  Database_Show_ButtonRound1.Pen_Width       = 1;
  Database_Show_ButtonRound1.Pen_Color       = 0x0000;
  Database_Show_ButtonRound1.Visible         = 1;
  Database_Show_ButtonRound1.Active          = 1;
  Database_Show_ButtonRound1.Transparent     = 1;
  Database_Show_ButtonRound1.Caption         = Database_Show_ButtonRound1_Caption;
  Database_Show_ButtonRound1.TextAlign             = _taCenter;
  Database_Show_ButtonRound1.FontName        = Tahoma11x13_Regular;
  Database_Show_ButtonRound1.PressColEnabled = 1;
  Database_Show_ButtonRound1.Font_Color      = 0x0000;
  Database_Show_ButtonRound1.Gradient        = 1;
  Database_Show_ButtonRound1.Gradient_Orientation    = 0;
  Database_Show_ButtonRound1.Gradient_Start_Color    = 0xFFFF;
  Database_Show_ButtonRound1.Gradient_End_Color      = 0xC618;
  Database_Show_ButtonRound1.Color           = 0xC618;
  Database_Show_ButtonRound1.Press_Color     = 0x8410;
  Database_Show_ButtonRound1.Corner_Radius      = 3;
  Database_Show_ButtonRound1.OnUpPtr         = 0;
  Database_Show_ButtonRound1.OnDownPtr       = 0;
  Database_Show_ButtonRound1.OnClickPtr      = 0;
  Database_Show_ButtonRound1.OnPressPtr      = Database_Show;

  CP_2_RadioButton1.OwnerScreen     = &MainScreen1;
  CP_2_RadioButton1.Order           = 4;
  CP_2_RadioButton1.Left            = 162;
  CP_2_RadioButton1.Top             = 90;
  CP_2_RadioButton1.Width           = 47;
  CP_2_RadioButton1.Height          = 16;
  CP_2_RadioButton1.Pen_Width       = 1;
  CP_2_RadioButton1.Pen_Color       = 0x0000;
  CP_2_RadioButton1.Visible         = 1;
  CP_2_RadioButton1.Active          = 1;
  CP_2_RadioButton1.Checked          = 1;
  CP_2_RadioButton1.Transparent     = 1;
  CP_2_RadioButton1.Caption         = CP_2_RadioButton1_Caption;
  CP_2_RadioButton1.TextAlign            = _taLeft;
  CP_2_RadioButton1.FontName        = Tahoma11x13_Regular;
  CP_2_RadioButton1.PressColEnabled = 1;
  CP_2_RadioButton1.Font_Color      = 0x0000;
  CP_2_RadioButton1.Gradient        = 1;
  CP_2_RadioButton1.Gradient_Orientation    = 0;
  CP_2_RadioButton1.Gradient_Start_Color    = 0xFFFF;
  CP_2_RadioButton1.Gradient_End_Color      = 0xC618;
  CP_2_RadioButton1.Color           = 0xC618;
  CP_2_RadioButton1.Press_Color     = 0xC618;
  CP_2_RadioButton1.Background_Color = 0x8410;
  CP_2_RadioButton1.OnUpPtr         = 0;
  CP_2_RadioButton1.OnDownPtr       = 0;
  CP_2_RadioButton1.OnClickPtr      = 0;
  CP_2_RadioButton1.OnPressPtr      = CP_2;

  CP_3_RadioButton1.OwnerScreen     = &MainScreen1;
  CP_3_RadioButton1.Order           = 5;
  CP_3_RadioButton1.Left            = 159;
  CP_3_RadioButton1.Top             = 140;
  CP_3_RadioButton1.Width           = 47;
  CP_3_RadioButton1.Height          = 16;
  CP_3_RadioButton1.Pen_Width       = 1;
  CP_3_RadioButton1.Pen_Color       = 0x0000;
  CP_3_RadioButton1.Visible         = 1;
  CP_3_RadioButton1.Active          = 1;
  CP_3_RadioButton1.Checked          = 1;
  CP_3_RadioButton1.Transparent     = 1;
  CP_3_RadioButton1.Caption         = CP_3_RadioButton1_Caption;
  CP_3_RadioButton1.TextAlign            = _taLeft;
  CP_3_RadioButton1.FontName        = Tahoma11x13_Regular;
  CP_3_RadioButton1.PressColEnabled = 1;
  CP_3_RadioButton1.Font_Color      = 0x0000;
  CP_3_RadioButton1.Gradient        = 1;
  CP_3_RadioButton1.Gradient_Orientation    = 0;
  CP_3_RadioButton1.Gradient_Start_Color    = 0xFFFF;
  CP_3_RadioButton1.Gradient_End_Color      = 0xC618;
  CP_3_RadioButton1.Color           = 0xC618;
  CP_3_RadioButton1.Press_Color     = 0xC618;
  CP_3_RadioButton1.Background_Color = 0x8410;
  CP_3_RadioButton1.OnUpPtr         = 0;
  CP_3_RadioButton1.OnDownPtr       = 0;
  CP_3_RadioButton1.OnClickPtr      = 0;
  CP_3_RadioButton1.OnPressPtr      = CP_3;

  CP_4_RadioButton1.OwnerScreen     = &MainScreen1;
  CP_4_RadioButton1.Order           = 6;
  CP_4_RadioButton1.Left            = 158;
  CP_4_RadioButton1.Top             = 199;
  CP_4_RadioButton1.Width           = 47;
  CP_4_RadioButton1.Height          = 16;
  CP_4_RadioButton1.Pen_Width       = 1;
  CP_4_RadioButton1.Pen_Color       = 0x0000;
  CP_4_RadioButton1.Visible         = 1;
  CP_4_RadioButton1.Active          = 1;
  CP_4_RadioButton1.Checked          = 1;
  CP_4_RadioButton1.Transparent     = 1;
  CP_4_RadioButton1.Caption         = CP_4_RadioButton1_Caption;
  CP_4_RadioButton1.TextAlign            = _taLeft;
  CP_4_RadioButton1.FontName        = Tahoma11x13_Regular;
  CP_4_RadioButton1.PressColEnabled = 1;
  CP_4_RadioButton1.Font_Color      = 0x0000;
  CP_4_RadioButton1.Gradient        = 1;
  CP_4_RadioButton1.Gradient_Orientation    = 0;
  CP_4_RadioButton1.Gradient_Start_Color    = 0xFFFF;
  CP_4_RadioButton1.Gradient_End_Color      = 0xC618;
  CP_4_RadioButton1.Color           = 0xC618;
  CP_4_RadioButton1.Press_Color     = 0xC618;
  CP_4_RadioButton1.Background_Color = 0x8410;
  CP_4_RadioButton1.OnUpPtr         = 0;
  CP_4_RadioButton1.OnDownPtr       = 0;
  CP_4_RadioButton1.OnClickPtr      = 0;
  CP_4_RadioButton1.OnPressPtr      = CP_4;

  CP_5_RadioButton1.OwnerScreen     = &MainScreen1;
  CP_5_RadioButton1.Order           = 7;
  CP_5_RadioButton1.Left            = 156;
  CP_5_RadioButton1.Top             = 252;
  CP_5_RadioButton1.Width           = 47;
  CP_5_RadioButton1.Height          = 16;
  CP_5_RadioButton1.Pen_Width       = 1;
  CP_5_RadioButton1.Pen_Color       = 0x0000;
  CP_5_RadioButton1.Visible         = 1;
  CP_5_RadioButton1.Active          = 1;
  CP_5_RadioButton1.Checked          = 1;
  CP_5_RadioButton1.Transparent     = 1;
  CP_5_RadioButton1.Caption         = CP_5_RadioButton1_Caption;
  CP_5_RadioButton1.TextAlign            = _taLeft;
  CP_5_RadioButton1.FontName        = Tahoma11x13_Regular;
  CP_5_RadioButton1.PressColEnabled = 1;
  CP_5_RadioButton1.Font_Color      = 0x0000;
  CP_5_RadioButton1.Gradient        = 1;
  CP_5_RadioButton1.Gradient_Orientation    = 0;
  CP_5_RadioButton1.Gradient_Start_Color    = 0xFFFF;
  CP_5_RadioButton1.Gradient_End_Color      = 0xC618;
  CP_5_RadioButton1.Color           = 0xC618;
  CP_5_RadioButton1.Press_Color     = 0xC618;
  CP_5_RadioButton1.Background_Color = 0x8410;
  CP_5_RadioButton1.OnUpPtr         = 0;
  CP_5_RadioButton1.OnDownPtr       = 0;
  CP_5_RadioButton1.OnClickPtr      = 0;
  CP_5_RadioButton1.OnPressPtr      = CP_5;

  Success_ProgressBar1.OwnerScreen     = &MainScreen1;
  Success_ProgressBar1.Order           = 8;
  Success_ProgressBar1.Left            = 19;
  Success_ProgressBar1.Top             = 270;
  Success_ProgressBar1.Width           = 100;
  Success_ProgressBar1.Height          = 17;
  Success_ProgressBar1.Pen_Width       = 1;
  Success_ProgressBar1.Pen_Color       = 0x0000;
  Success_ProgressBar1.Visible         = 1;
  Success_ProgressBar1.Active          = 1;
  Success_ProgressBar1.Transparent     = 1;
  Success_ProgressBar1.Caption         = Success_ProgressBar1_Caption;
  Success_ProgressBar1.FontName        = Tahoma11x13_Regular;
  Success_ProgressBar1.Font_Color      = 0x0000;
  Success_ProgressBar1.Gradient        = 1;
  Success_ProgressBar1.Gradient_Orientation    = 0;
  Success_ProgressBar1.Gradient_Start_Color    = 0xFFFF;
  Success_ProgressBar1.Gradient_End_Color      = 0x07E0;
  Success_ProgressBar1.Color           = 0xA65E;
  Success_ProgressBar1.Background_Color = 0x8410;
  Success_ProgressBar1.Min             = 0;
  Success_ProgressBar1.Max             = 100;
  Success_ProgressBar1.Position        = 0;
  Success_ProgressBar1.Show_Position   = 1;
  Success_ProgressBar1.Show_Percentage = 1;
  Success_ProgressBar1.Smooth          = 1;
  Success_ProgressBar1.Rounded         = 1;
  Success_ProgressBar1.Corner_Radius      = 3;

  Label2.OwnerScreen     = &MainScreen1;
  Label2.Order          = 9;
  Label2.Left           = 37;
  Label2.Top            = 251;
  Label2.Width          = 66;
  Label2.Height         = 16;
  Label2.Visible        = 1;
  Label2.Active         = 1;
  Label2.Caption        = Label2_Caption;
  Label2.FontName       = Arial13x16_Italic;
  Label2.Font_Color     = 0xF800;
  Label2.OnUpPtr         = 0;
  Label2.OnDownPtr       = 0;
  Label2.OnClickPtr      = 0;
  Label2.OnPressPtr      = 0;

  Label3.OwnerScreen     = &MainScreen1;
  Label3.Order          = 10;
  Label3.Left           = 70;
  Label3.Top            = 45;
  Label3.Width          = 95;
  Label3.Height         = 16;
  Label3.Visible        = 1;
  Label3.Active         = 1;
  Label3.Caption        = Label3_Caption;
  Label3.FontName       = Arial13x16_Italic;
  Label3.Font_Color     = 0xF800;
  Label3.OnUpPtr         = 0;
  Label3.OnDownPtr       = 0;
  Label3.OnClickPtr      = 0;
  Label3.OnPressPtr      = 0;

  Label4.OwnerScreen     = &DatabaseScreen2;
  Label4.Order          = 0;
  Label4.Left           = 63;
  Label4.Top            = 19;
  Label4.Width          = 103;
  Label4.Height         = 16;
  Label4.Visible        = 1;
  Label4.Active         = 1;
  Label4.Caption        = Label4_Caption;
  Label4.FontName       = Arial13x16_Italic;
  Label4.Font_Color     = 0x301F;
  Label4.OnUpPtr         = 0;
  Label4.OnDownPtr       = 0;
  Label4.OnClickPtr      = 0;
  Label4.OnPressPtr      = 0;

  Image1.OwnerScreen     = &TrainingScreen3;
  Image1.Order          = 0;
  Image1.Left           = 169;
  Image1.Top            = 225;
  Image1.Width          = 72;
  Image1.Height         = 93;
  Image1.Picture_Type        = 1;
  Image1.Picture_Ratio  = 1;
  Image1.Picture_Name   = amblem_jpg;
  Image1.Visible        = 1;
  Image1.Active         = 1;
  Image1.OnUpPtr         = 0;
  Image1.OnDownPtr       = 0;
  Image1.OnClickPtr      = 0;
  Image1.OnPressPtr      = 0;

  Label5.OwnerScreen     = &TrainingScreen3;
  Label5.Order          = 1;
  Label5.Left           = 49;
  Label5.Top            = 15;
  Label5.Width          = 129;
  Label5.Height         = 17;
  Label5.Visible        = 1;
  Label5.Active         = 1;
  Label5.Caption        = Label5_Caption;
  Label5.FontName       = Tahoma12x16_Italic;
  Label5.Font_Color     = 0xF800;
  Label5.OnUpPtr         = 0;
  Label5.OnDownPtr       = 0;
  Label5.OnClickPtr      = 0;
  Label5.OnPressPtr      = 0;

  Label6.OwnerScreen     = &TestScreen4;
  Label6.Order          = 0;
  Label6.Left           = 91;
  Label6.Top            = 30;
  Label6.Width          = 34;
  Label6.Height         = 16;
  Label6.Visible        = 1;
  Label6.Active         = 1;
  Label6.Caption        = Label6_Caption;
  Label6.FontName       = Arial13x16_BoldItalic;
  Label6.Font_Color     = 0xFFFF;
  Label6.OnUpPtr         = 0;
  Label6.OnDownPtr       = 0;
  Label6.OnClickPtr      = 0;
  Label6.OnPressPtr      = 0;
}

static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
  if ( (Left<= X) && (Left+ Width - 1 >= X) &&
       (Top <= Y)  && (Top + Height - 1 >= Y) )
    return 1;
  else
    return 0;
}


#define GetRoundButton(index)         CurrentScreen->Buttons_Round[index]
#define GetLabel(index)               CurrentScreen->Labels[index]
#define GetImage(index)               CurrentScreen->Images[index]
#define GetRadioButton(index)           CurrentScreen->RadioButtons[index]
#define GetProgressBar(index)           CurrentScreen->ProgressBars[index]

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

void DrawImage(TImage *AImage) {
  if (AImage->Visible) {
    TFT_Ext_Image(AImage->Left, AImage->Top, AImage->Picture_Name, AImage->Picture_Ratio);
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
             TFT_Circle(ARadioButton->Left  + ARadioButton->Width - ARadioButton->Height / 2, ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2);
             if (ARadioButton->Checked == 1) {
                 if (object_pressed == 1) {
                    object_pressed = 0;
                    TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Press_Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_End_Color, ARadioButton->Gradient_Start_Color);
                 }
                 else 
                   TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_Start_Color, ARadioButton->Gradient_End_Color);
                 TFT_Circle(ARadioButton->Left  + ARadioButton->Width - ARadioButton->Height / 2, ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2 - circleOffset);
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
    if (caption_height >  AProgressBar->Height)
        caption_height =  AProgressBar->Height;
    if (caption_length >  AProgressBar->Width)
        caption_length =  AProgressBar->Width;
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
         // Then position rect
         TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
         TFT_Rectangle(AProgressBar->Left + AProgressBar->Corner_Radius, AProgressBar->Top,  AProgressBar->Left + AProgressBar->Corner_Radius  + locPosition *  (AProgressBar->Width-AProgressBar->Corner_Radius*2) / 100 , AProgressBar->Top + AProgressBar->Height);
      }
    }
    else {
      if (locPosition > 0) {
         TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
         TFT_Rectangle(AProgressBar->Left, AProgressBar->Top,  AProgressBar->Left + (locPosition * AProgressBar->Width) / 100, AProgressBar->Top + AProgressBar->Height);
      }
    }
    // Draw not smoothed position rect
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
              if  (cnt - tmpRound + 3 >=  tmpWidth * locPosition)
TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top, AProgressBar->Left + tmpRound  + tmpWidth * locPosition , AProgressBar->Top + AProgressBar->Height);
              else
          TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top,  AProgressBar->Left + cnt + 3, AProgressBar->Top + AProgressBar->Height);
          cnt = cnt + move_offset + 3;
        }
      }
    // Clear caption frist
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
      // First draw back rect
      TFT_Rectangle_Round_Edges(AProgressBar->Left, AProgressBar->Top,  AProgressBar->Left + AProgressBar->Width, AProgressBar->Top + AProgressBar->Height, AProgressBar->Corner_Radius);
      if (locPosition > 0) {
         // Then position rect
         TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
         TFT_Rectangle(AProgressBar->Left + AProgressBar->Corner_Radius, AProgressBar->Top,  AProgressBar->Left + AProgressBar->Corner_Radius   + locPosition *  (AProgressBar->Width-AProgressBar->Corner_Radius*2) / 100, AProgressBar->Top + AProgressBar->Height);
      }
    }
    else {
      // First draw back rect
      TFT_Rectangle(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + AProgressBar->Width, AProgressBar->Top + AProgressBar->Height);
      if (locPosition > 0) {
         // Then position rect
         TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
         TFT_Rectangle(AProgressBar->Left, AProgressBar->Top,  AProgressBar->Left + (locPosition * AProgressBar->Width) / 100, AProgressBar->Top + AProgressBar->Height);
      }
    }
    // Draw not smoothed position rect
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
            if  (cnt - tmpRound + 3 >=  tmpWidth * locPosition)
              TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top, AProgressBar->Left + tmpRound  + tmpWidth * locPosition , AProgressBar->Top + AProgressBar->Height);
            else
              TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top,  AProgressBar->Left + cnt + 3, AProgressBar->Top + AProgressBar->Height);
        cnt = cnt + move_offset + 3;
     }
    }
    // Clear caption frist
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
  unsigned short image_idx;
  TImage *local_image;
  unsigned short radio_button_idx;
  TRadioButton *local_radio_button;
  unsigned short progress_bar_idx;
  TProgressBar *local_progress_bar;
  char save_bled, save_bled_direction;

  object_pressed = 0;
  order = 0;
  round_button_idx = 0;
  label_idx = 0;
  image_idx = 0;
  radio_button_idx = 0;
  progress_bar_idx = 0;
  CurrentScreen = aScreen;

  if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
    save_bled = TFT_BLED;
    TFT_BLED           = 0;
    TFT_Init(CurrentScreen->Width, CurrentScreen->Height);
    TFT_Set_Ext_Buffer(TFT_Get_Data);
    TP_TFT_Init(CurrentScreen->Width, CurrentScreen->Height, 8, 9);                                  // Initialize touch panel
    TP_TFT_Set_ADC_Threshold(ADC_THRESHOLD);                              // Set touch panel ADC threshold
    TFT_Fill_Screen(CurrentScreen->Color);
    display_width = CurrentScreen->Width;
    display_height = CurrentScreen->Height;
    TFT_BLED           = save_bled;
  }
  else
    TFT_Fill_Screen(CurrentScreen->Color);


  while (order < CurrentScreen->ObjectsCount) {
    if (round_button_idx < CurrentScreen->Buttons_RoundCount) {
      local_round_button = GetRoundButton(round_button_idx);
      if (order == local_round_button->Order) {
        order++;
        round_button_idx++;
        DrawRoundButton(local_round_button);
      }
    }

    if (label_idx < CurrentScreen->LabelsCount) {
      local_label = GetLabel(label_idx);
      if (order == local_label->Order) {
        label_idx++;
        order++;
        DrawLabel(local_label);
      }
    }

    if (image_idx  < CurrentScreen->ImagesCount) {
      local_image = GetImage(image_idx);
      if (order == local_image->Order) {
        image_idx++;
        order++;
        DrawImage(local_image);
      }
    }

    if (radio_button_idx  < CurrentScreen->RadioButtonsCount) {
      local_radio_button = GetRadioButton(radio_button_idx);
      if (order == local_radio_button->Order) {
        radio_button_idx++;
        order++;
        DrawRadioButton(local_radio_button);
      }
    }

    if (progress_bar_idx  < CurrentScreen->ProgressBarsCount) {
      local_progress_bar = GetProgressBar(progress_bar_idx);
      if (order == local_progress_bar->Order) {
        progress_bar_idx++;
        order++;
        DrawProgressBar(local_progress_bar);
      }
    }

  }
}

void Get_Object(unsigned int X, unsigned int Y) {
  round_button_order  = -1;
  label_order         = -1;
  image_order         = -1;
  radio_button_order    = -1;
  progress_bar_order    = -1;
  //  Buttons with Round Edges
  for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
    local_round_button = GetRoundButton(_object_count);
    if (local_round_button->Active == 1) {
      if (IsInsideObject(X, Y, local_round_button->Left, local_round_button->Top,
                         local_round_button->Width, local_round_button->Height) == 1) {
        round_button_order = local_round_button->Order;
        exec_round_button = local_round_button;
      }
    }
  }

  //  Labels
  for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
    local_label = GetLabel(_object_count);
    if (local_label->Active == 1) {
      if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
                         local_label->Width, local_label->Height) == 1) {
        label_order = local_label->Order;
        exec_label = local_label;
      }
    }
  }

  //  Images
  for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
    local_image = GetImage(_object_count);
    if (local_image->Active == 1) {
      if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
                         local_image->Width, local_image->Height) == 1) {
        image_order = local_image->Order;
        exec_image = local_image;
      }
    }
  }

  // RadioButtons
  for ( _object_count = 0 ; _object_count < CurrentScreen->RadioButtonsCount ; _object_count++ ) {
    local_radio_button = GetRadioButton(_object_count);
    if (local_radio_button->Active == 1) {
      if (IsInsideObject(X, Y, local_radio_button->Left, local_radio_button->Top,
                         local_radio_button->Width, local_radio_button->Height) == 1) {
        radio_button_order = local_radio_button->Order;
        exec_radio_button = local_radio_button;
      }
    }
  }

  // ProgressBar
  for ( _object_count = 0 ; _object_count < CurrentScreen->ProgressBarsCount ; _object_count++ ) {
    local_progress_bar = GetProgressBar(_object_count);
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
  if (label_order >  _object_count )
    _object_count = label_order;
  if (image_order >  _object_count )
    _object_count = image_order;
  if (radio_button_order >  _object_count )
    _object_count = radio_button_order;
  if (progress_bar_order >  _object_count )
    _object_count = progress_bar_order;
}


static void Process_TP_Press(unsigned int X, unsigned int Y) {
  exec_round_button   = 0;
  exec_label          = 0;
  exec_image          = 0;
  exec_radio_button     = 0;
  exec_progress_bar     = 0;

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

    if (_object_count == image_order) {
      if (exec_image->Active == 1) {
        if (exec_image->OnPressPtr != 0) {
          exec_image->OnPressPtr();
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
    // Round Button
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
    // RadioButton
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

  exec_label          = 0;
  exec_image          = 0;

  Get_Object(X, Y);


  if (_object_count != -1) {
  // Buttons with Round Edges
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

  // Labels
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

  // Images
    if (_object_count == image_order) {
      if (exec_image->Active == 1) {
        if (exec_image->OnUpPtr != 0)
          exec_image->OnUpPtr();
        if (PressedObject == (void *)exec_image)
          if (exec_image->OnClickPtr != 0)
            exec_image->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  // RadioButtons
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

  object_pressed      = 0;
  exec_round_button   = 0;
  exec_label          = 0;
  exec_image          = 0;
  exec_radio_button     = 0;

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

    if (_object_count == image_order) {
      if (exec_image->Active == 1) {
        PressedObject = (void *)exec_image;
        PressedObjectType = 3;
        if (exec_image->OnDownPtr != 0) {
          exec_image->OnDownPtr();
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
    // After a PRESS is detected read X-Y and convert it to Display dimensions space
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
  // Initialize SPI
  SPI3_Init_Advanced(_SPI_FPCLK_DIV64, _SPI_MASTER | _SPI_8_BIT |
                                                 _SPI_CLK_IDLE_LOW | _SPI_FIRST_CLK_EDGE_TRANSITION |
                                                 _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
                                                 &_GPIO_MODULE_SPI3_PC10_11_12);
  Delay_ms(10);
  //--- init the FAT library
  if (!Mmc_Fat_Init()) {
    SPI3_CR1 = 0;
    // reinitialize spi at higher speed
    SPI3_Init_Advanced(_SPI_FPCLK_DIV2, _SPI_MASTER | _SPI_8_BIT |
                                        _SPI_CLK_IDLE_LOW | _SPI_FIRST_CLK_EDGE_TRANSITION |
                                              _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
                                              &_GPIO_MODULE_SPI3_PC10_11_12);
    // Open resource file for read
    Mmc_Fat_Assign("FISHER_G.RES", 0);
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
  display_width = MainScreen1.Width;
  display_height = MainScreen1.Height;
  DrawScreen(&MainScreen1);
}