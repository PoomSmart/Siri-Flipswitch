#import <Flipswitch/FSSwitchDataSource.h>
#import <Flipswitch/FSSwitchPanel.h>

@interface SiriToggleSwitch : NSObject <FSSwitchDataSource>
@end

@interface AFPreferences : NSObject
+ (AFPreferences *)sharedPreferences;
- (void)_setAssistantIsEnabledLocal:(BOOL)enabled;
- (BOOL)assistantIsEnabled;
- (void)setAssistantIsEnabled:(BOOL)enabled;
- (void)synchronize;
@end

@implementation SiriToggleSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
	return [[AFPreferences sharedPreferences] assistantIsEnabled] ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
	if (newState == FSSwitchStateIndeterminate)
		return;
	[[AFPreferences sharedPreferences] setAssistantIsEnabled:newState == FSSwitchStateOn];
	[[AFPreferences sharedPreferences] _setAssistantIsEnabledLocal:newState == FSSwitchStateOn];
	[[AFPreferences sharedPreferences] synchronize];
}

@end