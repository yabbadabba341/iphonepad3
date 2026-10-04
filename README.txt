THE FORGE  |  Copyright (c) 2026 Yannie D. Forest. All rights reserved.
NO LICENCE IS GRANTED. No copying, adaptation, redistribution, reverse
engineering or commercial use without the author's written permission.
See LICENCE.txt. Every distributed copy carries a build marker.
--------------------------------------------------------------------------

THE FORGE FOR IPHONE AND IPAD
=============================

Build 624 (9s56), 2026-10-04. Made by The Forge, 4 October 2026.

Apple's rules, prices and the third party tools named below change from
time to time. Where a fact may have changed, this guide says so. Please
check those points on the official pages.

WHAT IS IN THIS PACKAGE
  READ ME FIRST.txt               This guide.
  Home Screen app/                Way A, ready to put online (index.html is
                                  the whole of The Forge).
  iPhone and iPad project/        Ways B to D: the app project GitHub turns
                                  into TheForge.ipa.
  GITHUB_WORKFLOW_paste_this.txt  The build recipe, as a visible file you can
                                  copy from (section 3, Step 3).
  LICENCE.txt


1. WHAT APPLE ALLOWS, PLAINLY
-----------------------------

An iPhone or iPad will only open a real app if the app carries a valid
signature from Apple's system. There is no iPhone or iPad equivalent of
the Fire tablet's APK, which you copy over and keep forever. This is
Apple's rule; no package, from anyone, can switch it off. That leaves
four honest ways:

  WAY A. HOME SCREEN APP
    Cost: free.  Lasts: until you remove it.  Needs the internet ONCE.
    Its own icon, full screen with no Safari bars, runs offline, keeps
    your work. Works on any iPhone or iPad with a recent iOS.

  WAY B. REAL APP, PAID APPLE DEVELOPER ACCOUNT, INSTALLED BY USB
    Apple charges about 99 US dollars a year (check the current price for
    your country). Lasts one year; then a two minute reinstall by USB
    keeps your work and runs another year. Uses the free tool Sideloadly.

  WAY C. REAL APP WITH TROLLSTORE
    Free and permanent, but ONLY on certain older iOS versions (section 5).

  WAY D. REAL APP, FREE APPLE ID, INSTALLED BY USB
    Free, but it lasts SEVEN DAYS; then it will not open until you
    reinstall it by USB. Your work is kept inside it meanwhile.

WHICH ONE?
  - Free and permanent on any iPhone or iPad: WAY A.
  - A real app installed by cable, and paying Apple each year is
    acceptable: WAY B.
  - Look up your iOS version first (Settings, General, About). If it is
    in TrollStore's list, WAY C is free and permanent.


2. WAY A: THE HOME SCREEN APP (free, permanent)
-----------------------------------------------

The folder "Home Screen app" is The Forge ready to be put online.
Safari installs it from a web address once, stores the whole app on the
iPhone or iPad, and from then on opens it with no internet.

Step 1. Put the folder online (once). The simplest free way:
  a. On your computer open app.netlify.com/drop in a web browser.
  b. Create a free Netlify account when asked. Without an account the
     site may be removed after a short time. Please check Netlify's
     current terms.
  c. Drag the whole "Home Screen app" folder onto the page.
  d. Netlify gives you an address ending in .netlify.app. Write it down.
  An alternative is GitHub Pages; on a free GitHub plan it needs a PUBLIC
  repository. Please check GitHub's current rules.

  PLEASE READ: the address is public. It has a random name and is not
  listed anywhere, but anyone who learns it can open The Forge. Your own
  work is NOT on the server: it is stored only on your iPhone or iPad.
  The included robots.txt asks search engines and AI crawlers to stay
  away; it cannot force them.

Step 2. On the iPhone or iPad open SAFARI (it must be Safari) and go to
  the address from Step 1. The Forge opens.

