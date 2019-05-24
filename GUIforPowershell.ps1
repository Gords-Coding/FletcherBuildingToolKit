param([string]$paramInput)

Add-Type -assembly System.Windows.Forms


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
$ComboBox.Items.Add("Ping");
$ComboBox.Items.Add("User Information");
$ComboBox.text = $paramInput

$main_form.Controls.Add($ComboBox)

#Create button to execute command here!
$Button01 = New-Object System.Windows.Forms.Button
$Button01.Location = New-Object System.Drawing.Size(5,($main_form.Height-10))
$Button01.Text = "Submit"
$main_form.Controls.Add($Button01)

$Button01.Add_Click(
{
    echo $ComboBox.SelectedItem
    if ($ComboBox.Text -eq "Ping") {
        $main_form.Close()
        $main_form.Dispose()
        C:\Users\gowan\Desktop\Programming\Experimenting\GUIforPowershell.ps1 "Ping"
        #Do this
        openPingWindow
        #>
        
    } else {
        #Do this - Try restart program

    }
}
)



#Adds label
$Label = New-Object System.Windows.Forms.Label
$Label.Text = "Username : "
$Label.Location  = New-Object System.Drawing.Point(5,12)
$Label.AutoSize = $true
#$main_form.Controls.Add($Label)

#Adds label
$Textbox01 = New-Object System.Windows.Forms.Textbox
$Textbox01.Text = "FBPF18RA5C"
$Textbox01.Location  = New-Object System.Drawing.Point(($Label.Width + 5),11)
$Textbox01.AutoSize = $true
#$main_form.Controls.Add($Textbox01)


#Output label text and space for output
$Label2 = New-Object System.Windows.Forms.Label
$Label2.Text = "Output : "
$Label2.Location  = New-Object System.Drawing.Point(5,40)
$Label2.AutoSize = $true
#$main_form.Controls.Add($Label2)

$Textbox02 = New-Object System.Windows.Forms.Textbox
$Textbox02.Text = "Hello World!"
$Textbox02.Location  = New-Object System.Drawing.Point(115,40)
$Textbox02.Width = 300
$Textbox02.Height = 300
$Textbox02.AutoSize = $true
$Textbox02.Multiline = $true 
#$main_form.Controls.Add($Textbox02)

#Create button to execute command here!
$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(($main_form.Width - 120),10)
$Button.Size = New-Object System.Drawing.Size(120,23)
$Button.Text = "Check"
#$main_form.Controls.Add($Button)

$Button.Add_Click(
{
    #$ExecutingCmd = Get-UserLogon -Computer $Textbox01.Text
    $Textbox02.Text = ping $Textbox01.Text
}
)

<#
$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(($main_form.Width - 120),10)
$Button.Size = New-Object System.Drawing.Size(120,23)
$Button.Text = "Check"
$main_form.Controls.Add($Button)

$Button.Add_Click(
{
$Label3.Text =  [datetime]::FromFileTime((Get-ADUser -identity $ComboBox.selectedItem -Properties pwdLastSet).pwdLastSet).ToString('MM dd yy : hh ss')
}
)
#>

function openPingWindow {
        echo hi
        $main_form.Controls.Add($Label)
        $main_form.Controls.Add($Textbox01)
        $main_form.Controls.Add($Label2)
        $main_form.Controls.Add($Textbox02)
        $main_form.Controls.Add($Button)
}


$main_form.ShowDialog()
$main_form.Dispose()
