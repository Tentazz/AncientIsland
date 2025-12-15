using UnityEngine;
using UnityEngine.InputSystem;

public class ReadingUI : MonoBehaviour
{
    public InputActionAsset InputActions;
    public InputAction CancelAction;

    public GameObject playerMovementScript;
    public GameObject mainCamera;
    public GameObject virtualCursor;

    public GameObject[] wordUIObjects;

    private void Awake() {
        CancelAction = InputSystem.actions.FindAction("Cancel");

    }


    void OnEnable() { //Activer la UI du panneau quand l'objet devient actif
        playerMovementScript.GetComponent<PlayerMovement>().enabled = false;
        mainCamera.GetComponent<MouseLook>().enabled = false;
        virtualCursor.SetActive(true);
        Time.timeScale = 0f;
    }

    void Update()
    {
        if (CancelAction.WasPressedThisFrame()) { //Eteindre la UI du panneau
            
            for (int i = 0; i < wordUIObjects.Length; i++) {
                    wordUIObjects[i].SetActive(false);
            }

            virtualCursor.SetActive(false);
            playerMovementScript.GetComponent<PlayerMovement>().enabled = true;
            mainCamera.GetComponent<MouseLook>().enabled = true;

            Time.timeScale = 1f;
            this.gameObject.SetActive(false);
        }
    }


}
