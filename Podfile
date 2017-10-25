workspace 'Roadblock.xcworkspace'

## Frameworks targets
abstract_target 'Frameworks' do
	use_frameworks!

	pod 'LocalizationToolkit', '~> 1.0'

	target 'Roadblock-iOS' do
		platform :ios, '8.0'
	end

	target 'Roadblock-tvOS' do
		platform :tvos, '9.0'
	end
end

## Tests targets
abstract_target 'Tests' do
	use_frameworks!

	pod 'LocalizationToolkit', '~> 1.0'

	target 'RoadblockTests-iOS' do
		platform :ios, '8.0'
	end

	target 'RoadblockTests-tvOS' do
		platform :tvos, '9.0'
	end
end

## Samples targets
abstract_target 'Samples' do
	use_frameworks!

	pod 'LocalizationToolkit', '~> 1.0'

	target 'RoadblockSample-iOS' do
		project 'Samples/RoadblockSample-iOS/RoadblockSample-iOS'
		platform :ios, '8.0'
	end

	target 'RoadblockSample-tvOS' do
		project 'Samples/RoadblockSample-tvOS/RoadblockSample-tvOS'
		platform :tvos, '9.0'
	end
end
