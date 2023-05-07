if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_user_key_bindings
end

if status --is-login
    set -gx EDITOR nvim
    set -gx ANDROID_HOME "$HOME/Android/Sdk"
    set -gx NDK_HOME "$ANDROID_HOME/ndk/25.0.8775105"
end

function fish_user_key_bindings
    bind --mode insert \ca beginning-of-line
    bind --mode insert \ce end-of-line
end

