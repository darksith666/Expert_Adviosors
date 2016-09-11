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
void OnTick()
  {
//---
//if the current time is between 9 gmt and 22 gmt
 //check if there is an order ///Extern variable

   //call fractal indicator
   
   //check if fractal pattern has been broken
      //if pattern broken flag equal
         //check if up or down pattern was broken
            //if up upflag equals true
            //if down down flag equals true
      
      //else flag equals false
   //check if there is an order ///Extern variable
   //if no order
      //check if fractal up flag equals true
      // call SMA
      //if price above 60 sma
         //call 5 ema low
         //if price => ema low
            //submit buy order
            //buyflag = tzrue
            
      //check if fractal down flag equals true
      // call SMA
      //if price below 60 sma
         //call 5 ema high
         //if price => ema high
            //submit sell order
            //buyflag = sell
            
            //if buyflag equals true
               //call 5 ema high
               //if price touches 5 ema high
               //close trade
               //buy flag equals false
               
            //if sellflag equals true
               //call 5 ema low
               //if price touches 5 ema low
               //close trade
               //sell flag equals false
  }
  }
//+------------------------------------------------------------------+
