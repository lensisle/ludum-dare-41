var state = argument0;


return state != ESceneState.CustomerEntering &&
	   state != ESceneState.CustomerLeaving &&
	   state != ESceneState.HandleFailed &&
	   state != ESceneState.NonInitialized;