Step 3. Tap the Share button (a square with an arrow pointing up). On
  iPhone it is at the bottom of the screen; on iPad, near the top right.
  If you cannot see it, tap the three dots first. Choose "Add to Home
  Screen". If "Open as Web App" is shown, leave it on. Tap "Add".

Step 4. Open The Forge FROM THE NEW ICON, while still online, and leave
  it open for about one minute while it stores itself on the device.

Step 5. Test it. Turn on Airplane Mode, close The Forge completely (swipe
  it away in the app switcher), and open it again from its icon. It
  opens. From now on it needs no internet at all.

YOUR WORK
  It is stored inside the Home Screen app on this device, separate from
  Safari: clearing Safari's history does not touch it. Removing the icon
  DOES delete it. In 2020 Apple's WebKit team wrote that Home Screen web
  apps are not subject to Safari's rule that deletes website data after
  seven days without use. I cannot promise Apple will never change this,
  so export a backup from The Forge from time to time.

UPDATING
  When there is a new the_forge.html: copy it into the "Home Screen app"
  folder, rename it index.html (replacing the old one), and drag the
  folder onto your Netlify site's "Deploys" page again. The next time
  The Forge opens while online, it picks up the new version by itself.
  Your work is kept. Keep the site online: if iOS ever clears the app's
  stored files (it can when the device is almost full), the site is how
  the app is restored.


3. GETTING THE REAL APP FILE (TheForge.ipa) FROM GITHUB
-------------------------------------------------------

WAYS B, C and D all install one file, TheForge.ipa. The same file works on
iPhone and iPad. GitHub builds it on its own Mac computers, so you need
no Mac and no Xcode of your own.

Step 1. Make a repository.
  Sign in at github.com. Click "+" at the top right, then "New
  repository". Name it, for example the-forge-ios. Choose Private.
  Do NOT tick "Add a README file". Click "Create repository".

Step 2. Upload the project.
  Click "uploading an existing file". Open the folder "iPhone and iPad
  project" in this package, select EVERYTHING INSIDE IT, and drag it
  onto the page. You should see TheForge.xcodeproj and a folder
  TheForge in the list. Wait for every file, then click "Commit
  changes".

Step 3. Add the build recipe by hand. THIS STEP MATTERS.
  The recipe lives in a folder called .github, and a Mac hides every
  name that starts with a full stop, so it is usually left behind.
    a. Click "Add file", then "Create new file".
    b. In the name box type exactly:
           .github/workflows/build-ipa.yml
    c. Open GITHUB_WORKFLOW_paste_this.txt from this package, copy all of
       it, and paste it into the large box.
    d. Click "Commit changes", then "Commit changes" again.
  If GitHub says the file already exists, it uploaded in Step 2. Fine.

Step 4. Click the "Actions" tab. "Build The Forge for iPhone and iPad"
  runs for about five to fifteen minutes. A green tick means it worked.
  It also opens the app in Apple's iPad and iPhone simulators and keeps
  photographs under "Artifacts" (simulator-photographs).

Step 5. On the repository's main page click "Releases", then
  "The Forge for iPhone and iPad", and download TheForge.ipa to your
  Mac or PC.

COST OF BUILDING: for a private repository, GitHub counts each minute on
its Mac computers as ten minutes of your monthly free allowance, so one
build may use roughly 50 to 150 minutes of it. Please check GitHub's
current figures on its billing pages.


4. WAY B: REAL APP BY USB, PAID APPLE DEVELOPER ACCOUNT
-------------------------------------------------------

Step 1. Join the Apple Developer Program with your Apple ID, at
  developer.apple.com/programs. Please check the current price and terms.
  Approval can take a day or two.

Step 2. Download Sideloadly from its official site, sideloadly.io, and
  install it on your Mac or Windows PC. Please check on that site that it
  supports your computer's system version.

Step 3. Connect the iPhone or iPad to the computer with its USB cable.
  Unlock it. If it asks "Trust This Computer?", tap Trust.

