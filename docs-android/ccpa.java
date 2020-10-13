import android.content.SharedPreferences;
import android.preference.PreferenceManager;

...
// save the user's consent
SharedPreferences sharedPref = PreferenceManager.getDefaultSharedPreferences(context_here);
SharedPreferences.Editor editor = sharedPref.edit();
editor.putString("IABUSPrivacy_String", "1YNN"); // for example "1YNN"
editor.commit();
