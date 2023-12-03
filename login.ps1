Add-Type -AssemblyName System.Windows.Forms
# $PSScriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Definition
# $scriptPath = Join-Path $PSScriptRoot ".\load.ps1"

# Set-Content -Path $scriptPath -Value (Get-Content -Path $scriptPath -Raw)

$form = New-Object System.Windows.Forms.Form
$form.Text = "CQU Network Login" 
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = "CenterScreen"

$idLabel = New-Object System.Windows.Forms.Label
$idLabel.Text = "ID:"
$idLabel.Location = New-Object System.Drawing.Point(10,30)
$idLabel.AutoSize = $true
$form.Controls.Add($idLabel)

$idTextBox = New-Object System.Windows.Forms.TextBox
$idTextBox.Location = New-Object System.Drawing.Point(80,30)
$form.Controls.Add($idTextBox)

$passwordLabel = New-Object System.Windows.Forms.Label
$passwordLabel.Text = "Password:"
$passwordLabel.Location = New-Object System.Drawing.Point(10,70)
$passwordLabel.AutoSize = $true
$form.Controls.Add($passwordLabel)

$passwordTextBox = New-Object System.Windows.Forms.TextBox
$passwordTextBox.Location = New-Object System.Drawing.Point(80,70)
$passwordTextBox.PasswordChar = '*'
$form.Controls.Add($passwordTextBox)


$okButton = New-Object System.Windows.Forms.Button
$okButton.Text = "OK"
$okButton.Location = New-Object System.Drawing.Point(150,120)
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
    $id = $idTextBox.Text
    $password = $passwordTextBox.Text
    $response = Invoke-WebRequest "http://10.254.7.4:801/eportal/portal/login?callback=dr1004&login_method=1&user_account=$id&user_password=$password"
    Write-Output $response
}
