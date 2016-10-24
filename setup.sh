#!/usr/bin/env bash

#Mising: Safari, Finder Window, Terminal
##Safari is way too complicated. So is finder window. Terminal is easier to import as a file.

#General
defaults write -g AppleAquaColorVariant -int 6; #Graphite colors
defaults write /Library/Preferences/.GlobalPreferences AppleLocale "en_MX@currency=USD"; #Correct locale
defaults write ~/Library/Preferences/.GlobalPreferences AppleLocale "en_MX@currency=USD";
defaults write ~/Library/Preferences/.GlobalPreferences AppleFirstWeekday "{gregorian=2;}"; #Set week start
defaults write ~/Library/Preferences/.GlobalPreferences AppleHighlightColor "1.000000 0.493272 0.473998"; #Set highlight
defaults write com.apple.systempreferences AppleOtherHighlightColor "1.000000 0.493272 0.473998";
defaults write ~/Library/Preferences/.GlobalPreferences AppleICUDateFormatStrings '{3 = "MMMM dd, y";}'; #Set date fmt
defaults write ~/Library/Preferences/.GlobalPreferences AppleICUForce24HourTime -bool YES; #Set 24 hr time
defaults write ~/Library/Preferences/.GlobalPreferences AppleLanguages "(en, es)"; #Set languages
defaults write ~/Library/Preferences/.GlobalPreferences AppleMeasurementUnits Centimeters; #Set units
defaults write ~/Library/Preferences/.GlobalPreferences AppleMetricUnits -bool YES; #Set metric
defaults write ~/Library/Preferences/.GlobalPreferences AppleMiniaturizeOnDoubleClick -bool NO;
defaults write ~/Library/Preferences/.GlobalPreferences NSPreferredWebServices '{
  NSWebServicesProviderWebSearch = {
    NSDefaultDisplayName = Google;
    NSProviderIdentifier = "com.google.www";
    };
  }'; #Set Google as search
defaults write ~/Library/Preferences/.GlobalPreferences NSRecentDocumentsLimit -int 5; #Limit recents
defaults write com.apple.menuextra.battery ShowPercent "YES";
defaults write com.apple.menuextra.clock '{
    DateFormat = "EEE HH:mm";
    FlashDateSeparators = 0;
    IsAnalog = 0;
}';


#Mice preferences
defaults write ~/Library/Preferences/.GlobalPreferences "com.apple.mouse.scaling" -int 3;
defaults write ~/Library/Preferences/.GlobalPreferences "com.apple.trackpad.scaling" -int 3;
defaults write com.apple.AppleMultitouchTrackpad ActuateDetents -bool YES;
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool YES;
defaults write com.apple.AppleMultitouchTrackpad DragLock -bool NO;
defaults write com.apple.AppleMultitouchTrackpad Dragging -bool NO;
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -bool YES;
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -bool YES;
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -bool NO;
defaults write com.apple.AppleMultitouchTrackpad TrackpadFiveFingerPinchGesture -int 2;
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerHorizSwipeGesture -int 2;
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerPinchGesture -int 2;
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 2;
defaults write com.apple.AppleMultitouchTrackpad TrackpadHandResting -bool YES;
defaults write com.apple.AppleMultitouchTrackpad TrackpadHorizScroll -bool YES;
defaults write com.apple.AppleMultitouchTrackpad TrackpadMomentumScroll -bool YES;
defaults write com.apple.AppleMultitouchTrackpad TrackpadPinch -bool YES;
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool YES;
defaults write com.apple.AppleMultitouchTrackpad TrackpadRotate -bool YES;
defaults write com.apple.AppleMultitouchTrackpad TrackpadScroll -bool YES;
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool YES;
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -bool NO;
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 2;
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -bool NO;
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerDoubleTapGesture -bool YES;
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 3;

#Spotlight
defaults write com.apple.Spotlight orderedItems '
  ({ enabled = 1; name = APPLICATIONS;},
  { enabled = 0; name = "MENU_SPOTLIGHT_SUGGESTIONS";},
  { enabled = 1; name = "MENU_CONVERSION";},
  { enabled = 1; name = "MENU_EXPRESSION";},
  { enabled = 0; name = "MENU_DEFINITION";},
  { enabled = 1; name = "SYSTEM_PREFS";},
  { enabled = 1; name = DOCUMENTS;},
  { enabled = 1; name = DIRECTORIES;},
  { enabled = 1; name = PRESENTATIONS;},
  { enabled = 1; name = SPREADSHEETS;},
  { enabled = 1; name = PDF;},
  { enabled = 0; name = MESSAGES;},
  { enabled = 0; name = CONTACT;},
  { enabled = 0; name = "EVENT_TODO";},
  { enabled = 1; name = IMAGES;},
  { enabled = 0; name = BOOKMARKS;},
  { enabled = 0; name = MUSIC;},
  { enabled = 1; name = MOVIES;},
  { enabled = 1; name = FONTS;},
  { enabled = 1; name = "MENU_OTHER";},
  { enabled = 0; name = "MENU_WEBSEARCH";})';

#Desktop
defaults write com.apple.finder DesktopViewSettings '{
  IconViewSettings = {
    arrangeBy = name;
    backgroundColorBlue = 1;
    backgroundColorGreen = 1;
    backgroundColorRed = 1;
    backgroundType = 0;
    gridOffsetX = 0;
    gridOffsetY = 0;
    gridSpacing = 36;
    iconSize = 60;
    labelOnBottom = 1;
    showIconPreview = 1;
    showItemInfo = 0;
    textSize = 11;
    viewOptionsVersion = 1;
  };
}';
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool YES;
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool YES;

#Dock
defaults write com.apple.dock largesize -int 55;
defaults write com.apple.dock magnification -bool YES;
defaults write com.apple.dock orientation -string bottom;
defaults write com.apple.dock tilesize -int 33;
defaults write com.apple.dock persistent-apps -array;

#Reset
killall Dock 2>/dev/null;
killall Finder 2>/dev/null;

# https://github.com/timsutton/osx-vm-templates/blob/ce8df8a7468faa7c5312444ece1b977c1b2f77a4/scripts/xcode-cli-tools.sh
touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
PROD=$(softwareupdate -l |
  grep "\*.*Command Line" |
  head -n 1 | awk -F"*" '{print $2}' |
  sed -e 's/^ *//' |
  tr -d '\n')
softwareupdate -i "$PROD" -v;

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";

brew install \
  zsh \
  sl \
  cloc \
  thefuck \
  tmux \
  tree \
  wget \
  zsh-completions \
;

brew cask install \
  imageoptim \
  eclipse-java \
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
  flux \
  transmission \
  typora \
;

apm install activate-power-mode chester-atom-syntax atom-handlebars;

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";

#Git
git config --global core.editor "atom --wait";
git config --global user.name "Salomon Smeke";
git config --global user.email "ssmeke@luc.edu";
git config --global push.default simple;

#Atom settings
cp './config/atom.config.cson' ~/.atom/;

#zshrc
cp './dotfiles/.zshrc' ~;

#App Store Apps: The Unarchiver Byword... maybe