Step 4. Open Sideloadly. Drag TheForge.ipa onto it. Type the Apple ID that
  is in the Developer Program. Click Start. Type your Apple ID password
  and the code Apple sends you if asked. Leave Sideloadly's advanced
  options as they are. In particular, do not let it change the app's
  bundle ID: a changed ID makes a new, empty app instead of updating
  yours. (This app's bundle ID is com.yannieforest.theforge.)

Step 5. Only once, on iOS 16 or later: open Settings, then Privacy &
  Security, then Developer Mode. Turn it on. The device restarts and asks
  you to confirm. If there is no Developer Mode entry, or the app opens
  without it, skip this step.

Step 6. Open The Forge from the Home Screen.

EVERY YEAR: when the year is up the app stops opening. Your work is still
inside it. Repeat Steps 3 and 4 with the same Apple ID and the same (or a
newer) TheForge.ipa; it installs over the top and opens again, with your
work, for another year.


5. WAY C: TROLLSTORE (free and permanent, older iOS only)
--------------------------------------------------------

TrollStore is a free tool that installs apps permanently on certain iOS
versions, by using a flaw that Apple has since closed. Apple does not
support it.

Step 1. On the device: Settings, General, About. Note the iOS version.
Step 2. Compare it with the list on TrollStore's official page:
  github.com/opa334/TrollStore
  As far as I know, the supported versions are iOS 14.0 beta 2 to 16.6.1,
  iOS 16.7 RC (build 20H18), and iOS 17.0; later versions are NOT
  supported. Please check the page itself; the list may have changed.
Step 3. If your version is supported, follow the installation guide
  linked from that page for your exact version.
Step 4. Copy TheForge.ipa to the device (AirDrop, or the Files app), open it
  with TrollStore, and install. It does not expire.
Export a backup before you ever update iOS on that device.


6. WAY D: FREE APPLE ID (seven days)
------------------------------------

Exactly as WAY B, but with any free Apple ID, and with one more step: on
the device open Settings, General, VPN & Device Management, tap your
Apple ID, and tap Trust. The app opens for seven days; after that, repeat
Steps 3 and 4 of WAY B. Your work is kept. As far as I know, a free Apple
ID can keep at most three such apps on a device at a time.


7. UPDATING THE REAL APP LATER
------------------------------

  1. On GitHub, open your repository, then the folder TheForge, then
     www. Click "Add file", then "Upload files", drop in the new
     the_forge.html (same name), and commit.
  2. Open BUILD_INFO.txt, click the pencil, change "Pass:" to the new
     build number, and commit. (The version iOS shows is set in
     TheForge/Info.plist; you may change its two version lines too.)
  3. GitHub builds again by itself (section 3, Steps 4 and 5).
  4. Install the new TheForge.ipa over the old one exactly as before.
     Your work stays, because the bundle ID stays the same.


8. IF THE GITHUB BUILD FAILS
----------------------------

A red cross within a few seconds, with no steps listed:
  GitHub refused to start the build. This is about the GitHub account.
  Open the failed run: GitHub shows the reason in a notice near the top.
  The usual reasons are that the account has used its monthly free
  minutes for private repositories, or a spending limit or payment
  problem in the billing settings (github.com/settings/billing). Fix
  what the notice names, then click "Re-run all jobs".

A red cross after some minutes, with steps listed:
  Click the step with the red cross. "If the build failed, show why"
  prints the errors and the last 60 lines of the build log.

"No .xcodeproj found" or "www/the_forge.html is missing":
  The project was not uploaded, or only partly. Upload the CONTENTS of
  "iPhone and iPad project" again.


ABOUT THE APP
-------------
  - The installed app runs entirely from the copy of the_forge.html inside
    it and works with no connection.
  - The first time something in it asks for the microphone, iOS asks
    whether The Forge may use it. Choose Allow. If it was refused, open
    the Settings app, find The Forge (or Safari, for the Home Screen
    app), and allow the Microphone.
  - The icon is the seal on a white square, because iOS shows a
    transparent icon's corners as black.
