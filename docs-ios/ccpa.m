// save the user's consent
- (void)saveCCPAUsPrivacyString:(NSString *)usString
{
    if (usString.length > 0) {
        [NSUserDefaults.standardUserDefaults setObject:usString 
         forKey:@"IABUSPrivacy_String"];
    }
}
// call this function like this:
// [saveCCPAUsPrivacyString usString:@"1YNN"]; 