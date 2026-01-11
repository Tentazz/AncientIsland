using UnityEngine;

public class SpawnPlayerOnEditorCamera : MonoBehaviour {
    public bool SpawnAtEditorCamera = true;
    public GameObject playerPrefab;
    public GameObject cameraObject; // Assign your camera GameObject here
    const string PlayerPrefsPosKey = "SceneViewCameraPosition";
    const string PlayerPrefsRotKey = "SceneViewCameraRotation";

    void Awake() {
        if (SpawnAtEditorCamera) {
            if (playerPrefab != null && PlayerPrefs.HasKey(PlayerPrefsPosKey)) {
                Vector3 editorViewPosition = JsonUtility.FromJson<Vector3>(PlayerPrefs.GetString(PlayerPrefsPosKey));
                playerPrefab.transform.position = editorViewPosition;
            }
            if (cameraObject != null && PlayerPrefs.HasKey(PlayerPrefsRotKey)) {
                Vector4 rotVec = JsonUtility.FromJson<Vector4>(PlayerPrefs.GetString(PlayerPrefsRotKey));
                Quaternion editorViewRotation = new Quaternion(rotVec.x, rotVec.y, rotVec.z, rotVec.w);
                cameraObject.transform.rotation = editorViewRotation;
                cameraObject.GetComponent<MouseLook>().ChangeInitialRotation(editorViewRotation);
            }
        }
    }

    void Start() {

    }
}
