#Like setup, but without so much fnaggling. Mostly settings I might forget about.

sudo pmset -a sms 0;
sudo nvram SystemAudioVolume=" ";
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false;
defaults write -g AppleAquaColorVariant -int 6;
defaults write ~/Library/Preferences/.GlobalPreferences AppleLocale "en_MX@currency=USD";
defaults write ~/Library/Preferences/.GlobalPreferences AppleFirstWeekday "{gregorian=2;}";
defaults write ~/Library/Preferences/.GlobalPreferences AppleHighlightColor "1.000000 0.493272 0.473998";
defaults write com.apple.systempreferences AppleOtherHighlightColor "1.000000 0.493272 0.473998";
defaults write ~/Library/Preferences/.GlobalPreferences AppleICUDateFormatStrings '{3 = "MMMM dd, y";}';
defaults write ~/Library/Preferences/.GlobalPreferences AppleICUForce24HourTime -bool YES;
defaults write ~/Library/Preferences/.GlobalPreferences AppleMeasurementUnits Centimeters; #Set units
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
}';
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1;
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1;
defaults write ~/Library/Preferences/.GlobalPreferences "com.apple.mouse.scaling" -int 3;
defaults write ~/Library/Preferences/.GlobalPreferences "com.apple.trackpad.scaling" -int 3;
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool YES;
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool YES;
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool YES;
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf";
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true;
defaults write com.apple.Safari IncludeDevelopMenu -bool true;
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true;
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true;
hash tmutil &> /dev/null && sudo tmutil disablelocal;
defaults write com.apple.dock largesize -int 55;
defaults write com.apple.dock magnification -bool YES;
defaults write com.apple.dock orientation -string bottom;
defaults write com.apple.dock tilesize -int 33;
defaults write com.apple.dock persistent-apps -array;
killall Dock 2>/dev/null;
killall Finder 2>/dev/null;
killall Safari 2>/dev/null;
killall mds > /dev/null 2>&1;
sudo mdutil -i on / > /dev/null;
sudo mdutil -E / > /dev/null;
touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
PROD=$(softwareupdate -l |
  grep "\*.*Command Line" |
  head -n 1 | awk -F"*" '{print $2}' |
  sed -e 's/^ *//' |
  tr -d '\n')
softwareupdate -i "$PROD";
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
apm install activate-power-mode chester-atom-syntax atom-handlebars atom-material-syntax autocomplete-json autocomplete-modules busy-signal intentions linter linter-coffeelint linter-csslint linter-eslint linter-markdown linter-pylint linter-tidy linter-ui-default;
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
git config --global core.editor "atom --wait";
git config --global user.name "Salomon Smeke";
git config --global user.email "ssmeke@luc.edu";
git config --global push.default simple;
path_to_atom=$(pwd)'/config/atom.config.cson';
path_to_zshrc=$(pwd)'/dotfiles/.zshrc';
ln -s $path_to_atom ~/.atom;
ln -s $path_to_zshrc ~;
echo "Cheers off you go."
