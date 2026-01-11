using UnityEditor;
using UnityEngine;

[InitializeOnLoad]
public static class SceneViewCameraPositionSaver
{
    const string PlayerPrefsPosKey = "SceneViewCameraPosition";
    const string PlayerPrefsRotKey = "SceneViewCameraRotation";

    static SceneViewCameraPositionSaver()
    {
        EditorApplication.playModeStateChanged += OnPlayModeChanged;
    }

    private static void OnPlayModeChanged(PlayModeStateChange state)
    {
        if (state == PlayModeStateChange.ExitingEditMode)
        {
            if (SceneView.lastActiveSceneView != null && SceneView.lastActiveSceneView.camera != null)
            {
                Vector3 pos = SceneView.lastActiveSceneView.camera.transform.position;
                Quaternion rot = SceneView.lastActiveSceneView.camera.transform.rotation;
                Vector4 rotVec = new Vector4(rot.x, rot.y, rot.z, rot.w);
                PlayerPrefs.SetString(PlayerPrefsPosKey, JsonUtility.ToJson(pos));
                PlayerPrefs.SetString(PlayerPrefsRotKey, JsonUtility.ToJson(rotVec));
                PlayerPrefs.Save();
            }
        }
    }
}
