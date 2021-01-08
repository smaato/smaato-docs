public class SplashAdActivity extends SmaatoSplashActivity {
 
    class MyEventListener extends EventListener {
        ...
    }
 
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
 
    @Override
    protected EventListener getEventListener() {
        return new MyEventListener();
    }
}
