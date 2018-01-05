var fs = require('fs');

var podExtraSettings = `
use_frameworks!

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '4.0'
    end
  end
end
`;

fs.appendFile('platforms/ios/Podfile', podExtraSettings, function (err, data) {
  
    console.log('ios_pod_extra_settings no error');
    if (err) {
    console.log('ios_pod_extra_settings' , err);
    process.exit(1);
  }
});
