#Like setup, but without so much fnaggling. Mostly settings I might forget about.

sudo pmset -a sms 0; #Disable head parking for HDD.
sudo nvram SystemAudioVolume=" "; #Mute on boot.
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false; #Fuck iCloud
defaults write -g AppleAquaColorVariant -int 6; #Set UI colors to gray.
defaults write ~/Library/Preferences/.GlobalPreferences AppleFirstWeekday "{gregorian=2;}"; #Monday is the first day of the week.
defaults write ~/Library/Preferences/.GlobalPreferences AppleHighlightColor "1.000000 0.493272 0.473998"; #Highlights
defaults write com.apple.systempreferences AppleOtherHighlightColor "1.000000 0.493272 0.473998"; #Unfocused highlights.
defaults write ~/Library/Preferences/.GlobalPreferences AppleICUDateFormatStrings '{3 = "MMMM dd, y";}'; #Format dates.
defaults write ~/Library/Preferences/.GlobalPreferences AppleICUForce24HourTime -bool YES; #24 hour time.
defaults write ~/Library/Preferences/.GlobalPreferences AppleMeasurementUnits Centimeters; #Set units to cm.
defaults write ~/Library/Preferences/.GlobalPreferences AppleMetricUnits -bool YES; #Set metric
defaults write ~/Library/Preferences/.GlobalPreferences NSPreferredWebServices '{
  NSWebServicesProviderWebSearch = {
    NSDefaultDisplayName = Google;
    NSProviderIdentifier = "com.google.www";
    };
  }'; #Set Google as search
defaults write com.apple.menuextra.clock '{
    DateFormat = "EEE HH:mm";
    FlashDateSeparators = 0;
    IsAnalog = 0;
}'; #Set clock to be nais.
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1; #Click to tap for current user.
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1; #Click to tap globally.
defaults write ~/Library/Preferences/.GlobalPreferences "com.apple.mouse.scaling" -int 3; #Fast mouse.
defaults write ~/Library/Preferences/.GlobalPreferences "com.apple.trackpad.scaling" -int 3; #Fast trackpad.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool YES; #Shows external drives on desktop.
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool YES; #Shows internal hard drives on desktop.
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool YES; #Show removable media on desktop.
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"; #Search works in the current directory, gawd dang.
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true; #Debug in safari.
defaults write com.apple.Safari IncludeDevelopMenu -bool true; #Debug in safari.
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true; #Debug in safari.
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true; #Debug in safari.
defaults write com.apple.dock largesize -int 55; #Set dock size.
defaults write com.apple.dock magnification -bool YES; #Set dock magnification.
defaults write com.apple.dock orientation -string bottom; #Put dock in bottom.
defaults write com.apple.dock tilesize -int 33; #Set dock tile size.
defaults write com.apple.dock persistent-apps -array; #Clear dock.

#Restart all relevant system apps.
killall Dock 2>/dev/null;
killall Finder 2>/dev/null;
killall Safari 2>/dev/null;
killall mds > /dev/null 2>&1;

sudo mdutil -i on / > /dev/null; #Index is on.
sudo mdutil -E / > /dev/null; #Reindex.

#Install brew and relevant packages.
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
brew install \
  zsh \
  sl \
  thefuck \
  tmux \
  tree \
  wget \
;
brew cask install \
  imageoptim \
  firefox \
  skype \
  atom \
  vlc \
  disk-inventory-x \
  ccleaner \
  onyx \
  slack \
  sourcetree \
  steam \
  transmission \
;

#Install atom packages.
apm install activate-power-mode chester-atom-syntax atom-handlebars atom-material-syntax autocomplete-json autocomplete-modules busy-signal intentions linter linter-coffeelint linter-csslint linter-eslint linter-markdown linter-pylint linter-tidy linter-ui-default;

#Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";

#Configure Git.
git config --global core.editor "atom --wait";
git config --global user.name "Salomon Smeke";
git config --global user.email "ssmeke@luc.edu";
git config --global push.default simple;

#Symlink dotfiles.
path_to_atom=$(pwd)'/config/atom.config.cson';
path_to_zshrc=$(pwd)'/dotfiles/.zshrc';
ln -s $path_to_atom ~/.atom/config.cson;
ln -s $path_to_zshrc ~;

#Bye
echo "Cheers off you go."
