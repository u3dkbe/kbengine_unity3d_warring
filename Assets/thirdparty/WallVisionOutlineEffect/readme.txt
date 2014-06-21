Wall Vision Outline Image Effect
--------------------------------

Thanks for purchasing and using the Wall Vision Outline Image Effect.

Purpose
-------
The Wall Vision Outline Image Effect lets certain objects shine trough certain other objects (occluders).

Usage
-----
To add the image effect to your project, select the cam, which should have the effect (probably the Main Camera). Click on Component > Image Effects > Wall Vision Outline Effect.

Parameters
----------

* Occluder & Visible
These two layer masks parameters are very essential. They define the objects occluding the other objects, which should be visible behind them. 

For example, if you want to see all enemies trough the walls of your level you have to add a layer for all the walls and a layer for all the enemies to your project. Put all GameObjects, which are walls on the first layer and all enemies on the second. Now set the layer mask Occluder to "Walls" (or whatever you did name your first layer) and the Visible layer mask to "Enemies".

* Color
Here you can change the color with which all enemies (visible objects) are drawn, when they are behind the walls (occluder).

You can use different colors for different objects if you like. Simply add another Wall Vision Outline Image Effect to this camera and set the "Visible" layer to something different, for instance "Friends". You can set the color of the first component to red (for the enemies) and the color of the second to green. After that every enemy is drawn in red and every GameObject on the layer "Friends" in green, when occluded by a wall.

*Glow strength
The glow strength parameter is important if you want to combine this effect with a Glow or Bloom Image Effect. These image effects are using, if alpha masking is enabled, the alpha channel of the frame buffer to determine how much a pixel glows. This parameter sets the alpha value of these pixels where an "outline" of an occluded object is drawn. This way it is possible to set the amount of glowing distinct from the rest of the scene.

* Visibility curve
The visibility curve describes the visibility of the occluded object in relation to the angle between the surface normal of the occluded object and the view vector of the camera. On the left end of the curve (horizontal axis) you have the visibility of the normals orthogonal to the camera whereas on the other side there are the normals which are pointing directly to the camera.

* Patterns
Patterns weren't available in the original effect from Chained, but they do a good amount of work, when it comes to making the effect more interesting. 

Patterns are small repeatable textures, which are used to modify the opacity of the outline of an occluded object in relation to the screen coordinate. The texture which is used has to be  a grayscale texture. 

With the scale parameter you can determine the size, and with that, the number of repetitions of the pattern on the screen. A scale of 1.0 will use one repetition of the pattern scaled over the whole screen (with respect to the aspect ratio). If you scale it down, like 0.01, the pattern is used more often.  

The weight factor defines how much effect the pattern has on the outline. You can use different shades of gray on the texture itself, to have a pattern with different opacities. But with the weight parameter you can scale the effect for all pixels of the outline effect.

Troubles
--------

If you have problems using the image effect, please visit my website www.danielkiedrowski.com for further information or to contact me