import android.content.SharedPreferences;
import android.preference.PreferenceManager;

...
// User is not subject to GDPR
SharedPreferences sharedPref = PreferenceManager.getDefaultSharedPreferences(context)
SharedPreferences.Editor editor = sharedPref.edit();
editor.putString("IABConsent_SubjectToGDPR", "0");
editor.commit();
// Use this example above to set values for the rest of the GDPR keys