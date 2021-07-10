# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

def dev_frameworks
  pod 'uicomponents', :path => '../UIComponents'
end

def test_frameworks
  pod 'uicomponents', :path => '../UIComponents'
end


target 'BCGMusicPLayyer' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  dev_frameworks

  target 'BCGMusicPLayyerTests' do
    inherit! :search_paths
    test_frameworks
  end
  
end
