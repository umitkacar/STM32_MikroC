#include "DCVA_GUI_objects.h"
#include "DCVA_GUI_resources.h"
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
sbit DriveX_Left at GPIOB_ODR.B1;
sbit DriveX_Right at GPIOB_ODR.B8;
sbit DriveY_Up at GPIOB_ODR.B9;
sbit DriveY_Down at GPIOB_ODR.B0;
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
TCircleButton *local_circle_button;
TCircleButton *exec_circle_button;
int circle_button_order;
TBox *local_box;
TBox *exec_box;
int box_order;
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
  TFT_Write_Text("Touch selected corners for calibration", 1, 120);
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
  TFT_Write_Text("now here ", 160, 15);
  TFT_Line(239, 0, 234, 0);
  TFT_Line(239, 0, 239, 5);
  TFT_Line(239, 0, 229, 10);

  TP_TFT_Calibrate_Max();                       // Calibration of bottom left corner
  Delay_ms(500);
}


/////////////////////////
  TScreen*  CurrentScreen;

  TScreen                Screen1;
  TLabel                 Label1;
char Label1_Caption[7] = "SYSTEM";

  TCircleButton          CircleButton1;
char CircleButton1_Caption[6] = "START";

  TLabel                 Label4;
char Label4_Caption[7] = "(DCVA)";

  TLabel                 Label6;
char Label6_Caption[16] = "EAR RECOGNITION";

  TLabel                 Label5;
char Label5_Caption[14] = "by Umit KACAR";

  TButton_Round          ButtonRound1;
char ButtonRound1_Caption[14] = "Show Database";

  TImage               Image1;
  TButton_Round          * const code Screen1_Buttons_Round[1]=
         {
         &ButtonRound1         
         };
  TLabel                 * const code Screen1_Labels[4]=
         {
         &Label1,              
         &Label4,              
         &Label6,              
         &Label5               
         };
  TImage                 * const code Screen1_Images[1]=
         {
         &Image1               
         };
  TCircleButton          * const code Screen1_CircleButtons[1]=
         {
         &CircleButton1        
         };

  TScreen                Screen2;
  TLabel                 Label2;
char Label2_Caption[14] = "DCVA TRAINING";

  TLabel                 * const code Screen2_Labels[1]=
         {
         &Label2               
         };

  TScreen                Screen3;
  TLabel                 Label3;
char Label3_Caption[10] = "DCVA TEST";

  TCircleButton          CircleButton2;
char CircleButton2_Caption[5] = "TEST";

  TLabel                 * const code Screen3_Labels[1]=
         {
         &Label3               
         };
  TCircleButton          * const code Screen3_CircleButtons[1]=
         {
         &CircleButton2        
         };

  TScreen                Screen4;
  TLabel                 Label7;
char Label7_Caption[10] = "DCVA TEST";

  TLabel                 * const code Screen4_Labels[1]=
         {
         &Label7               
         };

  TScreen                Screen5;
  TRadioButton                 RadioButton1;
char RadioButton1_Caption[5] = "0.01";

  TRadioButton                 RadioButton2;
char RadioButton2_Caption[6] = "0.001";

  TRadioButton                 RadioButton3;
char RadioButton3_Caption[7] = "0.0001";

  TRadioButton                 RadioButton4;
char RadioButton4_Caption[8] = "0.00001";

  TRadioButton                 RadioButton5;
char RadioButton5_Caption[9] = "0.000001";

  TRadioButton                 RadioButton6;
char RadioButton6_Caption[10] = "0.0000001";

  TRadioButton                 RadioButton7;
char RadioButton7_Caption[11] = "0.00000001";

  TRadioButton                 RadioButton8;
char RadioButton8_Caption[12] = "0.000000001";

  TLabel                 Label8;
char Label8_Caption[17] = "JACOBI ITERATION";

  TLabel                 * const code Screen5_Labels[1]=
         {
         &Label8               
         };
  TRadioButton           * const code Screen5_RadioButtons[8]=
         {
         &RadioButton1,        
         &RadioButton2,        
         &RadioButton3,        
         &RadioButton4,        
         &RadioButton5,        
         &RadioButton6,        
         &RadioButton7,        
         &RadioButton8         
         };

  TScreen                Screen6;
  TLabel                 Label9;
char Label9_Caption[14] = "DCVA TRAINING";

  TCircleButton          CircleButton3;
char CircleButton3_Caption[9] = "TRAINING";

  TLabel                 * const code Screen6_Labels[1]=
         {
         &Label9               
         };
  TCircleButton          * const code Screen6_CircleButtons[1]=
         {
         &CircleButton3        
         };

  TScreen                Screen7;
  TProgressBar                 ProgressBar1;
char ProgressBar1_Caption[5] = "0\%";

  TLabel                 Label10;
char Label10_Caption[21] = "Rate of Recognition ";

  TLabel                 Label11;
char Label11_Caption[8] = "RESULTS";

  TLabel                 * const code Screen7_Labels[2]=
         {
         &Label10,             
         &Label11              
         };
  TProgressBar           * const code Screen7_ProgressBars[1]=
         {
         &ProgressBar1         
         };

  TScreen                Screen8;
  TBox                   Diagram8_Box6;
  TBox                   Diagram8_Box5;
  TBox                   Diagram8_Box4;
  TBox                   Diagram8_Box3;
  TBox                   Diagram8_Box2;
  TLabel                 Diagram8_S2L2;
char Diagram8_S2L2_Caption[9] = "Test Set";

  TBox                   Diagram8_Box1;
  TLabel                 Diagram8_S2L4;
char Diagram8_S2L4_Caption[2] = "1";

  TLabel                 Diagram8_S2L5;
char Diagram8_S2L5_Caption[2] = "2";

  TLabel                 Diagram8_S2L6;
char Diagram8_S2L6_Caption[2] = "3";

  TLabel                 Diagram8_S2L7;
char Diagram8_S2L7_Caption[2] = "4";

  TLabel                 Diagram8_S2L8;
char Diagram8_S2L8_Caption[2] = "5";

  TLabel                 Diagram8_S2L1;
char Diagram8_S2L1_Caption[13] = "Training Set";

  TLabel                 * const code Screen8_Labels[7]=
         {
         &Diagram8_S2L2,       
         &Diagram8_S2L4,       
         &Diagram8_S2L5,       
         &Diagram8_S2L6,       
         &Diagram8_S2L7,       
         &Diagram8_S2L8,       
         &Diagram8_S2L1        
         };
  TBox                   * const code Screen8_Boxes[6]=
         {
         &Diagram8_Box6,       
         &Diagram8_Box5,       
         &Diagram8_Box4,       
         &Diagram8_Box3,       
         &Diagram8_Box2,       
         &Diagram8_Box1        
         };



