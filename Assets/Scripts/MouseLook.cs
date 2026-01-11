using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class MouseLook : MonoBehaviour
{
    public Vector3 initialRotation = new Vector3(0f,0f,0f);
    //setup input Action
    public InputActionAsset InputActions;
    public InputAction lookAction;

    public Animator cameraAnimator;
    private float lookAmountXAnimator;
    private float lookAmountXAnimatorPreviousFrame;

    private Vector2 lookAmount;


    public float mouseSensitivityX = 100f;
    public float mouseSensitivityY = 100f;

    // Sensitivity to use for gamepad (sticks are [-1,1], so we typically treat them as units/sec)
    public float gamepadSensitivityX = 100f;
    public float gamepadSensitivityY = 100f;

    public Transform playerBody;

    float xRotation;

    public float jumellesMultiplyier = 1f;



    //Activer le systeme d'input du joueur
    private void OnEnable() {
        InputActions.FindActionMap("Player").Enable();
    }

    /*private void OnDisable() {
        InputActions.FindActionMap("Player").Disable();
    }*/

    private void Awake() {
        lookAction = InputSystem.actions.FindAction("Look");
    }

    // Start is called before the first frame update
    void Start()
    {
        xRotation = initialRotation.x;
        playerBody.localRotation = Quaternion.Euler(0f, initialRotation.y, 0f);
        //transform.localRotation = Quaternion.Euler(initialRotation.x, initialRotation.y, initialRotation.z);
        //Cursor.lockState = CursorLockMode.Locked;
    }

    // Update is called once per frame
    void Update()
    {
        lookAmount = lookAction.ReadValue<Vector2>();

        lookAmountXAnimator = (lookAmount.x/50) + 0.5f;

        cameraAnimator.SetFloat("LookAmountX", (lookAmountXAnimator + lookAmountXAnimatorPreviousFrame)/2);
        lookAmountXAnimatorPreviousFrame = lookAmountXAnimator;
        //cameraAnimator.SetFloat("LookAmountY", lookAmount.y);

        var control = lookAction.activeControl;
        bool fromMouse = control != null && control.device is Mouse; 

        float mouseX;
        float mouseY;

        if (fromMouse)
        {
            // Mouse gives a per-frame delta (pixels since last frame) -> don't multiply by Time.deltaTime
            mouseX = lookAmount.x * mouseSensitivityX / 100 * jumellesMultiplyier;
            mouseY = lookAmount.y * mouseSensitivityY / 100 * jumellesMultiplyier;
        }
        else
        {
            // Gamepad/joystick gives axis values [-1,1] -> treat as units/sec so multiply by Time.deltaTime
            mouseX = lookAmount.x * gamepadSensitivityX * Time.deltaTime * jumellesMultiplyier;
            mouseY = lookAmount.y * gamepadSensitivityY * Time.deltaTime * jumellesMultiplyier;
        }

        xRotation -= mouseY;
        xRotation = Mathf.Clamp(xRotation, -90f, 90f);

        
        playerBody.Rotate(Vector3.up * mouseX);
        transform.localRotation = Quaternion.Euler(xRotation, 0f, 0f);
    }

    public void ChangeInitialRotation(Quaternion newRotation)
    {
        Vector3 eulerRotation = newRotation.eulerAngles;
        initialRotation = eulerRotation;
        xRotation = eulerRotation.x;
    }
}
