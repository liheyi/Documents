import debugger
debugger = debugger.debugger()
#debugger.load(r"C:\Windows\System32\calc.exe")
pid = raw_input("Enter the PID of the process to attach to: ")
debugger.attach(int(pid))
debugger.detach()