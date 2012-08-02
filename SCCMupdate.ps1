param (
    [string]$ComputerName = $env:computername
)
try {
	$SCCMClient = [wmiclass] "\\$ComputerName\root\ccm:sms_client"
	$SCCMClient.RequestMachinePolicy() | Out-Null
	$SCCMClient.EvaluateMachinePolicy() | Out-Null
	echo "Refreshed SCCM Machine Policy on $ComputerName."
}
catch {
	echo "Failed to refresh SCCM Machine Policy on $ComputerName."
	exit(1)
}
