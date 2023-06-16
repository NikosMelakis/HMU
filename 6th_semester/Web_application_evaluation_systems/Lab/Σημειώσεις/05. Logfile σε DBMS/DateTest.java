/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datetest;

import java.text.ParseException;
import java.util.Locale;

/**
 *
 * @author costis
 */
public class DateTest {

    public static void main(String[] args) {
        Locale loc=new Locale("en","US");
        System.out.println(Locale.getDefault()); 
        String dateAsIs = "18/May/2018:10:09:15 +0300";
        java.text.DateFormat dfm = new java.text.SimpleDateFormat("dd/MMM/yyyy:HH:mm:ss Z", loc);
        //dfm.setTimeZone(java.util.TimeZone.getTimeZone("Europe/Athens"));
        System.out.println("dateAsIs " + dateAsIs);
        java.util.Date a;
        try {
            a = dfm.parse(dateAsIs);

            //jTextField14.setText(dfm.format(a));
            java.sql.Timestamp ts1 = new java.sql.Timestamp(a.getTime());
            System.out.println("ts1 " + ts1.toString());

            System.out.println("...");

        } catch (ParseException ex) {
            System.out.println("ads" + ex.getMessage());
        }
    }
}
