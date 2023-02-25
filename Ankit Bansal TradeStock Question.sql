SELECT * FROM trade_tbl;

/*Here we are using self join to get the second trade_id column from second self join table based on the trade_id*/
/* Then we need to remove the duplicate pairs like trade_1, trade_2 and trade_2 and trade_1 combinations.*/
/* To eliminate the above Condition we use where condition t1.Trade_Timestamp<t2.Trade_Timestamp to remove duplicate ones */
/* Then we use timestampdiff of second functions to get the two trades done in 10 seconds*/

SELECT t1.TRADE_ID,t2.TRADE_ID,t1.trade_timestamp,t2.Trade_Timestamp,t1.price,t2.Price,abs(100*(t1.price-t2.price)/t1.Price*1.0) as Price_difference
 FROM  trade_tbl t1
INNER JOIN trade_tbl t2 on 1=1
where t1.Trade_Timestamp<t2.Trade_Timestamp and timestampdiff(second,t1.trade_timestamp,t2.trade_timestamp)<10
and abs(100*(t1.price-t2.price)/t1.Price*1.0)>10