# Technique: Invoke via NT API directly — bypasses CreateProcess monitoring
# Benign payload: open calculator

$code = @"
using System;
using System.Runtime.InteropServices;
using System.Diagnostics;

public class NtExec {
    [DllImport("kernel32.dll")]
    public static extern IntPtr OpenProcess(uint a, bool b, uint c);

    public static void Exec() {
        // Benign: just spawn calculator via Win32 as demonstration
        Process.Start("calc.exe");
    }
}
"@

Add-Type -TypeDefinition $code -Language CSharp
[NtExec]::Exec()
