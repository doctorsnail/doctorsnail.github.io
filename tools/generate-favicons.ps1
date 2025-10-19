Add-Type -AssemblyName System.Drawing

$sourcePath = "..\assets\img\avatar.png"
$outputDir = "..\assets\img\favicons"

# 确保输出目录存在
if (-not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir
}

# 定义需要的尺寸
$sizes = @(
    @{name = "favicon-16x16.png"; size = 16},
    @{name = "favicon-32x32.png"; size = 32},
    @{name = "apple-touch-icon.png"; size = 180},
    @{name = "android-chrome-192x192.png"; size = 192},
    @{name = "android-chrome-512x512.png"; size = 512},
    @{name = "mstile-150x150.png"; size = 150}
)

try {
    $sourceImage = [System.Drawing.Image]::FromFile((Resolve-Path $sourcePath))
    
    foreach ($sizeConfig in $sizes) {
        $bitmap = New-Object System.Drawing.Bitmap($sizeConfig.size, $sizeConfig.size)
        $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
        
        # 设置高质量缩放
        $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
        $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
        
        # 绘制图像
        $graphics.DrawImage($sourceImage, 0, 0, $sizeConfig.size, $sizeConfig.size)
        
        # 保存图像
        $outputPath = Join-Path $outputDir $sizeConfig.name
        $bitmap.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)
        
        # 清理
        $graphics.Dispose()
        $bitmap.Dispose()
        
        Write-Host "Generated $($sizeConfig.name)"
    }
    
    # 生成 ICO 文件
    $icon32 = Join-Path $outputDir "favicon-32x32.png"
    $icoPath = Join-Path $outputDir "favicon.ico"
    # 使用 ImageMagick 如果可用，否则复制 32x32 版本
    if (Get-Command "magick" -ErrorAction SilentlyContinue) {
        magick convert $icon32 $icoPath
    } else {
        Copy-Item $icon32 $icoPath
    }
    
} finally {
    if ($sourceImage) { $sourceImage.Dispose() }
}

# 创建 browserconfig.xml
$browserconfigContent = @"
<?xml version="1.0" encoding="utf-8"?>
<browserconfig>
  <msapplication>
    <tile>
      <square150x150logo src="/assets/img/favicons/mstile-150x150.png" />
      <TileColor>#da532c</TileColor>
    </tile>
  </msapplication>
</browserconfig>
"@
Set-Content -Path (Join-Path $outputDir "browserconfig.xml") -Value $browserconfigContent

# 创建 site.webmanifest
$webmanifestContent = @"
{
  "name": "ComputingX",
  "short_name": "ComputingX",
  "description": "Something about Computing.",
  "icons": [
    {
      "src": "/assets/img/favicons/android-chrome-192x192.png",
      "sizes": "192x192",
      "type": "image/png"
    },
    {
      "src": "/assets/img/favicons/android-chrome-512x512.png",
      "sizes": "512x512",
      "type": "image/png"
    }
  ],
  "start_url": "/index.html",
  "theme_color": "#2a1e6b",
  "background_color": "#ffffff",
  "display": "fullscreen"
}
"@
Set-Content -Path (Join-Path $outputDir "site.webmanifest") -Value $webmanifestContent

Write-Host "All favicon files have been generated!"