
CandleSticksChart

CandleSticksChart is a Project that shows Chart for Crypto Currencies using Binance API.

List of completed tasks:
 Main Task:-
    UI Implementation
    Creating Web Layer
    Drawing Candles using (Charts)
    Adding Prices Scale
 Bonus Task No1:-
     chart can be scrolled left and right, and the candles should shrink and expand relative to the frame in which they are contained.

 Bonus task No2: 
    create a new screen with a list of currencies.
    Clicking on a list item opens a screen with a graph. Make it possible to close this chart
and choose a new currency.
    Use “BTCUSDT”, “LTCUSDT” and “ETHUSDT” for the list of currencies.
    
    After selecting the currency, the application must make a new request with the selected currency to the exchange server in order to get the correct price data.

 Bonus Taks No3:-
    Use Firebase for Analytics
    Create Event Manager to be reusable.
    

Known Issues:-
    could'nt put the time scale on the x-axis.
    UI of Chart Doesnt match attached Chart in Figma(its close to it) 

Defficulties:-
    Ploting Data on Candle Chart as the documentation not descriptive.
    Data Handling as i used Codable for parsing data , and the array was with different data types.
