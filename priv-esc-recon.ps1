# Technique: In-memory ScriptBlock
# Triggers: Wazuh process creation + privilege recon alert

$sb = [scriptblock]::Create(@'
whoami /priv
whoami /groups
net localgroup administrators
'@)
& $sb
