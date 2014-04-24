SCCM 2012 Machine Policy Update Script
======================================
By: Craig Meinschein

Forces a computer (or set of computers) to run its SCCM Machine Policy
Retrieval & Evaluation Cycle. Also triggers the SCCM Application Deployment
Evaluation Cycle on SCCM 2012 clients. In my environment, it was easiest to
implement this as a PowerShell script with a batch script "wrapper".

Usage
-----
	sccmupdate.cmd [computer1] [computer2] [...]

If run with no arguments, it will refresh Machine Policy on the
local machine.
