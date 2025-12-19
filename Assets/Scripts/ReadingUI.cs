using TMPro;
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
        CancelAction = InputSystem.actions.FindAction("UICancel");
    }


    void OnEnable() { //Activer la UI du panneau quand l'objet devient actif
        playerMovementScript.GetComponent<PlayerMovement>().enabled = false;
        mainCamera.GetComponent<MouseLook>().enabled = false;
        virtualCursor.SetActive(true);
        InputActions.FindActionMap("Player").Disable(); //activer le systeme d'input du joueur
        InputActions.FindActionMap("Interface").Enable(); //activer le systeme d'input du joueur
        Time.timeScale = 0f;
    }

    private void OnDisable() {
        InputActions.FindActionMap("Player").Enable();//desactiver le systeme d'input du joueur
        InputActions.FindActionMap("Interface").Disable(); //activer le systeme d'input du joueur
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
