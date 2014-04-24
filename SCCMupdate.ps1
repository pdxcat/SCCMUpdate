# Credit where credit is due, this was helped along by Tommy Gunn's blog post at:
# http://www.systemcentercentral.com/BlogDetails/tabid/143/IndexID/19249/Default.aspx
param (
    [string]$ComputerName = $env:computername
)
try {
	$SCCMClient = [wmiclass] "\\$ComputerName\root\ccm:sms_client"
	$SCCMClient.RequestMachinePolicy() | Out-Null
	$SCCMClient.EvaluateMachinePolicy() | Out-Null
	# Comment the below line for SCCM 2007 clients.
	$SCCMClient.TriggerSchedule('{00000000-0000-0000-0000-000000000121}') | Out-Null
	echo "Refreshed SCCM Machine Policy on $ComputerName."
}
catch {
	echo "Failed to refresh SCCM Machine Policy on $ComputerName."
	exit(1)
}
