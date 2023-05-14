# WindowsSandboxForMABS

After download/edit of the .bat and .wsb, double-click on the .wsb to fire up a Windows Sandbox prepared for use by MABS.   

Double-click on the auto-created `000-RUNME_init_mabs.bat` to download and extract MABS ready to run.   

When MABS has built, double-click on `111-SAVE_mabs.bat` to save the results back to the host, whereupon one can close tyh sandbox which erase eveything in it.   

Dependencies you can/must edit or delete:   
  1. Inside `dcw_sandbox_v02.wsb`   
    1.1 `C:\software` is on the host and contains software folders, like NPP containing portable notepad++   
    1.2 `C:\software\WindowsSandbox` is on the host and contains `dcw_sandbox_v02.wsb` and `Setup_v02.bat`   
    1.3 `D:\VM\MABS` is on the host and, after you copy stuff into there, will contain the results of the MABS run   
    1.4 `C:\host_software\WindowsSandbox\Setup_v02.bat` is a file on the host and is auto-run by the .wsb inside newly created windows sandbox

  2. Inside `Setup_v02.bat`   
    2.1  
