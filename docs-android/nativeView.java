import com.smaato.sdk.nativead.NativeAdView;

class SmaatoNativeAdView implements NativeAdView {
 
    private final View binding;
 
    SmaatoNativeAdView(View binding) {
        this.binding = binding;
    }
 
    @Nullable
    @Override
    public TextView titleView() {
        return binding.findViewById(R.id.title);
    }
 
    @Nullable
    @Override
    public TextView textView() {
        return binding.findViewById(R.id.text);
    }
 
    @Nullable
    @Override
    public TextView sponsoredView() {
        // Return null if you don't have this kind of view
        return null;
    }
 
    @Nullable
    @Override
    public TextView ctaView() {
        return binding.findViewById(R.id.cta);
    }
 
    @Nullable
    @Override
    public View iconView() {
        return binding.findViewById(R.id.icon);
    }
 
    @Nullable
    @Override
    public View mediaView() {
        return binding.findViewById(R.id.media);
    }
 
    @Nullable
    @Override
    public View ratingView() {
        return binding.findViewById(R.id.rating);
    }
 
    @Nullable
    @Override
    public View privacyView() {
        return binding.findViewById(R.id.privacy);
    }
 
}
