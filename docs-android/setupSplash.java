public class SplashAdActivity extends SmaatoSplashActivity {
 
    @NonNull
    @Override
    protected String getAdSpaceId() {
        return "130626426";
    }
 
    @NonNull
    @Override
    protected Class<? extends Activity> getNextActivity() {
        return MainActivity.class;
    }
 
}
