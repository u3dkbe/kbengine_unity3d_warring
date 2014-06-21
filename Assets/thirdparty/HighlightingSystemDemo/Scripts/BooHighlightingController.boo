import UnityEngine

class BooHighlightingController (MonoBehaviour): 
	
	protected ho as HighlightableObject

	def Awake():
		ho = (gameObject.AddComponent[of HighlightableObject]() as HighlightableObject);
	
	def Update():
		// Fade in/out constant highlighting with 'Tab' button
		if Input.GetKeyDown(KeyCode.Tab):
			ho.ConstantSwitch();
		// Turn on/off constant highlighting with 'Q' button
		elif Input.GetKeyDown(KeyCode.Q):
			ho.ConstantSwitchImmediate();
		
		// Turn off all highlighting modes with 'Z' button
		if Input.GetKeyDown(KeyCode.Z):
			ho.Off()
