Param(
    [string]$OutputPath = "assets/icons/notes_icon.png"
)

Add-Type -AssemblyName System.Drawing

$size = 512
New-Item -ItemType Directory -Force -Path (Split-Path $OutputPath) | Out-Null

$bmp = New-Object System.Drawing.Bitmap($size, $size)
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.SmoothingMode = 'HighQuality'

# Colors inspired by provided icon
$bgTop = [System.Drawing.Color]::FromArgb(0xFF, 0xEC, 0xF0, 0xF8)
$bgBottom = [System.Drawing.Color]::FromArgb(0xFF, 0xE4, 0xE7, 0xF2)
$lineColor = [System.Drawing.Color]::FromArgb(0xFF, 0x27, 0xC6, 0xFF)
$penBodyColor = [System.Drawing.Color]::FromArgb(0xFF, 0x1F, 0x26, 0x3D)
$penBandColor = [System.Drawing.Color]::FromArgb(0xFF, 0xE9, 0xEB, 0xF5)
$penTipColor = [System.Drawing.Color]::FromArgb(0xFF, 0x18, 0x4A, 0x80)

# Gradient background
$rect = New-Object System.Drawing.Rectangle(0, 0, $size, $size)
$lg = New-Object System.Drawing.Drawing2D.LinearGradientBrush($rect, $bgTop, $bgBottom, 90)
$g.FillRectangle($lg, $rect)

# Rounded square card
$cardRect = New-Object System.Drawing.Rectangle(56, 56, 400, 400)
$path = New-Object System.Drawing.Drawing2D.GraphicsPath
$radius = 80
$path.AddArc($cardRect.X, $cardRect.Y, $radius, $radius, 180, 90)
$path.AddArc($cardRect.Right - $radius, $cardRect.Y, $radius, $radius, 270, 90)
$path.AddArc($cardRect.Right - $radius, $cardRect.Bottom - $radius, $radius, $radius, 0, 90)
$path.AddArc($cardRect.X, $cardRect.Bottom - $radius, $radius, $radius, 90, 90)
$path.CloseFigure()
$cardBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(0xFF, 0xFB, 0xFB, 0xFD))
$shadowBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(40, 0, 0, 0))
$g.TranslateTransform(6, 10)
$g.FillPath($shadowBrush, $path)
$g.TranslateTransform(-6, -10)
$g.FillPath($cardBrush, $path)

# Lines on paper
$linePen = New-Object System.Drawing.Pen($lineColor, 22)
$linePen.StartCap = 'Round'
$linePen.EndCap = 'Round'
$lineY = 160
for ($i = 0; $i -lt 3; $i++) {
    $g.DrawLine($linePen, 150, $lineY + ($i * 70), 330, $lineY + ($i * 70))
}
# Signature squiggle
$g.DrawBezier($linePen, 150, 350, 190, 330, 230, 380, 270, 360)

# Pen body
$penPath = New-Object System.Drawing.Drawing2D.GraphicsPath
$penPath.AddLine(300, 170, 420, 110)
$penPath.AddLine(440, 150, 340, 210)
$penPath.CloseFigure()
$penBrush = New-Object System.Drawing.SolidBrush($penBodyColor)
$g.FillPath($penBrush, $penPath)

# Pen band
$bandPen = New-Object System.Drawing.Pen($penBandColor, 12)
$bandPen.StartCap = 'Round'
$bandPen.EndCap = 'Round'
$g.DrawLine($bandPen, 365, 138, 415, 115)

# Pen tip
$tipPath = New-Object System.Drawing.Drawing2D.GraphicsPath
$tipPath.AddPolygon(@(
    [System.Drawing.Point]::new(340, 210),
    [System.Drawing.Point]::new(360, 196),
    [System.Drawing.Point]::new(350, 220)
))
$tipBrush = New-Object System.Drawing.SolidBrush($penTipColor)
$g.FillPath($tipBrush, $tipPath)

$bmp.Save($OutputPath, [System.Drawing.Imaging.ImageFormat]::Png)
$g.Dispose()
$bmp.Dispose()

Write-Host "Icon generated at $OutputPath"