static void InitializeObjects() {
  Screen1.Color                     = 0x87FF;
  Screen1.Width                     = 240;
  Screen1.Height                    = 320;
  Screen1.Buttons_RoundCount        = 1;
  Screen1.Buttons_Round             = Screen1_Buttons_Round;
  Screen1.LabelsCount               = 4;
  Screen1.Labels                    = Screen1_Labels;
  Screen1.ImagesCount               = 1;
  Screen1.Images                    = Screen1_Images;
  Screen1.CircleButtonsCount        = 1;
  Screen1.CircleButtons             = Screen1_CircleButtons;
  Screen1.BoxesCount                = 0;
  Screen1.RadioButtonsCount         = 0;
  Screen1.ProgressBarsCount         = 0;
  Screen1.ObjectsCount              = 7;

  Screen2.Color                     = 0x001F;
  Screen2.Width                     = 240;
  Screen2.Height                    = 320;
  Screen2.Buttons_RoundCount        = 0;
  Screen2.LabelsCount               = 1;
  Screen2.Labels                    = Screen2_Labels;
  Screen2.ImagesCount               = 0;
  Screen2.CircleButtonsCount        = 0;
  Screen2.BoxesCount                = 0;
  Screen2.RadioButtonsCount         = 0;
  Screen2.ProgressBarsCount         = 0;
  Screen2.ObjectsCount              = 1;

  Screen3.Color                     = 0xFC00;
  Screen3.Width                     = 240;
  Screen3.Height                    = 320;
  Screen3.Buttons_RoundCount        = 0;
  Screen3.LabelsCount               = 1;
  Screen3.Labels                    = Screen3_Labels;
  Screen3.ImagesCount               = 0;
  Screen3.CircleButtonsCount        = 1;
  Screen3.CircleButtons             = Screen3_CircleButtons;
  Screen3.BoxesCount                = 0;
  Screen3.RadioButtonsCount         = 0;
  Screen3.ProgressBarsCount         = 0;
  Screen3.ObjectsCount              = 2;

  Screen4.Color                     = 0x001F;
  Screen4.Width                     = 240;
  Screen4.Height                    = 320;
  Screen4.Buttons_RoundCount        = 0;
  Screen4.LabelsCount               = 1;
  Screen4.Labels                    = Screen4_Labels;
  Screen4.ImagesCount               = 0;
  Screen4.CircleButtonsCount        = 0;
  Screen4.BoxesCount                = 0;
  Screen4.RadioButtonsCount         = 0;
  Screen4.ProgressBarsCount         = 0;
  Screen4.ObjectsCount              = 1;

  Screen5.Color                     = 0x07E8;
  Screen5.Width                     = 240;
  Screen5.Height                    = 320;
  Screen5.Buttons_RoundCount        = 0;
  Screen5.LabelsCount               = 1;
  Screen5.Labels                    = Screen5_Labels;
  Screen5.ImagesCount               = 0;
  Screen5.CircleButtonsCount        = 0;
  Screen5.BoxesCount                = 0;
  Screen5.RadioButtonsCount         = 8;
  Screen5.RadioButtons              = Screen5_RadioButtons;
  Screen5.ProgressBarsCount         = 0;
  Screen5.ObjectsCount              = 9;

  Screen6.Color                     = 0x801F;
  Screen6.Width                     = 240;
  Screen6.Height                    = 320;
  Screen6.Buttons_RoundCount        = 0;
  Screen6.LabelsCount               = 1;
  Screen6.Labels                    = Screen6_Labels;
  Screen6.ImagesCount               = 0;
  Screen6.CircleButtonsCount        = 1;
  Screen6.CircleButtons             = Screen6_CircleButtons;
  Screen6.BoxesCount                = 0;
  Screen6.RadioButtonsCount         = 0;
  Screen6.ProgressBarsCount         = 0;
  Screen6.ObjectsCount              = 2;

  Screen7.Color                     = 0xFFFF;
  Screen7.Width                     = 240;
  Screen7.Height                    = 320;
  Screen7.Buttons_RoundCount        = 0;
  Screen7.LabelsCount               = 2;
  Screen7.Labels                    = Screen7_Labels;
  Screen7.ImagesCount               = 0;
  Screen7.CircleButtonsCount        = 0;
  Screen7.BoxesCount                = 0;
  Screen7.RadioButtonsCount         = 0;
  Screen7.ProgressBarsCount         = 1;
  Screen7.ProgressBars              = Screen7_ProgressBars;
  Screen7.ObjectsCount              = 3;

  Screen8.Color                     = 0xFFFF;
  Screen8.Width                     = 320;
  Screen8.Height                    = 240;
  Screen8.Buttons_RoundCount        = 0;
  Screen8.LabelsCount               = 7;
  Screen8.Labels                    = Screen8_Labels;
  Screen8.ImagesCount               = 0;
  Screen8.CircleButtonsCount        = 0;
  Screen8.BoxesCount                = 6;
  Screen8.Boxes                     = Screen8_Boxes;
  Screen8.RadioButtonsCount         = 0;
  Screen8.ProgressBarsCount         = 0;
  Screen8.ObjectsCount              = 13;


  Label1.OwnerScreen     = &Screen1;
  Label1.Order           = 0;
  Label1.Left            = 75;
  Label1.Top             = 26;
  Label1.Width           = 71;
  Label1.Height          = 25;
  Label1.Visible         = 1;
  Label1.Active          = 1;
  Label1.Caption         = Label1_Caption;
  Label1.FontName        = Tahoma19x23_Regular;
  Label1.Font_Color      = 0xF800;
  Label1.OnUpPtr         = 0;
  Label1.OnDownPtr       = 0;
  Label1.OnClickPtr      = 0;
  Label1.OnPressPtr      = 0;

  CircleButton1.OwnerScreen     = &Screen1;
  CircleButton1.Order           = 1;
  CircleButton1.Left            = 77;
  CircleButton1.Top             = 83;
  CircleButton1.Radius          = 36;
  CircleButton1.Pen_Width       = 1;
  CircleButton1.Pen_Color       = 0x0000;
  CircleButton1.Visible         = 1;
  CircleButton1.Active          = 1;
  CircleButton1.Transparent     = 1;
  CircleButton1.Caption         = CircleButton1_Caption;
  CircleButton1.TextAlign       = _taCenter;
  CircleButton1.FontName        = Tahoma13x16_Regular;
  CircleButton1.PressColEnabled = 1;
  CircleButton1.Font_Color      = 0x0000;
  CircleButton1.Gradient        = 1;
  CircleButton1.Gradient_Orientation = 0;
  CircleButton1.Gradient_Start_Color = 0xFFFF;
  CircleButton1.Gradient_End_Color = 0xC618;
  CircleButton1.Color           = 0xC618;
  CircleButton1.Press_Color     = 0x8410;
  CircleButton1.OnUpPtr         = 0;
  CircleButton1.OnDownPtr       = 0;
  CircleButton1.OnClickPtr      = 0;
  CircleButton1.OnPressPtr      = DCVA_START;

  Label4.OwnerScreen     = &Screen1;
  Label4.Order           = 2;
  Label4.Left            = 78;
  Label4.Top             = 48;
  Label4.Width           = 63;
  Label4.Height          = 25;
  Label4.Visible         = 1;
  Label4.Active          = 1;
  Label4.Caption         = Label4_Caption;
  Label4.FontName        = Tahoma19x23_Regular;
  Label4.Font_Color      = 0xF800;
  Label4.OnUpPtr         = 0;
  Label4.OnDownPtr       = 0;
  Label4.OnClickPtr      = 0;
  Label4.OnPressPtr      = 0;

  Label6.OwnerScreen     = &Screen1;
  Label6.Order           = 3;
  Label6.Left            = 32;
  Label6.Top             = 4;
  Label6.Width           = 169;
  Label6.Height          = 25;
  Label6.Visible         = 1;
  Label6.Active          = 1;
  Label6.Caption         = Label6_Caption;
  Label6.FontName        = Tahoma19x23_Regular;
  Label6.Font_Color      = 0xF800;
  Label6.OnUpPtr         = 0;
  Label6.OnDownPtr       = 0;
  Label6.OnClickPtr      = 0;
  Label6.OnPressPtr      = 0;

  Label5.OwnerScreen     = &Screen1;
  Label5.Order           = 4;
  Label5.Left            = 153;
  Label5.Top             = 300;
  Label5.Width           = 76;
  Label5.Height          = 15;
  Label5.Visible         = 1;
  Label5.Active          = 1;
  Label5.Caption         = Label5_Caption;
  Label5.FontName        = Tahoma11x13_Regular;
  Label5.Font_Color      = 0x8000;
  Label5.OnUpPtr         = 0;
  Label5.OnDownPtr       = 0;
  Label5.OnClickPtr      = 0;
  Label5.OnPressPtr      = 0;

  ButtonRound1.OwnerScreen     = &Screen1;
  ButtonRound1.Order           = 5;
  ButtonRound1.Left            = 20;
  ButtonRound1.Top             = 213;
  ButtonRound1.Width           = 106;
  ButtonRound1.Height          = 44;
  ButtonRound1.Pen_Width       = 1;
  ButtonRound1.Pen_Color       = 0x0000;
  ButtonRound1.Visible         = 1;
  ButtonRound1.Active          = 1;
  ButtonRound1.Transparent     = 1;
  ButtonRound1.Caption         = ButtonRound1_Caption;
  ButtonRound1.TextAlign       = _taCenter;
  ButtonRound1.FontName        = Tahoma13x16_Regular;
  ButtonRound1.PressColEnabled = 1;
  ButtonRound1.Font_Color      = 0x0000;
  ButtonRound1.Gradient        = 1;
  ButtonRound1.Gradient_Orientation = 0;
  ButtonRound1.Gradient_Start_Color = 0xFFFF;
  ButtonRound1.Gradient_End_Color = 0xC618;
  ButtonRound1.Color           = 0xC618;
  ButtonRound1.Press_Color     = 0xE71C;
  ButtonRound1.Corner_Radius   = 3;
  ButtonRound1.OnUpPtr         = 0;
  ButtonRound1.OnDownPtr       = 0;
  ButtonRound1.OnClickPtr      = 0;
  ButtonRound1.OnPressPtr      = Show_database;

  Image1.OwnerScreen     = &Screen1;
  Image1.Order           = 6;
  Image1.Left            = 157;
  Image1.Top             = 194;
  Image1.Width           = 62;
  Image1.Height          = 85;
  Image1.Picture_Type    = 1;
  Image1.Picture_Ratio   = 1;
  Image1.Picture_Name    = ITU_son_jpg;
  Image1.Visible         = 1;
  Image1.Active          = 1;
  Image1.OnUpPtr         = 0;
  Image1.OnDownPtr       = 0;
  Image1.OnClickPtr      = 0;
  Image1.OnPressPtr      = 0;

  Label2.OwnerScreen     = &Screen2;
  Label2.Order           = 0;
  Label2.Left            = 62;
  Label2.Top             = 1;
  Label2.Width           = 112;
  Label2.Height          = 17;
  Label2.Visible         = 1;
  Label2.Active          = 1;
  Label2.Caption         = Label2_Caption;
  Label2.FontName        = Tahoma14x16_Bold;
  Label2.Font_Color      = 0xFFE0;
  Label2.OnUpPtr         = 0;
  Label2.OnDownPtr       = 0;
  Label2.OnClickPtr      = 0;
  Label2.OnPressPtr      = 0;

  Label3.OwnerScreen     = &Screen3;
  Label3.Order           = 0;
  Label3.Left            = 58;
  Label3.Top             = 66;
  Label3.Width           = 120;
  Label3.Height          = 28;
  Label3.Visible         = 1;
  Label3.Active          = 1;
  Label3.Caption         = Label3_Caption;
  Label3.FontName        = Tahoma25x25_Bold;
  Label3.Font_Color      = 0x601F;
  Label3.OnUpPtr         = 0;
  Label3.OnDownPtr       = 0;
  Label3.OnClickPtr      = 0;
  Label3.OnPressPtr      = 0;

  CircleButton2.OwnerScreen     = &Screen3;
  CircleButton2.Order           = 1;
  CircleButton2.Left            = 78;
  CircleButton2.Top             = 137;
  CircleButton2.Radius          = 40;
  CircleButton2.Pen_Width       = 1;
  CircleButton2.Pen_Color       = 0x0000;
  CircleButton2.Visible         = 1;
  CircleButton2.Active          = 1;
  CircleButton2.Transparent     = 1;
  CircleButton2.Caption         = CircleButton2_Caption;
  CircleButton2.TextAlign       = _taCenter;
  CircleButton2.FontName        = Tahoma19x23_Regular;
  CircleButton2.PressColEnabled = 1;
  CircleButton2.Font_Color      = 0x0000;
  CircleButton2.Gradient        = 1;
  CircleButton2.Gradient_Orientation = 0;
  CircleButton2.Gradient_Start_Color = 0xFFF0;
  CircleButton2.Gradient_End_Color = 0x07E0;
  CircleButton2.Color           = 0xC618;
  CircleButton2.Press_Color     = 0x8410;
  CircleButton2.OnUpPtr         = 0;
  CircleButton2.OnDownPtr       = 0;
  CircleButton2.OnClickPtr      = 0;
  CircleButton2.OnPressPtr      = DCVA_TEST;

  Label7.OwnerScreen     = &Screen4;
  Label7.Order           = 0;
  Label7.Left            = 78;
  Label7.Top             = 1;
  Label7.Width           = 74;
  Label7.Height          = 17;
  Label7.Visible         = 1;
  Label7.Active          = 1;
  Label7.Caption         = Label7_Caption;
  Label7.FontName        = Tahoma14x16_Bold;
  Label7.Font_Color      = 0xFFE0;
  Label7.OnUpPtr         = 0;
  Label7.OnDownPtr       = 0;
  Label7.OnClickPtr      = 0;
  Label7.OnPressPtr      = 0;

  RadioButton1.OwnerScreen     = &Screen5;
  RadioButton1.Order           = 0;
  RadioButton1.Left            = 37;
  RadioButton1.Top             = 49;
  RadioButton1.Width           = 42;
  RadioButton1.Height          = 16;
  RadioButton1.Pen_Width       = 1;
  RadioButton1.Pen_Color       = 0x0000;
  RadioButton1.Visible         = 1;
  RadioButton1.Active          = 1;
  RadioButton1.Checked         = 1;
  RadioButton1.Transparent     = 1;
  RadioButton1.Caption         = RadioButton1_Caption;
  RadioButton1.TextAlign       = _taLeft;
  RadioButton1.FontName        = Tahoma11x13_Regular;
  RadioButton1.PressColEnabled = 1;
  RadioButton1.Font_Color      = 0x0000;
  RadioButton1.Gradient        = 1;
  RadioButton1.Gradient_Orientation = 0;
  RadioButton1.Gradient_Start_Color = 0xFFFF;
  RadioButton1.Gradient_End_Color = 0xC618;
  RadioButton1.Color           = 0xC618;
  RadioButton1.Press_Color     = 0xC618;
  RadioButton1.Background_Color = 0x8410;
  RadioButton1.OnUpPtr         = 0;
  RadioButton1.OnDownPtr       = 0;
  RadioButton1.OnClickPtr      = 0;
  RadioButton1.OnPressPtr      = J_E_2;

  RadioButton2.OwnerScreen     = &Screen5;
  RadioButton2.Order           = 1;
  RadioButton2.Left            = 151;
  RadioButton2.Top             = 66;
  RadioButton2.Width           = 48;
  RadioButton2.Height          = 16;
  RadioButton2.Pen_Width       = 1;
  RadioButton2.Pen_Color       = 0x0000;
  RadioButton2.Visible         = 1;
  RadioButton2.Active          = 1;
  RadioButton2.Checked         = 1;
  RadioButton2.Transparent     = 1;
  RadioButton2.Caption         = RadioButton2_Caption;
  RadioButton2.TextAlign       = _taLeft;
  RadioButton2.FontName        = Tahoma11x13_Regular;
  RadioButton2.PressColEnabled = 1;
  RadioButton2.Font_Color      = 0x0000;
  RadioButton2.Gradient        = 1;
  RadioButton2.Gradient_Orientation = 0;
  RadioButton2.Gradient_Start_Color = 0xFFFF;
  RadioButton2.Gradient_End_Color = 0xC618;
  RadioButton2.Color           = 0xC618;
  RadioButton2.Press_Color     = 0xC618;
  RadioButton2.Background_Color = 0x8410;
  RadioButton2.OnUpPtr         = 0;
  RadioButton2.OnDownPtr       = 0;
  RadioButton2.OnClickPtr      = 0;
  RadioButton2.OnPressPtr      = J_E_3;

  RadioButton3.OwnerScreen     = &Screen5;
  RadioButton3.Order           = 2;
  RadioButton3.Left            = 39;
  RadioButton3.Top             = 103;
  RadioButton3.Width           = 54;
  RadioButton3.Height          = 16;
  RadioButton3.Pen_Width       = 1;
  RadioButton3.Pen_Color       = 0x0000;
  RadioButton3.Visible         = 1;
  RadioButton3.Active          = 1;
  RadioButton3.Checked         = 1;
  RadioButton3.Transparent     = 1;
  RadioButton3.Caption         = RadioButton3_Caption;
  RadioButton3.TextAlign       = _taLeft;
  RadioButton3.FontName        = Tahoma11x13_Regular;
  RadioButton3.PressColEnabled = 1;
  RadioButton3.Font_Color      = 0x0000;
  RadioButton3.Gradient        = 1;
  RadioButton3.Gradient_Orientation = 0;
  RadioButton3.Gradient_Start_Color = 0xFFFF;
  RadioButton3.Gradient_End_Color = 0xC618;
  RadioButton3.Color           = 0xC618;
  RadioButton3.Press_Color     = 0xC618;
  RadioButton3.Background_Color = 0x8410;
  RadioButton3.OnUpPtr         = 0;
  RadioButton3.OnDownPtr       = 0;
  RadioButton3.OnClickPtr      = 0;
  RadioButton3.OnPressPtr      = J_E_4;

  RadioButton4.OwnerScreen     = &Screen5;
  RadioButton4.Order           = 3;
  RadioButton4.Left            = 144;
  RadioButton4.Top             = 121;
  RadioButton4.Width           = 61;
  RadioButton4.Height          = 16;
  RadioButton4.Pen_Width       = 1;
  RadioButton4.Pen_Color       = 0x0000;
  RadioButton4.Visible         = 1;
  RadioButton4.Active          = 1;
  RadioButton4.Checked         = 1;
  RadioButton4.Transparent     = 1;
  RadioButton4.Caption         = RadioButton4_Caption;
  RadioButton4.TextAlign       = _taLeft;
  RadioButton4.FontName        = Tahoma11x13_Regular;
  RadioButton4.PressColEnabled = 1;
  RadioButton4.Font_Color      = 0x0000;
  RadioButton4.Gradient        = 1;
  RadioButton4.Gradient_Orientation = 0;
  RadioButton4.Gradient_Start_Color = 0xFFFF;
  RadioButton4.Gradient_End_Color = 0xC618;
  RadioButton4.Color           = 0xC618;
  RadioButton4.Press_Color     = 0xC618;
  RadioButton4.Background_Color = 0x8410;
  RadioButton4.OnUpPtr         = 0;
  RadioButton4.OnDownPtr       = 0;
  RadioButton4.OnClickPtr      = 0;
  RadioButton4.OnPressPtr      = J_E_5;

  RadioButton5.OwnerScreen     = &Screen5;
  RadioButton5.Order           = 4;
  RadioButton5.Left            = 39;
  RadioButton5.Top             = 156;
  RadioButton5.Width           = 67;
  RadioButton5.Height          = 16;
  RadioButton5.Pen_Width       = 1;
  RadioButton5.Pen_Color       = 0x0000;
  RadioButton5.Visible         = 1;
  RadioButton5.Active          = 1;
  RadioButton5.Checked         = 1;
  RadioButton5.Transparent     = 1;
  RadioButton5.Caption         = RadioButton5_Caption;
  RadioButton5.TextAlign       = _taLeft;
  RadioButton5.FontName        = Tahoma11x13_Regular;
  RadioButton5.PressColEnabled = 1;
  RadioButton5.Font_Color      = 0x0000;
  RadioButton5.Gradient        = 1;
  RadioButton5.Gradient_Orientation = 0;
  RadioButton5.Gradient_Start_Color = 0xFFFF;
  RadioButton5.Gradient_End_Color = 0xC618;
  RadioButton5.Color           = 0xC618;
  RadioButton5.Press_Color     = 0xC618;
  RadioButton5.Background_Color = 0x8410;
  RadioButton5.OnUpPtr         = 0;
  RadioButton5.OnDownPtr       = 0;
  RadioButton5.OnClickPtr      = 0;
  RadioButton5.OnPressPtr      = J_E_6;

  RadioButton6.OwnerScreen     = &Screen5;
  RadioButton6.Order           = 5;
  RadioButton6.Left            = 134;
  RadioButton6.Top             = 184;
  RadioButton6.Width           = 73;
  RadioButton6.Height          = 16;
  RadioButton6.Pen_Width       = 1;
  RadioButton6.Pen_Color       = 0x0000;
  RadioButton6.Visible         = 1;
  RadioButton6.Active          = 1;
  RadioButton6.Checked         = 1;
  RadioButton6.Transparent     = 1;
  RadioButton6.Caption         = RadioButton6_Caption;
  RadioButton6.TextAlign       = _taLeft;
  RadioButton6.FontName        = Tahoma11x13_Regular;
  RadioButton6.PressColEnabled = 1;
  RadioButton6.Font_Color      = 0x0000;
  RadioButton6.Gradient        = 1;
  RadioButton6.Gradient_Orientation = 0;
  RadioButton6.Gradient_Start_Color = 0xFFFF;
  RadioButton6.Gradient_End_Color = 0xC618;
  RadioButton6.Color           = 0xC618;
  RadioButton6.Press_Color     = 0xC618;
  RadioButton6.Background_Color = 0x8410;
  RadioButton6.OnUpPtr         = 0;
  RadioButton6.OnDownPtr       = 0;
  RadioButton6.OnClickPtr      = 0;
  RadioButton6.OnPressPtr      = J_E_7;

  RadioButton7.OwnerScreen     = &Screen5;
  RadioButton7.Order           = 6;
  RadioButton7.Left            = 47;
  RadioButton7.Top             = 221;
  RadioButton7.Width           = 79;
  RadioButton7.Height          = 16;
  RadioButton7.Pen_Width       = 1;
  RadioButton7.Pen_Color       = 0x0000;
  RadioButton7.Visible         = 1;
  RadioButton7.Active          = 1;
  RadioButton7.Checked         = 1;
  RadioButton7.Transparent     = 1;
  RadioButton7.Caption         = RadioButton7_Caption;
  RadioButton7.TextAlign       = _taLeft;
  RadioButton7.FontName        = Tahoma11x13_Regular;
  RadioButton7.PressColEnabled = 1;
  RadioButton7.Font_Color      = 0x0000;
  RadioButton7.Gradient        = 1;
  RadioButton7.Gradient_Orientation = 0;
  RadioButton7.Gradient_Start_Color = 0xFFFF;
  RadioButton7.Gradient_End_Color = 0xC618;
  RadioButton7.Color           = 0xC618;
  RadioButton7.Press_Color     = 0xC618;
  RadioButton7.Background_Color = 0x8410;
  RadioButton7.OnUpPtr         = 0;
  RadioButton7.OnDownPtr       = 0;
  RadioButton7.OnClickPtr      = 0;
  RadioButton7.OnPressPtr      = J_E_8;

  RadioButton8.OwnerScreen     = &Screen5;
  RadioButton8.Order           = 7;
  RadioButton8.Left            = 129;
  RadioButton8.Top             = 249;
  RadioButton8.Width           = 85;
  RadioButton8.Height          = 16;
  RadioButton8.Pen_Width       = 1;
  RadioButton8.Pen_Color       = 0x0000;
  RadioButton8.Visible         = 1;
  RadioButton8.Active          = 1;
  RadioButton8.Checked         = 1;
  RadioButton8.Transparent     = 1;
  RadioButton8.Caption         = RadioButton8_Caption;
  RadioButton8.TextAlign       = _taLeft;
  RadioButton8.FontName        = Tahoma11x13_Regular;
  RadioButton8.PressColEnabled = 1;
  RadioButton8.Font_Color      = 0x0000;
  RadioButton8.Gradient        = 1;
  RadioButton8.Gradient_Orientation = 0;
  RadioButton8.Gradient_Start_Color = 0xFFFF;
  RadioButton8.Gradient_End_Color = 0xC618;
  RadioButton8.Color           = 0xC618;
  RadioButton8.Press_Color     = 0xC618;
  RadioButton8.Background_Color = 0x8410;
  RadioButton8.OnUpPtr         = 0;
  RadioButton8.OnDownPtr       = 0;
  RadioButton8.OnClickPtr      = 0;
  RadioButton8.OnPressPtr      = J_E_9;

  Label8.OwnerScreen     = &Screen5;
  Label8.Order           = 8;
  Label8.Left            = 72;
  Label8.Top             = 16;
  Label8.Width           = 98;
  Label8.Height          = 15;
  Label8.Visible         = 1;
  Label8.Active          = 1;
  Label8.Caption         = Label8_Caption;
  Label8.FontName        = Tahoma11x13_Regular;
  Label8.Font_Color      = 0x0000;
  Label8.OnUpPtr         = 0;
  Label8.OnDownPtr       = 0;
  Label8.OnClickPtr      = 0;
  Label8.OnPressPtr      = 0;

  Label9.OwnerScreen     = &Screen6;
  Label9.Order           = 0;
  Label9.Left            = 35;
  Label9.Top             = 63;
  Label9.Width           = 181;
  Label9.Height          = 28;
  Label9.Visible         = 1;
  Label9.Active          = 1;
  Label9.Caption         = Label9_Caption;
  Label9.FontName        = Tahoma25x25_Bold;
  Label9.Font_Color      = 0xFFFF;
  Label9.OnUpPtr         = 0;
  Label9.OnDownPtr       = 0;
  Label9.OnClickPtr      = 0;
  Label9.OnPressPtr      = 0;

  CircleButton3.OwnerScreen     = &Screen6;
  CircleButton3.Order           = 1;
  CircleButton3.Left            = 78;
  CircleButton3.Top             = 128;
  CircleButton3.Radius          = 38;
  CircleButton3.Pen_Width       = 1;
  CircleButton3.Pen_Color       = 0x0000;
  CircleButton3.Visible         = 1;
  CircleButton3.Active          = 1;
  CircleButton3.Transparent     = 1;
  CircleButton3.Caption         = CircleButton3_Caption;
  CircleButton3.TextAlign       = _taCenter;
  CircleButton3.FontName        = Tahoma11x13_Regular;
  CircleButton3.PressColEnabled = 1;
  CircleButton3.Font_Color      = 0x0000;
  CircleButton3.Gradient        = 1;
  CircleButton3.Gradient_Orientation = 0;
  CircleButton3.Gradient_Start_Color = 0xFFFF;
  CircleButton3.Gradient_End_Color = 0x07FF;
  CircleButton3.Color           = 0xC618;
  CircleButton3.Press_Color     = 0x8410;
  CircleButton3.OnUpPtr         = 0;
  CircleButton3.OnDownPtr       = 0;
  CircleButton3.OnClickPtr      = 0;
  CircleButton3.OnPressPtr      = DCVA_TRAINING;

  ProgressBar1.OwnerScreen     = &Screen7;
  ProgressBar1.Order           = 0;
  ProgressBar1.Left            = 72;
  ProgressBar1.Top             = 256;
  ProgressBar1.Width           = 100;
  ProgressBar1.Height          = 17;
  ProgressBar1.Pen_Width       = 1;
  ProgressBar1.Pen_Color       = 0x0000;
  ProgressBar1.Visible         = 1;
  ProgressBar1.Transparent     = 1;
  ProgressBar1.Caption         = ProgressBar1_Caption;
  ProgressBar1.FontName        = Tahoma11x13_Regular;
  ProgressBar1.Font_Color      = 0x0000;
  ProgressBar1.Gradient        = 1;
  ProgressBar1.Gradient_Orientation = 0;
  ProgressBar1.Gradient_Start_Color = 0xFFFF;
  ProgressBar1.Gradient_End_Color = 0x07E0;
  ProgressBar1.Color           = 0xA65E;
  ProgressBar1.Background_Color = 0x8410;
  ProgressBar1.Min             = 0;
  ProgressBar1.Max             = 100;
  ProgressBar1.Position        = 0;
  ProgressBar1.Show_Position   = 1;
  ProgressBar1.Show_Percentage = 1;
  ProgressBar1.Smooth          = 1;
  ProgressBar1.Rounded         = 1;
  ProgressBar1.Corner_Radius   = 3;

  Label10.OwnerScreen     = &Screen7;
  Label10.Order           = 1;
  Label10.Left            = 62;
  Label10.Top             = 234;
  Label10.Width           = 126;
  Label10.Height          = 16;
  Label10.Visible         = 1;
  Label10.Active          = 1;
  Label10.Caption         = Label10_Caption;
  Label10.FontName        = Arial13x16_Bold;
  Label10.Font_Color      = 0xF800;
  Label10.OnUpPtr         = 0;
  Label10.OnDownPtr       = 0;
  Label10.OnClickPtr      = 0;
  Label10.OnPressPtr      = 0;

  Label11.OwnerScreen     = &Screen7;
  Label11.Order           = 2;
  Label11.Left            = 87;
  Label11.Top             = 9;
  Label11.Width           = 62;
  Label11.Height          = 16;
  Label11.Visible         = 1;
  Label11.Active          = 1;
  Label11.Caption         = Label11_Caption;
  Label11.FontName        = Arial13x16_Bold;
  Label11.Font_Color      = 0xF800;
  Label11.OnUpPtr         = 0;
  Label11.OnDownPtr       = 0;
  Label11.OnClickPtr      = 0;
  Label11.OnPressPtr      = 0;

  Diagram8_Box6.OwnerScreen     = &Screen8;
  Diagram8_Box6.Order           = 0;
  Diagram8_Box6.Left            = 250;
  Diagram8_Box6.Top             = 25;
  Diagram8_Box6.Width           = 60;
  Diagram8_Box6.Height          = 80;
  Diagram8_Box6.Pen_Width       = 1;
  Diagram8_Box6.Pen_Color       = 0x0000;
  Diagram8_Box6.Visible         = 1;
  Diagram8_Box6.Active          = 1;
  Diagram8_Box6.Transparent     = 1;
  Diagram8_Box6.Gradient        = 1;
  Diagram8_Box6.Gradient_Orientation = 0;
  Diagram8_Box6.Gradient_Start_Color = 0xFFFF;
  Diagram8_Box6.Gradient_End_Color = 0xC618;
  Diagram8_Box6.Color           = 0xC618;
  Diagram8_Box6.PressColEnabled = 1;
  Diagram8_Box6.Press_Color     = 0xE71C;
  Diagram8_Box6.OnUpPtr         = 0;
  Diagram8_Box6.OnDownPtr       = 0;
  Diagram8_Box6.OnClickPtr      = 0;
  Diagram8_Box6.OnPressPtr      = 0;

  Diagram8_Box5.OwnerScreen     = &Screen8;
  Diagram8_Box5.Order           = 1;
  Diagram8_Box5.Left            = 190;
  Diagram8_Box5.Top             = 25;
  Diagram8_Box5.Width           = 60;
  Diagram8_Box5.Height          = 80;
  Diagram8_Box5.Pen_Width       = 1;
  Diagram8_Box5.Pen_Color       = 0x0000;
  Diagram8_Box5.Visible         = 1;
  Diagram8_Box5.Active          = 1;
  Diagram8_Box5.Transparent     = 1;
  Diagram8_Box5.Gradient        = 1;
  Diagram8_Box5.Gradient_Orientation = 0;
  Diagram8_Box5.Gradient_Start_Color = 0xFFFF;
  Diagram8_Box5.Gradient_End_Color = 0xC618;
  Diagram8_Box5.Color           = 0xC618;
  Diagram8_Box5.PressColEnabled = 1;
  Diagram8_Box5.Press_Color     = 0xE71C;
  Diagram8_Box5.OnUpPtr         = 0;
  Diagram8_Box5.OnDownPtr       = 0;
  Diagram8_Box5.OnClickPtr      = 0;
  Diagram8_Box5.OnPressPtr      = 0;

  Diagram8_Box4.OwnerScreen     = &Screen8;
  Diagram8_Box4.Order           = 2;
  Diagram8_Box4.Left            = 130;
  Diagram8_Box4.Top             = 25;
  Diagram8_Box4.Width           = 60;
  Diagram8_Box4.Height          = 80;
  Diagram8_Box4.Pen_Width       = 1;
  Diagram8_Box4.Pen_Color       = 0x0000;
  Diagram8_Box4.Visible         = 1;
  Diagram8_Box4.Active          = 1;
  Diagram8_Box4.Transparent     = 1;
  Diagram8_Box4.Gradient        = 1;
  Diagram8_Box4.Gradient_Orientation = 0;
  Diagram8_Box4.Gradient_Start_Color = 0xFFFF;
  Diagram8_Box4.Gradient_End_Color = 0xC618;
  Diagram8_Box4.Color           = 0xC618;
  Diagram8_Box4.PressColEnabled = 1;
  Diagram8_Box4.Press_Color     = 0xE71C;
  Diagram8_Box4.OnUpPtr         = 0;
  Diagram8_Box4.OnDownPtr       = 0;
  Diagram8_Box4.OnClickPtr      = 0;
  Diagram8_Box4.OnPressPtr      = 0;

  Diagram8_Box3.OwnerScreen     = &Screen8;
  Diagram8_Box3.Order           = 3;
  Diagram8_Box3.Left            = 70;
  Diagram8_Box3.Top             = 25;
  Diagram8_Box3.Width           = 60;
  Diagram8_Box3.Height          = 80;
  Diagram8_Box3.Pen_Width       = 1;
  Diagram8_Box3.Pen_Color       = 0x0000;
  Diagram8_Box3.Visible         = 1;
  Diagram8_Box3.Active          = 1;
  Diagram8_Box3.Transparent     = 1;
  Diagram8_Box3.Gradient        = 1;
  Diagram8_Box3.Gradient_Orientation = 0;
  Diagram8_Box3.Gradient_Start_Color = 0xFFFF;
  Diagram8_Box3.Gradient_End_Color = 0xC618;
  Diagram8_Box3.Color           = 0xC618;
  Diagram8_Box3.PressColEnabled = 1;
  Diagram8_Box3.Press_Color     = 0xE71C;
  Diagram8_Box3.OnUpPtr         = 0;
  Diagram8_Box3.OnDownPtr       = 0;
  Diagram8_Box3.OnClickPtr      = 0;
  Diagram8_Box3.OnPressPtr      = 0;

  Diagram8_Box2.OwnerScreen     = &Screen8;
  Diagram8_Box2.Order           = 4;
  Diagram8_Box2.Left            = 10;
  Diagram8_Box2.Top             = 25;
  Diagram8_Box2.Width           = 60;
  Diagram8_Box2.Height          = 80;
  Diagram8_Box2.Pen_Width       = 1;
  Diagram8_Box2.Pen_Color       = 0x0000;
  Diagram8_Box2.Visible         = 1;
  Diagram8_Box2.Active          = 1;
  Diagram8_Box2.Transparent     = 1;
  Diagram8_Box2.Gradient        = 1;
  Diagram8_Box2.Gradient_Orientation = 0;
  Diagram8_Box2.Gradient_Start_Color = 0xFFFF;
  Diagram8_Box2.Gradient_End_Color = 0xC618;
  Diagram8_Box2.Color           = 0xC618;
  Diagram8_Box2.PressColEnabled = 1;
  Diagram8_Box2.Press_Color     = 0xE71C;
  Diagram8_Box2.OnUpPtr         = 0;
  Diagram8_Box2.OnDownPtr       = 0;
  Diagram8_Box2.OnClickPtr      = 0;
  Diagram8_Box2.OnPressPtr      = 0;

  Diagram8_S2L2.OwnerScreen     = &Screen8;
  Diagram8_S2L2.Order           = 5;
  Diagram8_S2L2.Left            = 137;
  Diagram8_S2L2.Top             = 5;
  Diagram8_S2L2.Width           = 46;
  Diagram8_S2L2.Height          = 15;
  Diagram8_S2L2.Visible         = 0;
  Diagram8_S2L2.Active          = 1;
  Diagram8_S2L2.Caption         = Diagram8_S2L2_Caption;
  Diagram8_S2L2.FontName        = Tahoma13x13_Bold;
  Diagram8_S2L2.Font_Color      = 0xF800;
  Diagram8_S2L2.OnUpPtr         = 0;
  Diagram8_S2L2.OnDownPtr       = 0;
  Diagram8_S2L2.OnClickPtr      = 0;
  Diagram8_S2L2.OnPressPtr      = 0;

  Diagram8_Box1.OwnerScreen     = &Screen8;
  Diagram8_Box1.Order           = 6;
  Diagram8_Box1.Left            = 0;
  Diagram8_Box1.Top             = 120;
  Diagram8_Box1.Width           = 320;
  Diagram8_Box1.Height          = 120;
  Diagram8_Box1.Pen_Width       = 1;
  Diagram8_Box1.Pen_Color       = 0x0000;
  Diagram8_Box1.Visible         = 1;
  Diagram8_Box1.Active          = 1;
  Diagram8_Box1.Transparent     = 1;
  Diagram8_Box1.Gradient        = 1;
  Diagram8_Box1.Gradient_Orientation = 0;
  Diagram8_Box1.Gradient_Start_Color = 0xFFFF;
  Diagram8_Box1.Gradient_End_Color = 0xC618;
  Diagram8_Box1.Color           = 0xC618;
  Diagram8_Box1.PressColEnabled = 1;
  Diagram8_Box1.Press_Color     = 0xE71C;
  Diagram8_Box1.OnUpPtr         = 0;
  Diagram8_Box1.OnDownPtr       = 0;
  Diagram8_Box1.OnClickPtr      = 0;
  Diagram8_Box1.OnPressPtr      = 0;

  Diagram8_S2L4.OwnerScreen     = &Screen8;
  Diagram8_S2L4.Order           = 7;
  Diagram8_S2L4.Left            = 35;
  Diagram8_S2L4.Top             = 105;
  Diagram8_S2L4.Width           = 7;
  Diagram8_S2L4.Height          = 15;
  Diagram8_S2L4.Visible         = 1;
  Diagram8_S2L4.Active          = 1;
  Diagram8_S2L4.Caption         = Diagram8_S2L4_Caption;
  Diagram8_S2L4.FontName        = Tahoma13x13_Bold;
  Diagram8_S2L4.Font_Color      = 0xFC00;
  Diagram8_S2L4.OnUpPtr         = 0;
  Diagram8_S2L4.OnDownPtr       = 0;
  Diagram8_S2L4.OnClickPtr      = 0;
  Diagram8_S2L4.OnPressPtr      = 0;

  Diagram8_S2L5.OwnerScreen     = &Screen8;
  Diagram8_S2L5.Order           = 8;
  Diagram8_S2L5.Left            = 95;
  Diagram8_S2L5.Top             = 105;
  Diagram8_S2L5.Width           = 7;
  Diagram8_S2L5.Height          = 15;
  Diagram8_S2L5.Visible         = 1;
  Diagram8_S2L5.Active          = 1;
  Diagram8_S2L5.Caption         = Diagram8_S2L5_Caption;
  Diagram8_S2L5.FontName        = Tahoma13x13_Bold;
  Diagram8_S2L5.Font_Color      = 0x87E0;
  Diagram8_S2L5.OnUpPtr         = 0;
  Diagram8_S2L5.OnDownPtr       = 0;
  Diagram8_S2L5.OnClickPtr      = 0;
  Diagram8_S2L5.OnPressPtr      = 0;

  Diagram8_S2L6.OwnerScreen     = &Screen8;
  Diagram8_S2L6.Order           = 9;
  Diagram8_S2L6.Left            = 155;
  Diagram8_S2L6.Top             = 105;
  Diagram8_S2L6.Width           = 7;
  Diagram8_S2L6.Height          = 15;
  Diagram8_S2L6.Visible         = 1;
  Diagram8_S2L6.Active          = 1;
  Diagram8_S2L6.Caption         = Diagram8_S2L6_Caption;
  Diagram8_S2L6.FontName        = Tahoma13x13_Bold;
  Diagram8_S2L6.Font_Color      = 0x8000;
  Diagram8_S2L6.OnUpPtr         = 0;
  Diagram8_S2L6.OnDownPtr       = 0;
  Diagram8_S2L6.OnClickPtr      = 0;
  Diagram8_S2L6.OnPressPtr      = 0;

  Diagram8_S2L7.OwnerScreen     = &Screen8;
  Diagram8_S2L7.Order           = 10;
  Diagram8_S2L7.Left            = 215;
  Diagram8_S2L7.Top             = 105;
  Diagram8_S2L7.Width           = 7;
  Diagram8_S2L7.Height          = 15;
  Diagram8_S2L7.Visible         = 1;
  Diagram8_S2L7.Active          = 1;
  Diagram8_S2L7.Caption         = Diagram8_S2L7_Caption;
  Diagram8_S2L7.FontName        = Tahoma13x13_Bold;
  Diagram8_S2L7.Font_Color      = 0x801F;
  Diagram8_S2L7.OnUpPtr         = 0;
  Diagram8_S2L7.OnDownPtr       = 0;
  Diagram8_S2L7.OnClickPtr      = 0;
  Diagram8_S2L7.OnPressPtr      = 0;

  Diagram8_S2L8.OwnerScreen     = &Screen8;
  Diagram8_S2L8.Order           = 11;
  Diagram8_S2L8.Left            = 275;
  Diagram8_S2L8.Top             = 105;
  Diagram8_S2L8.Width           = 7;
  Diagram8_S2L8.Height          = 15;
  Diagram8_S2L8.Visible         = 1;
  Diagram8_S2L8.Active          = 1;
  Diagram8_S2L8.Caption         = Diagram8_S2L8_Caption;
  Diagram8_S2L8.FontName        = Tahoma13x13_Bold;
  Diagram8_S2L8.Font_Color      = 0xFC1F;
  Diagram8_S2L8.OnUpPtr         = 0;
  Diagram8_S2L8.OnDownPtr       = 0;
  Diagram8_S2L8.OnClickPtr      = 0;
  Diagram8_S2L8.OnPressPtr      = 0;

  Diagram8_S2L1.OwnerScreen     = &Screen8;
  Diagram8_S2L1.Order           = 12;
  Diagram8_S2L1.Left            = 10;
  Diagram8_S2L1.Top             = 4;
  Diagram8_S2L1.Width           = 69;
  Diagram8_S2L1.Height          = 15;
  Diagram8_S2L1.Visible         = 1;
  Diagram8_S2L1.Active          = 1;
  Diagram8_S2L1.Caption         = Diagram8_S2L1_Caption;
  Diagram8_S2L1.FontName        = Tahoma13x13_Bold;
  Diagram8_S2L1.Font_Color      = 0xF800;
  Diagram8_S2L1.OnUpPtr         = 0;
  Diagram8_S2L1.OnDownPtr       = 0;
  Diagram8_S2L1.OnClickPtr      = 0;
  Diagram8_S2L1.OnPressPtr      = 0;
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
#define GetCircleButton(index)        CurrentScreen->CircleButtons[index]
#define GetBox(index)                 CurrentScreen->Boxes[index]
#define GetRadioButton(index)         CurrentScreen->RadioButtons[index]
#define GetProgressBar(index)         CurrentScreen->ProgressBars[index]

void DeleteTrailingSpaces(char* str){
  char counter;
  while(1) {
  if (str[0] == ' ') {
    for(counter = 0; counter < strlen(str); counter++) {
      str[counter] = str[counter+1];
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
      TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
        Around_button->Left + Around_button->Width - 2,
        Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
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

void DrawBox(TBox *ABox) {
  if (ABox->Visible == 1) {
    if (object_pressed == 1) {
      object_pressed = 0;
      TFT_Set_Brush(ABox->Transparent, ABox->Press_Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_End_Color, ABox->Gradient_Start_Color);
    }
    else {
      TFT_Set_Brush(ABox->Transparent, ABox->Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_Start_Color, ABox->Gradient_End_Color);
    }
    TFT_Set_Pen(ABox->Pen_Color, ABox->Pen_Width);
    TFT_Rectangle(ABox->Left, ABox->Top, ABox->Left + ABox->Width - 1, ABox->Top + ABox->Height - 1);
  }
}

void DrawRadioButton(TRadioButton *ARadioButton) {
  int circleOffset = 0;
  if (ARadioButton->Visible == 1) {
    circleOffset = ARadioButton->Height / 5;
    TFT_Set_Pen(ARadioButton->Pen_Color, ARadioButton->Pen_Width);
    TFT_Set_Ext_Font(ARadioButton->FontName, ARadioButton->Font_Color, FO_HORIZONTAL);
    if (ARadioButton->TextAlign == _taLeft) {
      TFT_Set_Brush(ARadioButton->Transparent,ARadioButton->Background_Color,0,0,0,0);
      TFT_Circle(ARadioButton->Left + ARadioButton->Height / 2, ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2);
      if (ARadioButton->Checked == 1) {
        if (object_pressed == 1) {
          object_pressed = 0;
          TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Press_Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_End_Color, ARadioButton->Gradient_Start_Color);
        } else
          TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_Start_Color, ARadioButton->Gradient_End_Color);
        TFT_Circle(ARadioButton->Left + ARadioButton->Height / 2 , ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2 - circleOffset);
      }
      TFT_Write_Text_Return_Pos(ARadioButton->Caption, ARadioButton->Left + ARadioButton->Height + 4, ARadioButton->Top);
      TFT_Write_Text(ARadioButton->Caption, ARadioButton->Left + ARadioButton->Height + 4, (ARadioButton->Top + ((ARadioButton->Height - caption_height) / 2)));
    } else {
      TFT_Set_Brush(ARadioButton->Transparent,ARadioButton->Background_Color,0,0,0,0);
      TFT_Circle(ARadioButton->Left  + ARadioButton->Width - ARadioButton->Height / 2, ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2);
      if (ARadioButton->Checked == 1) {
        if (object_pressed == 1) {
          object_pressed = 0;
          TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Press_Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_End_Color, ARadioButton->Gradient_Start_Color);
        } else
          TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_Start_Color, ARadioButton->Gradient_End_Color);
        TFT_Circle(ARadioButton->Left  + ARadioButton->Width - ARadioButton->Height / 2, ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2 - circleOffset);
      }
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
  locPosition = (AProgressBar->Position - AProgressBar->Min) * 100 / (AProgressBar->Max - AProgressBar->Min);
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
          WordToStr(locPosition , tmpStr);
          DeleteTrailingSpaces(tmpStr);
          strcpy(AProgressBar->Caption, tmpStr);
          strcat(AProgressBar->Caption, "\%");
    }
    else {
         WordToStr(AProgressBar->Position , tmpStr);
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
  unsigned long locPosition = 0;
  int move_offset = 0;
  unsigned cnt = 0;
  unsigned int tmpWidth = 0;
  unsigned int tmpRound = 0;
  unsigned int _tmpI, _tmpII;
  char tmpStr[8];
  move_offset = 10;
  _tmpI = AProgressBar->Position - AProgressBar->Min;
  _tmpII = AProgressBar->Max - AProgressBar->Min;
  locPosition = (unsigned long)_tmpI * 100 / _tmpII;
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
    // Clear caption first
    if (AProgressBar->Show_Position == 1){
       if (AProgressBar->Show_Percentage == 1) {
          WordToStr(locPosition , tmpStr);
          DeleteTrailingSpaces(tmpStr);
          strcpy(AProgressBar->Caption, tmpStr);
          strcat(AProgressBar->Caption, "\%");
       }
       else {
         WordToStr(AProgressBar->Position , tmpStr);
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
 unsigned int order;
  unsigned short round_button_idx;
  TButton_Round *local_round_button;
  unsigned short label_idx;
  TLabel *local_label;
  unsigned short image_idx;
  TImage *local_image;
  unsigned short circle_button_idx;
  TCircleButton *local_circle_button;
  unsigned short box_idx;
  TBox *local_box;
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
  circle_button_idx = 0;
  box_idx = 0;
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
        round_button_idx++;
        order++;
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

    if (circle_button_idx < CurrentScreen->CircleButtonsCount) {
      local_circle_button = GetCircleButton(circle_button_idx);
      if (order == local_circle_button->Order) {
        circle_button_idx++;
        order++;
        DrawCircleButton(local_circle_button);
      }
    }

    if (box_idx < CurrentScreen->BoxesCount) {
      local_box = GetBox(box_idx);
      if (order == local_box->Order) {
        box_idx++;
        order++;
        DrawBox(local_box);
      }
    }

    if (image_idx < CurrentScreen->ImagesCount) {
      local_image = GetImage(image_idx);
      if (order == local_image->Order) {
        image_idx++;
        order++;
        DrawImage(local_image);
      }
    }

    if (radio_button_idx < CurrentScreen->RadioButtonsCount) {
      local_radio_button = GetRadioButton(radio_button_idx);
      if (order == local_radio_button->Order) {
        radio_button_idx++;
        order++;
        DrawRadioButton(local_radio_button);
      }
    }

    if (progress_bar_idx < CurrentScreen->ProgressBarsCount) {
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
  circle_button_order = -1;
  box_order           = -1;
  radio_button_order  = -1;
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

  //  Circle Buttons
  for ( _object_count = 0 ; _object_count < CurrentScreen->CircleButtonsCount ; _object_count++ ) {
    local_circle_button = GetCircleButton(_object_count);
    if (local_circle_button->Active == 1) {
      if (IsInsideObject(X, Y, local_circle_button->Left, local_circle_button->Top,
                        (local_circle_button->Radius * 2), (local_circle_button->Radius * 2)) == 1) {
        circle_button_order = local_circle_button->Order;
        exec_circle_button = local_circle_button;
      }
    }
  }

  //  Boxes
  for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
    local_box = GetBox(_object_count);
    if (local_box->Active == 1) {
      if (IsInsideObject(X, Y, local_box->Left, local_box->Top,
                         local_box->Width, local_box->Height) == 1) {
        box_order = local_box->Order;
        exec_box = local_box;
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

  _object_count = -1;
  if (round_button_order >  _object_count )
    _object_count = round_button_order;
  if (label_order >  _object_count )
    _object_count = label_order;
  if (image_order >  _object_count )
    _object_count = image_order;
  if (circle_button_order >  _object_count )
    _object_count = circle_button_order;
  if (box_order >  _object_count )
    _object_count = box_order;
  if (radio_button_order >  _object_count )
    _object_count = radio_button_order;
}


static void Process_TP_Press(unsigned int X, unsigned int Y) {
  exec_round_button   = 0;
  exec_label          = 0;
  exec_image          = 0;
  exec_circle_button  = 0;
  exec_box            = 0;
  exec_radio_button   = 0;

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

    if (_object_count == circle_button_order) {
      if (exec_circle_button->Active == 1) {
        if (exec_circle_button->OnPressPtr != 0) {
          exec_circle_button->OnPressPtr();
          return;
        }
      }
    }

    if (_object_count == box_order) {
      if (exec_box->Active == 1) {
        if (exec_box->OnPressPtr != 0) {
          exec_box->OnPressPtr();
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
    // Circle Button
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
    // Box
    case 6: {
      if (PressedObject != 0) {
        exec_box = (TBox*)PressedObject;
        if ((exec_box->PressColEnabled == 1) && (exec_box->OwnerScreen == CurrentScreen)) {
          DrawBox(exec_box);
        }
        break;
      }
      break;
    }
    // Radio Button
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

  // Circle Buttons
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

  // Boxes
    if (_object_count == box_order) {
      if (exec_box->Active == 1) {
        if (exec_box->OnUpPtr != 0)
          exec_box->OnUpPtr();
        if (PressedObject == (void *)exec_box)
          if (exec_box->OnClickPtr != 0)
            exec_box->OnClickPtr();
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
  exec_circle_button  = 0;
  exec_box            = 0;
  exec_radio_button   = 0;

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

    if (_object_count == box_order) {
      if (exec_box->Active == 1) {
        if (exec_box->PressColEnabled == 1) {
          object_pressed = 1;
          DrawBox(exec_box);
        }
        PressedObject = (void *)exec_box;
        PressedObjectType = 6;
        if (exec_box->OnDownPtr != 0) {
          exec_box->OnDownPtr();
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
    Mmc_Fat_Assign("DCVA_GUI.RES", 0);
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
