Map<String, String> smaatoAdapterConfiguration = new HashMap<>();
smaatoAdapterConfiguration.put(SmaatoAdapterConfiguration.KEY_ENABLE_LOGGING, String.valueOf(true));
smaatoAdapterConfiguration.put(SmaatoAdapterConfiguration.KEY_HTTPS_ONLY, String.valueOf(true));
smaatoAdapterConfiguration.put(SmaatoAdapterConfiguration.KEY_LOG_LEVEL, String.valueOf(LogLevel.DEBUG));
smaatoAdapterConfiguration.put(SmaatoAdapterConfiguration.KEY_MAX_AD_CONTENT_RATING, String.valueOf(AdContentRating.MAX_AD_CONTENT_RATING_UNDEFINED));
smaatoAdapterConfiguration.put(SmaatoAdapterConfiguration.KEY_PUBLISHER_ID, "SMAATO_PUBLISHER_ID");
 
SdkConfiguration sdkConfiguration = new SdkConfiguration.Builder("MOPUB_AD_UNIT_ID")
        .withLogLevel(MoPubLog.LogLevel.DEBUG)
        .withAdditionalNetwork(SmaatoAdapterConfiguration.class.getName())
        .withMediatedNetworkConfiguration(SmaatoAdapterConfiguration.class.getName(), smaatoAdapterConfiguration)
        .build();
MoPub.initializeSdk(this, sdkConfiguration, () -> {
    SmaatoSdk.setGPSEnabled(true);
    SmaatoSdk.setGender(Gender.FEMALE);
    SmaatoSdk.setAge(30);
    SmaatoSdk.setKeywords("yoga, vegan, san+francisco");
});
