--------------------------------------------------
              NGUI: HUD Text
 Copyright © 2012-2013 Tasharen Entertainment
                Version 1.8
http://www.tasharen.com/forum/index.php?topic=997.0
--------------------------------------------------

Thank you for buying NGUI HUD Text!

----------------------------------------------
!! IMPORTANT NOTE !!
----------------------------------------------

Upon importing this package into a brand-new project, you will get compile errors!
This is normal -- it only happens if NGUI is missing. You can import the full version of NGUI
(if you have it), or double-click on the provided "ngui_distribution" package to import
the Distribution Version.

----------------------------------------------

Usage:
1. Attach the HUDText script to a game object underneath your UIRoot and set the font it should use.
2. To make it follow an object drawn with another camera, attach UIFollowTarget to the same object and set its target.
3. From code, use HUDText's Add() function to add new floating text entries.

You can also tweak the splines on the HUDText script, changing the motion of the text as you see fit.

Video: http://www.youtube.com/watch?v=diql3UP1KQM

----------------------------------------------
Example Usage:
----------------------------------------------

HUDText hudText = GetComponent<HUDText>();

// This will show damage of 123 in red, and the message will immediately start moving.
hudText.Add(-123f, Color.red, 0f);

// This will show "Hello World!" and make it stay on the screen for 1 second before moving
hudText.Add("Hello World!", Color.white, 1f);

----------------------------------------------

If you have any questions, suggestions, comments or feature requests, please
drop by the forums, found here: http://www.tasharen.com/forum/index.php?topic=997.0
