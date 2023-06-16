/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package logfileloader;

import javax.swing.*;
import java.sql.*;
import java.io.*;
import java.text.*;
/**
 *
 * @author costis
 */
public class ConverterSingle implements Runnable {

    private Statement stmt;
    private ResultSet rs;
    private int shop;
    private String filnam;
    private File aFile;
    private JProgressBar progress;
    private java.util.Date from, to;
    private JTextField batchTextField;
    
    private java.sql.Timestamp lastTS;
           
    public ConverterSingle(Connection con, int shop, File inputFile, String filnam, int numlin,
            JProgressBar progress, java.util.Date from, java.util.Date to, JTextField batchTextField) {

        this.shop = shop;
        this.filnam = filnam;
        this.aFile = inputFile;
        this.progress = progress;
        this.from = from;
        this.to = to;
        this.batchTextField = batchTextField;

        progress.setValue(0);
        progress.setMinimum(0);
        progress.setMaximum(numlin - 1);

        if (inputFile != null) {
            if (!inputFile.exists())
                JOptionPane.showMessageDialog(null, "Please select an existing Logfile to work on!");
            else {
                try {
                    stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    rs = stmt.executeQuery("select * from transactions");
                } catch (SQLException sea) {
                    JOptionPane.showMessageDialog(null, "ConverterSingle: " + sea.getMessage());
                }
            }
         } else
            JOptionPane.showMessageDialog(null, "File not selected!");
    }

    public void run() {
        int lin = 0;
        try {
            BufferedReader input =  new BufferedReader(new FileReader(aFile));
            try {
                String line = null; //not declared within while loop

                while ( ((line = input.readLine()) != null) && (!Thread.interrupted()) ) {
                    //System.out.println(line);
                    try {
                        rs.moveToInsertRow();
                        rs.updateString("batch", batchTextField.getText());
                        rs.updateInt("site", shop);
                        rs.updateString("filename", filnam);
                        updateDBFields(line);
                        //java.sql.Timestamp t = rs.getTimestamp("tDateAndTime");
                        java.sql.Timestamp t = lastTS;
                        if ((from != null) && (to != null)) {
                            if ((t.after(from) || t.equals(from)) && ((t.equals(to)) || (t.before(to)))) {
                                rs.insertRow();
                                progress.setValue(++lin);
                            } 
                        } else if ((from != null) && (to == null)) {
                            System.out.println("case with from and no to");
                            if (t.after(from) || t.equals(from)) {
                                rs.insertRow();
                                progress.setValue(++lin);
                            }
                        } else if ((from == null) && (to != null)) {
                            System.out.println("case with no from and to");
                            if (t.before(from) || t.equals(from)) {
                                rs.insertRow();
                                progress.setValue(++lin);
                            }
                        } else { // no daterestrictions
                            rs.insertRow();
                            progress.setValue(++lin);
                        }
                    } catch (SQLException se) {
                        JOptionPane.showMessageDialog(null, "Converter: " + se.getMessage());
                    }
                    //contents.append(line);
                  //contents.append(System.getProperty("line.separator"));
                }
            } finally {
                input.close();
                JOptionPane.showMessageDialog(null, "Finished! (" + lin + ")");
                progress.setValue(0);
                java.util.Date d = new java.util.Date();
                java.text.SimpleDateFormat df1 = new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss Z");
                batchTextField.setText(df1.format(d));
            }
        } catch (IOException exe){
            System.out.println("Exception: " + exe.getMessage());
        }
    }

    private void updateDBFields(String oneLine) {
        int nValue;
        String lStr;
        String agent, referer;
        
        int ref2=oneLine.lastIndexOf('\"');
        int ref1=oneLine.lastIndexOf('\"', ref2-1);
        int ag2=oneLine.lastIndexOf('\"', ref1-1);
        int ag1=oneLine.lastIndexOf('\"', ag2-1);
        
        agent=oneLine.substring(ag1+1, ag2);
        referer=oneLine.substring(ref1+1, ref2);

        String[] components = oneLine.split(" ",0);
        try {
            rs.updateString("aRemoteIPAddress", components[0]);
            rs.updateString("ALocalIPAddress", components[1]);

            if (components[2].equals("-")) {
                nValue = 0;
            } else {
                nValue = Integer.parseInt(components[2]);
            }
            rs.updateInt("bBytesSentOrDash", nValue);

            nValue=Integer.parseInt(components[3]);
            rs.updateInt("BBytesSent", nValue);

            rs.updateString("hRemoteHostName", components[4]);

            rs.updateString("HRequestProtocol", null);

            rs.updateString("lRemoteLogicalUserName", components[5]);

            rs.updateString("mRequestMethod", components[6]);

            nValue=Integer.parseInt(components[7]);
            rs.updateInt("pLocalPort", nValue);

            rs.updateString("qQueryString", components[8]);

            lStr = components[12]+components[13]+components[14];
            rs.updateString("rFirstLineOfRequest", lStr );

            rs.updateString("sHTTPStatusCode", components[15]);

            rs.updateString("SUserSessionID", components[18]);

            //was rs.updateString("tDateAndTime", components[10]+components[11]);

            String dateAsIs = components[10].substring(1); // get rid of [
            dateAsIs = dateAsIs.replace("/", " ");
            dateAsIs = dateAsIs.replaceFirst(":", " ");
            dateAsIs = dateAsIs + " " + components[11].substring(0, 5); //09 Feb 2009 20:22:01 +0200
            System.out.println("--->" + dateAsIs);
            // initialize a well-known Date
            java.text.DateFormat dfm = new java.text.SimpleDateFormat("dd MMM yyyy HH:mm:ss Z");
            dfm.setTimeZone(java.util.TimeZone.getTimeZone("Europe/Athens"));
            System.out.println("dateAsIs " + dateAsIs);
            java.util.Date a;
            try {
                a = dfm.parse(dateAsIs);

                //jTextField14.setText(dfm.format(a));


                java.sql.Timestamp ts1 = new java.sql.Timestamp(a.getTime());
                System.out.println("ts1 " + ts1.toString());
                rs.updateTimestamp("tDateAndTime", ts1);
                System.out.println("...");
                lastTS = ts1;
            } catch (ParseException ex) {
                System.out.println("ads" +  ex.getMessage());
            }

            rs.updateString("uRemoteUserAuthenticated", components[9]);
            rs.updateString("URequestedURLPath", components[16]);

            nValue = Integer.parseInt(components[17]);
            rs.updateInt("DMillisToProcess", nValue);

//            nValue = Integer.parseInt(components[18]);
//            rs.updateInt("TSecondsToProcess", nValue);

            rs.updateString("agent", agent);
            rs.updateString("referer", referer);
            
        } catch (SQLException slwp) {
            System.out.println("ads1" +  slwp.getMessage());
        }
    }
}