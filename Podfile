platform :ios, '13.0'

def networking
    pod 'Alamofire'
    pod 'SwiftyJSON'
    pod 'Kingfisher'
    pod 'SVGKit'
    pod 'PromiseKit'
    pod 'PromiseKit/CoreLocation'
    pod 'ReachabilitySwift'
end

def uiLibraries
    pod 'IQKeyboardManagerSwift'
    pod 'DZNEmptyDataSet'
    pod 'JSQMessagesViewController'
    pod 'SpreadsheetView'
end

def analytics
    pod 'SwiftLint'
    pod 'Branch'
end

target 'pokemonLeslieYaneth' do
  use_frameworks!
  inhibit_all_warnings!

  # Pods for pokemonLeslieYaneth
  networking
  uiLibraries
  analytics
  pod 'RxCocoa'
  pod 'Disk'
  pod 'Siren'
  pod 'Presentr'
  pod 'AccountKit'
end

project 'pokemonLeslieYaneth', {
    'Debug Beta' => :debug,
    'Debug Prod' => :debug,
    'Release' => :release,
}
