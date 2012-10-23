
// $Id: HostLookup.java,v 1.1 2005/01/21 09:15:41 doros Exp $
// gcj --main=HostLookup HostLookup.java -o HostLookup

import java.net.*;
import java.io.*;
public class HostLookup {
  public static void main(String[] args) {
    try {
      InetAddress LocalAddress=InetAddress.getLocalHost();
      System.out.println("Local Host: " + LocalAddress.getHostName() +
        ", IP address: "+ LocalAddress.getHostAddress());
    } catch(UnknownHostException e) {
      System.out.println("Host Unknown");
      e.printStackTrace();
    }
    if (args.length != 1)
      System.out.println("Usage: HostLookup host");
    else {
      System.out.println("Serching " + args[0]+ " ...");
      try {
        InetAddress RemoteMachine=InetAddress.getByName(args[0]);
        System.out.println("Remote Host: " + RemoteMachine.getHostName() +
          ", IP address: "+ RemoteMachine.getHostAddress());
      } catch(UnknownHostException e) {
        System.out.println("Host " +args[0]+ " Unknown");
      }
    }
  }
}
