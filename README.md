TouchIDIssue
============

An Issue I found when developing apps that using TouchID to unlock.

You can reproduce simply like this:

Put your finger on the touch area and then start this application. You will find that after user passed the authentication and jump to the second view controller, the alert requiring fingerprint is still there...

Here is the solution I use:

Wait a while after the availablility check of Touch ID.

You can uncomment the code below and see what happens:

dispatch_after(dispatch_time(DISPATCH_TIME_NOW, .5f * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
    ...
});

The issue happens when you change current view controller or window in the reply block of evaluatePolicy:localizedReason:reply:.