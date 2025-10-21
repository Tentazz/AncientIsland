using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class MouseLook : MonoBehaviour
{
    //setup input Action
    public InputActionAsset InputActions;
    public InputAction lookAction;

    private Vector2 lookAmount;

    public float mouseSensitivityX = 100f;
    public float mouseSensitivityY = 100f;
    public Transform playerBody;

    float xRotation = 0f;



    //Activer le systeme d'input du joueur
    private void OnEnable() {
        InputActions.FindActionMap("Player").Enable();
    }

    private void OnDisable() {
        InputActions.FindActionMap("Player").Disable();
    }

    private void Awake() {
        lookAction = InputSystem.actions.FindAction("Look");
    }

    // Start is called before the first frame update
    void Start()
    {
        Cursor.lockState = CursorLockMode.Locked;
    }

    // Update is called once per frame
    void Update()
    {
        lookAmount = lookAction.ReadValue<Vector2>();

        float mouseX = lookAmount.x * mouseSensitivityX * Time.deltaTime;
        float mouseY = lookAmount.y * mouseSensitivityY * Time.deltaTime;
        

        xRotation -= mouseY;
        xRotation = Mathf.Clamp(xRotation, -90f, 90f);

        transform.localRotation = Quaternion.Euler(xRotation, 0f, 0f);
        playerBody.Rotate(Vector3.up * mouseX);
    }
}
