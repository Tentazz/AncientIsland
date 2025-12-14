using UnityEngine;
using UnityEngine.InputSystem;

public class ReadingUI : MonoBehaviour
{
    public InputActionAsset InputActions;
    public InputAction CancelAction;

    public GameObject playerMovementScript;
    public GameObject mainCamera;
    public GameObject virtualCursor;

    /*private void OnEnable() {
        InputActions.FindActionMap("Player").Enable(); //activer le systeme d'input du joueur
        InputActions.FindActionMap("Player").Enable(); //activer le systeme d'input du joueur
    }

    private void OnDisable() {
        InputActions.FindActionMap("Player").Disable();//desactiver le systeme d'input du joueur
    }*/

    private void Awake() {
        CancelAction = InputSystem.actions.FindAction("Cancel");

    }

    /*private void OnEnable() {
        InputActions.FindActionMap("Player").Enable(); //activer le systeme d'input du joueur
    }

    private void OnDisable() {
        InputActions.FindActionMap("Player").Disable();//desactiver le systeme d'input du joueur
    }*/

    /*void Start()
    {
        playerMovementScript.GetComponent<PlayerMovement>().enabled = false;
        mainCamera.GetComponent<MouseLook>().enabled = false;
        virtualCursor.SetActive(true);
    }*/

    void OnEnable() {
        playerMovementScript.GetComponent<PlayerMovement>().enabled = false;
        mainCamera.GetComponent<MouseLook>().enabled = false;
        virtualCursor.SetActive(true);
        Time.timeScale = 0f;
    }

    // Update is called once per frame
    void Update()
    {
        if (CancelAction.WasPressedThisFrame()) {
            //print(CancelAction);
            virtualCursor.SetActive(false);
            playerMovementScript.GetComponent<PlayerMovement>().enabled = true;
            mainCamera.GetComponent<MouseLook>().enabled = true;

            Time.timeScale = 1f;
            this.gameObject.SetActive(false);
        }
    }


}
