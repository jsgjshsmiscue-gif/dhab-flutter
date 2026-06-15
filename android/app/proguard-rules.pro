# Flutter Wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Firebase
-keep class com.firebase.** { *; }
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.** { *; }

# Firestore
-keep class com.google.firestore.** { *; }
-keep class com.google.cloud.firestore.** { *; }

# Gson
-keep class com.google.gson.** { *; }
-keepclassmembers class ** {
    @com.google.gson.annotations.SerializedName <fields>;
}

# Keep enums
-keepclassmembers enum ** {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# Keep custom application classes
-keep class com.materelectric.dhab.** { *; }
