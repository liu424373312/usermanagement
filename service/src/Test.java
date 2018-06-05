import java.util.Scanner;

import com.wei.socket.ServerManager;

public class Test {

    public static void main(String[] args) {

        ServerManager serverManager=new ServerManager();

        boolean isRun=true;
        Scanner scanner=new Scanner(System.in);

        System.out.println("Input your choice:");
        while(isRun){
            int input=scanner.nextInt();
            switch (input) {
            case 1:
                serverManager.Start(8888);
                break;
            case 2:
                serverManager.Stop();
                isRun=false;
                break;
            default:
                break;
            }
        }
    }

}