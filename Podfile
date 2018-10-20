# Uncomment the next line to define a global platform for your project
 platform :ios, '11.0'

target 'TylerQuickMedia' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for TylerQuickMedia
  pod 'SwiftLint', '~> 0.27'
  pod 'SwiftGen', '~> 5.3.0'
  pod 'ReactorKit', '~> 1.2.0'
  pod 'Then', '~> 2.4.0'
  # Pods for ShowMap
  def testing_pods
    pod 'Quick', '~> 1.3'
    pod 'Nimble', '~> 7.3'
  end
  target 'TylerQuickMediaTests' do
    inherit! :search_paths
    testing_pods
  end

  target 'TylerQuickMediaUITests' do
    inherit! :search_paths
    testing_pods
  end

end
