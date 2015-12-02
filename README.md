# Radar #22948078 (SOLVED)

# Update, and solution:

Apple came back to me with a fix. Apparently this is caused by an 'incompatibility between settings'. They provided two options to solve this:

1. Enable the "Prefer coder" checkbox in the File inspector (for the NSSplitView). (We strongly recommend this.) 
2. Enable the "Arranges All Subviews" checkbox in the attributes inspector for the split view.

The first option did the trick.

![Prefer coder](https://raw.github.com/boyvanamstel/NSSplitView-bug/master/Screenshots/fix.jpg)

# Summary:
When programatically adding an NSViewController containing an NSSplitView to a view, the NSSplitView will look distorted and won't listen to Auto Layout and autoresizingMask rules.

When compiling the exact same project on a machine running OS X 10.10, everything looks and works correctly.

# Steps to Reproduce:
1. Create a new project.
2. Create a new NSViewController with xib.
3. Add an NSSplitView to the NSView in the xib.
4. Add some content to each of the panels of the split view and vertically and horizontally position them to the view using Auto Layout.
4. Use Auto Layout to make sure the NSSplitView resizes with the NSView.
5. Programmatically add the view to the content view of the window in the AppDelegate. Use autoresizingMask to automatically scale the view with the window.

# Expected Results:
When the application runs, a new window should pop up with an NSSplitView and when you resize the window the components in it should scale and move around to match the increasing/decreasing size of the window.

![Should look like](https://raw.github.com/boyvanamstel/NSSplitView-bug/master/Screenshots/working.png)

# Actual Results:
A distorted version of the NSSplitView is drawn and none of the Auto Layout and autoresizingMask rules are being followed.

![Actually looks like](https://raw.github.com/boyvanamstel/NSSplitView-bug/master/Screenshots/buggy.png)
