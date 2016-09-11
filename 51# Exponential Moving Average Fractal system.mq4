//+------------------------------------------------------------------+
//|                                                    #51_BROUT.mq4 |
//|                                                    Dali Haeusler |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Dali Haeusler"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
//EXTERNABLES
extern int StartHour;
extern int EndHour;
extern int OrderCheck;

void OnTick()
  {
//---
//if the current time is between 9 gmt and 22 gmt
if(Hour() >= StartHour && Hour() <= EndHour)
{
 bool CurrentBuyOrder;
 bool CurrentSellOrder;
 
 //check if there is an order ///Extern variable //TODO

   //Fractal Indicator
    double Fractal = iCustom(NULL,NULL,"Fractals",0,0); //TODO setup Indicator
       
   //Check if Fractal Trend has been Broken
   int  UpCounter = 0;           int  DownCounter = 0;
   bool UpFractalBroken = false; bool DownFractalBroken = false;
   
   //TODO calculate if fractal is up or down
   //TODO Make into a Function fractal checker

   //Down Fractal Trend Broken Checker
   if(Fractal == up)
   {
   UpCounter++;
   if(DownCounter >=1 && UpCounter == 1){DownFractalBroken = true;}
   }
   
   //Up Fractal Trend Broken Checker
   if(Fractal == down)
   {
   DownCounter++;
   if(UpCounter >=1 && DownCounter == 1){UpFractalBroken = true;}
   }  
      
   //check if there is an order ///Extern variable //TODO //Maybe????
   //if no order
   
      //If the Up Fractal Trend has broken then Send a Buy Order
      if(UpFractalBroken == True)
      {     
         //Call SMA
         double SMMA = iMA(NULL,NULL,60,0,2,0,0); //TODO Change to Kirell SMMA
         if(Bid > SMMA)
         {
            double EMALow = iMA(NULL,NULL,5,0,1,3,0);
            if(Bid >= EMALow){OrderSend();}//TODO Buy Order Send
         }
      }
      
      //If the Down Fractal Trend has broken then Send a Sell Order
      if(DownFractalBroken == True)
      {     
         //Call SMMA
         double SMMA = iMA(NULL,NULL,60,0,2,0,0); //TODO Change to Kirell SMMA
         if(Bid > SMMA)
         {
            double EMAHigh = iMA(NULL,NULL,5,0,1,2,0);
            if(Bid >= EMAHigh){OrderSend();}//TODO Sell Order Send
         }
      }
      
      //Buy Order Exit Stratergey
      if(CurrentBuyOrder == true)
      {
         double EMAHigh = iMA(NULL,NULL,5,0,1,2,0);
         if(Bid >= EMAHigh)
         {
            bool OrderExit = OrderClose();//TODO Finish Order Close
            if(!OrderExit){Alert("Buy Order Not Closed");}
         }
      }
      
      //Sell Order Exit Stratergey
      if(CurrentSellOrder == true)
      {
         double EMALow = iMA(NULL,NULL,5,0,1,3,0);
         if(Bid >= EMALow)
         {
            bool OrderExit = OrderClose();//TODO Finish Order Close
            if(!OrderExit){Alert("Buy Order Not Closed");}
         }
      }
            
     
  }
  }
//+------------------------------------------------------------------+
