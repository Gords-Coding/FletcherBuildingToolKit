param([string]$paramInput)

Add-Type -assembly System.Windows.Forms


write-Output "Running with Input param: " $paramInput | Out-Default

#Creates Form
$main_form = New-Object System.Windows.Forms.Form
$main_form.Text = 'GUI for my PowerShell Script'
$main_form.Width = 600
$main_form.Height = 400
$main_form.AutoSize = $true

#Adds dropdown box
$ComboBox = New-Object System.Windows.Forms.ComboBox
$ComboBox.Width = 300
$ComboBox.Location  = New-Object System.Drawing.Point(5,($main_form.Height-10))
#Add content in Combo box
$ComboBox.text = $paramInput
$ComboBox.Items.Add("Ping");
$ComboBox.Items.Add("UserInformation");
$main_form.Controls.Add($ComboBox)


#Create button to execute command here!
$Button01 = New-Object System.Windows.Forms.Button
$Button01.Location = New-Object System.Drawing.Size(5,($main_form.Height-10))
$Button01.Text = "Submit"
$main_form.Controls.Add($Button01)

$Button01.Add_Click(
{
    echo $ComboBox.SelectedItem
    switch ($ComboBox.Text) {
        'Ping'{
            $main_form.Close()
            $main_form.Dispose()
            #C:\Users\gowan\Desktop\Programming\Experimenting\GUIforPowershell.ps1 "Ping"
            D:\Users\Gordon\Documents\GitHub\FletcherBuildingToolKit\GUIforPowershell.ps1 "Ping"
        }
        'UserInformation'{
            $main_form.Close()
            $main_form.Dispose()
            #C:\Users\gowan\Desktop\Programming\Experimenting\GUIforPowershell.ps1 "UserInformation"
            D:\Users\Gordon\Documents\GitHub\FletcherBuildingToolKit\GUIforPowershell.ps1 "UserInformation"
        }
        
    } 
}
)



#Adds label
$PingAssetNoLabel = New-Object System.Windows.Forms.Label
$PingAssetNoLabel.Text = "Asset No. : "
$PingAssetNoLabel.Location  = New-Object System.Drawing.Point(5,12)
$PingAssetNoLabel.AutoSize = $true


#Adds label
$PingAssetNumberTextbox = New-Object System.Windows.Forms.Textbox
$PingAssetNumberTextbox.Text = "FBPF18RA5C"
$PingAssetNumberTextbox.Location  = New-Object System.Drawing.Point(($Label.Width + 5),11)
$PingAssetNumberTextbox.AutoSize = $true


#Output label text and space for output
$PingOutputLabel = New-Object System.Windows.Forms.Label
$PingOutputLabel.Text = "Output : "
$PingOutputLabel.Location  = New-Object System.Drawing.Point(5,40)
$PingOutputLabel.AutoSize = $true

$PingOutputTextbox = New-Object System.Windows.Forms.Textbox
$PingOutputTextbox.Text = "Hello World!"
$PingOutputTextbox.Location  = New-Object System.Drawing.Point(115,40)
$PingOutputTextbox.Width = 300
$PingOutputTextbox.Height = 300
$PingOutputTextbox.AutoSize = $true
$PingOutputTextbox.Multiline = $true 

#Create button to execute command here!
$PingCheckButton = New-Object System.Windows.Forms.Button
$PingCheckButton.Location = New-Object System.Drawing.Size(($main_form.Width - 120),10)
$PingCheckButton.Size = New-Object System.Drawing.Size(120,23)
$PingCheckButton.Text = "Check"

$PingCheckButton.Add_Click(
{
    #$ExecutingCmd = Get-UserLogon -Computer $Textbox01.Text
    $PingOutputTextbox.Text = ping $PingAssetNumberTextbox.Text
}
)


#Adds label
$InfoUserNameLabel = New-Object System.Windows.Forms.Label
$InfoUserNameLabel.Text = "User's Name : "
$InfoUserNameLabel.Location  = New-Object System.Drawing.Point(5,12)
$InfoUserNameLabel.AutoSize = $true

#Adds label
$InfoUserNameTextbox = New-Object System.Windows.Forms.Textbox
$InfoUserNameTextbox.Text = "gorwan"
$InfoUserNameTextbox.Location  = New-Object System.Drawing.Point(($Label.Width + 5),11)
$InfoUserNameTextbox.AutoSize = $true

#Create button to execute command here!
$InfoExecuteButton = New-Object System.Windows.Forms.Button
$InfoExecuteButton.Location = New-Object System.Drawing.Size(($main_form.Width - 120),10)
$InfoExecuteButton.Size = New-Object System.Drawing.Size(120,23)
$InfoExecuteButton.Text = "Execute"

$InfoOutputTextbox = New-Object System.Windows.Forms.Textbox
$InfoOutputTextbox.Text = "Hello World!"
$InfoOutputTextbox.Location  = New-Object System.Drawing.Point(10,40)
$InfoOutputTextbox.Width = 500
$InfoOutputTextbox.Height = 300
$InfoOutputTextbox.AutoSize = $true
$InfoOutputTextbox.Multiline = $true 

$InfoExecuteButton.Add_Click(
{
    #$ExecutingCmd = Get-UserLogon -Computer $Textbox01.Text
    $InfoOutputTextbox.Text = get-aduser $InfoUserNameTextbox.Text
    <#
        get-aduser username -Properties * | Select-Object GivenName, Surname, SamAccountName, Manager, DisplayName, ` 
        City, EmailAddress, EmployeeID, Enabled, Department, OfficePhone, MobilePhone, LockedOut, LockOutTime, AccountExpirationDate, ` 
        PasswordExpired, PasswordLastSet, Title
    #>
}
)

function Open-PingWindow {
        $main_form.Controls.Add($PingAssetNoLabel)
        $main_form.Controls.Add($PingAssetNumberTextbox)
        $main_form.Controls.Add($PingOutputLabel)
        $main_form.Controls.Add($PingOutputTextbox)
        $main_form.Controls.Add($PingCheckButton)
}
function Open-UserInformationWindow {
    $main_form.Controls.Add($InfoUserNameLabel)
    $main_form.Controls.Add($InfoUserNameTextbox)
    $main_form.Controls.Add($InfoExecuteButton)
    $main_form.Controls.Add($InfoOutputTextbox)

}

switch ($paramInput) {
    'Ping' {
        Open-PingWindow
    }
    'UserInformation' {
        Open-UserInformationWindow
    }

}

$main_form.ShowDialog()
$main_form.Dispose()
