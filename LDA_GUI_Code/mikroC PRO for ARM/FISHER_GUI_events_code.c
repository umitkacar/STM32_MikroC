

// Event Handlers
void Database_Show() {
     DrawScreen(&DatabaseScreen2);
     k1=0;a1=0;
     for(jj=0;jj<TrainPicture;jj++){
       if (a1==(3*k1))    {q1 = 50; q2 = 60;}
       if (a1==(3*k1+1))   q1 = 130;
       if (a1==(3*k1+2))  {q1 = 90; q2 = 180; k1 = k1 + 1;}
       Delay_ms(100);
       ii=0;
       for(y1=0;y1<col;y1++){
          for(x1=0;x1<row;x1++){
              temp1 = TFT_RGBToColor16bit(Ear[jj*row*col+ii], Ear[jj*row*col+ii], Ear[jj*row*col+ii]);
              TFT_Dot(x1+q1,y1+q2,temp1);
              ii=ii+1;}}
       a1 = a1 + 1;}

     DrawScreen(&MainScreen1);
}

void Training() {
     DrawScreen(&TrainingScreen3);
     Delay_ms(3000);
     DrawScreen(&MainScreen1);
}

void Test() {
    DrawScreen(&TestScreen4);
    Delay_ms(3000);
    DrawScreen(&MainScreen1);
}



void CP_2() {

}

void CP_3() {

}

void CP_4() {

}

void CP_5() {

}